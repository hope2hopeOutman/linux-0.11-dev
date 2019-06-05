/*
 *  linux/kernel/sched.c
 *
 *  (C) 1991  Linus Torvalds
 */

/*
 * 'sched.c' is the main kernel file. It contains scheduling primitives
 * (sleep_on, wakeup, schedule etc) as well as a number of simple system
 * call functions (type getpid(), which just extracts a field from
 * current-task
 */
#include <linux/sched.h>
#include <linux/kernel.h>
#include <linux/sys.h>
#include <linux/fdreg.h>
#include <asm/system.h>
#include <asm/io.h>
#include <asm/segment.h>

#include <signal.h>

#include <linux/head.h>

#define _S(nr) (1<<((nr)-1))
#define _BLOCKABLE (~(_S(SIGKILL) | _S(SIGSTOP)))

/************************ semaphore variable ******************************/
unsigned long sched_semaphore = 0;
unsigned long sleep_on_semaphore = 0;
unsigned long interruptible_sleep_on_semaphore = 0;
/**************************************************************************/

extern void task_exit_clear(void);

void show_task(int nr,struct task_struct * p)
{
	int i,j = 4096-sizeof(struct task_struct);

	printk("%d: pid=%d, state=%d, ",nr,p->pid,p->state);
	i=0;
	while (i<j && !((char *)(p+1))[i])
		i++;
	printk("%d (of %d) chars free in kernel stack\n\r",i,j);
}

void show_stat(void)
{
	int i;

	for (i=0;i<NR_TASKS;i++)
		if (task[i])
			show_task(i,task[i]);
}

#define LATCH (1193180/HZ)

extern void mem_use(void);
extern int timer_interrupt(void);
extern int system_call(void);

union task_union {
	struct task_struct task;
	char stack[PAGE_SIZE];
};

union task_union init_task = {INIT_TASK,};
union task_union ap_default_task = {INIT_TASK,};
/*
 * 这里一次性分配64个processor，主要原因是这样可以使data_segment_align 4K对齐，
 * 如果设置为4的话就导致data_segment_align不能4K对齐了，导致运行有问题，
 * 至于具体的原因，没有深入研究GCC这块是怎么编译的，后面会详细研究一下。
 */
struct apic_info apic_ids[LOGICAL_PROCESSOR_MAXIMUM] = {{0,0,0,0,0,&(init_task.task)},{0,0,0,0,0,&(ap_default_task.task)},
		      {0,0,0,0,0,&(ap_default_task.task)},{0,0,0,0,0,&(ap_default_task.task)},};/* 所有processor的apicId存储在这里 */
long volatile jiffies=0;
long startup_time=0;
//struct task_struct *current = &(init_task.task);
//struct task_struct *current_per_apic[LOGICAL_PROCESSOR_NUM] = {&(init_task.task),0,0,0};
struct task_struct *last_task_used_math = NULL;
struct task_struct * task[NR_TASKS] = {&(init_task.task), };
long user_stack [ PAGE_SIZE>>2 ];
struct {
	long * a;
	short b;
	} stack_start = {&user_stack[PAGE_SIZE>>2] , 0x10};

/* 获取当前processor正在运行的任务 */
unsigned long get_current_apic_id(){
	register unsigned long apic_id asm("ebx");
	__asm__ ("movl $0x01,%%eax\n\t" \
			 "cpuid\n\t" \
			 "shr $24,%%ebx\n\t" \
			 :"=b" (apic_id):
			);
	if (apic_id > 0) {
		//printk("apic_id = %d\n\r", apic_id);
	}
	return apic_id;
}



struct apic_info* get_apic_info(unsigned long apic_id) {
	for (int i=0;i<LOGICAL_PROCESSOR_NUM;i++) {
		if (apic_ids[i].apic_id == apic_id) {
			return &apic_ids[i];
		}
	}
	return 0;
}

struct task_struct* get_current_task(){
	return get_apic_info(get_current_apic_id())->current;
}

void reset_cpu_load() {
	for (int i=0;i<LOGICAL_PROCESSOR_NUM;i++) {
		apic_ids[i].load_per_apic = 0;
	}
}

