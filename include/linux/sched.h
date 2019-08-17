#ifndef _SCHED_H
#define _SCHED_H
/*
 * GDT标的limit=2^16=64K, 64K/8=8K,GDT最大可以承载8K个段描述符，
 * 除去第一项不用，内核段和数据段，这里可以有8K-3个段描述可以使用
 * 这里取整只用8000个段描述符，因为一个task要占用两项段描述符(LDT和TSS)，
 * 所以最大可以创建4000个进程。
 */
//#define NR_TASKS 1k=1024
#define NR_TASKS 64
#define HZ 10

#define FIRST_TASK task[0]
#define LAST_TASK task[NR_TASKS-1]

#include <linux/head.h>
#include <linux/fs.h>
#include <linux/mm.h>
#include <signal.h>

#if (NR_OPEN > 32)
#error "Currently the close-on-exec-flags are in one word, max 32 files/proc"
#endif

#define TASK_RUNNING		0
#define TASK_INTERRUPTIBLE	1
#define TASK_UNINTERRUPTIBLE	2
#define TASK_ZOMBIE		3
#define TASK_STOPPED		4

#ifndef NULL
#define NULL ((void *) 0)
#endif

#define PG_DIR_ADDR 0

extern int copy_page_tables(unsigned long from, unsigned long to, long size, struct task_struct* new_task);
extern int free_page_tables(unsigned long from, unsigned long size, struct task_struct* task);

extern void sched_init(void);
extern void schedule(void);
extern void trap_init(void);
extern void panic(const char * str);
extern int tty_write(unsigned minor,char * buf,int count);

typedef int (*fn_ptr)();

struct i387_struct {
	long	cwd;
	long	swd;
	long	twd;
	long	fip;
	long	fcs;
	long	foo;
	long	fos;
	long	st_space[20];	/* 8*10 bytes for each FP-reg = 80 bytes */
};

struct tss_struct {
	long	back_link;	/* 16 high bits zero */
	long	esp0;
	long	ss0;		/* 16 high bits zero */
	long	esp1;
	long	ss1;		/* 16 high bits zero */
	long	esp2;
	long	ss2;		/* 16 high bits zero */
	long	cr3;
	long	eip;
	long	eflags;
	long	eax,ecx,edx,ebx;
	long	esp;
	long	ebp;
	long	esi;
	long	edi;
	long	es;		/* 16 high bits zero */
	long	cs;		/* 16 high bits zero */
	long	ss;		/* 16 high bits zero */
	long	ds;		/* 16 high bits zero */
	long	fs;		/* 16 high bits zero */
	long	gs;		/* 16 high bits zero */
	long	ldt;		/* 16 high bits zero, 这里LDT表在GDT表中的索引，也称为LDT表描述符 */
	long	trace_bitmap;	/* bits: trace 0, bitmap 16-31 */
	struct i387_struct i387;
};

struct task_struct {
/* these are hardcoded - don't touch */
	long state;	/* -1 unrunnable, 0 runnable, >0 stopped */
	long counter;
	long priority;
	long signal;
	struct sigaction sigaction[32];
	long blocked;	/* bitmap of masked signals */
/* various fields */
	int exit_code;
	unsigned long start_code,end_code,end_data,brk,start_stack;
	long pid,father,pgrp,session,leader;
	unsigned short uid,euid,suid;
	unsigned short gid,egid,sgid;
	long alarm;
	long utime,stime,cutime,cstime,start_time;
	unsigned short used_math;
/* file system info */
	int tty;		/* -1 if no tty, so it must be signed */
	unsigned short umask;
	struct m_inode * pwd;
	struct m_inode * root;
	struct m_inode * executable;
	unsigned long close_on_exec;
	struct file * filp[NR_OPEN];
/* ldt for this task 0 - zero 1 - cs 2 - ds&ss */
/*
 * 因为每个用户进程的地址空间都是1G～4G,所以这个LDT描述符表可以不要了，在GDT表中只保留一个LDT段即可，被所有进程共用，但是TSS段不能共享的，
 * 这里保持原来的机制不变，每个进程还是在GDT表中分配独立的LDT和TSS段描述符，不过LDT段描述符指向的地址是相同的。
 * 由于task0和task1是共享相同的内核代码段和数据段，所以他们是共享目录表和页表的，所以本质上他们是共享相同的地址空间，这其实就是线程了，
 * task1一旦要对共享的堆栈就行写操作，就会触发WP异常，内核就会给task1分配一页作为task1的堆栈，这其实就是线程私有的堆栈了，想想多线程是怎么执行的啦啦啦。
 */
	struct desc_struct ldt[3];
/* tss for this task */
	struct tss_struct tss;
	/* 这个标志主要是为了防止，同一个进程被BSP调度到不同的AP上，同时执行，这样是有问题的，因为他们会共用相同的用户栈和内核栈， 以后会优化的。*/
	int sched_on_ap;  /* 1: running on AP, 0: not */
	int task_nr;
	int father_nr;
};

