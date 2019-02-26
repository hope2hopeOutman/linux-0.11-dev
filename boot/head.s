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
 */

HD_INTERRUPT_READ = 0x20

.text
.globl idt,gdt,pg_dir,tmp_floppy_area,params_table_addr,load_os_addr,hd_read_interrupt,hd_intr_cmd
pg_dir:
.globl startup_32
startup_32:
	movl $0x10,%eax
	mov %ax,%ds
	mov %ax,%es
	mov %ax,%fs
	mov %ax,%gs

	movl %ds:0x90002,%edx
	shl  $0x0A,%edx
	addl $0x100000,%edx
	/* 设置GDT表中内核代码段和代码段的limit为实际物理内存大小,这里使用废弃的floppy数据区作为临时栈。 */
    lss tmp_floppy_area,%esp

    /* 设置内核代码段的limit */
    lea gdt,%ebx
    add $0x08,%ebx
    push %edx
    push %ebx
    call set_seg_limit   /* 注意这里的函数调用可不会自动帮你把参数弹出来哈哈，自己动手丰衣足食。 */
    popl %ebx
    popl %edx            /* 恢复内存的总大小，单位是byte,因为set_seg_limit函数会将它转换为粒度G=4k的数值。*/

    /* 设置内核数据段的limit */
    lea gdt,%ebx
    add $0x10,%ebx
    push %edx
    push %ebx
    call set_seg_limit
    popl %ebx
    popl %edx  /* 恢复内存的总大小，单位是byte,因为set_seg_limit函数会将它转换为粒度G=4k的数值。*/

	subl $0x4,%edx
    /* init a temp stack in the highest addr of memory for handling HD intr.  */
	movl %edx,temp_stack
	lss temp_stack,%esp
	call setup_idt
	call setup_gdt
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
    .long 0x8000

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
.org 0x1000
pg0:

.org 0x2000
pg1:

.org 0x3000
pg2:

.org 0x4000
pg3:

.org 0x5000
/*
 * tmp_floppy_area is used by the floppy-driver when DMA cannot
 * reach to a buffer-block. It needs to be aligned, so that it isn't
 * on a 64kB border.
 */
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
	movl $1024*5,%ecx		/* 5 pages - pg_dir+4 page tables */
	xorl %eax,%eax
	xorl %edi,%edi			/* pg_dir is at 0x000 */
	cld;rep;stosl
	movl $pg0+7,pg_dir		/* set present bit/user r/w */
	movl $pg1+7,pg_dir+4		/*  --------- " " --------- */
	movl $pg2+7,pg_dir+8		/*  --------- " " --------- */
	movl $pg3+7,pg_dir+12		/*  --------- " " --------- */
	movl $pg3+4092,%edi
	movl $0xfff007,%eax		/*  16Mb - 4096 + 7 (r/w user,p) */
	std
1:	stosl			/* fill pages backwards - more efficient :-) */
	subl $0x1000,%eax
	jge 1b
	xorl %eax,%eax		/* pg_dir is at 0x0000 */
	movl %eax,%cr3		/* cr3 - page directory start */
	movl %cr0,%eax
	orl $0x80000000,%eax
	movl %eax,%cr0		/* set paging (PG) bit */
	ret			/* this also flushes prefetch-queue */

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