/* 计算哪个AP的负载最小，后续的task将会调度该AP执行。 */
unsigned long get_min_load_ap() {
	unsigned long apic_index = 1;  /* BSP不参与计算 */
	int overload = 0;
	if (apic_ids[apic_index].load_per_apic == 0xFFFFFFFF) {
		++overload;
	}
	for (int i=2;i<LOGICAL_PROCESSOR_NUM;i++) {
		if (apic_ids[i].load_per_apic == 0xFFFFFFFF) {
			++overload;
			continue;
		}
		if (apic_ids[apic_index].load_per_apic > apic_ids[i].load_per_apic) {
			apic_index = i;
		}
	}
	if (overload == LOGICAL_PROCESSOR_NUM-1) {
		reset_cpu_load();
		return apic_ids[LOGICAL_PROCESSOR_NUM-1].apic_id;
	}

	return apic_ids[apic_index].apic_id;
}

int check_default_task_running_on_ap() {
	if (get_current_apic_id()) {
		if (get_current_task() == &ap_default_task.task) {
			return 1;
		}
		else {
			return 0;
		}
	}
	return 0;
}

/*
 * 向指定的AP发送IPI中断消息,要先写ICR的高32位，因为写低32位就会触发IPI了，
 * 所以要现将apic_id写到destination field,然后再触发IPI。
 */
void send_IPI(int apic_id, int v_num) {
__asm__ ("movl bsp_apic_icr_relocation,%%edx\n\t" \
		 "addl $0x10,%%edx\n\t" \
		 "shll $24,%%eax\n\t" \
		 "movl %%eax,0(%%edx)\n\t"       /* 设置ICR高32位中的destination field */  \
		 "movl bsp_apic_icr_relocation,%%edx\n\t" \
		 "addl $0x00004000,%%ebx\n\t" \
		 "movl %%ebx,0(%%edx)\n\t"       /* 设置ICR低32位的vector field */   \
		 "wait_loop_ipi:\n\t" \
		 "xorl %%eax,%%eax\n\t" \
		 "movl 0(%%edx),%%eax\n\t" \
		 "andl $0x00001000,%%eax\n\t"    /* 判断ICR低32位的delivery status field, 0: idle, 1: send pending */  \
		 "cmpl $0x00,%%eax\n\t"   \
		 "jne wait_loop_ipi\n\t"  \
		 ::"a" (apic_id),"b" (v_num));
}

/* 发送中断处理结束信号： end of interrupt */
void send_EOI() {
	unsigned long apic_id = get_current_apic_id();
	struct apic_info* apic = get_apic_info(apic_id);
	if (apic) {
		unsigned long addr = apic->apic_regs_addr;
		__asm__("addl $0xB0,%%eax\n\t" /* EOI register offset relative with APIC_REGS_BASE is 0xB0 */ \
				"movl $0x00,0(%%eax)"  /* Write EOI register */ \
				::"a" (addr)
				);
	}
}

unsigned long get_current_apic_index() {
	unsigned long apic_id = get_current_apic_id();
	for (int i=0;i<LOGICAL_PROCESSOR_NUM;i++) {
		if (apic_ids[i].apic_id == apic_id) {
			return i;
		}
	}
	return 0;
}

/* 主要是为了AP初始化的时候使用，用于任务一开始切换时，将当前内核态的context信息存储到指定的位置，而不是一开始默认的0x00地址处，这样就不会覆盖内核的目录表了。 */
void reload_ap_ltr() {
	//set_tss_desc(gdt+(nr<<1)+FIRST_TSS_ENTRY, &(ap_default_task.task.tss));
	int nr = (get_current_apic_index() + AP_DEFAULT_TASK_NR);
	ltr(nr);
}

void init_ap_tss(int nr) {
	set_tss_desc(gdt+(nr<<1)+FIRST_TSS_ENTRY, &(ap_default_task.task.tss));
}

void reset_ap_default_task() {
	unsigned long apic_index = get_current_apic_index();
	apic_ids[apic_index].current = &ap_default_task.task;
}