/*
 *  INIT_TASK is used to set up the first task table, touch at
 * your own risk!. Base=0, limit=0x9ffff (=640kB)
 */
/*
 *  1. 注意：这里的段限长还是640K就有问题了，因为内核代码和数据段已经被最终放置在了5M的开始处了，所以这里的Limit应该设置为59F,5M+640K
 *  2. 当改成每个进程都有4G的地址空间的时候，这里又要改了，内核的地址空间是0～1G(limit=1G/4k-1=0x3FFFF)，用户空间是1G~4G
 */
#define INIT_TASK \
/* state etc */	{ 0,15,15, \
/* signals */	0,{{},},0, \
/* ec,brk... */	0,0,0,0,0,0, \
/* pid etc.. */	0,-1,0,0,0, \
/* uid etc */	0,0,0,0,0,0, \
/* alarm */	0,0,0,0,0,0, \
/* math */	0, \
/* fs info */	-1,0022,NULL,NULL,NULL,0, \
/* filp */	{NULL,}, \
	{ \
		{0,0}, \
/* ldt */	{0x3fff,0xc0fa00}, \
		{0x3fff,0xc0f200}, \
	}, \
/*tss*/	{0,PAGE_SIZE+(long)&init_task,0x10,0,0,0,0,PG_DIR_ADDR,\
	 0,0,0,0,0,0,0,0, \
	 0,0,0x17,0x17,0x17,0x17,0x17,0x17, \
	 _LDT(0),0x80000000, \
		{} \
	}, \
/*sched_on_ap=0，表示没有AP运行该task，可以被调度到AP上运行*/ 0 \
}

union task_union {
	struct task_struct task;
	char stack[PAGE_SIZE];
};

extern struct task_struct *task[NR_TASKS];
extern struct task_struct *last_task_used_math;
extern struct task_struct *current;
extern long volatile jiffies;
extern long startup_time;

#define CURRENT_TIME (startup_time+jiffies/HZ)

extern void add_timer(long jiffies, void (*fn)(void));
extern void sleep_on(struct task_struct ** p);
extern void interruptible_sleep_on(struct task_struct ** p);
extern void wake_up(struct task_struct ** p);

/*
 * Entry into gdt where to find first TSS. 0-nul, 1-cs, 2-ds, 3-syscall
 * 4-TSS0, 5-LDT0, 6-TSS1 etc ...
 */
#define FIRST_TSS_ENTRY 4
#define FIRST_LDT_ENTRY (FIRST_TSS_ENTRY+1)
#define _TSS(n) ((((unsigned long) n)<<4)+(FIRST_TSS_ENTRY<<3))
#define _LDT(n) ((((unsigned long) n)<<4)+(FIRST_LDT_ENTRY<<3))
#define ltr(n)  __asm__("ltr %%ax"::"a"  (_TSS(n)))
#define lldt(n) __asm__("lldt %%ax"::"a" (_LDT(n)))
#define str(n) \
__asm__("str %%ax\n\t" \
	"subl %2,%%eax\n\t" \
	"shrl $4,%%eax" \
	:"=a" (n) \
	:"a" (0),"i" (FIRST_TSS_ENTRY<<3))
/*
 *	switch_to(n) should switch tasks to task nr n, first
 * checking that n isn't the current task, in which case it does nothing.
 * This also clears the TS-flag if the task we switched to has used
 * tha math co-processor latest.
 */
