/*
 *  linux/boot/head.s
 *
 *  (C) 1991  Linus Torvalds
 */

/*
 *  head.s contains the 32-bit startup code.
 *
 * NOTE!!! Startup happens at absolute address 0x00000000, which is also where
 * the page directory will exist. The startup code will be overwritten by
 * the page directory.
 * 以上注释是linux0.11初始版本的说明
 * 现在这个版本已经不是这么玩了哈哈，这里详细介绍一下OS加载的整个过程
 * 1.实地址模式下，bootsect.s负责把OS的前32Kcode加载到0x10000处，然后跳转到setup.s处继续执行。
 * 2.实地址模式下，setup.s负责把之前加载在0x10000处的32K OS code搬运到0x0000处，
 * 然后进入保护模式，并跳转到0x0000处执行head.s（其实这里可以不搬运的，可以进入保护模式，然后直接跳到0x10000处执行head.s代码，just for practice）
 * 3.保护模式下，head.s首先会将0x0000处的32k OS-code再次搬运到5M地址处，并跳转到5M地址相应的offset处继续执行head.s后面的加载剩余OS-code.
 * 4.为什么要把OS-code放在5M地址处呢，因为0~1M用于存放内核的目录表和显存，其余的就占时不用了，1M~5M用于存放内核的页表，这么大空间说明可以管理最大4G内存。
 *
 * 5.关于让每个进程都有独立的4G寻址空间，我这里将内核的地址空间映射到0~1G地址空间，用户态映射到1G~4G的地址空间，其中内核空间是共享的。
 *   5.1  这里关于内核如何能够管理和读写整个内存（尤其是>1G的内存）有两个想法
	 * 1. 当创建一个新的进程的时候，会复制内核目录表，因为内核目录表只有0~1G的目录项是设置的，所以每个进程都是一样的指向相同的页表，所以共享内核。
	 *    当内存大于1G的时候，内核的1G地址空间要分一部分出来用作读写高地址（>1G物理地址）内存，不能都用来实地址一对一映射。
	 *    注意：内核可以管理4G内存，这里的管理指的是用一个数组mem_map，来标记每个物理页的占用情况，这个数组本身是在内核的地址空间的，所以可以管理。
	 *    如果分配的页表或目录表在1G物理地址外的话，那么如果内核要初始化(读写)这个为新进程分配的物理页的话，因为这个地址超过了内核的地址空间了，所以要用内核保留的一部分
	 *    线性地址通过散射(非实地址一对一映射)的方式来映射这个超过1G的物理地址，这样内核读写这部分保留的线性地址，最终会映射到这个超过1G的物理地址上。
	 *    CPU的眼里只有线性地址O(∩_∩)O哈哈~
	 *    尼玛想了一下午，终于理清了怎么搞了，也不知道现代的OS是怎么搞的，这么搞是不是很low啊。
	 *
	 * 2. 终于想到了另一种方式了：可以将内核的地址空间设置为4G,但还是只使用开始的1G线性空间，内核目录表的前1G还是实地址一对一映射，后面的3G内存空间先不设置。
	 *    这样就可以管理和读写整个内存了，这里可能有人会问内核的地址空间只有1G大小，如何产生超过1G的线性地址（既访问用户空间的线性地址），
	 *    还记得FS段吗，它可是一直保留了用户态的段选择符的，通过FS:offset就可以访问用户空间的任何一个地址了，当然这种方式访问>1G物理内存的前提是该进程已经存在且
	 *    用户空间线性地址已经映射了物理地址了，这时内核通过fs:offset的方式访问，在做段限长检查的时候用的是进程的limit而不是内核的，所以可以访问>1G的物理内存，
	 *    但是当内核在处理sys_fork中断创建新进程的时候，用户空间内存映射还没开始呢，这时内核要是通过mem_map找到了一页空闲物理内存且地址>1G，用作新进程的task_struct
	 *    的话，这时就是用内核的DS段去读写了，因为内核的DS和CS的limit都设置为4G了，所以段检查没问题，但是这就得要求内核的4G地址空间映射都得1:1实地址映射了，
	 *    这样的话就麻烦了，当进程从用户态切换到内核态时，要根据内核具体的操作来区分是否切换CR3，有如下几种情况：
	 *       (1)如果内核仅仅是读写用户空间的数据，这时不用切花CR3，因为用户空间的地址映射可不是实地址1:1映射的，要切换到内核目录表反而有问题，
	 *          还是用用户态的目录表，内核可以通过用户态的FS来访问用户态数据。
     *       (2)如果是处理缺页操作的话，这时说明相应的用户空间线性地址还没映射呢，这时就要将CR3切换到内核的目录表了，这样分配实际的物理地址并更新用户态的目录表。
     *       (3)如果在内核态频繁处理1,2两步操作的话，可以想想CR3就得得频繁的切换，而且还得用临时变量来存储用户空间线性地址实际映射到的物理地址，这样内核才好去访问，太烦了。
	 *
	 * 3. 开始实施的时候才发现，第二种方式有问题而且实现起来更麻烦，要在用户态和内核态频繁切花CR3才能实现，效率反而太差。

 * 5.2 内核目录表和页表的初始化
 *     5.2.1 用部分内核空间映射剩余3G用户空间
	 *     1. if total_mem_size <= 1G,那么根据total_mem_size实地址一对一初始化目录表和页表，因为内核线性空间可以cover整个内存，所以就可以读写整个内存了。
	 *     2. if total_mem_size > 1G, 那么内核线性地址空间的前(1024M-128M),可以用实地址一对一映射，最后的128M保留，不实地址一对一映射，用来散射>1G的物理内存，
	 *        进而读写所有物理内存。
	 *        这里还有个待商榷的地方，就是为进程新分配的目录表是否复制内核映射的那部分线性地址，这直接决定了进程由用户态进入内核态是否要重新加载目录表cr3寄存器。
	 *        如果复制的话：
	 *        那么就可以不用切换CR3寄存器，但是内核要自己维护保留线性地址空间已经被占用的情况，因为如果切换到其他任务的话，内核在管理其他任务时要用到
	 *        保留空间的线性地址的话，要能知道哪些是可用的，哪些已经被其他进程占用了，因为你不切换CR3的话，修改的是用户目录表的前1G内核空间中的保留空间，内核的目录表的保留空间是没有更新的.
	 *        如果不复制的话:
	 *        那么就必须要切换CR3寄存器，加载内核的目录表，但内核也还是要维护保留空间的使用情况并与各个进程绑定起来，进程切换和返回的时候可以对上。
	 *     3. 注意这里一定要和分页管理内存区分开来，分页管理内存也就是mem_map数组管理的那部分。
	 *
	 * 5.2.2 将内核limit设置为4G，可以读写整个内存
	 *     1. if total_mem_size <= 1G,那么根据total_mem_size实地址一对一初始化目录表和页表，因为内核线性空间可以cover整个内存，所以就可以读写整个内存了。
	 *     2. if total_mem_size > 1G，那么将内核的代码段和数据段的limit都设置为4G，当创建一个新的进程的时候，会为新进程分配目录表，
	 *        该目录表分配在内核空间还是用户空间，还没想好，暂且是分配在用户空间吧
	 *       （页表是一定要分配的在用户空间的，因为一个进程目录表只有一个，但页表会有很多个，放在内核空间太占内存了），
	 *        并将进程的目录表地址存储在其task_struct中，然后把内核的目录表中前1G有效的目录项复制到进程的目录表中(线性地址和物理地址是实地址1:1映射的)，
	 *        接着再在用户空间分配一个页表用来管理进程的前4M(code+data)并将页表的首地址复制到进程目录表中的相应目录项中，
	 *        最后再分配一页内存（用户空间）用于加载用户开始的4k代码，并将该页的地址复制到进程页表的相应的页表项中((address>>12)<<2),
	 *        到这进程的目录表就可以管理内核空间和用户空间了，进程在用户态和内核态切换是不需要切换cr3寄存器的。
 *
 */