void lock_op(unsigned long* sem_addr) {
	__asm__ ("lock_loop:\n\t"        \
			 "cmp $0x00,%0\n\t"      \
			 "jne lock_loop\n\t"     \
			 "movl $0x01,%%edx\n\t"  \
			 "lock\n\t"    /*xchg默认会加上lock前缀的，这里显示加上lock prefix是为了统一风格*/  \
			 "xchg %%edx,%0\n\t"     \
			 "cmp $0x00,%%edx\n\t"   \
			 "jne lock_loop\n\t"     \
			 ::"m" (*sem_addr)       \
		    );
}

void unlock_op(unsigned long* sem_addr) {
	__asm__ ("cmpl $0x00,%0\n\t" \
			 "jle 1f\n\t" \
			 "subl $0x01,%0\n\t" \
			 "1:\n\t" \
			 ::"m" (*sem_addr)   \
			);
}

void reset_ap_context() {
	unsigned long apic_index =  get_current_apic_index();
	int father_id = get_current_task()->father;
	/* 这里一定要将AP的CR3设置为0x00,因为当前进程已经被释放掉了，所以当前的CR3中的目录表基地址就无效了（此页有可能被其他进程占用了） */
	reset_dir_base();

	/* 重新加载AP的LTR寄存器,使其指向GDT表中NR=0x80的任务tss,这个任务是每个AP共享的,
	 * 主要的作用是,当AP由halt状态被唤醒后执行scheduel操作造成任务切换,用来保存当前halt状态下的context
	 * 如果不设置的话,当前LTR有可能指向0x00内核目录表,或上次执行过的TR(如果该TR已经执行结束了),这时把当前halt状态下的context
	 * 保存到0x00地址处或当前AP的LTR指向的地址处会覆盖内核目录表或已经分配了新任务的TR NR,从而造成系统崩溃.
	 * 这也是埋藏很深的巨坑,这里有必要解释一下.
	 * */
	reload_ap_ltr();
	printk("exit after reset_ap_tss\n\r");
	/* 下次任务调度的时候,保留当前的任务状态,否则,TSS默认值为0,会映射到0x00内核目录表处,这样会覆盖掉内核目录表,系统会崩溃的 */
	//reset_ap_default_task();
	//printk("exit after reset_ap_default_task\n\r");
	/* 重新设置AP的内核栈指针，然后跳转到idle_loop执行空循环，等待新的IPI中断 */
	alloc_ap_kernel_stack(apic_index,task_exit_clear,father_id);
}

/*
 *  'math_state_restore()' saves the current math information in the
 * old math state array, and gets the new ones from the current task
 */
void math_state_restore()
{
	struct task_struct* current = get_current_task();
	if (last_task_used_math == current)
		return;
	__asm__("fwait");
	if (last_task_used_math) {
		__asm__("fnsave %0"::"m" (last_task_used_math->tss.i387));
	}
	last_task_used_math=current;
	if (current->used_math) {
		__asm__("frstor %0"::"m" (current->tss.i387));
	} else {
		__asm__("fninit"::);
		current->used_math=1;
	}
}

/*
 *  'schedule()' is the scheduler function. This is GOOD CODE! There
 * probably won't be any reason to change this, as it should work well
 * in all circumstances (ie gives IO-bound processes good response etc).
 * The one thing you might take a look at is the signal-handler code here.
 *
 *   NOTE!!  Task 0 is the 'idle' task, which gets called when no other
 * tasks can run. It can not be killed, and it cannot sleep. The 'state'
 * information in task[0] is never used.
 */
