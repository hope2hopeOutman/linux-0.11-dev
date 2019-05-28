/*
 *  linux/kernel/fork.c
 *
 *  (C) 1991  Linus Torvalds
 */

/*
 *  'fork.c' contains the help-routines for the 'fork' system call
 * (see also system_call.s), and some misc functions ('verify_area').
 * Fork is rather simple, once you get the hang of it, but the memory
 * management can be a bitch. See 'mm/mm.c': 'copy_page_tables()'
 */
#include <errno.h>

#include <linux/sched.h>
#include <linux/kernel.h>
#include <asm/segment.h>
#include <asm/system.h>
#include <linux/head.h>
/************************ semaphore variable ******************************/
extern unsigned long sched_semaphore;
unsigned long find_empty_process_semaphore = 0;
/**************************************************************************/


extern void write_verify(unsigned long address);
long last_pid = 0;

void verify_area(void * addr, int size) {
	struct task_struct* current = get_current_task();
	unsigned long start;

	start = (unsigned long) addr;
	size += start & 0xfff;               /* 计算该地址的页内offset */
	start &= 0xfffff000;                 /* 计算该地址在进程地址空间内的页帧号，其实也是个offset，4K align */
	start += get_base(current->ldt[2]);  /* 页帧号+进程地址空间base=CPU线性地址, 4k align */
	while (size > 0) {
		size -= 4096;
		write_verify(start);
		start += 4096;                   /* 跳到下一页继续verify了 */
	}
}

int copy_mem(int nr, struct task_struct * p) {
	unsigned long old_data_base, new_data_base, data_limit;
	unsigned long old_code_base, new_code_base, code_limit;

	/* 所有fork出来的进程的基地址和limit都是一样，所以到这你应该理解当所有进程都有相同的4G地址空间的时候，在GDT表中只需要一个LDT描述符即可，但进程的TSS还是每个进程私有的。 */
	new_data_base = new_code_base = USER_LINEAR_ADDR_START;
	code_limit = data_limit = USER_LINEAR_ADDR_LIMIT;

	p->start_code = new_code_base;
	set_base(p->ldt[1], new_code_base);
	set_base(p->ldt[2], new_data_base);
	set_limit(p->ldt[1], data_limit);
	set_limit(p->ldt[2], data_limit);
	if (copy_page_tables(old_data_base, new_data_base, data_limit, p)) {
		//printk("copy_mem call free_page_tables before\n\r");
		free_page_tables(new_data_base, data_limit,p);
		//printk("copy_mem call free_page_tables after\n\r");
		return -ENOMEM;
	}
	return 0;
}

/*
 *  Ok, this is the main fork-routine. It copies the system process
 * information (task[nr]) and sets up the necessary registers. It
 * also copies the data segment in it's entirety.
 */
