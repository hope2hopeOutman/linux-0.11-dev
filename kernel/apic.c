/*
 * apic.c
 *
 *  Created on: Aug 20, 2019
 *      Author: outman
 */

#include <linux/head.h>
#include <linux/sched.h>

unsigned long bsp_apic_default_location = BSP_APIC_REGS_DEFAULT_LOCATION;
unsigned long bsp_apic_regs_relocation  = BSP_APIC_REGS_RELOCATION;
unsigned long bsp_apic_icr_relocation   = BSP_APIC_ICR_RELOCATION;

extern struct apic_info apic_ids[LOGICAL_PROCESSOR_NUM];

/*void test_local_pins_intr() {
    int lint0 = 0, lint1 = 0;
   __asm__("movl $0x20350,%%ecx;"  \
		   "movl 0(%%ecx),%%eax;"  \
		   "movl $0x20360,%%ecx;"  \
		   "movl 0(%%ecx),%%ebx;"  \
		   :"=a" (lint0),"=b" (lint1) :);
   printk("lint0: %d, lint1: %d \n\r", lint0, lint1);
}*/

/*void print_apic_enable_status() {
	int apic_status = 0;
	__asm__("xor %%eax,%%eax\n\t" \
			"xor %%edx,%%edx\n\t" \
			"movl $0x1B,%%ecx\n\t" \
			"rdmsr\n\t" \
			:"=a" (apic_status):);
	printk("apic_status: %d \n\r", apic_status);
}*/