/* 这里有必要解释一下：cmpl %%ecx,last_task_used_math，这个指令的作用
 * 任务切换会导致CPU自动设置CR0的TS标志，但是不会自动保存FPU的context.
 * 当新任务执行FPU指令时由于TS=1，会自动触发异常，因此我们会在异常处理函数中保存当前FPU的context到相应的task中,并清除TS=0，
 * 这样异常处理返回后继续执行FPU指令就不会报错了，这样处理的好处是什么呢，又为甚么要这么做呢？

 * 因为我们不知道即将被调度的任务是否会使用FPU，因此有以下两种处理方式
 * 1. 即将被调度的任务会用到FPU，因此在使用之前由该任务负责将当前FPU的context保存到last_task_used_math指向的task，
 *    然后将自己设置为last_task_used_math并清除TS=0。
 * 2. 即将被调度的任务不使用FPU，因此该任务不会引起FPU的switch（FPU context频繁Switch也是很耗时的）
 *    这就是在这里我们没有先保存当前任务的FPU内容(假设当前任务执行了FPU)，然后就跳转了的原因。
 * 所以当老任务被切换回来继续执行的时候，会先执行cmpl %%ecx,last_task_used_math
 * 1. 如果相等说明没有发生FPU switch，也就是说没有其他任务执行过FPU指令，返回到当前任务后将清除TS=0，可以继续执行FPU指令而不会触发异常。
 * 2. 如果不等说明发生了FPU switch, 有其他任务执行了FPU指令了，这时TS=1，返回到当前任务后，如果该任务执行了FPU指令，也会触发FPU异常(TS=1)，
 *    进入异常处理函数，它会做同样的事：保存当前FPU的context到相应的task，然后设置TS=0，这样异常返回后，再执行FPU指令就不会报异常了。
 */
#define switch_to(n,current) {\
struct {long a,b;} __tmp; \
__asm__("cmpl %%ecx,%2\n\t" \
		"je 1f\n\t" \
		"movw %%dx,%1\n\t" \
		"xchgl %2,%%ecx\n\t" \
		"ljmp %0\n\t" \
		"cmpl %%ecx,last_task_used_math\n\t"  \
		"jne 1f\n\t" \
		"clts\n" \
		"1:" \
		::"m" (*&__tmp.a),"m" (*&__tmp.b),"m" (*current), \
		"d" (_TSS(n)),"c" ((long) task[n])); \
}

#define PAGE_ALIGN(n) (((n)+0xfff)&0xfffff000)

#define _set_base(addr,base) \
__asm__("movw %%dx,%0\n\t" \
	"rorl $16,%%edx\n\t" \
	"movb %%dl,%1\n\t" \
	"movb %%dh,%2\n\t" \
	"rorl $16,%%edx" \
	::"m" (*((addr)+2)), \
	  "m" (*((addr)+4)), \
	  "m" (*((addr)+7)), \
	  "d" (base))

#define _set_limit(addr,limit) \
__asm__("movw %%dx,%0\n\t" \
	"rorl $16,%%edx\n\t" \
	"movb %1,%%dh\n\t" \
	"andb $0xf0,%%dh\n\t" \
	"orb %%dh,%%dl\n\t" \
	"movb %%dl,%1\n\t" \
	"rorl $16,%%edx" \
	::"m" (*(addr)), \
	  "m" (*((addr)+6)), \
	  "d" (limit))

#define set_base(ldt,base) _set_base( ((char *)&(ldt)) , base )
#define set_limit(ldt,limit) _set_limit( ((char *)&(ldt)) , (limit-1)>>12 )

/*
#define _get_base(addr) ({\
unsigned long __base; \
__asm__("movb %3,%%dh\n\t" \
	"movb %2,%%dl\n\t" \
	"shll $16,%%edx\n\t" \
	"movw %1,%%dx" \
	:"=d" (__base) \
	:"m" (*((addr)+2)), \
	 "m" (*((addr)+4)), \
	 "m" (*((addr)+7))); \
__base;})
*/

#define _get_base(addr) ({\
unsigned long __base; \
__asm__ __volatile__ ("push %%eax" ::); \
__asm__ __volatile__ ("addl $7,%%eax\n\t" \
                      "movb 0(%%eax),%%dh\n\t" \
					  "subl $3,%%eax\n\t" \
					  "movb 0(%%eax),%%dl\n\t" \
					  "shll $16,%%edx\n\t" \
					  "subl $2,%%eax\n\t" \
				      "movw 0(%%eax),%%dx\n\t" \
					  "pop %%eax" \
					  :"=d" (__base) \
                      :"a" ((long)addr)); \
__base;})

#define get_base(ldt) _get_base( ((char *)&(ldt)) )

#define get_limit(segment) ({ \
unsigned long __limit; \
__asm__("lsll %1,%0\n\tincl %0":"=r" (__limit):"r" (segment)); \
__limit;})

#endif
