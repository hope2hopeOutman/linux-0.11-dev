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

unsigned long find_empty_process_semaphore = 0;

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
int copy_process(int nr, long ebp, long edi, long esi, long gs, long none,
		long ebx, long ecx, long edx, long fs, long es, long ds, long eip,
		long cs, long eflags, long esp, long ss) {
	struct task_struct* current = get_current_task();
	struct task_struct *p;
	int i;
	struct file *f;
    /* 此版本将进程的task_struct和目录表都分配在内核实地址寻址的空间(mem>512M && mem<(512-64)M) */
	p = (struct task_struct *) get_free_page(PAGE_IN_REAL_MEM_MAP);
	if (!p)
		return -EAGAIN;
	task[nr] = p;
	*p = *current; /* NOTE! this doesn't copy the supervisor stack */
	p->task_nr = nr;
	p->father_nr = current->task_nr;
	p->sched_on_ap = 0; /* 这里是自己埋的最后一个大坑，如果在AP上运行的task调用fork的话，其子进程的sched_on_ap肯定等于1了，这样它就永远不能被BSP调度运行 */
	p->state = TASK_UNINTERRUPTIBLE;
	p->pid = last_pid;
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
	for (i = 0; i < NR_OPEN; i++)
		if (f = p->filp[i])
			f->f_count++;
	if (current->pwd)
		current->pwd->i_count++;
	if (current->root)
		current->root->i_count++;
	if (current->executable)
		current->executable->i_count++;
	set_tss_desc(gdt+(nr<<1)+FIRST_TSS_ENTRY, &(p->tss));
	set_ldt_desc(gdt+(nr<<1)+FIRST_LDT_ENTRY, &(p->ldt));
	p->state = TASK_RUNNING; /* do this last, just in case */
	return last_pid;
}

int find_empty_process(void) {
	lock_op(&find_empty_process_semaphore);
	int lock_flag = 1;
	int i;

	repeat: if ((++last_pid) < 0)
		last_pid = 1;
	for (i = 0; i < NR_TASKS; i++)
		if (task[i]) {
			/*printk("find, pid: %d, fpid: %d, currentPid: %d, status: %d\n\r",
					task[i]->pid, task[i]->father, current->pid,
					current->state);*/
			if (task[i]->pid == last_pid)
				goto repeat;
		}

	for (i = 1; i < NR_TASKS; i++) {
		if (!task[i]) {
			//printk("NR: %d, last_pid: %d\n\r", i, last_pid);
			task[i] = task[0];  /* 这里这样赋值,主要是起到设置占位符的作用 */
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