/* 初始化APs，包括让AP进入保护模式，开启中断，初始化段寄存器使其指向内核代码段等等 */
void init_ap() {
	for (int i=0;i<LOGICAL_PROCESSOR_NUM;i++) {
		apic_ids[i].kernel_stack = get_free_page(PAGE_IN_REAL_MEM_MAP);
		if (i > 0) {
			init_ap_tss(AP_DEFAULT_TASK_NR+i);
		}
	}
	apic_ids[0].bsp_flag = 1;  /* 这里的代码只有BSP能执行到，所以这里把apic_ids[0]设置为BSP。 */

#if EMULATOR_TYPE
	__asm__(
	/* ============================= Set Apic ID for BSP ============================= */
        "movl $0x01,%%eax\n\t" \
		"cpuid\n\t"            \
		"shr $24,%%ebx\n\t"    \
		"push %%ebx\n\t"       \
		"push $0x00\n\t"       \
		"call set_apic_id\n\t" \
		"pop %%ebx\n\t"        \
		"pop %%ebx\n\t"        \
	/* ============================= End Set Apic ID for BSP ============================= */

	/* ============================= Init APIC timer for BSP ============================= */
		"pushl $0x00\n\t"            \
		"call init_apic_timer\n\t"   \
		"popl %%eax\n\t"             \
    /* ============================= End init APIC timer for BSP ========================= */

	/* ============================= Sending INIT中断消息给APs  ============================= */
	    "movl bsp_apic_default_location,%%edx\n\t" \
		"pushl %%edx\n\t"  \
		"call remap_msr_linear_addr\n\t" /* 返回的linear addr存储在eax中 */ \
		"popl %%edx\n\t" \
		"addl $0x300,%%eax\n\t"          /* The offset of ICR register is 0x300 */  \
		/* 发送 INIT message */
	    "movl $0x000C4500,0(%%eax)\n\t" \
	    "mov $0x05,%%ecx\n\t" \
	    "wait_loop_init:\n\t" \
	    "dec %%ecx\n\t" \
	    "nop\n\t" \
	    "cmp $0x0,%%ecx\n\t" \
	    "jne wait_loop_init\n\t" \
	/* ============================= End sending INIT中断消息给APs ========================== */

	/* ============================= Sending SIPI中断消息给APs ============================= */
		/* 发送 SIPI message */
		"movl $0x000C4691,0(%%eax)\n\t" /* SIPI中断的入口地址是0x91000 */  \
		"pushl %%eax\n\t"                 \
		"call recov_msr_swap_linear\n\t"  \
		"popl %%eax\n\t"                  \
		"mov $0x1000,%%ecx\n\t"           \
	    "wait_loop_sipi:\n\t"             \
	    "dec %%ecx\n\t"                   \
	    "nop\n\t"                         \
	    "cmp $0x0,%%ecx\n\t"              \
	    "jne wait_loop_sipi\n\t"          \
		::);
	/* ============================= End Sending SIPI中断消息给APs ========================== */
#else
	__asm__(
	/* ============================= Set Apic ID for BSP ============================= */
        "movl $0x01,%%eax\n\t" \
		"cpuid\n\t"            \
		"shr $24,%%ebx\n\t"    \
		"push %%ebx\n\t"       \
		"push $0x00\n\t"       \
		"call set_apic_id\n\t" \
		"pop %%ebx\n\t"        \
		"pop %%ebx\n\t"        \
	/* ============================= End Set Apic ID for BSP ============================= */

	/* ============================= Relocating the Local APIC Registers of BSP ============================= */
	/* 看过Intel手册关于MSRs寄存器族的都知道，每个processor的Local APIC registers寄存器默认都是映射到内存的0xFEE00000地址处的，
	 * 所以通过RW该内存地址，就可以操作APIC寄存是发送IPI消息，但是我们的内核线性地址空间最大只有1G，所以超出的部分，要么进行remap，要么就对APIC registers
	 * 的内存映射地址进行relocate，用于发送IPI消息的ICR寄存器的地址默认是0xFEE00300,直接读写0xFEE00300内存地址会报错。以下代码就是对其基地址进行relocate操作。
	 * 每个processor都有自己私有的MSRs寄存器族，地址都是从0开始的(注意这里要和内存地址区分开来)，利用rdmsr和wrmsr来读写这些MSRs，地址1B处就是用来relocate
	 * APIC registers内存基地址的。
	 * 到这里终于明白为什么现代OS要把内核的线性地址空间放在4G线性地址空间的高1G地址空间了，因为大量的MSRs寄存器都是映射到高地址空间的，这样就不用重映射了,
	 * 当然对于多核CPU来说，还是要relocate的。
	 */
		"pushl $0x00\n\t"           \
		"call init_apic_addr\n\t"   \
		"popl %%eax\n\t"            \
    /* ============================= End Relocating the Local APIC Registers of BSP ========================= */

	/* ============================= Init APIC timer for BSP ============================= */
		"pushl $0x00\n\t"           \
		"call init_apic_timer\n\t"   \
		"popl %%eax\n\t"            \
    /* ============================= End init APIC timer for BSP ========================= */

	/* ============================= Sending INIT中断消息给APs  ============================= */
	    "movl bsp_apic_icr_relocation,%%eax\n\t" \
		/* 发送 INIT message */
	    "movl $0x000C4500,0(%%eax)\n\t" \
	    "mov $0x05,%%ecx\n\t" \
	    "wait_loop_init:\n\t" \
	    "dec %%ecx\n\t" \
	    "nop\n\t" \
	    "cmp $0x0,%%ecx\n\t" \
	    "jne wait_loop_init\n\t" \
	/* ============================= End sending INIT中断消息给APs ========================== */

	/* ============================= Sending SIPI中断消息给APs ============================= */
		/* 发送 SIPI message */
		"movl $0x000C4691,0(%%eax)\n\t" /* SIPI中断的入口地址是0x91000 */  \
		"mov $0x1000,%%ecx\n\t" \
	    "wait_loop_sipi:\n\t" \
	    "dec %%ecx\n\t" \
	    "nop\n\t" \
	    "cmp $0x0,%%ecx\n\t" \
	    "jne wait_loop_sipi\n\t" \
		::);
	/* ============================= End Sending SIPI中断消息给APs ========================== */
#endif
}

void print_eax(int eax){
	printk("ap eax: %d\n\r", eax);
}

void print_ap_test() {
	printk("come to ap clear\n\r");
}

/* 保存每个processor的apic-id,通过apic-id就可以解析处CPU的topology */
void set_apic_id(long apic_index,long apic_id) {
	apic_ids[apic_index].apic_id = apic_id;
}