EMULATOR_TYPE      = 0x01       /* 模拟器类型：0:bochs, 1:qemu */
HD_INTERRUPT_READ  = 0x20
OS_BASE_ADDR       = 0x500000
PG_DIR_BASE_ADDR   = 0x000000   /* 内核目录表基地址 */
PG_TAB_BASE_ADDR   = 0x100000   /* 内核页表起始地址,4M大小可以管理4G内存 */

/* boot实地址模式下，预加载的OS大小，这里设置为32K，可以自己调整，但最好不要超过64K，因为实地址模式的段限长是64K，
 * 如果必须要加载>64K的OS代码的话，最好是64K的倍数，这要好处理，不过目前预加载的32K OS代码足够内核初始化了。
 */
OS_PRELOAD_SIZE    = 0x8000

/*
 * 1. Bochs linux版本
 * Deprecated: 因为bochs模拟>1G的内存有问题，不是很稳定，我在linux上自己重编了bochs并将--enable-large-mem选项也加上了，但是>1G还是有问题，这里不纠结了。
 * AP: 问题找到了，是我给vmware虚拟机分配的物理内存有点小了(才2G)，vmware的内存调整为8G,设置bochs配置文件：guest=2044(注意guest设置为2048还是有问题的)，host=1024就可以。
 * 2. Bochs window版本
 * windows版本的bochs我没有加上--enable-large-mem重编过，感兴趣的朋友可以试一下。
 * 不想重编的话，设置megs=1024(4M的倍数)，然后把内核线性地址空间(KERNEL_LINEAR_ADDR_SPACE)设置为512M，这样也能验证用内核保留空间访问>512M的高地址内存。
 * 当然head.h中的6个有关内核线性地址空间的参数也要作相应的调整，将 (#if 0) 改为 (#if 1) 即可。
 */
