/*
 *  linux/init/main.c
 *
 *  (C) 1991  Linus Torvalds
 */

#define __LIBRARY__
#include <unistd.h>
#include <time.h>

/*
 * we need this inline - forking from kernel space will result
 * in NO COPY ON WRITE (!!!), until an execve is executed. This
 * is no problem, but for the stack. This is handled by not letting
 * main() use the stack at all after fork(). Thus, no function
 * calls - which means inline code for fork too, as otherwise we
 * would use the stack upon exit from 'fork()'.
 *
 * Actually only pause and fork are needed inline, so that there
 * won't be any messing with the stack from main(), but we define
 * some others too.
 */
inline _syscall0(int,fork)
inline _syscall0(int,pause)
inline _syscall1(int,setup,void *,BIOS)
inline _syscall0(int,sync)

#include <linux/tty.h>
#include <linux/sched.h>
#include <linux/head.h>
#include <asm/system.h>
#include <asm/io.h>

#include <stddef.h>
#include <stdarg.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>

#include <linux/fs.h>

unsigned long* pg_dir = (unsigned long*)0;

static char printbuf[1024];

extern int vsprintf();
extern void init(void);
extern void blk_dev_init(void);
extern void chr_dev_init(void);
extern void hd_init(void);
extern void floppy_init(void);
extern void mem_init(long start, long end);
extern long rd_init(long mem_start, int length);
extern long kernel_mktime(struct tm * tm);
extern long startup_time;
extern long params_table_addr;
extern long total_memory_size;

long memory_end = 0;         /* Granularity is 4K */
long buffer_memory_end = 0;  /* Granularity is 4K */
long main_memory_start = 0;  /* Granularity is 4K */

long PAGING_PAGES = 0;
long LOW_MEM      = 0;       /* Granularity is byte */
long HIGH_MEMORY  = 0;       /* Granularity is byte */

struct drive_info { char dummy[32]; } drive_info;


/*
 * This is set up by the setup-routine at boot-time
 */

#define EXT_MEM_K     (*(unsigned short *)    (params_table_addr+0x0002))
#define DRIVE_INFO    (*(struct drive_info *) (params_table_addr+0x0080))
#define ORIG_ROOT_DEV (*(unsigned short *)    (params_table_addr+0x01BC))

#define copy_struct(from,to,count) \
__asm__("push %%edi; cld ; rep ; movsl; pop %%edi"::"S" (from),"D" (to),"c" (count))

/*
 * Yeah, yeah, it's ugly, but I cannot find how to do this correctly
 * and this seems to work. I anybody has more info on the real-time
 * clock I'd be interested. Most of this was trial and error, and some
 * bios-listing reading. Urghh.
 */

#define CMOS_READ(addr) ({ \
outb_p(0x80|addr,0x70); \
inb_p(0x71); \
})

#define BCD_TO_BIN(val) ((val)=((val)&15) + ((val)>>4)*10)

static void time_init(void)
{
	struct tm time;

	do {
		time.tm_sec = CMOS_READ(0);
		time.tm_min = CMOS_READ(2);
		time.tm_hour = CMOS_READ(4);
		time.tm_mday = CMOS_READ(7);
		time.tm_mon = CMOS_READ(8);
		time.tm_year = CMOS_READ(9);
	} while (time.tm_sec != CMOS_READ(0));
	BCD_TO_BIN(time.tm_sec);
	BCD_TO_BIN(time.tm_min);
	BCD_TO_BIN(time.tm_hour);
	BCD_TO_BIN(time.tm_mday);
	BCD_TO_BIN(time.tm_mon);
	BCD_TO_BIN(time.tm_year);
	time.tm_mon--;
	startup_time = kernel_mktime(&time);
}