void schedule(void)
{
	unsigned long current_apic_id = get_current_apic_id();
	if (current_apic_id == 1) {
		//printk("ap1 come to schedule\n\r");
	}
	struct apic_info* apic_info = get_apic_info(current_apic_id);
	struct task_struct ** current = &(apic_info->current);
	int i,next,c;
	struct task_struct ** p;
/* check alarm, wake up any interruptible tasks that have got a signal */

	lock_op(&sched_semaphore);  /* 这里一定要加锁，否则会出现多个AP同时执行同一个task */
	/*
	 * 这里有必要解释下,为什么要加一个局部变量来释放锁
	 * 因为这里锁的释放有好几处,程序最后还会释放一次,这个临时变量就是保证每个进程对自己加的锁只释放一次,
	 * 如果不加这个临时变量判断一下,程序有可能会释放其他进程加的锁.
	 * */
	int lock_flag = 1;

	for(p = &LAST_TASK ; p > &FIRST_TASK ; --p)
		if (*p) {
			if ((*p)->alarm && (*p)->alarm < jiffies) {
					(*p)->signal |= (1<<(SIGALRM-1));
					(*p)->alarm = 0;
			}
			if (((*p)->signal & ~(_BLOCKABLE & (*p)->blocked)) &&
			(*p)->state==TASK_INTERRUPTIBLE)
				(*p)->state=TASK_RUNNING;
		}

/* this is the scheduler proper: */

	while (1) {
		c = -1;
		next = 0;
		i = NR_TASKS;
		p = &task[NR_TASKS];
		while (--i) {
			if (!*--p)
				continue;
			if ((*p)->state == TASK_RUNNING && (*p)->counter > c && (*p)->sched_on_ap == 0) {
				c = (*p)->counter, next = i;
			}
		}
		if (c) break;
		for(p = &LAST_TASK ; p > &FIRST_TASK ; --p) {
			if (*p) {
				(*p)->counter = ((*p)->counter >> 1) + (*p)->priority;
			}
		}
	}

	if (current_apic_id == apic_ids[0].apic_id) {  /* 调度任务发生在BSP上 */
#if 0
		unsigned long sched_apic_id = get_min_load_ap();
		/* 这里禁止BSP将task[0]和task[1]调度到AP上执行 */
		if (sched_apic_id != current_apic_id && task[next] != task[0] && task[next] != task[1]) {
			/* 这里发送IPI给sched_apic_id调用该方法取执行选定的任务。 */
			//printk("Before send IPI: %d\n\r", sched_apic_id);
			//delay_op(500); /* 这个延迟函数终于可以去掉了,磁盘块和内存块之间的同步终于实现了 */
			send_IPI(sched_apic_id, SCHED_INTR_NO);

			if (lock_flag) {
				unlock_op(&sched_semaphore);
				lock_flag = 0;
			}
			++apic_ids[sched_apic_id].load_per_apic;
			next = 1;   /* BSP上只运行task0和task1 */
		}
#else
		if (task[next] != task[0] && task[next] != task[1]) {
			if (task[1]->state != 0) {
				next = 0;
			}
			else {
				next = 1;
			}
		}
#endif
	}
	else {  /* 调度任务发生在AP上，这时AP只能调度除task[0]和task[1]之外的任务，后面会开启AP的timer自主调度。 */
#if 0
		if (task[next] == task[0] || task[next] == task[1]) {
			if (lock_flag) {
				unlock_op(&sched_semaphore);
				lock_flag = 0;
			}
			if (*current != 0) {  /* 这里要注意在执行sys_exit系统调用的时候一定要遍历所有AP的current，将对应的current清空 */
				return;           /* 如果AP有已经执行过的task,这时不调度，继续执行老的task. */
			}
			else {
				/* halt等待新的调度IPI */
				__asm__("hlt"::);
			}
		}
		else {  /* 这时AP要调度新的task[n>1] */
			if (*current) {
			    (*current)->sched_on_ap = 0;  /* 只有这样，BSP之后才能继续调用该current到其他AP上运行，否则，该进程将永远不会被重新sched. */
			}
			task[next]->sched_on_ap = 1;
		}
#else
		if (task[next] == task[0] || task[next] == task[1]) {
			if (lock_flag) {
				unlock_op(&sched_semaphore);
				lock_flag = 0;
			}
			if (*current != 0) {
				//printk("no nr>1 can run on Ap\n\r");
				return;          /* 如果AP有已经执行过的task(包括idle_loop,也就是ap_default_task任务),这时不调度，继续执行老的task. */
			}
			else {/* 执行到这个分之,说明内核是有问题的,current是不可能为0的,这里进行reset相当于错误自我修正吧. */
				/* 重置AP的执行上下文,使其执行idle_loop程序,等待调度新的任务执行 */
				panic("Errors occur on AP schedule\n\r");
				reset_ap_context();
			}
		}
		else {  /* 这时AP要调度新的task[n>1] */
			//printk("has nr>1 can run on Ap\n\r");
			unsigned long sched_apic_id = get_min_load_ap();
			if (sched_apic_id == current_apic_id) {
				if (*current) {
					/* 只有这样，BSP之后才能继续调用该current到其他AP上运行，否则，该进程将永远不会被重新sched.(但ap_default_task是永远不会被调度的) */
				    (*current)->sched_on_ap = 0;
				}
				task[next]->sched_on_ap = 1;      /* 设置任务占用符,这样释放锁以后,该任务是不会被其他AP调度执行的 */
				++apic_ids[sched_apic_id].load_per_apic;
			}
			else {
				if (lock_flag) {
					unlock_op(&sched_semaphore);
					lock_flag = 0;
				}
				return;
			}
		}
#endif
	}
	if (lock_flag) {
		unlock_op(&sched_semaphore);
		lock_flag = 0;
	}
	switch_to(next,current);
}