//KERNEL_LINEAR_ADDR_SPACE = 0x20000  /* granularity 4K (512M) */
KERNEL_LINEAR_ADDR_SPACE = 0x40000    /* granularity 4K (1G)   */

AP_DEFAULT_TASK_NR = 0x50      /* 这个数字已经超出了任务的最大个数64,所以永远不会被schedule方法调度到,仅用来保存AP halt状态下的context */

.text
.globl idt,gdt,tmp_floppy_area,params_table_addr,load_os_addr,hd_read_interrupt,hd_intr_cmd,check_x87,total_memory_size,vm_exit_handler
.globl startup_32,sync_semaphore,idle_loop,ap_default_loop,task_exit_clear,globle_var_test_start,globle_var_test_end,init_pgt
startup_32:
	movl $0x10,%eax
	mov %ax,%ds
	mov %ax,%es
	mov %ax,%fs
	mov %ax,%gs
	mov %ax,%ss

	/* 将preload的32K OS-code再次搬运到5M地址起始处，前面的4K用作kernel的目录表最大可以管理1k个页表，
	 * 4k~640k用作高速buffer存储buffer_head和磁盘块,1M~5M用于存储1k个页表，每个页表可以管理4M物理内存，最大可管理4G物理内存。
	 * 5M后加载OS，如果内存<4G意味着4M页表空间是用不完的，所以也可以用来当作高速buffer，内核态用实地址模式管理整个物理内存。
	 * 这样做的目的是为了能根据内存实际大小，动态分配页表，管理最大4G的内存，并且最大化利用物理内存，同时利于物理内存管理。
	 */
    movl $OS_PRELOAD_SIZE,%ecx   /* 总共要复制的字节数0x8000=32k */
    movl $0x10000,%esi           /* origin addr */
    movl $OS_BASE_ADDR,%edi      /* dest addr */
    cld
    rep
    movsb
    //jmp real_entry    /* 注意这里千万别这么用，这里real_entry标号是相对与head.o的offset，所以要获得其在整个CS段内的offset要加上head的入口地址（既0x500000）*/
    xorl %ecx,%ecx
    lea real_entry,%ecx  /*这里获得的有效地址就是head.o编译时分配的基地址（0x500000+real_enry）*/
    /*
     * 这里再说明一下，这行之前的代码还是以0x00作为基地址执行的，后面的代码通过JMP操作就跳转到以5M为基地址的代码段中执行了，其实还是相同的代码，不过是在以5M为基地址的地址空间寻址运行了。
     */
    jmp *%ecx

/* 下面计算内存的大小统一用4K作为粒度。 */
real_entry:
    xor %edx,%edx
	movw %ds:0x90002,%dx          /* 这里得到的是granularity为64K的extend2的大小，所以要乘以16，前面的16M/4K=4K, 这里也是个小坑，mem长度是2字节，之前用movl是4字节有问题啊 */
	xorl %eax,%eax
	movl $EMULATOR_TYPE,%eax
	cmpl $0x00,%eax
	je bochs_emulator
	addl $0x03,%dx    /* Qemu模拟器，在取扩展内存extend2的时候，会默认少3*64K,原因还不清楚(也是个巨坑，排查好长时间)，这里默认加上+3；用bochs的话，一定要去掉这里。 */