unsigned long copy_process_semaphore = 0;
int copy_process(int nr, long ebp, long edi, long esi, long gs, long none,
		long ebx, long ecx, long edx, long fs, long es, long ds, long eip,
		long cs, long eflags, long esp, long ss) {

	struct task_struct* current = get_current_task();
	struct task_struct *p = task[nr];
	int i;
	struct file *f;
    /* 此版本将进程的task_struct和目录表都分配在内核实地址寻址的空间(mem>512M && mem<(512-64)M) */
	if (!p)
		return -EAGAIN;
	long pid = p->pid;   /* 现将新分配的PID保存起来 */

	lock_op(&sched_semaphore);
	/*
	 * 这也是个巨坑啊
	 * 这里一定要在copy操作之前先获得schedule的锁,这样确保在COPY老任务的时候,如果将新任务的state设置为running时,也不会被调度.
	 *  */
	*p = *current; /* NOTE! this doesn't copy the supervisor stack */
	p->state = TASK_UNINTERRUPTIBLE;
	unlock_op(&sched_semaphore);

	p->task_nr = nr;
	p->father_nr = current->task_nr;
	p->sched_on_ap = 0; /* 这里是自己埋的最后一个大坑，如果在AP上运行的task调用fork的话，其子进程的sched_on_ap肯定等于1了，这样它就永远不能被BSP调度运行 */
	p->pid = pid;
	p->father = current->pid;
	p->counter = p->priority;
	p->signal = 0;
	p->alarm = 0;
	p->leader = 0;                       /* process leadership doesn't inherit */
	p->utime = p->stime = 0;
	p->cutime = p->cstime = 0;
	p->start_time = jiffies;
	p->tss.back_link = 0;
	p->tss.esp0 = PAGE_SIZE + (long) p;
	p->tss.ss0 = 0x10;
	p->tss.eip = eip;
	p->tss.eflags = eflags;
	p->tss.eax = 0;                   /* fork返回值是0的话，代表运行的是子进程，奥秘就在这里哈哈 */
	p->tss.ecx = ecx;
	p->tss.edx = edx;
	p->tss.ebx = ebx;
	p->tss.esp = esp;
	p->tss.ebp = ebp;
	p->tss.esi = esi;
	p->tss.edi = edi;
	p->tss.es = es & 0xffff;
	p->tss.cs = cs & 0xffff;
	p->tss.ss = ss & 0xffff;
	p->tss.ds = ds & 0xffff;
	p->tss.fs = fs & 0xffff;
	p->tss.gs = gs & 0xffff;
	p->tss.ldt = _LDT(nr);             /* 注意：这里的ldt存储的是LDT表存储在GDT表中的选择符。 */
	p->tss.trace_bitmap = 0x80000000;
	if (last_task_used_math == current)
		__asm__("clts ; fnsave %0"::"m" (p->tss.i387));
	if (copy_mem(nr, p)) {
		task[nr] = NULL;
		if (!free_page((long)p))
			panic("fork.copy_process: trying to free free page");
		return -EAGAIN;
	}

	/* 共享的inode节点一定要同步 */
	lock_op(&copy_process_semaphore);
	for (i = 0; i < NR_OPEN; i++)
		if (f = p->filp[i])
			f->f_count++;
	if (current->pwd)
		current->pwd->i_count++;
	if (current->root)
		current->root->i_count++;
	if (current->executable)
		current->executable->i_count++;
	unlock_op(&copy_process_semaphore);

	set_tss_desc(gdt+(nr<<1)+FIRST_TSS_ENTRY, &(p->tss));
	set_ldt_desc(gdt+(nr<<1)+FIRST_LDT_ENTRY, &(p->ldt));
	p->state = TASK_RUNNING; /* do this last, just in case */

	return pid;  /* 这时的子进程ID不能用last_pid了 */
}

int find_empty_process(void) {
	lock_op(&find_empty_process_semaphore);
	int lock_flag = 1;
	int i;

	repeat: if ((++last_pid) < 0)
		last_pid = 1;
	for (i = 0; i < NR_TASKS; i++)
		if (task[i]) {
			if (task[i]->pid == last_pid)
				goto repeat;
		}

	for (i = 1; i < NR_TASKS; i++) {
		if (!task[i]) {
			/* 多进程并发的时候,这里要先分配一页,起到站位的作用,否则会两个进程共用一个NR. */
			struct task_struct* task_page = (struct task_struct *) get_free_page(PAGE_IN_REAL_MEM_MAP);
			/* 这里一定要先设置任务的状态为不可中断状态,因为默认的是running状态,一旦赋值给task[nr],schedule就能调度运行了
			 * 但是这时相应的任务状态信息还没有设置,所以会报错,这是个大坑啊
			 *  */
			task_page->state = TASK_UNINTERRUPTIBLE;
			task_page->pid = last_pid;  /* 这里要设置PID,否则后面进程并发会造成多个进程共用同一个PID */
			task[i] = task_page;  /* 这样就确保任务此时,是不会被调度的. */
			if (lock_flag) {
				unlock_op(&find_empty_process_semaphore);
				lock_flag = 0;
			}
			return i;
		}
	}
    if (lock_flag) {
    	unlock_op(&find_empty_process_semaphore);
    	lock_flag = 0;
    }
	return -EAGAIN;
}
