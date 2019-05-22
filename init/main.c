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
static char user_print_buf[1024];

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
extern struct apic_info apic_ids[LOGICAL_PROCESSOR_NUM];
extern unsigned long tty_io_semaphore;

long memory_end = 0;         /* Granularity is 4K */
long buffer_memory_end = 0;  /* Granularity is 4K */
long main_memory_start = 0;  /* Granularity is 4K */

long PAGING_PAGES = 0;
long LOW_MEM      = 0;       /* Granularity is byte */
long HIGH_MEMORY  = 0;       /* Granularity is byte */

unsigned long bsp_apic_regs_relocation = BSP_APIC_REGS_RELOCATION;
unsigned long bsp_apic_icr_relocation = BSP_APIC_ICR_RELOCATION;

struct drive_info { char dummy[32]; } drive_info;

/*
 * This is set up by the setup-routine at boot-time
 */

#define EXT_MEM_K     (*(unsigned short *)    (params_table_addr+0x0002))
#define DRIVE_INFO    (*(struct drive_info *) (params_table_addr+0x0080))
#define ORIG_ROOT_DEV (*(unsigned short *)    (params_table_addr+0x01BC))
#define copy_struct(from,to,count) \
__asm__("push %%edi; cld ; rep ; movsl; pop %%edi"::"S" (from),"D" (to),"c" (count))

void test_ext_int() {
    int lint0 = 0, lint1 = 0;
   __asm__("movl $0x20350,%%ecx;"  \
			"movl 0(%%ecx),%%eax;"  \
		"movl $0x20360,%%ecx;"  \
		"movl 0(%%ecx),%%ebx;"  \
			:"=a" (lint0),"=b" (lint1) :);
   printk("lint0: %d, lint1: %d \n\r", lint0, lint1);
}

void get_cpu_topology_info() {
	int eax_value=0, ebx_value = 0 ,edx_value = 0;
#if 0
    __asm__("movl $0x01,%%eax;"  \
    		"movl $0x00,%%ecx;"  \
    		"cpuid;" \
    		:"=a" (eax_value),"=b" (ebx_value),"=d" (edx_value));
#endif

    __asm__("movl $0x1B,%%ecx;"  \
        	"rdmsr;" \
        	:"=a" (eax_value),"=b" (ebx_value),"=d" (edx_value));

    printk("eax: %u, ebx: %u, edx: %u \n\r", eax_value, ebx_value, edx_value);

    int sipi_cpu_count = *((unsigned short *) 0x90C00);
    int ipi_cpu_count  = *((unsigned short *) 0x90C04);
    printk("SIPI_cpu_count: %d, ^_^ successfully interact with APs by SIPI \n\r", sipi_cpu_count);
    //printk("IPI_processor_count : %d, Successfully interact with APs by IPI ^_^ ^.^ ^_^ \n\r", ipi_cpu_count);
}
/* 初始化APs，包括让AP进入保护模式，开启中断，初始化段寄存器使其指向内核代码段等等 */
void init_ap() {
	for (int i=0;i<LOGICAL_PROCESSOR_NUM;i++) {
		apic_ids[i].kernel_stack = get_free_page(PAGE_IN_REAL_MEM_MAP);
	}
	apic_ids[0].bsp_flag = 1;  /* 这里的代码只有BSP能执行到，所以这里把apic_ids[0]设置为BSP。 */

	__asm__(
	/* *************************** Set Apic ID for BSP *************************************************/
        "movl $0x01,%%eax\n\t" \
		"cpuid\n\t"            \
		"shr $24,%%ebx\n\t"    \
		"push %%ebx\n\t"       \
		"push $0x00\n\t"       \
		"call set_apic_id\n\t" \
		"pop %%ebx\n\t"        \
		"pop %%ebx\n\t"        \
	/* *************************** End Set Apic ID for BSP *********************************************/

	/* *************************** Relocating the Local APIC Registers of BSP *********************************************/
	/* 看过Intel手册关于MSRs寄存器族的都知道，每个processor的Local APIC registers寄存器默认都是映射到内存的0xFEE00000地址处的，
	 * 所以通过RW该内存地址，就可以操作APIC寄存是发送IPI消息，但是我们的内核线性地址空间最大只有1G，所以超出的部分，要么进行remap，要么就对APIC registers
	 * 的内存映射地址进行relocate，用于发送IPI消息的ICR寄存器的地址默认是0xFEE00300,直接读写0xFEE00300内存地址会报错。以下代码就是对其基地址进行relocate操作。
	 * 每个processor都有自己私有的MSRs寄存器族，地址都是从0开始的(注意这里要和内存地址区分开来)，利用rdmsr和wrmsr来读写这些MSRs，地址1B处就是用来relocate
	 * APIC registers内存基地址的。
	 * 到这里终于明白为什么现代OS要把内核的线性地址空间放在4G线性地址空间的高1G地址空间了，因为大量的MSRs寄存器都是映射到高地址空间的，这样就不用重映射了,
	 * 当然对于多核CPU来说，还是要relocate的。
	 */
		"pushl $0x00\n\t"  /* apic_index */ \
		"call init_apic_addr\n\t"  \
		"popl %%eax\n\t" \
    /**************************** Relocating the Local APIC Registers of BSP **********************************************/

	/**************************** 发送INIT中断消息给APs **********************************************/
	    "movl bsp_apic_icr_relocation,%%eax\n\t" \
		/* 发送 INIT message */
	    "movl $0x000C4500,0(%%eax)\n\t" \
	    "mov $0x05,%%ecx\n\t" \
	    "wait_loop_init:\n\t" \
	    "dec %%ecx\n\t" \
	    "nop\n\t" \
	    "cmp $0x0,%%ecx\n\t" \
	    "jne wait_loop_init\n\t" \
	/**************************** 等待APs处理INIT中断结束 **********************************************/

	/**************************** 发送SIPI中断消息给APs ***********************************************/
		/* 发送 SIPI message */
		"movl $0x000C4691,0(%%eax)\n\t" \
		"mov $0x20,%%ecx\n\t" \
	    "wait_loop_sipi:\n\t" \
	    "dec %%ecx\n\t" \
	    "nop\n\t" \
	    "cmp $0x0,%%ecx\n\t" \
	    "jne wait_loop_sipi\n\t" \
		"jmp skip_return \n\t"      /* 跳过发送IPI中断消息给AP，这里用作调试，todo remove */  \
	/**************************** 等待APs处理SIPI中断结束 **********************************************/

	/**************************** 发送IPI中断消息给APs **********************************************/
		/* 发送 Fixed IPI message  */

		"movl $0x000C4081,0(%%eax)\n\t" \
		"mov $0x5,%%ecx\n\t" \
		"wait_loop_ipi:\n\t" \
		"dec %%ecx\n\t" \
		"nop\n\t" \
		"cmp $0x0,%%ecx\n\t" \
		"jne wait_loop_ipi\n\t" \
		"skip_return:\n\t" \
		::);
	/**************************** 结束发送INIT中断消息给APs **********************************************/
}