bochs_emulator:
	shl  $0x04,%edx               /* 左移4位乘以16*/
	addl $0x1000,%edx             /* +16M得到总的内存大小，以4K为单位。 */
	movl %edx,total_memory_size   /* 将内存总大小(4K granularity)存储到全局变量total_memory_size */
    lss tmp_floppy_area,%esp      /* 设置GDT表中内核代码段和代码段的limit为实际物理内存大小,这里使用废弃的floppy数据区作为临时栈。 */

    /* 设置内核代码段的limit,因为要支持每个进程都有4G的地址空间，所以内核的地址空间是512M,当内存>512M的时候，也只能设置为512M=0x20000(4K) */
    cmp $KERNEL_LINEAR_ADDR_SPACE,%edx
    jle 1f
    movl $KERNEL_LINEAR_ADDR_SPACE,%edx  /* 如果内存>512M，那么设置内核的limit为512M */
1:  lea gdt,%ebx
    add $0x08,%ebx
    push %edx
    push %ebx
    call set_seg_limit   /* 注意这里的函数调用可不会自动帮你把参数弹出来哈哈，自己动手丰衣足食。  */
    popl %ebx
    popl %edx            /* 恢复内存的总大小，单位是4K，因为set_seg_limit函数有可能会用到edx。*/

    /* 设置内核数据段的limit */
    lea gdt,%ebx
    add $0x10,%ebx
    push %edx
    push %ebx
    call set_seg_limit
    popl %ebx
    popl %edx             /* 恢复内存的总大小，单位是4K,如果内存>512M这里的edx恒等于512M，注意:这里还没开启分页功能，所以地址的访问是实地址映射。 */

    shl $0x0C,%edx        /* 注意：这里的edx应该是<=(512M/4k) */
    /*
     * 此时将内核能实地址映射的内存的(最高地址-4)处设置为临时栈顶，注意“此时”的含义，
     * 因为如果内存>512M的话，内核实地址映射的内存是(512-64)M，因为要留64M地址空间映射>512M内存以及保留空间(64M)的物理地址。
     * 此时还没开启分页，所以整个物理内存都可以实地址访问。
     */
	subl $0x4,%edx
    /* init a temp stack in the highest addr of memory for handling HD intr.  */
init_temp_stack:
	movl %edx,temp_stack
	lss temp_stack,%esp

	call setup_gdt
	call setup_idt

	movl $0x10,%eax		# reload all the segment registers
	mov %ax,%ds		    # after changing gdt. CS was already
	mov %ax,%es		    # reloaded in 'setup_gdt'
	mov %ax,%fs
	mov %ax,%gs
	/* Move the params, such as memeory size, vedio card, hd info to the highest address of the memory, because addr bound will be erased later.  */
    call move_params_to_memend
    /* Mask all other inerrupts except hd interrupt, and register a hd handler to IDT table for handling HD int */
	call set_hd_intr_gate
globle_var_test_start:
    /* Open Interrupt here, just for HD intr. */
	sti
	/* Capture HD intr and handle it , mainly work is get data from HD controller (HD_DATA port), sector by sector. intr trigger per sector. */
	call do_hd_read_request
	/* Pay much more Attenttion here, you must make sure all sectors has been loaded from HD before executing below command. */
	cli
globle_var_test_end:

	/* 设置BSP的apic_id */
	movl $0x01,%eax
	cpuid
	shr $24,%ebx
	pushl %ebx
	pushl $0x00
	call set_apic_id
	popl %ebx
	popl %ebx

	lss stack_start,%esp
	xorl %eax,%eax
1:	incl %eax		    # check that A20 really IS enabled
	movl %eax,0x000000	# loop forever if it isn't
	cmpl %eax,0x100000
	je 1b
/*
 * NOTE! 486 should set bit 16, to check for write-protect in supervisor
 * mode. Then it would be unnecessary with the "verify_area()"-calls.
 * 486 users probably want to set the NE (#5) bit also, so as to use
 * int 16 for math errors.
 */
	movl %cr0,%eax		# check math chip
	andl $0x80000011,%eax	# Save PG,PE,ET
/* "orl $0x10020,%eax" here for 486 might be good */
	orl $2,%eax		# set MP
	movl %eax,%cr0
	call check_x87
	jmp after_page_tables

/*
 * We depend on ET to be correct. This checks for 287/387.
 */
check_x87:
	fninit
	fstsw %ax
	cmpb $0,%al
	je 1f			/* no coprocessor: have to set bits */
	movl %cr0,%eax
	xorl $6,%eax		/* reset MP, set EM */
	movl %eax,%cr0
	ret
.align 4
1:	.byte 0xDB,0xE4		/* fsetpm for 287, ignored by 387 */
	ret