/* 为每个AP分配一个内核栈 */
void alloc_ap_kernel_stack(long ap_index, long return_addr, int father_id) {
	unsigned long stack_base = apic_ids[ap_index].kernel_stack;

	struct ap_stack_struct{
		long* stack;
		short selector;
	} ap_stack = {(long*)(stack_base+4096), 0x10};
    /*
     * 在函数调用里用lss命令的时候一定要小心，要把函数返回的指令地址预先保存下来，
     * 因为重置esp后，调用ret指令弹出的栈顶数据是不正确的，懂否哈哈，这个问题太tricky了，排查了好长时间，
     * bochs的多核调试手段太匮乏了，不好用。 */

	/* 这里也太有必要解释下,为什么要强行将fs设置为执行内核数据段,
	 * 因为普通进程退出后会调用该方法,这时fs是指向普通任务LDT的数据段的值为0x17,普通任务退出后会在内核态运行特殊的ap_default_loop(loop操作),
	 * 等待ap上的timer中断,调度新的进程运行,这时会出现两种情况:
	 * 1. 没有新的进程可供调度,返回继续执行特殊的Loop程序.
	 *    注意,timer中断默认会先push所有段寄存器的,当返回pop这些段寄存器时,有分两种情况:
	 *    1.1 因为fs还是0x17,这时LDT指向的普通任务已经被释放了,所以执行pop fs会报GP 0x14错误.
	 *    1.2 如果当前AP的LDT指向的任务虽然销毁了,但随后该LDT在GDT中的的描述符又被其他AP创建的新任务填上了,这时是不会报GP 0x14, load segment error.
	 * 2. 调度执行了新的任务,发生了任务切换操作.
	 *    注意,当执行TSS switch时,会将当前AP的executing context保存到我们指向定义的ap_default_task.tss中.
	 *    这时因为没有执行pop fs操作是不会检查load segment的有效性的,所以是不会报load segment error的.
	 * 1.1这种情况出现的频率比较高,是个巨坑啊,搞了好长时间,调试手段太匮乏了,也是过了好几遍代码灵光乍现想到的,解决了这个问题,AP自主调度就完全搞定了mama.
	 *  */
	__asm__ ("movl $0x10,%%eax\n\t"  \
			 "mov %%ax,%%fs\n\t" \
			 "lss %2,%%esp\n\t" \
			 "pushl %%ecx\n\t" /* 将father_id入栈，作为后面执行ap_exit_clear代码段中的tell_father函数的入参，这里这样做有点太tricky了,不过我喜欢哈哈. */ \
			 "pushl %%edx\n\t"  \
			 "ret\n\t" \
			::"c" (father_id),"d" (return_addr),"m" (*(&ap_stack))
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
		/*"pushl %%eax\n\t" \
		"call print_eax\n\t" \
		"popl %%eax\n\t" \*/
		::"b" (addr));
}

void init_apic_addr(int apic_index) {
	unsigned long addr = bsp_apic_regs_relocation + (apic_index*0x1000);  /* 为每个APIC的regs分配4K内存 */
	reloc_apic_regs_addr(addr);
	apic_ids[apic_index].apic_regs_addr = addr;
}


/*
 * 这里终于搞清楚AP上的timer为什么不工作了
 * 因为CPU reset后，会将APIC的spurious vector register设置为0x00FF,这样就会自动软件禁用APIC，
 * 而Apic timer寄存器也会被重置为0，但是mask bit会被置为1，屏蔽timer中断，
 * 当要重置tiemr寄存器时，其他位都可重置唯独maskbit是只读的，不能重置，这也是为什么timer没有启动，因为中断被屏蔽掉了，
 * 所以要先软件开启APIC， reset APIC_BASE+0xFO SVR寄存器，然后再设置timer寄存器，将屏蔽位置0就可启动timer了。
 * 尼玛这个问题搞了两天啊，主要是因为BSP reset后的timer是能正常工作的，所以就默认AP也是如此，被迷惑了。
 * 不过文档上也没说BSP会重置SVR的APIC enable位，取消reset后的disable APIC，但是BSP既然reset，timer能正常工作，
 * 说明BSP的init过程enbale了SVR的APIC位，所以这里我也就默认AP的初始化过程也是如此，所以就...
 * 还是要仔细研读Intel文档啊。
 * 10.4.7.1 Local APIC State After Power-Up or Reset
  Following a power-up or reset of the processor, the state of local APIC and its registers are as follows:
• The following registers are reset to all 0s:
• IRR, ISR, TMR, ICR, LDR, and TPR
• Timer initial count and timer current count registers
• Divide configuration register
• The DFR register is reset to all 1s.
• 重点关注这一条: !!! The LVT register is reset to 0s except for the mask bits; these are set to 1s !!!.
• The local APIC version register is not affected.
• The local APIC ID register is set to a unique APIC ID. (Pentium and P6 family processors only). The Arb ID
register is set to the value in the APIC ID register.
• The spurious-interrupt vector register is initialized to 000000FFH. By setting bit 8 to 0, software disables the
local APIC.
• If the processor is the only processor in the system or it is the BSP in an MP system (see Section 8.4.1, “BSP
and AP Processors”); the local APIC will respond normally to INIT and NMI messages, to INIT# signals and to
STPCLK# signals. If the processor is in an MP system and has been designated as an AP; the local APIC will
respond the same as for the BSP. In addition, it will respond to SIPI messages. For P6 family processors only,
an AP will not respond to a STPCLK# signal.

10.4.7.2 Local APIC State After It Has Been Software Disabled
When the APIC software enable/disable flag in the spurious interrupt vector register has been explicitly cleared (as
opposed to being cleared during a power up or reset), the local APIC is temporarily disabled (see Section 10.4.3,
“Enabling or Disabling the Local APIC”). The operation and response of a local APIC while in this software-disabled
state is as follows:
• The local APIC will respond normally to INIT, NMI, SMI, and SIPI messages.
• Pending interrupts in the IRR and ISR registers are held and require masking or handling by the CPU.
  看到这里你应该明白,即使APIC被禁用了,但是APIC还是能发送和处理IPI消息的,这也就是为什么BSP发给AP的进程调度IPI,AP还是能够收到并处理,
  因为BSP的SVR在BIOS init过程中已经开启了APIC,所以就不需要再次设置SVR的APIC enable位了,这些记忆使我想当然的以为AP在BIOS init后
  也是默认开启了APIC,给自己挖了个大坑,搞了两天啊mama.
  不过也就是凭借这个之前看过的模糊记忆作为切入点,再看手册找到了这一大段描述,再次研读,终于明白APIC上的timer为什么不触发中断.
• The local APIC can still issue IPIs. It is software’s responsibility to avoid issuing IPIs through the IPI mechanism
and the ICR register if sending interrupts through this mechanism is not desired.
• The reception of any interrupt or transmission of any IPIs that are in progress when the local APIC is disabled
are completed before the local APIC enters the software-disabled state.
• 重点关注这一条: !!! The mask bits for all the LVT entries are set. Attempts to reset these bits will be ignored. !!!
• (For Pentium and P6 family processors) The local APIC continues to listen to all bus messages in order to keep
its arbitration ID synchronized with the rest of the system.
 *
 *  */
