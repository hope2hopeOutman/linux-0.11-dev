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
extern volatile ulong load_guest_os_addr;
extern volatile ulong load_guest_os_flag;
extern ulong bsp_apic_default_location;


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

void get_cpu_topology_info() {
	int eax_value=0, ebx_value = 0 ,edx_value = 0, ecx_value = 0;
#if 1
    __asm__("movl $0x01,%%eax;"  \
    		"cpuid;" \
    		:"=a" (eax_value),"=b" (ebx_value),"=c" (ecx_value), "=d" (edx_value) :);
#else
    __asm__("movl $0x1B,%%ecx;"  \
        	"rdmsr;" \
        	:"=a" (eax_value),"=b" (ebx_value),"=d" (edx_value));
#endif

    printk("eax: %u, ebx: %u,ecx: %u, edx: %u \n\r", eax_value, ebx_value,ecx_value, edx_value);

    int sipi_cpu_count = *((unsigned short *) 0x90C00);
    int ipi_cpu_count  = *((unsigned short *) 0x90C04);
    printk("SIPI_cpu_count: %d, ^_^ successfully interact with APs by SIPI \n\r", sipi_cpu_count);
    //printk("IPI_processor_count : %d, Successfully interact with APs by IPI ^_^ ^.^ ^_^ \n\r", ipi_cpu_count);
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
		time.tm_sec  = CMOS_READ(0);
		time.tm_min  = CMOS_READ(2);
		time.tm_hour = CMOS_READ(4);
		time.tm_mday = CMOS_READ(7);
		time.tm_mon  = CMOS_READ(8);
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
	if (memory_end == 0x100000 || (((memory_end-1)*0x1000)+0xFFF) >= 64*1024*1024) {
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
		/*
		 * 内存必须>=64M, 因为在内核空间分配了一个永久实地址映射空间，大小为32M，加上内核占用的12M空间，一共要44M内存空间，所以这里定义内存最小为64M.
		 */
		panic("Real physical memory size must be greater than 64M.");
	}

	main_memory_start = buffer_memory_end;
	/*
	 * 因为12M~16M这4M地址空间用来保存GuestOS代码，并且通过EPT表实地址映射这个区间,这么做主要是为了好调试GuestOS的代码.
	 * 因此这4M内存空间Host是不能放进mem_map里用于page-fault映射的.
	 */
#if 0
	main_memory_start += 0x400; /* todo removed after GuestOS debug. 12M~16M用于实地址存放GuestOS代码 */
#else
	/* todo removed after GuestOS debug.
	 * 12M~16M用于实地址存放GuestOS代码,16M~20M用于存放GuestOS的页表（全为0，用于测试）,
	 * 这样main_memory_start=20M,也就是内存从20M,OS开始利用mem_map进行分页管理.
	 */
	main_memory_start += 0x800;
#endif
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
	hd_init();
	buffer_init(buffer_memory_end);
	floppy_init();
	printk("mem_size: %u (granularity 4K) \n\r", memory_end);  /* 知道print函数为甚么必须在这里才有效吗嘿嘿。 */

#if 0
    /* 得到的结果是bsp (lint0:lint1):(0x8700:0x8400)
     * 由此可以看出:
     * BSP.lint0被初始化为ExtINT
     * BSP.lint1被初始化为NMI
     * 这也就是为什么AP上发起的HD_INTR默认是route到BSP上的
     * CLI(BSP) 然后调用init_apic_lint0就能将HD_INTR route到AP上了.
     * 和我之前猜测的一样，这里终于验证了，QEMU没有严格按照Intel的官方文档进行reset和init.
     *
     * 以下说明是"Figure 10-8. Local Vector Table (LVT)"中的原话.
     * The mask bit for its associated LVT entry is set. Value After Reset: 0001 0000H
     */
	print_bsp_lint_values();
#endif

	load_guest_os();
	/*
	 * 一定要在send_IPI(3, VMX_ENTRY_IPI_INTR_NO)之前就加锁，
	 * 之前是在vmx_env_entry中加锁的，这样是有风险的，因为很有可能在AP响应VMX_ENTRY_IPI_INTR_NO中断之前当前程序就运行到了block_host_os了
	 * 这样会造成AP无法成功运行GuestOS，事实这种情况的确时有发生，有一定的概率。
	 * 不过在这里加锁就不会了.
	 */
	lock_op((ulong*)VMM_VM_SHARED_SPACE_SEMAPHORE);
#if 1
	init_ap();

	/*printk("apic0: %d, apic1: %d, apic2: %d apic3: %d \n\r",
			apic_ids[0].apic_id,apic_ids[1].apic_id,apic_ids[2].apic_id,apic_ids[3].apic_id);*/
	//get_cpu_topology_info();
#else
	vmx_env_entry();
#endif
	send_IPI(3, VMX_ENTRY_IPI_INTR_NO);

#if 0
	/* 如果将8259A PIC连接到AP的lint0那么这里一定要关闭BSP的中断，
	 * 因为如果不关闭的话会应到到AP接收来自8259A的中断,中断还是会被route到BSP，
	 * 但Intel官方文档说只有一个processor可以directly connect to 8259A。
	 * 已经通过init_apic_lint0将某个AP连接到了8259A了，这里BSP应该接收不到来自8259A的中断了，但事实不是这样，
	 * 但是将BSP的中断关闭的话，AP就可以接收来自8259A的中断了，这里很费解，怀疑qemu对于这块默认的处理机制就是这样.
	 * 这样GuestOS就可以直接访问HD了。
	 * 但这样做有个弊端，如果有n>=2个AP中同时运行GuestOS这样的话，对来自不同VM中GuestOS的hd_request/response进行同步就是个大问题了
	 * 这里只有一个GuestOS在运行不会有以上问题.
	 *
	 * 下面介绍另一种方式实现GuestOS对HD的访问
	 *  实现思路是:所有的HD_INTR中断都route到BSP，由BSP来区分是谁触发了该HD_INTR，然后通过发送IPI中断的方式触发对应的AP响应该HD_INTR.
	 *  这种实现方式就是考虑到以后多个GuestOS在不同的AP上并发运行时，产生HD_INTR如何同步的问题，在BSP侧加锁实现.
	 *  该方式已经实现，具体看host如何发送HD_IPI_INTR_NO中断号，以及GuestOS如何处理该HD_IPI_INTR_NO中断号的.
	 */
	cli();
#endif

	block_host_os:
	lock_op((ulong*)VMM_VM_SHARED_SPACE_SEMAPHORE);
	hd_init();
	send_IPI(1, APIC_TIMER_ENABLE_IPI_INTR_NO);
	send_IPI(2, APIC_TIMER_ENABLE_IPI_INTR_NO);
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

void load_guest_os() {
	load_guest_os_addr = 0xC00000;  /* guestOS存放在内存的位置 */
	ulong start_addr   = 0x500000;  /* guestos在硬盘的位置 */
	set_hd_intr_gate();
	load_guest_os_flag = 1;
	do_hd_read_request_in_vm(start_addr,1024*1024/512);
}
void print_bsp_lint_values() {
	ulong linear_addr = remap_msr_linear_addr(bsp_apic_default_location);
	ulong* msr_lint0_p =  (ulong* )(linear_addr + 0x350);
	ulong* msr_lint1_p =  (ulong* )(linear_addr + 0x360);
    printk("BSP (lint0:lint1):(%08x:%08x)\n\r", *msr_lint0_p, *msr_lint1_p);
    recov_msr_swap_linear(linear_addr, linear_addr);
    while(1);
}