/*
 *  setup_idt
 *
 *  sets up a idt with 256 entries pointing to
 *  ignore_int, interrupt gates. It then loads
 *  idt. Everything that wants to install itself
 *  in the idt-table may do so themselves. Interrupts
 *  are enabled elsewhere, when we can be relatively
 *  sure everything is ok. This routine will be over-
 *  written by the page tables.
 */
setup_idt:
	lea ignore_int,%edx
	movl $0x00080000,%eax
	movw %dx,%ax		/* selector = 0x0008 = cs */
	movw $0x8E00,%dx	/* interrupt gate - dpl=0, present */

	lea idt,%edi
	mov $256,%ecx
rp_sidt:
	movl %eax,(%edi)
	movl %edx,4(%edi)
	addl $8,%edi
	dec %ecx
	jne rp_sidt
	lidt idt_descr
	ret

/*
 *  setup_gdt
 *
 *  This routines sets up a new gdt and loads it.
 *  Only two entries are currently built, the same
 *  ones that were built in init.s. The routine
 *  is VERY complicated at two whole lines, so this
 *  rather long comment is certainly needed :-).
 *  This routine will beoverwritten by the page tables.
 */
setup_gdt:
	lgdt gdt_descr
	ret
/* handle HD intr for reading per sector. */
hd_read_interrupt:
/*
 * It's strange here that when HD_INTERRUPT occurs,
 * the EIP pointer to second code relative to the beginning of this code seg,
 * so insert a redundant code here, to make sure, pushl %eax can be call.
 */
    jmp 1f
1:	pushl %eax
	pushl %ecx
	pushl %edx
	push %ds
	push %es
	push %fs
	movl $0x10,%eax
	mov %ax,%ds
	mov %ax,%es
	mov %ax,%fs
	movb $0x20,%al
	outb %al,$0xA0		# EOI to interrupt controller #1
	jmp 1f			    # give port chance to breathe
1:	jmp 1f

1:	outb %al,$0x20
    movl %ds:hd_intr_cmd,%edx
    cmpl $HD_INTERRUPT_READ,%edx
    jne omt
	call do_read_intr	# interesting way of handling intr.
omt:pop %fs
	pop %es
	pop %ds
	popl %edx
	popl %ecx
	popl %eax
	iret
/* init stack struct for lss comand to load. */
.align 4
temp_stack:
    .long 0x00
    .word 0x10
    .word 0x0
/*
 * Record the beginning address for loading the left OS code to here,
 * because in bootsect.s we have loaded 32K os code to 0x10000 and move it to 0x0000,
 * so here the init value should be OS_BASE_ADDR+0x8000.
 */
.align 4
load_os_addr:
    .long OS_BASE_ADDR+OS_PRELOAD_SIZE

/*
 * This variable will filter all other Intrs from HD, just read intr can be work, it's used in hd_read_interrupt.
 */
.align 4
hd_intr_cmd:
    .long 0x0

/*
 * I put the kernel page tables right after the page directory,
 * using 4 of them to span 16 Mb of physical memory. People with
 * more than 16MB will have to expand this.
 * 现在已经修改为根据内存实际大小动态初始化和分配目录表和页表了，所以这里就废弃了。
 */

/*
.org 0x1000
pg0:

.org 0x2000
pg1:

.org 0x3000
pg2:

.org 0x4000
pg3:

.org 0x5000
*/

/*
 * tmp_floppy_area is used by the floppy-driver when DMA cannot
 * reach to a buffer-block. It needs to be aligned, so that it isn't
 * on a 64kB border.
 * 该地址空间被用作临时堆栈了。
 */
.org 0x1000
tmp_floppy_area:
    .long after_page_tables
    .word 0x10
	.fill 1024-6,1,0

after_page_tables:
	pushl $0		# These are the parameters to main :-)
	pushl $0
	pushl $0
	pushl $L6		# return address for main, if it decides to.
	pushl $main
	jmp setup_paging
L6:
	jmp L6			# main should never return here, but
				# just in case, we know what happens.

/* This is the default interrupt "handler" :-) */
int_msg:
	.asciz "Unknown interrupt\n\r"
.align 4
ignore_int:
	pushl %eax
	pushl %ecx
	pushl %edx
	push %ds
	push %es
	push %fs
	movl $0x10,%eax
	mov %ax,%ds
	mov %ax,%es
	mov %ax,%fs
	pushl $int_msg
	call printk
	popl %eax
	pop %fs
	pop %es
	pop %ds
	popl %edx
	popl %ecx
	popl %eax
	iret