int sys_pause(void)
{
	struct task_struct* current = get_current_task();
	current->state = TASK_INTERRUPTIBLE;
	schedule();
	return 0;
}

/*
 * 该方法要加同步锁,因为当多个进程并发调用该方法时,
 * 会造成多个等待进程同时指向相同的上一个等待进程,但是该inode.i_wait是共享的,只能有一个并发进程被保存到inode.i_wait,
 * 所以其他的并发进程将丢失了,是永远不会被唤醒的.
 * 每个进程调用该方法时,通过分配在栈上的tmp局部变量来串联所有等待任务的,这个链表本身也是个栈,先进后出,
 * 所以最后调用sleep_on方法的进程,会将自己的任务指针保存在inode.i_wait,当施加lock inode操作的进程释放lock,并调用wake_up方法后
 * 会唤醒inode.i_wait任务,该任务会唤醒它保存的上一个等待任务,以此类推,直到最后一个等待任务.
 * */
void sleep_on(struct task_struct **p)
{
	lock_op(&sleep_on_semaphore);

	struct task_struct* current = get_current_task();
	struct task_struct *tmp;

	if (!p) {
		unlock_op(&sleep_on_semaphore);
		return;
	}
	if (current == &(init_task.task))
		panic("task[0] trying to sleep");
	tmp = *p;        /* 将目前inode.i_wait指向的等待任务的指针保存到tmp */
	*p = current;    /* 将当前任务的指针，保存到inode.i_wait */
	current->state = TASK_UNINTERRUPTIBLE;  /* 将当前任务设置为不可中断的睡眠状态(必须通过wake_up唤醒，不能通过signal方式唤醒) */

	unlock_op(&sleep_on_semaphore);         /* 一定要在调度操作之前把锁释放了 */

	schedule();      /* 这里肯定调度其他任务执行了，不可能再是本任务了 */
	/*
	 * 这里最有意思了，每个等待任务用自己的局部变量tmp来保存前一个等待任务的指针，这样就形成了一个等待任务列表了。
	 * 当该任务被其他任务通过wake_up唤醒后，会紧接着执行下面的代码，把它自己维护的上一个等待任务的状态设置为running状态，
	 * 这样这个任务就被唤醒了，就有可能被下次schedule方法调度运行了，tricky吧，这里有必要解释一下。
	 * */
	if (tmp)
		tmp->state=0;
}

void interruptible_sleep_on(struct task_struct **p)
{
	lock_op(&interruptible_sleep_on_semaphore);
	struct task_struct* current = get_current_task();
	struct task_struct *tmp;

	if (!p) {
		unlock_op(&interruptible_sleep_on_semaphore);
		return;
	}
	if (current == &(init_task.task))
		panic("task[0] trying to sleep");
	tmp=*p;
	*p=current;
    repeat:
    current->state = TASK_INTERRUPTIBLE;
    unlock_op(&interruptible_sleep_on_semaphore);
	schedule();
	if (*p && *p != current) {
		(**p).state=0;
		goto repeat;
	}
	//*p=NULL;
	*p=tmp;
	if (tmp)
		tmp->state=0;
}

