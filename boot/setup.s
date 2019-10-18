!
!	setup.s		(C) 1991 Linus Torvalds
!
! setup.s is responsible for getting the system data from the BIOS,
! and putting them into the appropriate places in system memory.
! both setup.s and system has been loaded by the bootblock.
!
! This code asks the bios for memory/disk/other parameters, and
! puts them in a "safe" place: 0x90000-0x901FF, ie where the
! boot-block used to be. It is then up to the protected mode
! system to read them from there before the area is overwritten
! for buffer-blocks.
!

! NOTE! These had better be the same as in bootsect.s!

INITSEG  = 0x9000	! we move boot here - out of the way
SYSSEG   = 0x1000	! system loaded at 0x10000 (65536).
SETUPSEG = 0x9020	! this is the current segment
NEEDMOVE = 0x8000

.globl begtext, begdata, begbss, endtext, enddata, endbss
.text
begtext:
.data
begdata:
.bss
begbss:
.text

entry start
start:

! ok, the read went well so we get current cursor position and save it for
! posterity.

	mov	ax,#INITSEG	! this is done in bootsect already, but...
	mov	ds,ax
	mov	ah,#0x03	! read cursor pos
	xor	bh,bh
	int	0x10		! save it in known place, con_init fetches
	mov	[0],dx		! it from 0x90000.

! Get memory size (extended mem, kB)
!这里因为要支持4G内存，所以用function number 0xE801，取扩展内存2的大小16M~4G(单位粒度是64K),扩展内存1(单位粒度是1K)大小为1M~16M,
!所以实际内存大小：extend1+extend2+1M
	mov	ax,#0xE801
	int	0x15
	mov	[2],bx

! Get video-card data:

	mov	ah,#0x0f
	int	0x10
	mov	[4],bx		! bh = display page
	mov	[6],ax		! al = video mode, ah = window width

! check for EGA/VGA and some config parameters

	mov	ah,#0x12
	mov	bl,#0x10
	int	0x10
	mov	[8],ax
	mov	[10],bx
	mov	[12],cx

! Get hd0 data

	mov	ax,#0x0000
	mov	ds,ax
	lds	si,[4*0x41]
	mov	ax,#INITSEG
	mov	es,ax
	mov	di,#0x0080
	mov	cx,#0x10
	rep
	movsb

! Get hd1 data

	mov	ax,#0x0000
	mov	ds,ax
	lds	si,[4*0x46]
	mov	ax,#INITSEG
	mov	es,ax
	mov	di,#0x0090
	mov	cx,#0x10
	rep
	movsb

! Check that there IS a hd1 :-)

	mov	ax,#0x01500
	mov	dl,#0x81
	int	0x13
	jc	no_disk1
	cmp	ah,#3
	je	is_disk1
no_disk1:
	mov	ax,#INITSEG
	mov	es,ax
	mov	di,#0x0090
	mov	cx,#0x10
	mov	ax,#0x00
	rep
	stosb
is_disk1:

! now we want to move to protected mode ...

	cli			! no interrupts allowed !

! first we move the system to it's rightful place

	mov	ax,#0x0000
	cld			! 'direction'=0, movs moves forward

/*
do_move:
	mov	es,ax		! destination segment
	add	ax,#0x1000
	mov	ds,ax		! source segment
	sub	di,di
	sub	si,si
	mov cx,#NEEDMOVE
	rep
	movsb
*/

! then we load the segment descriptors

end_move:
	mov	ax,#SETUPSEG	! right, forgot this at first. didn't work :-)
	mov	ds,ax
	lidt	idt_48		! load idt with 0,0
	lgdt	gdt_48		! load gdt with whatever appropriate

! that was painless, now we enable A20

	call	empty_8042
	mov	al,#0xD1		! command write
	out	#0x64,al
	call	empty_8042
	mov	al,#0xDF		! A20 on
	out	#0x60,al
	call	empty_8042

