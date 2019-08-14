/*
 * 这里有必要解释一下：这时的esp就是head.s中"lss stack_start,%esp"加载的值，所以说内核初始化的时候虽然处于内核态，但是用的是用户栈。
 * 这里利用iret指令返回用户态后，用的还是stack_start栈，这时就是在用户态下运行task0了,之前的初始化在sched_init()之前是没有任务概念的。
 * 当task0通过系统调用sys_pause进入内核态后，用的就是task0自己的内核栈了，也就是init_task结构体中esp0，这点也是挺tricky的。
 * 关于中断返回这里页着重描述一下：
 * 中断处理有两种情况：
 * 1. 特权级发生跃迁，例如中断处理函数必须在内核态执行，而当前任务运行在用户态。
 *    这时CPU会自动保存用户态的ss,esp,eflag,cs,eip寄存器到内核栈上，当中断处理完，调用IRET命令，会自动从栈中弹出这些值，任务又回到用户态执行。
 * 2. 特权级没有跃迁，例如中断处理函数必须在内核态执行，而当前任务也运行在内核态。
 *    这时CPU会自动保存eflag,cs,eip到内核栈上，但不会保存ss和esp,因为用的还是内核栈，栈没有切换。
 *    这时IRET返回后还是内核态，如何让IRET返回到用户态呢，这就要像下面这样，只要将cs设置为用户态段(selector.CPL.GDT|LDT)，IRET就检测处自己当前是内核态，要返回到用户态，
 *    因此IRET会从栈中多弹出两个值加载到对应的ss和esp寄存器的，ok。
 */
#define move_to_user_mode() \
__asm__("movl %%esp,%%eax\n\t"   \
		"pushl $0x17\n\t" \
		"pushl %%eax\n\t" \
		"pushfl\n\t" \
		"pushl $0x0f\n\t" \
		"pushl $1f\n\t" \
		"iret\n" \
		"1:\tmovl $0x17,%%eax\n\t" \
		"movw %%ax,%%ds\n\t" \
		"movw %%ax,%%es\n\t" \
		"movw %%ax,%%fs\n\t" \
		"movw %%ax,%%gs" \
		:::"ax")

#define sti() __asm__ ("sti"::)
#define cli() __asm__ ("cli"::)
#define nop() __asm__ ("nop"::)

#define iret() __asm__ ("iret"::)

#define _set_gate(gate_addr,type,dpl,addr) \
__asm__("movw %%dx,%%ax\n\t" \
		"movw %0,%%dx\n\t" \
		"movl %%eax,%1\n\t" \
		"movl %%edx,%2" \
		: \
		: "i" ((short) (0x8000+(dpl<<13)+(type<<8))), \
		"o" (*((char *) (gate_addr))), \
		"o" (*(4+(char *) (gate_addr))), \
		"d" ((char *) (addr)),"a" (0x00080000))

#define set_intr_gate(n,addr) \
	_set_gate(&idt[n],14,0,addr)

#define set_intr_gate_in_vm(guest_idt_p,n,addr) \
	_set_gate(guest_idt_p+n,14,0,addr)

#define set_trap_gate(n,addr) \
	_set_gate(&idt[n],15,0,addr)

#define set_system_gate(n,addr) \
	_set_gate(&idt[n],15,3,addr)

#define _set_seg_desc(gate_addr,type,dpl,base,limit) {\
	*(gate_addr) = ((base) & 0xff000000) | \
		(((base) & 0x00ff0000)>>16) | \
		((limit) & 0xf0000) | \
		((dpl)<<13) | \
		(0x00408000) | \
		((type)<<8); \
	*((gate_addr)+1) = (((base) & 0x0000ffff)<<16) | \
		((limit) & 0x0ffff); }

#define _set_tssldt_desc(n,addr,type) \
__asm__ ("movw $104,%1\n\t" \
	"movw %%ax,%2\n\t" \
	"rorl $16,%%eax\n\t" \
	"movb %%al,%3\n\t" \
	"movb $" type ",%4\n\t" \
	"movb $0x00,%5\n\t" \
	"movb %%ah,%6\n\t" \
	"rorl $16,%%eax" \
	::"a" (addr), "m" (*(n)), "m" (*(n+2)), "m" (*(n+4)), \
	 "m" (*(n+5)), "m" (*(n+6)), "m" (*(n+7)) \
	)

#define set_tss_desc(n,addr) _set_tssldt_desc(((char *) (n)),addr,"0x89")
#define set_vm_guest_tss_desc(n,addr) _set_tssldt_desc(((char *) (n)),addr,"0x8B")
#define set_ldt_desc(n,addr) _set_tssldt_desc(((char *) (n)),addr,"0x82")

 /*
  * 这里有必要解释一下，为什么eax!=0就进入等待循环
  * 因为xchg操作默认是加锁操作，所以第一个加锁成功的processor会把sync_semaphore设置为1，对应的eax设置为0(sync_semaphore初始化值为0)
  * 其它加锁不成功的会block住，等到获得锁的processor写完sync_semaphore后，会自动释放锁，然后其它的processor再次竞争，这时加锁成功的第二个processor
  * 会将自己对应的eax设置为1(因为此时的sync_semaphore已经被第一个processor设置为1了)，所以下面的cmp $0x00,%eax就好理解了，这也是Java中sync实现的基础，
  * 通过这个操作，可以实现对大块内存或代码段的执行实现同步。
  * 当然，至于lock操作是通过bus-lock实现的还是cacheline-lock实现的，这就和要写的内存的类型有关了，这就需要配置MTRR了。
  * 1. 如果该块内存是WB(write back)类型的，就是cacheline-lock，这时是不会阻塞其它进程访问其它内存块的.
  * 2. 如果该块内存是UC(uncacheable)类型的，就是bus-lock，这时会阻塞其它进程对整个内存的访问.
  */
extern void lock_op(unsigned long * sem_addr);

/* sem_addr的值为1表示获得lock,如果值为0表示释放了lock */
extern void unlock_op(unsigned long * sem_addr);

/*
#define unlock_op(sem_addr)  \
__asm__ ("cmpl $0x00,%0\n\t" \
		 "jle 1f\n\t" \
         "subl $0x01,%0\n\t" \
		 "1:\n\t" \
		 ::"m" (*sem_addr)   \
	    )
*/


/* delay operation , such as nop */
#define delay_op(count) \
__asm__("delay_loop:\n\t" \
        "cmpl $0x00,%%ecx\n\t" \
		"je 1f\n\t" \
        "nop\n\t" \
		"nop\n\t" \
		"nop\n\t" \
		"dec %%ecx\n\t" \
		"jmp delay_loop\n\t" \
		"1:\n\t" \
		::"c" (count));