/*
 * Setup_paging
 *
 * This routine sets up paging by setting the page bit
 * in cr0. The page tables are set up, identity-mapping
 * the first 16MB. The pager assumes that no illegal
 * addresses are produced (ie >4Mb on a 4Mb machine).
 *
 * NOTE! Although all physical memory should be identity
 * mapped by this routine, only the kernel page functions
 * use the >1Mb addresses directly. All "normal" functions
 * use just the lower 1Mb, or the local data space, which
 * will be mapped to some other place - mm keeps track of
 * that.
 *
 * For those with more memory than 16 Mb - tough luck. I've
 * not got it, why should you :-) The source is here. Change
 * it. (Seriously - it shouldn't be too difficult. Mostly
 * change some constants etc. I left it at 16Mb, as my machine
 * even cannot be extended past that (ok, but it was cheap :-)
 * I've tried to show which constants to change by having
 * some kind of marker at them (search for "16Mb"), but I
 * won't guarantee that's all :-( )
 */
.align 4
setup_paging:
	movl $1024,%ecx		    /* 1 page - pg_dir，目录表占用一页4K,且在内存开始出0x0000～0x0FFF */
	xorl %eax,%eax
	xorl %edi,%edi			/* pg_dir is at 0x000 */
	cld;rep;stosl           /* 将这4K空间初始化为0 */

    /* total_memory_size存储了内存的大小，但是granularity=4K */
    movl total_memory_size,%eax
    /*
     * 判断内存是否>512M，如果大于512M的话，强制设置内核目录表映射的地址空间为512M，且是实地址映射模式,
     * 注意:此时的内核空间512M是可以完全实地址映射的，因为在内核初始化阶段是不会调用get_free_page，所以也不会remap保留地址空间，
     * 因此保留地址空间的实地址映射还是有效的，可以直接访问。
     */
    cmp $KERNEL_LINEAR_ADDR_SPACE,%eax
    jle 1f
    /*
     * 设置内核实地址映射的地址空间为512M，这里可能有人会问，不是说好了(KERNEL_LINEAR_ADDR_SPACE-64M)的吗，怎么又是了512M了，其实这里512M的地址空间都实地址映射是没问题的，
     * 因为，在调用get_free_page的时候会重置内核保留的64M地址空间对应的物理页的，所以在内核初始化的时候实地址映射内核这64M地址空间是没问题的
     * 而且os_params放在512M-0x8000开始处(内存>=512M)，也需要这样初始化内核目录表，这样在初始化mem和char_dev的时候才好访问这些os_params，
     * 一旦内核完成了初始化，后面的内存分配都要通过get_free_page来管理，这时448M~512M这个64M地址空间就无效了，会被remap的。
     */
    movl $KERNEL_LINEAR_ADDR_SPACE,%eax
    /*
     * 计算内核实地址映射的内存占用多少页表或目录项，也就是多少个目录项。目录项个数=内存大小/4M=total_memory_size/1k
     */
1:  movl $0x400,%ebx
    xorl %edx,%edx       /* 因为divl的除数是双字，所以被除数是%edx:%eax，所以这里要把edx清零。 */
    divl %ebx            /* 商存储在eax中，余数存储在edx中；因为一个页表可以管理4M物理内存所以，内存总大小/4M 就得到页表数了，也是目录项个数 */
    movl %eax,%ecx       /* 备份要初始化目录项个数，因为后面%eax中的值会改变 */
    movl $PG_TAB_BASE_ADDR,%edx
    movl $PG_DIR_BASE_ADDR,%ebx

/* 初始化目录项，将每个页表的基地址赋值到目录项并设置rwx属性。 */
init_dir:
    cmp  $0,%eax
    je init_pgt
    dec %eax
    addl $7,%edx
    movl %edx,(%ebx)
    subl $7,%edx
    cmp $0,%eax
    je init_pgt
    addl $0x1000,%edx
    addl $4,%ebx
    jmp init_dir

/* 初始化所有页表，从最后一个页表的最后一个页表项初始化。 */
init_pgt:
    addl $4092,%edx      /* 注意：这里的edx经过上面的init_dir操作后，存储的就是最后一个页表的首地址，所以+4092就得到了最后一个页表项的首地址了。*/
    movl %edx,%edi
	movl %ecx,%eax       /* 获取内核要实地址映射的内存对应的目录项个数 */
    shl $22,%eax         /* 获得内核要实地址映射的的内存的大小(*4M),单位是byte */
    subl $4096,%eax      /* 计算得到要实地址映射的最后一页的基地址 */
    /* 将内存最后一页的起始地址+7(设置为RWX)，赋值给eax */
    addl $7,%eax
	std                 /* 重置方向为地址递减操作 */
