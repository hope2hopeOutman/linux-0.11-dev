/*
 *  linux/kernel/exit.c
 *
 *  (C) 1991  Linus Torvalds
 */

#include <errno.h>
#include <signal.h>
#include <sys/wait.h>

#include <linux/sched.h>
#include <linux/kernel.h>
#include <linux/tty.h>
#include <linux/head.h>
#include <asm/segment.h>

int sys_pause(void);
int sys_close(int fd);
void idle_loop(void);
extern struct apic_info apic_ids[LOGICAL_PROCESSOR_NUM];

void release(struct task_struct * p)
{
	int i;

	if (!p)
		return;
	for (i=1 ; i<NR_TASKS ; i++)
		if (task[i]==p) {
			task[i]=NULL;
			if (!free_page((long)(p->tss.cr3)))  /* 先把该进程占用的目录表释放掉 */
				panic("exit.release dir: trying to free free page");
			if (!free_page((long)p))
				panic("exit.release: trying to free free page");
			schedule();
			return;
		}
	panic("trying to release non-existent task");
}

int send_sig(long sig,struct task_struct * p,int priv)
{
	struct task_struct* current = get_current_task();
	if (!p || sig<1 || sig>32)
		return -EINVAL;
	if (priv || (current->euid==p->euid) || suser())
		p->signal |= (1<<(sig-1));
	else
		return -EPERM;
	return 0;
}

void kill_session(void)
{
	struct task_struct* current = get_current_task();
	struct task_struct **p = NR_TASKS + task;
	
	while (--p > &FIRST_TASK) {
		if (*p && (*p)->session == current->session)
			(*p)->signal |= 1<<(SIGHUP-1);
	}
}

/*
 * XXX need to check permissions needed to send signals to process
 * groups, etc. etc.  kill() permissions semantics are tricky!
 */
int sys_kill(int pid,int sig)
{
	struct task_struct* current = get_current_task();
	struct task_struct **p = NR_TASKS + task;
	int err, retval = 0;

	if (!pid) while (--p > &FIRST_TASK) {
		if (*p && (*p)->pgrp == current->pid) 
			if (err=send_sig(sig,*p,1))
				retval = err;
	} else if (pid>0) while (--p > &FIRST_TASK) {
		if (*p && (*p)->pid == pid) 
			if (err=send_sig(sig,*p,0))
				retval = err;
	} else if (pid == -1) while (--p > &FIRST_TASK)
		if (err = send_sig(sig,*p,0))
			retval = err;
	else while (--p > &FIRST_TASK)
		if (*p && (*p)->pgrp == -pid)
			if (err = send_sig(sig,*p,0))
				retval = err;
	return retval;
}

void tell_father(int pid)
{
	int i;
	struct task_struct * current = get_current_task();
	if (pid)
		for (i=0;i<NR_TASKS;i++) {
			if (!task[i])
				continue;
			if (task[i]->pid != pid)
				continue;
			task[i]->signal |= (1<<(SIGCHLD-1));
			return;
		}
/* if we don't find any fathers, we just release ourselves */
/* This is not really OK. Must change it to make father 1 */
	printk("BAD BAD - no father found\n\r");
	release(current);
}

