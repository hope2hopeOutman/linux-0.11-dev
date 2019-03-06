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
	 *    还记得FS段吗，它可是一直保留了用户态的段选择符的，通过FS:offset就可以访问用户空间的任何一个地址了，而且当进程从用户态进入内核态还不用切换目录表
	 *    因为在创建进程的目录表的时候，会将前1G的内核空间自动初始化为实地址一对一映射，或直接复制内核的目录表。
	 *    但这样做实际上是将内核的地址空间设置为4G大小了，只不过内核实际只用前面的1G，后面的3G让所有进程共享，由内核动态管理，而不像前面的1G映射已经固定下来了。
	 *    不过这样做就带来了巨大的风险，因为内核态就没有段长保护机制了，好危险啊哈哈
	 *
	 * 3. 我打算两种方式都实现一把，自认为第二种方式实现起来相对简单也很高效的。

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

HD_INTERRUPT_READ  = 0x20
OS_BASE_ADDR       = 0x500000
PG_DIR_BASE_ADDR   = 0x000000
PG_TAB_BASE_ADDR   = 0x100000

.text
.globl idt,gdt,tmp_floppy_area,params_table_addr,load_os_addr,hd_read_interrupt,hd_intr_cmd,check_x87,total_memory_size
.globl startup_32
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
    movl $0x8000,%ecx            /* 总共要复制的字节数0x8000=32k */
    movl $0x0000,%esi            /* origin addr */
    movl $OS_BASE_ADDR,%edi      /* dest addr */
    cld
    rep
    movsb
    //jmp real_entry    /* 注意这里千万别这么用，这里real_entry标号是相对与head.o的offset，所以要获得其在整个CS段内的offset要加上head的入口地址（既0x500000）*/
    xorl %ecx,%ecx
    lea real_entry,%ecx  /*这里获得的有效地址就是head.o编译时分配的基地址（0x500000+real_enry）*/
    jmp *%ecx
/* 下面计算内存的大小统一用4K作为粒度。 */
real_entry:
	movl %ds:0x90002,%edx         /* 这里得到的是granularity为64K的extend2的大小，所以要乘以16，前面的16M/4K=4K */
	shl  $0x04,%edx               /* 左移4位乘以16*/
	addl $0x1000,%edx             /* +16M得到总的内存大小，以4K为单位。 */
	movl %edx,total_memory_size   /* 将内存总大小(4K granularity)存储到全局变量total_memory_size */
	/* 设置GDT表中内核代码段和代码段的limit为实际物理内存大小,这里使用废弃的floppy数据区作为临时栈。 */
    lss tmp_floppy_area,%esp

    /* 设置内核代码段的limit */
    lea gdt,%ebx
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
    popl %edx             /* 恢复内存的总大小，单位是4K。*/

    cmp $0x100000,%edx    /* 比较edx是否等于1M,也就是总内存大小是否是4G，如果等于4G，那么esp=(4G-4)=0xFFFF FFFC */
    jne L4G
    movl $0xFFFFFFFC,%edx
    jmp init_temp_stack
L4G:
    shl $0x0C,%edx
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
    /* Open Interrupt here, just for HD intr. */
	sti
	/* Capture HD intr and handle it , mainly work is get data from HD controller (HD_DATA port), sector by sector. intr trigger per sector. */
	call do_hd_read_request
	/* Pay much more Attenttion here, you must make sure all sectors has been loaded from HD before executing below command. */
	cli

	lss stack_start,%esp
	xorl %eax,%eax
1:	incl %eax		# check that A20 really IS enabled
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
 * so here the init value should be 0x8000.
 */
.align 4
load_os_addr:
    .long OS_BASE_ADDR+0x8000

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
	movl $1024,%ecx		     /* 1 page - pg_dir，目录表占用一页4K,且在内存开始出0x0000～0x0FFF */
	xorl %eax,%eax
	xorl %edi,%edi			/* pg_dir is at 0x000 */
	cld;rep;stosl           /* 将这4K空间初始化为0 */

    /* 首先计算获得内存的大小，注意这时0x90002还没有被覆盖，此处存储的还是扩展内存的大小。 */
    movl total_memory_size,%eax
    /* 计算内存占用多少页表，也就是多少个目录项。 */
    movl $0x400,%ebx
    xorl %edx,%edx       /* 因为divl的除数是双字，所以被除数是%edx:%eax，所以这里要把edx清零。 */
    divl %ebx            /* 商存储在eax中，余数存储在edx中；因为一个页表可以管理4M物理内存所以，内存总大小/4M 就得到页表数了，也是目录项个数。 */
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

//	movl $pg0+7,pg_dir		    /* set present bit/user r/w */
//	movl $pg1+7,pg_dir+4		/*  --------- " " --------- */
//	movl $pg2+7,pg_dir+8		/*  --------- " " --------- */
//	movl $pg3+7,pg_dir+12		/*  --------- " " --------- */

/* 初始化所有页表，从最后一个页表的最后一个页表项初始化。 */
init_pgt:
//	movl $pg3+4092,%edi
    addl $4092,%edx         /* 注意：这里的edx经过上面的init_dir操作后，存储的就是最后一个页表的首地址，所以+4094就得到了最后一个页表项的首地址了。*/
    movl %edx,%edi

//	movl $0xfff007,%eax		/*  16Mb - 4096 + 7 (r/w user,p) */

	/* 首先获取内存总大小。 */
    movl total_memory_size,%eax
	/* 将内存最后一页的起始地址+7，赋值给eax */
	cmp $0x100000,%eax
    jne l4g
	movl $0xFFFFF000,%eax
	jmp rwx
l4g:
    shl $0x0C,%eax
    subl $4096,%eax
rwx:
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
.word 0
idt_descr:
	.word 256*8-1		# idt contains 256 entries
	.long idt
.align 4
.word 0
gdt_descr:
	.word 256*8-1		# so does gdt (not that that's any
	.long gdt		# magic number, but it works for me :^)

	.align 8
idt:	.fill 256,8,0		# idt is uninitialized

gdt:
	.quad 0x0000000000000000	/* NULL descriptor */
	.quad 0x00c09a0000000fff	/* Code seg, limit default size: 16Mb */
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