1:	stosl			    /* fill pages backwards - more efficient :-) ，类似功能：movl %eax,%ss:%edi;subl $4,%edi*/
	subl $0x1000,%eax
	jge 1b
	xorl %eax,%eax		/* pg_dir is at 0x0000 */
	movl %eax,%cr3		/* cr3 - page directory start */
	movl %cr0,%eax
	orl $0x80000000,%eax
	movl %eax,%cr0		/* set paging (PG) bit */
	ret			        /* this also flushes prefetch-queue */

.align 4
idt_descr:
	.word 256*8-1		# idt contains 256 entries
	.long idt
	.word 0

.align 4
gdt_descr:
	.word 256*8		# so does gdt (not that that's any
	.long gdt		# magic number, but it works for me :^)
	.word 0

.org 0x2000
.align 8
idt:	.fill 256,8,0		# idt is uninitialized
gdt:
	.quad 0x0000000000000000	/* NULL descriptor */
	.quad 0x00c09a0000000fff	/* Code seg, limit default size: 16Mb,it will be changed by set_limit */
	.quad 0x00c0920000000fff	/* Data seg, limit default size: 16Mb */
	.quad 0x0000000000000000	/* TEMPORARY - don't use */
	.fill 252,8,0			    /* space for LDT's and TSS's etc */
/*
 * Record the address of the params table for main func to init.
 * allocated in here to avoid erasing when setup dir_page.
 */
.align 4
params_table_addr:
    .long 0

/* 这里的内存总大小是以4K为granularity的。 */
.align 4
total_memory_size:
    .long 0
.align 4
sync_semaphore:
    .long 0
apic_index:
    .long 1

/* setup.s中，处理SIPI中断会用这段代码来初始化各个AP的段寄存器 */
.org 0x4000
sipi_segment_init:
    xor %eax,%eax
    mov $0x10,%ax
    mov %ax,%ds
    mov %ax,%ss
    mov %ax,%fs
    mov %ax,%es

lock_loop:
    cmp $0x00,%ds:sync_semaphore
    jne lock_loop
    movl $0x01,%eax

    lock   /* xchg默认会加上lock前缀的，这里显示加上lock prefix是为了统一风格 */
    xchg %eax,%ds:sync_semaphore
    /*
     * 这里有必要解释一下，为什么eax!=0就进入等待循环
     * 因为xchg操作默认是加锁操作，所以第一个加锁成功的processor会把sync_semaphore设置为1，对应的eax设置为0(sync_semaphore初始化值为0)
     * 其它加锁不成功的会block住，等到获得锁的processor写完sync_semaphore后，会自动释放锁，然后其它的processor再次竞争，这时加锁成功的第二个processor
     * 会将自己对应的eax设置为1(因为此时的sync_semaphore已经被第一个processor设置为1了)，所以下面的cmp $0x00,%eax就好理解了，这也是Java中sync实现的基础，
     * 通过这个操作，可以实现对大块内存或代码段的执行实现同步。
     * 当然，至于lock操作是通过bus-lock实现的还是cacheline-lock实现的，这就和要写的内存的类型有关了，这就需要配置MTRR了。
     * 1. 如果该块内存是WB(write back)类型的，就是cacheline-lock，这时是不会阻塞其它进程访问其它内存块的.
     * 2. 如果该块内存是UC(uncacheable)类型的，就是bus-lock，这时会阻塞其它进程对内存的访问.
     */
    cmp $0x00,%eax
    jne lock_loop

    /*
     * AP要想用call指令进行函数调用，必须要先初始化esp，因为power reset或init后APs的esp都是设置为0,
     * 而此时系统的内核的页目录表是放置在0x00地址处的，Ap的所有段的base也都是设置为0的，所以AP的函数调用操作对栈的操作，会覆盖内核的目录表项，
     * 造成内核崩溃的，这点一定要注意。
     * 当内核进入保护模式并开启了分页模式，此时内核的目录表和页表都已经初始化好了，也就是内核完成了对内核线性地址空间的物理内存的实地址映射，
     * 所以这时，所有的中断操作，都会涉及到对栈的操作，这时一定要搞清楚栈的基地址是否在内存最开始的一页地址范围内，那是内核的目录表位置，千万别覆盖了。
     */
    lss tmp_floppy_area,%esp
    movl $0x01,%eax
    cpuid
    shr $24,%ebx

    push %ebx
    push %ds:apic_index
    call set_apic_id
    pop %eax
    pop %ebx

    /* 这时eax存储的是apic_index,所以这里作为参数传给alloc_ap_kernel_stack */
    lea return_addr,%ebx
    pushl $0x01  /* 该参数在此无意义 */
    pushl %ebx
    pushl %eax
    call alloc_ap_kernel_stack