void wake_up(struct task_struct **p)
{
	if (p && *p) {
		(**p).state=0; /* 将等待任务的状态设置为running状态，这样就可以被schedule方法调度了. */
		//*p=NULL;
	}
}

/*
 * OK, here are some floppy things that shouldn't be in the kernel
 * proper. They are here because the floppy needs a timer, and this
 * was the easiest way of doing it.
 */
static struct task_struct * wait_motor[4] = {NULL,NULL,NULL,NULL};
static int  mon_timer[4]={0,0,0,0};
static int moff_timer[4]={0,0,0,0};
unsigned char current_DOR = 0x0C;

int ticks_to_floppy_on(unsigned int nr)
{
	extern unsigned char selected;
	unsigned char mask = 0x10 << nr;

	if (nr>3)
		panic("floppy_on: nr>3");
	moff_timer[nr]=10000;		/* 100 s = very big :-) */
	cli();				/* use floppy_off to turn it off */
	mask |= current_DOR;
	if (!selected) {
		mask &= 0xFC;
		mask |= nr;
	}
	if (mask != current_DOR) {
		outb(mask,FD_DOR);
		if ((mask ^ current_DOR) & 0xf0)
			mon_timer[nr] = HZ/2;
		else if (mon_timer[nr] < 2)
			mon_timer[nr] = 2;
		current_DOR = mask;
	}
	sti();
	return mon_timer[nr];
}

void floppy_on(unsigned int nr)
{
	cli();
	while (ticks_to_floppy_on(nr))
		sleep_on(nr+wait_motor);
	sti();
}

void floppy_off(unsigned int nr)
{
	moff_timer[nr]=3*HZ;
}

void do_floppy_timer(void)
{
	int i;
	unsigned char mask = 0x10;

	for (i=0 ; i<4 ; i++,mask <<= 1) {
		if (!(mask & current_DOR))
			continue;
		if (mon_timer[i]) {
			if (!--mon_timer[i])
				wake_up(i+wait_motor);
		} else if (!moff_timer[i]) {
			current_DOR &= ~mask;
			outb(current_DOR,FD_DOR);
		} else
			moff_timer[i]--;
	}
}

#define TIME_REQUESTS 64

static struct timer_list {
	long jiffies;
	void (*fn)();
	struct timer_list * next;
} timer_list[TIME_REQUESTS], * next_timer = NULL;

void add_timer(long jiffies, void (*fn)(void))
{
	struct timer_list * p;

	if (!fn)
		return;
	cli();
	if (jiffies <= 0)
		(fn)();
	else {
		for (p = timer_list ; p < timer_list + TIME_REQUESTS ; p++) {
			if (!p->fn)
				break;
		}
		if (p >= timer_list + TIME_REQUESTS)
			panic("No more time requests free");
		p->fn = fn;
		p->jiffies = jiffies;
		p->next = next_timer;
		next_timer = p;
		while (p->next && p->next->jiffies < p->jiffies) {
			p->jiffies -= p->next->jiffies;
			fn = p->fn;
			p->fn = p->next->fn;
			p->next->fn = fn;
			jiffies = p->jiffies;
			p->jiffies = p->next->jiffies;
			p->next->jiffies = jiffies;
			p = p->next;
		}
	}
	sti();
}