void main(void)		/* This really IS void, no error here. */
{			/* The startup routine assumes (well, ...) this */
/*
 * Interrupts are still disabled. Do necessary setups, then
 * enable them
 */
 	ROOT_DEV = ORIG_ROOT_DEV;
 	//drive_info = DRIVE_INFO;
 	copy_struct((struct drive_info *)(params_table_addr+0x0080), &drive_info, 8);
/*	memory_end = (1<<20) + (EXT_MEM_K<<10);
	memory_end &= 0xfffff000;*/
 	memory_end = total_memory_size;      /* granularity 4K  */

	long code_end = (long) start_buffer;

	/*
	 * 这里目前最大只能支持64M内存，因为每个进程的寻址空进就是64M，所以如果内存大于64M话，因为是共享同一个目录表的，所以会造成内核与普通进程寻址空间冲突。
	 * 下面会改为每个进程都有自己的目录表，这样都有4G的寻址空间而不会冲突。
	 */
	/*if (memory_end > 64*1024*1024) {
		memory_end = 64*1024*1024;
	}*/

	if (memory_end == 0x100000 || memory_end*0x1000 >= 16*1024*1024) {
		unsigned long code_szie = (code_end-OS_BASE_ADDR);
		if (code_szie < 0x100000) {
		    buffer_memory_end = (OS_BASE_ADDR + 4*1024*1024) / 0x1000; //因为内核最终加载到以5M为基地址的内存处，所以这里要调整。
		}
		else {
			//buffer_memory_end = ((code_end>>20)<<20 + 4*1024*1024);这里千万别这么写,GCC会优化成用sbb指令，造成结果有误，坑爹啊。
			buffer_memory_end = ((code_end/0x100000)*0x100000 + 4*1024*1024) / 0x1000;  /* 这里给高速缓冲区分配最大4M内存 */
		}
	}
	else {
		/* 内存必须>=16M */
		return;
	}

	main_memory_start = buffer_memory_end;
	PAGING_PAGES = memory_end - main_memory_start;
	LOW_MEM      = main_memory_start*0x1000;
	HIGH_MEMORY  = (memory_end-1)*0x1000+0xFFF;

#ifdef RAMDISK
	main_memory_start += rd_init(main_memory_start, RAMDISK*1024);
#endif
	mem_init(main_memory_start,memory_end);
	trap_init();
	blk_dev_init();
	chr_dev_init();
	tty_init();
	time_init();
	sched_init();
	buffer_init(buffer_memory_end);
	hd_init();
	floppy_init();
	printk("mem_size: %u (granularity 4K) \n\r", memory_end);
	sti();
	move_to_user_mode();
	if (!fork()) {		/* we count on this going ok */
		init();
	}
/*
 *   NOTE!!   For any other task 'pause()' would mean we have to get a
 * signal to awaken, but task0 is the sole exception (see 'schedule()')
 * as task 0 gets activated at every idle moment (when no other tasks
 * can run). For task0 'pause()' just means we go check if some other
 * task can run, and if not we return here.
 */
	for(;;) pause();
}

static int printf(const char *fmt, ...)
{
	va_list args;
	int i;

	va_start(args, fmt);
	write(1,printbuf,i=vsprintf(printbuf, fmt, args));
	va_end(args);
	return i;
}

static char * argv_rc[] = { "/bin/sh", NULL };
static char * envp_rc[] = { "HOME=/", NULL };

static char * argv[] = { "-/bin/sh",NULL };
static char * envp[] = { "HOME=/usr/root", NULL };

void init(void)
{
	/* 这里是task1执行的代码 */
	int pid,i;

	setup((void *) &drive_info);
	(void) open("/dev/tty0",O_RDWR,2);
	(void) dup(0);
	(void) dup(0);
	printf("%d buffers = %d bytes buffer space\n\r",NR_BUFFERS, NR_BUFFERS*BLOCK_SIZE);
	printf("Free mem: %d bytes\n\r",memory_end-main_memory_start);
	if (!(pid=fork())) {
		close(0);  /* 这里是task2开始执行的代码 */
		if (open("/etc/rc",O_RDONLY,0))
			_exit(1);
		execve("/bin/sh",argv_rc,envp_rc);
		_exit(2);
	}
	if (pid>0)
		//printf("pid: %d \n\r", pid);  /* 这里是进程1执行的代码 */
		while (pid != wait(&i))
			/* nothing */;
	while (1) {
		if ((pid=fork())<0) {
			printf("Fork failed in init\r\n");
			continue;
		}
		if (!pid) {
			close(0);close(1);close(2);
			setsid();
			(void) open("/dev/tty0",O_RDWR,2);
			(void) dup(0);
			(void) dup(0);
			_exit(execve("/bin/sh",argv,envp));
		}
		while (1)
			if (pid == wait(&i))
				break;
		printf("\n\rchild %d died with code %04x\n\r",pid,i);
		sync();
	}
	_exit(0);	/* NOTE! _exit, not exit() */
}