return_addr:
    /* 下面连续两个pop操作应该去掉,因为这时内核栈已经重新分配了,指向一个新的内存页的顶端,
     * 这里要是执行pop操作的话,会使ESP指向下一页内存了,会造成下一页内存有效数据被覆盖的错误.
     * */
    //pop %eax
    //pop %eax
    /* 初始化AP apic regs addr, just for bochs, qemu can't support this feature. */
    movl $EMULATOR_TYPE,%eax
    cmpl $0x00,%eax
    jne enable_paging
    push %ds:apic_index
    call init_apic_addr
    pop %ebx

   /* 开启分页机制.
    * 自己挖的巨坑啊，后面老是报readlimit，把current.cr3打印出来映射的都是对的，就是不起作用，
    * 后来发现log里cpu1的cr3总是等于0，恍然大悟啊，分页没开启,ljmp对cr3不起作用的.
    */
enable_paging:
    xorl %eax,%eax		 /* pg_dir is at 0x0000 */
	movl %eax,%cr3		 /* cr3 - page directory start */
	movl %cr0,%eax
	orl $0x80000000,%eax
	movl %eax,%cr0		 /* set paging (PG) bit */

   /* 这里一定要设置一个TSS段的默认保存地址，因为AP在执行第一次任务切换时如果不设置的话，
    * 会将当前内核态的context保存到内核目录表中的(TSS未初始化的默认值是0x00,内核目录表的地址)，大问题啊.
    */
	call reload_ap_ltr

	/* 初始化并启用AP的timer,让AP能够定时调度task执行,不用再劳烦BSP指派任务了哈哈,
	 * 这里有问题,一旦开启了APIC的timer就执行schedule了,下面的解锁操作就不会执行了,又一个自挖的大坑啊.
	 * 要先初始化timer,但要设置其mask位,待AP释放了初始化锁后,就可开启timer了.*/

    call get_current_apic_index
	pushl %eax
	call init_apic_timer
	popl %eax

    pushl %eax    /* 作为start_apic_timer的apic_index参数 */
	addl $0x01,%ds:apic_index
    subl $1,%ds:sync_semaphore

    /* 开启AP timer */
    call start_apic_timer
    popl %eax

    hlt
idle_loop:
    hlt
    xorl %ebx,%ebx
    jmp idle_loop
task_exit_clear:
   call tell_father   /* 这时通知父进程释放其子进程就没问题了 */
   popl %eax          /* 这里弹出的是father_id */
   /*
   pushl %eax
   call print_eax
   popl %eax
   */
   call reset_ap_default_task  /* 设置AP的current_task=ap_default_task,当timer中断调度执行新的task,用于保存当前人executing context */
ap_default_loop:
    hlt
    xorl %eax,%eax
    jmp ap_default_loop

/*
   这里详细解释下为什么要保存Guest的通用寄存器值,而且为什么要在这里保存而不是在C函数中通过嵌入式汇编保存.
   1. 如果基于寄存器进行寻址的话, 一定要备份Guest通用寄存器的值
      例如 movl Ox4(%%eax),%%ecx
      通过上面方式寻址时出现page-fault错误的话，那么当处理完page-fault后执行vmresume,eax寄存器的值很可能会改变的，这时得到的就不是想要的值了
      程序会出错，例如lock_op就会遇到这样的问题，在处理完page-fault后,这个问题太难排查了，压根就没往这方面想.
   2. 如果在C函数的开头嵌入这些备份汇编，GCC优化后就不是你想要的顺序了,备份会有问题.
      所以在汇编文件里加入备份代码最保险了.
*/
vm_exit_handler:
    pushl %edi
    pushl %esi
    pushl %edx
    pushl %ecx
    pushl %ebx
    pushl %eax
    call vm_exit_diagnose
    popl %eax
    popl %ebx
    popl %ecx
    popl %edx
    popl %esi
    popl %edi
 //   vmresume