void do_timer(long cpl)
{
	if (get_current_apic_id() != 0) {
		//printk("ap execute do_timer\n\r");
	}
	struct task_struct* current = get_current_task();
	extern int beepcount;
	extern void sysbeepstop(void);

	if (beepcount)
		if (!--beepcount)
			sysbeepstop();

	if (cpl)
		current->utime++;
	else
		current->stime++;

	if (next_timer) {
		next_timer->jiffies--;
		while (next_timer && next_timer->jiffies <= 0) {
			void (*fn)(void);
			
			fn = next_timer->fn;
			next_timer->fn = NULL;
			next_timer = next_timer->next;
			(fn)();
		}
	}
	if (current_DOR & 0xf0)
		do_floppy_timer();
	if ((--current->counter)>0) return;
	current->counter=0;

	/*
	 * 后面有时间的话,会将调度改成在内核态可以进行抢占式调度,不过难度很大,最大的问题就是同步依赖问题,很容易造成锁的死锁状态.
	 * 任务要根据优先级,时间片,锁的依赖关系(每个进程是否要维护一个锁依赖列表)等等,要考虑的因素太多了,当前任务就不展开了.
	 *  */
	if (get_current_apic_id() == 0) {
		if (!cpl) return;  /* 这里可以看出内核态是不支持timer中断进行进程调度的，其他的外部中断除外 */
	}
	else {
		/* 1. 如果AP上当前运行的task != ap_default_task,那么AP上运行的就是普通的task,那么这个task在内核态很可能用到了很多同步锁,
		 *    如果调度运行其他任务的话,其他任务的时间片如果>当前任务的话,那么当前任务就有可能不会被调度,但是它占用的锁如果被其它进程依赖的话,
		 *    那么这种情况就造成了死锁状态.
		 * 2. 如果AP上运行的是当前任务是ap_default_task,其肯定是运行在内核态,但是它只执行idl_loop操作,
		 *    因此不会占用锁,也就不会造成其它进程的锁依赖,所以可以在内核态进行进程的调度.
		 *    */
		if (get_current_task() != &ap_default_task.task) {
			if (!cpl) return;
		}
	}

	schedule();
}

int sys_alarm(long seconds)
{
	struct task_struct* current = get_current_task();
	int old = current->alarm;

	if (old)
		old = (old - jiffies) / HZ;
	current->alarm = (seconds>0)?(jiffies+HZ*seconds):0;
	return (old);
}

int sys_getpid(void)
{
	struct task_struct* current = get_current_task();
	return current->pid;
}

int sys_getppid(void)
{
	struct task_struct* current = get_current_task();
	return current->father;
}

int sys_getuid(void)
{
	struct task_struct* current = get_current_task();
	return current->uid;
}

int sys_geteuid(void)
{
	struct task_struct* current = get_current_task();
	return current->euid;
}

int sys_getgid(void)
{
	struct task_struct* current = get_current_task();
	return current->gid;
}

int sys_getegid(void)
{
	struct task_struct* current = get_current_task();
	return current->egid;
}

int sys_nice(long increment)
{
	struct task_struct* current = get_current_task();
	if (current->priority-increment>0)
		current->priority -= increment;
	return 0;
}

void sched_init(void)
{
	int i;
	struct desc_struct * p;

	if (sizeof(struct sigaction) != 16)
		panic("Struct sigaction MUST be 16 bytes");
	set_tss_desc(gdt+FIRST_TSS_ENTRY,&(init_task.task.tss));
	set_ldt_desc(gdt+FIRST_LDT_ENTRY,&(init_task.task.ldt));
	p = gdt+2+FIRST_TSS_ENTRY;
	for(i=1;i<NR_TASKS;i++) {
		task[i] = NULL;
		p->a=p->b=0;
		p++;
		p->a=p->b=0;
		p++;
	}
/* Clear NT, so that we won't have troubles with that later on */
	__asm__("pushfl ; andl $0xffffbfff,(%esp) ; popfl");
	ltr(0);
	lldt(0);
	/* 设置8253定时器中断 */
#if 0
	outb_p(0x36,0x43);		/* binary, mode 3, LSB/MSB, ch 0 */
	outb_p(LATCH & 0xff , 0x40);	/* LSB */
	outb(LATCH >> 8 , 0x40);	/* MSB */
	set_intr_gate(0x20,&timer_interrupt);
	outb(inb_p(0x21)&~0x01,0x21);   /* Not mask timer intr */
#else
	set_intr_gate(APIC_TIMER_INTR_NO,&timer_interrupt);  /* Vector value 0x83 for APIC timer */
#endif

	set_system_gate(0x80,&system_call);
}