/* 保存每个processor的apic-id,通过apic-id就可以解析处CPU的topology */
void set_apic_id(long apic_index,long apic_id) {
	apic_ids[apic_index].apic_id = apic_id;
}

/* 为每个AP分配一个内核栈 */
void alloc_ap_kernel_stack(long ap_index, long return_addr) {
	unsigned long stack_base = apic_ids[ap_index].kernel_stack;

	struct ap_stack_struct{
		long* stack;
		short selector;
	} ap_stack = {(long*)(stack_base+4096), 0x10};
    /*
     * 在函数调用里用lss命令的时候一定要小心，要把函数返回的指令地址预先保存下来，
     * 因为重置esp后，调用ret指令弹出的栈顶数据是不正确的，懂否哈哈，这个问题太tricky了，排查了好长时间，
     * bochs的多核调试手段太匮乏了，不好用。 */
	__asm__ ("lss %1,%%esp\n\t" \
			 "pushl %%edx\n\t" \
			 "ret\n\t" \
			::"d" (return_addr),"m" (*(&ap_stack))
			);
}

void reset_dir_base() {
	__asm__("xorl %%eax,%%eax\n\t" \
			"movl %%eax,%%cr3\n\t" \
			::);
}

/* 对Local APIC Registers的内存映射进行relocate. */
void reloc_apic_regs_addr(unsigned long addr) {
__asm__("xor %%eax,%%eax\n\t" \
		"xor %%edx,%%edx\n\t" \
		"movl $0x1B,%%ecx\n\t" \
		"rdmsr\n\t" \
		"and $0x00000FFF,%%eax\n\t" \
		"add %%ebx,%%eax\n\t" \
		"wrmsr\n\t" \
		"xor %%eax,%%eax\n\t"    /* just for test， todo remove */ \
		"xor %%edx,%%edx\n\t" \
		"rdmsr\n\t" \
		::"b" (addr));
}

void init_apic_addr(int apic_index) {
	unsigned long addr = bsp_apic_regs_relocation + (apic_index*0x1000);  /* 为每个APIC的regs分配4K内存 */
	reloc_apic_regs_addr(addr);
	apic_ids[apic_index].apic_regs_addr = addr;
}

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

void time_init(void)
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
		    //buffer_memory_end = (OS_BASE_ADDR + 4*1024*1024) / 0x1000; //因为内核最终加载到以5M为基地址的内存处，所以这里要调整。
		    buffer_memory_end = 0xC00;  /* 内核+BUFFER占用12M，3个目录项 */
		}
		else {
			//buffer_memory_end = ((code_end>>20)<<20 + 4*1024*1024);这里千万别这么写,GCC会优化成用sbb指令，造成结果有误，坑爹啊。
			buffer_memory_end = 0xC00;  /* 内核+BUFFER占用12M，3个目录项 */
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
	ipi_intr_init();
	blk_dev_init();
	chr_dev_init();
	tty_init();
	time_init();
	sched_init();
	buffer_init(buffer_memory_end);
	hd_init();
	floppy_init();
	printk("mem_size: %u (granularity 4K) \n\r", memory_end);  /* 知道print函数为甚么必须在这里才有效吗嘿嘿。 */
	init_ap();
	get_cpu_topology_info();
	printk("apic0: %d, apic1: %d, apic2: %d apic3: %d \n\r",
			apic_ids[0].apic_id,apic_ids[1].apic_id,apic_ids[2].apic_id,apic_ids[3].apic_id);
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
	write(1,user_print_buf,i=vsprintf(user_print_buf, fmt, args));
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
	printf("Free mem: %d (granularity 4k)\n\r",memory_end-main_memory_start);
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
			if (pid == wait(&i)) /* 登录Shell会一直存在的，所以task[1]会在这一直循环下去 */
				break;
		printf("\n\rchild %d died with code %04x\n\r",pid,i);
		sync();
	}
	_exit(0);	/* NOTE! _exit, not exit() */
}