int do_exit(long code)
{
	struct task_struct* current = get_current_task();
	int i;

	//printk("do_exit call free_page_tables before\n\r");
	free_page_tables(get_base(current->ldt[1]),get_limit(0x0f),current);
	free_page_tables(get_base(current->ldt[2]),get_limit(0x17),current);
    //printk("do_exit call free_page_tables after\n\r");

	for (i=0 ; i<NR_TASKS ; i++)
		if (task[i] && task[i]->father == current->pid) {
			task[i]->father = 1;
			if (task[i]->state == TASK_ZOMBIE)
				/* assumption task[1] is always init */
				(void) send_sig(SIGCHLD, task[1], 1);
		}
	for (i=0 ; i<NR_OPEN ; i++)
		if (current->filp[i])
			sys_close(i);
	iput(current->pwd);
	current->pwd=NULL;
	iput(current->root);
	current->root=NULL;
	iput(current->executable);
	current->executable=NULL;
	if (current->leader && current->tty >= 0)
		tty_table[current->tty].pgrp = 0;
	if (last_task_used_math == current)
		last_task_used_math = NULL;
	if (current->leader)
		kill_session();
	current->state = TASK_ZOMBIE;
	current->exit_code = code;
	tell_father(current->father);
	if (get_current_apic_id() == apic_ids[0].apic_id) {
		/* 在BSP上退出一个进程后，自主调用schedule，这里是不可能的，因为BSP只运行task0和task1，但这两个进程是不可能退出的，除非系统崩溃了 */
	    schedule();
	}
	else {
		unsigned long apic_id = get_current_apic_id();
		printk("task[%d],exit at AP[%d]\n\r", current->task_nr, apic_id);
		unsigned long apic_index =  get_current_apic_index();
		/* 这里一定要将AP的CR3设置为0x00,因为当前进程已经被释放掉了，所以当前的CR3中的目录表基地址就无效了（此页有可能被其他进程占用了） */
		reset_dir_base();
		/* 重新加载AP的LTR寄存器,使其指向GDT表中NR=0x80的任务tss,这个任务是每个AP共享的,
		 * 主要的作用是,当AP由halt状态被唤醒后执行scheduel操作造成任务切换,用来保存当前halt状态下的context
		 * 如果不设置的话,当前LTR有可能指向0x00内核目录表,或上次执行过的TR(如果该TR已经执行结束了),这时把当前halt状态下的context
		 * 保存到0x00地址处或当前AP的LTR指向的地址处会覆盖内核目录表或已经分配了新任务的TR NR,从而造成系统崩溃.
		 * 这也是埋藏很深的巨坑,这里有必要解释一下.
		 * */
		reset_ap_tss(AP_DEFAULT_TASK_NR);
		/* 下次任务调度的时候,保留当前的任务状态,否则,TSS默认值为0,会映射到0x00内核目录表处,这样会覆盖掉内核目录表,系统会崩溃的 */
		reset_ap_default_task();
		/* 重新设置AP的内核栈指针，然后跳转到idle_loop执行空循环，等待新的IPI中断 */
		alloc_ap_kernel_stack(apic_index,idle_loop);
	}
	return (-1);	/* just to suppress warnings */
}

int sys_exit(int error_code)
{
	return do_exit((error_code&0xff)<<8);
}

int sys_waitpid(pid_t pid,unsigned long * stat_addr, int options)
{
	struct task_struct* current = get_current_task();
	int flag, code;
	struct task_struct ** p;

	verify_area(stat_addr,4);
repeat:
	flag=0;
	for(p = &LAST_TASK ; p > &FIRST_TASK ; --p) {
		if (!*p || *p == current)   /* 过滤掉自身 */
			continue;
		if ((*p)->father != current->pid)  /* 查找当前进程的子进程 */
			continue;
		if (pid>0) {
			if ((*p)->pid != pid)
				continue;
		} else if (!pid) {
			if ((*p)->pgrp != current->pgrp)
				continue;
		} else if (pid != -1) {
			if ((*p)->pgrp != -pid)
				continue;
		}
		switch ((*p)->state) {
			case TASK_STOPPED:
				if (!(options & WUNTRACED))
					continue;
				put_fs_long(0x7f,stat_addr);
				return (*p)->pid;
			case TASK_ZOMBIE:
				current->cutime += (*p)->utime;
				current->cstime += (*p)->stime;
				flag = (*p)->pid;
				code = (*p)->exit_code;
				//printk("pid: %d, fpid: %d, exitCode: %d\n\r", flag,(*p)->father, code);
				release(*p);
				put_fs_long(code,stat_addr);
				return flag;
			default:
				flag=1;
				continue;
		}
	}

	if (flag) {
		if (options & WNOHANG){
			//printk("flag: %d \n\r", flag);
			return 0;
		}

		current->state=TASK_INTERRUPTIBLE;
		schedule();
		/* 子进程如果调用了exit会调用tell_father将father的SIG_CHILD位置1的，这里父进程就是在等这个标志。 */
		if (!(current->signal &= ~(1<<(SIGCHLD-1))))
			goto repeat;
		else
			return -EINTR;
	}
	return -ECHILD;
}