void init_apic_timer(int apic_index) {
	unsigned long init_count = 1193180/HZ;
#if EMULATOR_TYPE
	unsigned long addr = BSP_APIC_REGS_DEFAULT_LOCATION; /* apic.regs base addr for QEMU, default addr: 0xFEE0 0000 */

	__asm__("pushl %%ecx\n\t"    /* 备份init_count的值，后面的call函数调用会覆盖ecx的值。 */      \
			"pushl %%eax\n\t"          \
			"call remap_msr_linear_addr\n\t" /* 因为内核地址空间<=1G,因此访问>1G的物理地址要进行remap */ \
			"movl %%eax,%%edx\n\t"     /* 将映射到物理地址0xFEE00000的线性地址(返回值存在eax中)，保存到edx中 */ \
			"popl %%eax\n\t"           /* 弹出APIC default address 0xFEE00000到eax */ \
			"pushl %%edx\n\t"          /* 备份映射后的线性地址 */ \
			"addl $0xF0,%%edx\n\t"     /* +0xF0得到spurious vector register的addr,这是线性地址了，在4K~640K范围内 */ \
			"movl 0(%%edx),%%eax\n\t"  /* 将SVR的old value复制到eax */ \
			"btsl $0x08,%%eax\n\t"     /* enable SVR的APIC功能,要先开启APIC功能,后面对APIC相关寄存器的操作才能生效啊. */ \
			"movl %%eax,0(%%edx)\n\t"  /* 将新值写入SVR,开启APIC功能,这样下面设置APIC timer相关寄存器才能生效,尤其是timer寄存器的mask位重置才能生效. */ \
			"popl %%eax\n\t"           /* 恢复APIC的base addr到eax,后面初始化APIC timer相关寄存器会用到，这是映射后4K~640K的linear addr */ \

			"movl %%eax,%%edx\n\t"      \
			"addl $0x3E0,%%edx\n\t"     \
			"movl $0x00,0(%%edx)\n\t"  /* Timer clock equals with bus clock divided by divide configuration register */ \

			"cmpl $0x00,%%ebx\n\t"      \
			"jne 1f\n\t"                \
			"movl $0x20083,%%ebx\n\t"  /* BSP立即开启timer中断,不屏蔽. */  \
			"jmp 2f\n\t"                \
			"1:\n\t"                    \
			"movl $0x30083,%%ebx\n\t"  /* AP先屏蔽timer中断,后面会开启. */ \
			"2:\n\t"                    \
			"movl %%eax,%%edx\n\t"      \
			"addl $0x320,%%edx\n\t"     \
            "movl %%ebx,0(%%edx)\n\t" /* LVT timer register, mode: 1(periodic,bit 17), mask: 1 (mask timer intr), vector number: 0x83=APIC_TIMER_INTR_NO  */ \


			"movl %%eax,%%edx\n\t"      \
			"addl $0x380,%%edx\n\t"    /* Initial count register for timer */ \
			"popl %%ecx\n\t"           /* 弹出一开始备份的init_count值 */        \
			"movl %%ecx,0(%%edx)\n\t"   \

            "pushl %%eax\n\t"                /* 注意：此时eax中存储的还是APIC base address(0xFEE00000)对应的linear address */        \
			"call recov_msr_swap_linear\n\t" /* reset被占用的线性地址，这样这个4K align的线性地址就可以映射到其他物理地址了 */            \
			"popl %%eax\n\t"            \

			/*"movl %%eax,%%edx\n\t"      \
			"addl $0x380,%%edx\n\t"     \
			"movl 0(%%edx),%%eax\n\t"   \
			"pushl %%eax\n\t"           \
			"call print_eax\n\t"        \
			"popl %%eax\n\t"            \*/

			::"a" (addr),"b" (apic_index), "c" (init_count));
#else
	unsigned long addr = bsp_apic_regs_relocation + (apic_index*0x1000); /* apic.regs base addr for bochs */

	__asm__("pushl %%eax\n\t"          \
			"movl %%eax,%%edx\n\t"     \
			"addl $0xF0,%%edx\n\t"     /* +0xF0得到spurious vector register的addr */ \
			"movl 0(%%edx),%%eax\n\t"  /* 将SVR的old value复制到eax */ \
			"btsl $0x08,%%eax\n\t"     /* enable SVR的APIC功能,要先开启APIC功能,后面对APIC相关寄存器的操作才能生效啊. */ \
			"movl %%eax,0(%%edx)\n\t"  /* 将新值写入SVR,开启APIC功能,这样下面设置APIC timer相关寄存器才能生效,尤其是timer寄存器的mask位重置才能生效. */ \
			"popl %%eax\n\t"           /* 恢复APIC的base addr到eax,后面初始化APIC timer相关寄存器会用到. */ \

			"movl %%eax,%%edx\n\t"      \
			"addl $0x3E0,%%edx\n\t"     \
			"movl $0x00,0(%%edx)\n\t"  /* Timer clock equals with bus clock divided by divide configuration register */ \

			"cmpl $0x00,%%ebx\n\t"      \
			"jne 1f\n\t"                \
			"movl $0x20083,%%ebx\n\t"  /* BSP立即开启timer中断,不屏蔽. */  \
			"jmp 2f\n\t"                \
			"1:\n\t"                    \
			"movl $0x30083,%%ebx\n\t"  /* AP先屏蔽timer中断,后面会开启. */ \
			"2:\n\t"                    \
			"movl %%eax,%%edx\n\t"      \
			"addl $0x320,%%edx\n\t"     \
            "movl %%ebx,0(%%edx)\n\t" /* LVT timer register, mode: 1(periodic,bit 17), mask: 1 (mask timer intr), vector number: 0x83=APIC_TIMER_INTR_NO  */ \


			"movl %%eax,%%edx\n\t"      \
			"addl $0x380,%%edx\n\t"    /* Initial count register for timer */ \
			"movl %%ecx,0(%%edx)\n\t"   \

			/*"movl %%eax,%%edx\n\t"      \
			"addl $0x380,%%edx\n\t"     \
			"movl 0(%%edx),%%eax\n\t"   \
			"pushl %%eax\n\t"           \
			"call print_eax\n\t"        \
			"popl %%eax\n\t"            \*/

			::"a" (addr),"b" (apic_index), "c" (init_count));
#endif

}

void start_apic_timer(int apic_index) {
#if EMULATOR_TYPE
	unsigned long addr = remap_msr_linear_addr(BSP_APIC_REGS_DEFAULT_LOCATION);
#else
	unsigned long addr = bsp_apic_regs_relocation + (apic_index*0x1000); /* apic.regs base addr */
#endif

	unsigned long init_count = 1193180/HZ;
	__asm__("movl %%eax,%%edx\n\t"      \
			"addl $0x320,%%edx\n\t"     \
            "movl $0x20083,0(%%edx)\n\t" /* LVT timer register, mode: 1(periodic,bit 17), mask: 0, vector number: 0x83=APIC_TIMER_INTR_NO  */ \

			::"a" (addr),"c" (init_count));

#if EMULATOR_TYPE
	recov_msr_swap_linear(addr);
#endif
}