! well, that went ok, I hope. Now we have to reprogram the interrupts :-(
! we put them right after the intel-reserved hardware interrupts, at
! int 0x20-0x2F. There they won't mess up anything. Sadly IBM really
! messed this up with the original PC, and they haven't been able to
! rectify it afterwards. Thus the bios puts interrupts at 0x08-0x0f,
! which is used for the internal hardware interrupts as well. We just
! have to reprogram the 8259's, and it isn't fun.

	mov	al,#0x11		! initialization sequence
	out	#0x20,al		! send it to 8259A-1
	.word	0x00eb,0x00eb		! jmp $+2, jmp $+2
	out	#0xA0,al		! and to 8259A-2
	.word	0x00eb,0x00eb
	mov	al,#0x20		! start of hardware int's (0x20)
	out	#0x21,al
	.word	0x00eb,0x00eb
	mov	al,#0x28		! start of hardware int's 2 (0x28)
	out	#0xA1,al
	.word	0x00eb,0x00eb
	mov	al,#0x04		! 8259-1 is master
	out	#0x21,al
	.word	0x00eb,0x00eb
	mov	al,#0x02		! 8259-2 is slave
	out	#0xA1,al
	.word	0x00eb,0x00eb
	mov	al,#0x01		! 8086 mode for both
	out	#0x21,al
	.word	0x00eb,0x00eb
	out	#0xA1,al
	.word	0x00eb,0x00eb
	mov	al,#0xFF		! mask off all interrupts for now
	out	#0x21,al
	.word	0x00eb,0x00eb
	out	#0xA1,al

! well, that certainly wasn't fun :-(. Hopefully it works, and we don't
! need no steenking BIOS anyway (except for the initial loading :-).
! The BIOS-routine wants lots of unnecessary data, and it's less
! "interesting" anyway. This is how REAL programmers do it.
!
! Well, now's the time to actually move into protected mode. To make
! things as simple as possible, we do no register set-up or anything,
! we let the gnu-compiled 32-bit programs do that. We just jump to
! absolute address 0x00000, in 32-bit protected mode.

switch_to_protect:
	mov	ax,#0x0001	    ! protected mode (PE) bit
	lmsw	ax		    ! This is it!
	jmpi	0x10000,8	! jmp offset 0 of segment 8 (cs)

! This routine checks that the keyboard command queue is empty
! No timeout is used - if this hangs there is something wrong with
! the machine, and we probably couldn't proceed anyway.
empty_8042:
	.word	0x00eb,0x00eb
	in	al,#0x64	! 8042 status port
	test	al,#2	! is input buffer full?
	jnz	empty_8042	! yes - loop
	ret

!注意这里的limit也要根据内存实际的大小动态调整才行，因为head.s里会在内存最大处建立临时堆栈，
!当call setup_gdt或setup_idt是会自动将下一条指令入栈，这时如果不将这里limit调为实际内存大小，会报beyong limit错误。
!注意如果内存过大的话，例如4G那么就超出了实地址模式能计算的最大值了，所以这里直接将其limit设置为4G即可,因为后面进入保护模式的时候，
!还会根据实际的内存大小重新设置的。
gdt:
	.word	0,0,0,0		! dummy

	.word	0xFFFF		! 4G: limit=0xFFFFF (4G/4K-1=0xFFFFF)
	.word	0x0000		! base address=0
	.word	0x9A00		! code read/exec
	.word	0x00CF		! granularity=4096, 386

	.word	0xFFFF		! 4G: limit=0xFFFFF (4G/4K-1=0xFFFFF)
	.word	0x0000		! base address=0
	.word	0x9200		! data read/write
	.word	0x00CF		! granularity=4096, 386

idt_48:
	.word	0x400		! idt limit=0
	.word	0,0			! idt base=0L

gdt_48:
	.word	0x400		! gdt limit=2048, 256 GDT entries
	.word	512+gdt,0x9	! gdt base = 0x9xxxx ,这里的512表示的是地址，一定要搞清楚了,因为bootsect.s占用一个扇区，所以要+512。

/* CPU个数的存储地址是1K对齐，(base=0x90000)+3K处 */
.org 0xA00
sipi_cpu_count:
    .word 0x01
    .word 0x00
ipi_cpu_count:
    .word 0x01
    .word 0x00
/* head.s中定义的中断描述符表的大小，和基地址 */
idt_descr:
    .word 256*8
    .word 0x2000,0x0050
    .word 0
/* head.s中定义的全局描述符表的大小，和基地址 */
gdt_descr:
    .word 256*8
    .word 0x2800,0x0050
    .word 0
/*
 * 下面解释下，为什么ap_sipi在本文件中要放置在0xE00地址处:
 *
 *	  1. 因为bootsect.s占用一个sector(0x200),从第0个sector开始,这里设置ap_init起始地址(ap_sipi)是第7个sector开始，
 *	     合并后(注意这里不能用链接，容易产生歧义)，加上bootsect.s占用的一个sector,这样ap_sipi就是从第8个sector开始了，所以是4K对齐的,
 *	     这样做就是为了AP能处理SIFI中断消息，这里稍微有点tricky。
 *	     这里再额外解释下，为什么ap_sipi代码段要将ds,fs,es的基地址设置为0x90200
 *	     因为bootsect.s,setup.s和后面的kernel分别被编译成单独的可执行程序的，所以是先去掉这三个可执行的header，
 *	     然后再把他们合并成一个文件的，所以每个可执行文件里的相对寻址都是独立的,所以setup.s的段基地址要加上一个sector，想想看是不是这样.
 *	  2. 这也是内核很有魅力的地方，如今已进入知命境，想怎么玩都可以了.
 *	     下一步就要适配MESI还有根据thermal&performance monitor(这是实现cgroup的根本)将进程调度到合适的processor上，
 *	     搞完这些应该就是知命上品了吧，当然夫子的无矩境是神往哈哈。
 */
.org 0xE00
ap_sipi:              /* 内核链接后，ap_sipi所在的位置 */
    /* 这里的基地址就是0x90200,必须要加上bootsect.s占用的512个字节 */
    mov ax,#0x9020
    mov ds,ax
    mov fs,ax
    mov es,ax
	lock
	inc sipi_cpu_count
	lidt idt_descr
	lgdt gdt_descr
	sti
	mov	ax,#0x0001	                 ! protected mode (PE) bit
	lmsw	ax		                 ! load machine status word,set CR0 bit
	jmpi	0x500000+0x4000,8	     ! jmp offset 0 of segment 8 (cs),这里的cs的基地址是0x00，所以这里要计算segment_init实际的offset.

/*
 * 实地址模式下，处理IFI中断消息
 */
.org 0xF00
ap_ipi:
    mov ax,#0x9020
    mov ds,ax
    mov fs,ax
    mov es,ax
	lock
	inc ipi_cpu_count
ipi_nop_loop:
    nop
    nop
    nop
    jmp ipi_nop_loop

.text
endtext:
.data
enddata:
.bss
endbss:
