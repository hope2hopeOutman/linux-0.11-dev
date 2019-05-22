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

#define _S(nr) (1<<((nr)-1))
#define _BLOCKABLE (~(_S(SIGKILL) | _S(SIGSTOP)))

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
//unsigned long padding[1024] = {1,};
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

unsigned long sched_semaphore = 0;

/* 获取当前processor正在运行的任务 */
unsigned long get_current_apic_id(){
	register unsigned long apic_id asm("ebx");
	__asm__ ("movl $0x01,%%eax\n\t" \
			 "cpuid\n\t" \
			 "shr $24,%%ebx\n\t" \
			 :"=b" (apic_id):
			);
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

unsigned long get_apic_index(unsigned long apic_id) {
	for (int i=0;i<LOGICAL_PROCESSOR_NUM;i++) {
		if (apic_ids[i].apic_id == apic_id) {
			return i;
		}
	}
	return 0;
}

/* 主要是为了AP初始化的时候使用，用于任务一开始切换时，将当前内核态的context信息存储到指定的位置，而不是一开始默认的0x00地址处，这样就不会覆盖内核的目录表了。 */
void reset_ap_tss(int nr) {
	set_tss_desc(gdt+(nr<<1)+FIRST_TSS_ENTRY, &(ap_default_task.task.tss));
	ltr(nr);
}

void reset_ap_default_task() {
	unsigned long apic_index = get_apic_index(get_current_apic_id());
	apic_ids[apic_index].current = &ap_default_task.task;
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
	//struct task_struct * current = get_current_task();
	unsigned long current_apic_id = get_current_apic_id();
	struct apic_info* apic_info = get_apic_info(current_apic_id);
	struct task_struct ** current = &(apic_info->current);
	if (!(*current)) {
		//panic("current shouldn't be null\n\r");
	}
	if (apic_info->apic_id > 0) {
		//printk("apic_id: %d, current_addr: %u\n\r", apic_info->apic_id, (unsigned long)(*current));
	}
	int i,next,c;
	struct task_struct ** p;
/* check alarm, wake up any interruptible tasks that have got a signal */

	lock_op(&sched_semaphore);  /* 这里一定要加锁，否则会出现多个AP同时执行同一个task */
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
		unsigned long sched_apic_id = get_min_load_ap();
		/* 这里禁止BSP将task[0]和task[1]调度到AP上执行 */
		if (sched_apic_id != current_apic_id && task[next] != task[0] && task[next] != task[1]) {
			/* 这里发送IPI给sched_apic_id调用该方法取执行选定的任务。 */
			//printk("Before send IPI: %d\n\r", sched_apic_id);
			delay_op(500);
			send_IPI(sched_apic_id, SCHED_INTR_NO);

			if (lock_flag) {
				unlock_op(&sched_semaphore);
				lock_flag = 0;
			}

			//delay_op(20);

			++apic_ids[sched_apic_id].load_per_apic;
			next = 1;   /* BSP上只运行task0和task1 */
		}
	}
	else {  /* 调度任务发生在AP上，这时AP只能调度除task[0]和task[1]之外的任务，后面会开启AP的timer自主调度。 */
		if (task[next] == task[0] || task[next] == task[1]) {
			if (lock_flag) {
				unlock_op(&sched_semaphore);
				lock_flag = 0;
			}
			if (*current != 0) {  /* 这里要注意在执行sys_exit系统调用的时候一定要遍历所有AP的current，将对应的current清空 */
				return;          /* 如果AP有已经执行过的task,这时不调度，继续执行老的task. */
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
	}
	if (lock_flag) {
		unlock_op(&sched_semaphore);
		lock_flag = 0;
	}

/*	if (apic_info->apic_id > 0) {
		printk("Ap, task[%d] running, cr3:%p\n\r",next,(unsigned long*)task[next]->tss.cr3);
	}*/

	switch_to(next,current);
}

int sys_pause(void)
{
	struct task_struct* current = get_current_task();
	current->state = TASK_INTERRUPTIBLE;
	schedule();
	return 0;
}

void sleep_on(struct task_struct **p)
{
	struct task_struct* current = get_current_task();
	struct task_struct *tmp;

	if (!p)
		return;
	if (current == &(init_task.task))
		panic("task[0] trying to sleep");
	tmp = *p;
	*p = current;
	current->state = TASK_UNINTERRUPTIBLE;
	schedule();
	if (tmp)
		tmp->state=0;
}

void interruptible_sleep_on(struct task_struct **p)
{
	struct task_struct* current = get_current_task();
	struct task_struct *tmp;

	if (!p)
		return;
	if (current == &(init_task.task))
		panic("task[0] trying to sleep");
	tmp=*p;
	*p=current;
repeat:	current->state = TASK_INTERRUPTIBLE;
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
		(**p).state=0;
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
		for (p = timer_list ; p < timer_list + TIME_REQUESTS ; p++)
			if (!p->fn)
				break;
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
	if (!cpl) return;  /* 这里可以看出内核态是不支持进程调度的，其他的外部中断除外 */
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
	outb_p(0x36,0x43);		/* binary, mode 3, LSB/MSB, ch 0 */
	outb_p(LATCH & 0xff , 0x40);	/* LSB */
	outb(LATCH >> 8 , 0x40);	/* MSB */
	set_intr_gate(0x20,&timer_interrupt);
	outb(inb_p(0x21)&~0x01,0x21);
	set_system_gate(0x80,&system_call);
}
