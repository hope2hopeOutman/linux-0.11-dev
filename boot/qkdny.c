/*
 *  linux/boot/qkdny.c
 *
 *  (C) 2019 @outman
 */

/*
 * qkdny will load left OS code from HD to memory at address 0x8000,
 * and qkdny will permanently resident in memory.
 */

#include <linux/hdreg.h>
#include <linux/head.h>
#include <asm/io.h>
#include <asm/system.h>

#define OS_SIZE 0x80000         /* 因为当前的OS只有不到120K,所以这里先把OS的大小设置为512K,以后随着功能扩展，OS会变大的，自己调整就行了。 */
#define OS_PRELOAD_SIZE 0x8000  /* 被预加载的OS-CODE大小，这部分代码用于加载剩余的OS-CODE，OS-CODE完全加载后再初始化内核。 */
extern void hd_read_interrupt(void);
extern long params_table_addr, load_os_addr, hd_intr_cmd, total_memory_size;
#define OS_PARAMS_ADDR(total_mem_4k_size) \
					((total_mem_4k_size >= KERNEL_LINEAR_ADDR_SPACE) ? ((KERNEL_LINEAR_ADDR_SPACE-OS_INIT_PARAMS_LIMIT)<<12) :\
					  ((total_mem_4k_size-OS_INIT_PARAMS_LIMIT)<<12)\
					)

typedef struct HardAllInfoT {
	char dummy[32];
} HardAllInfoT;

typedef struct HdParamsT {
	int head, sect, cyl, wpcom, lzone, ctl;
} HdParamsT;

#define port_read(port,buf,nr) \
__asm__("pushl %%edi;cld;rep;insw;popl %%edi"::"d" (port),"D" (buf),"c" (nr))

#define copy_struct(from,to,count) \
__asm__("push %%edi; cld ; rep ; movsl; pop %%edi"::"S" (from),"D" (to),"c" (count))

#define set_limit(addr,limit) \
__asm__("pushl %%edx\n\t" \
    "movw %%dx,%0\n\t" \
	"rorl $16,%%edx\n\t" \
	"movb %1,%%dh\n\t" \
	"andb $0xf0,%%dh\n\t" \
	"orb %%dh,%%dl\n\t" \
	"movb %%dl,%1\n\t" \
	"rorl $16,%%edx\n\t" \
	"popl %%edx\n\t" \
	::"m" (*(addr)), \
	  "m" (*((addr)+6)), \
	  "d" (limit))

/* 这里也要讲内存转换成以4K为单位的总大小. */
void move_params_to_memend() {
	unsigned long totalMem  = 0;
	unsigned long paramsMem = 0;
	/*
	 * 这里其实还有个更简单的方法，当内存>KERNEL_LINEAR_ADDR_SPACE时候，直接在KERNEL_LINEAR_ADDR_SPACE内存的最高处开辟一个0x8000(32K)字节的空间，用于存储os_params,
	 * 因为在初始化内核的目录表的时候，虽然当内存>KERNEL_LINEAR_ADDR_SPACE时候只能实地址管理前面的KERNEL_LINEAR_ADDR_SPACE-64M内存，后面的内存只能通过保留的64M地址空间散射访问，
	 * 但是在内核初始化自己的目录表的时候，还是可以把自己地址空间的后64M地址空间映射为实地址模式的，因为内核初始化的时候，是不会调用get_free_page的，
	 * 所以是不会remap这64M地址空间的，所以在执行main函数的各种init操作的时候，是可以正确访问KERNEL_LINEAR_ADDR_SPACE地址空间的最后64M内存的，
	 * 当初始化操作完成，fork task1的时候就会重置内核的64M地址空间用于访问>(KERNEL_LINEAR_ADDR_SPACE-64M)的内存了，当然这时的os_params已经不需要了,
	 * 所以可以被覆盖了。
	 */
	paramsMem = OS_PARAMS_ADDR(total_memory_size);
	params_table_addr = paramsMem;
	copy_struct((long*)OS_INIT_PARAMS_ADDR, (long*)paramsMem, 512/4);
}

int do_controller_ready(int retries) {
	while (--retries && (inb_p(HD_STATUS) & 0xc0) != 0x40)
		;
	return (retries);
}

void set_hd_intr_gate() {
	set_intr_gate(0x2E, &hd_read_interrupt);
	outb_p(inb_p(0x21)&0xfb, 0x21);
	outb(inb_p(0xA1)&0xbf, 0xA1);
}

void set_hd_intr_gate_in_vm(struct desc_struct * guest_idt_p) {
	set_intr_gate_in_vm(guest_idt_p, 0x2E, &hd_read_interrupt);
	outb_p(inb_p(0x21)&0xfb, 0x21);
	outb(inb_p(0xA1)&0xbf, 0xA1);
}

int do_win_result(void) {
	int i = inb_p(HD_STATUS);

	if ((i & (BUSY_STAT | READY_STAT | WRERR_STAT | SEEK_STAT | ERR_STAT))
			== (READY_STAT | SEEK_STAT))
		return (0); /* ok */
	if (i & 1)
		i = inb(HD_ERROR);
	return (1);
}

void do_hd_read_out(unsigned int drive, unsigned int nsect, unsigned int sect,
		unsigned int head, unsigned int cyl, unsigned int cmd,
		HdParamsT* hd_params) {
	register int port asm("dx");
	int retries = 10000;
	repeat: if (!do_controller_ready(retries)) {
		retries = 10000;
		goto repeat;
	};

	if (cmd == WIN_READ) {
		hd_intr_cmd = WIN_READ;
	} else {
		hd_intr_cmd = 0;
	}
	outb_p(hd_params->ctl, HD_CMD);
	port = HD_DATA;
	outb_p(hd_params->wpcom>>2, ++port);
	outb_p(nsect, ++port);
	outb_p(sect, ++port);
	outb_p(cyl, ++port);
	outb_p(cyl>>8, ++port);
	outb_p(0xA0|(drive<<4)|head, ++port);
	outb(cmd, ++port);
}

int do_drive_busy(void) {
	unsigned int i;

	for (i = 0; i < 10000; i++)
		if (READY_STAT == (inb_p(HD_STATUS) & (BUSY_STAT | READY_STAT)))
			break;
	i = inb(HD_STATUS);
	i &= BUSY_STAT | READY_STAT | SEEK_STAT;
	if (i == READY_STAT | SEEK_STAT)
		return (0);
	return (1);
}

void do_reset_controller(HdParamsT* hd_params) {
	int i;

	outb(4, HD_CMD);
	for (i = 0; i < 100; i++)
		nop();
	outb(hd_params->ctl & 0x0f, HD_CMD);
	if (do_drive_busy()) {
	}
	if ((i = inb(HD_ERROR)) != 1) {
	}
}

void do_reset_hd(int nr, HdParamsT* hd_params) {
	do_reset_controller(hd_params);
	do_hd_read_out(nr, hd_params->sect, hd_params->sect, hd_params->head - 1,
			hd_params->cyl, WIN_SPECIFY, hd_params);
}

void do_read_intr() {
	if (do_win_result()) {
		return;
	}
	port_read(HD_DATA, load_os_addr, 256);
	load_os_addr += 512;
}

/* 这块是加载剩余OS-CODE的方法，具体如何访问硬盘参见bootsect.s，那里有我详细的注释。 */
void do_hd_read_request(void) {
	HdParamsT hd_params;

	hd_params.cyl   = *(unsigned short *) (0  + 0x90080);
	hd_params.head  = *( unsigned char *) (2  + 0x90080);
	hd_params.wpcom = *(unsigned short *) (5  + 0x90080);
	hd_params.ctl   = *( unsigned char *) (8  + 0x90080);
	hd_params.lzone = *(unsigned short *) (12 + 0x90080);
	hd_params.sect  = *( unsigned char *) (14 + 0x90080);

	unsigned int block, dev = 0;
	unsigned int sec, head, cyl, sread;
	unsigned int nsect;
	unsigned int totalNeedSects = (OS_SIZE - OS_PRELOAD_SIZE) / 512;
	block = (0x100000 + OS_PRELOAD_SIZE) / 512;  /* 1M+32K，因为现代硬盘的引导区已经扩展到1M了(不是以前的1个扇区了)，所以OS代码是放在1M硬盘空间的开始处的。 */

	do_reset_hd(dev, &hd_params); /* reset hd. */
	do_hd_read_out(dev, hd_params.sect, 0, 0, 0, WIN_RESTORE, &hd_params); /* recalibrate HD. */

	__asm__("divl %4":"=a" (block),"=d" (sec):"0" (block),"1" (0),
			"r" (hd_params.sect));
	__asm__("divl %4":"=a" (cyl),"=d" (head):"0" (block),"1" (0),
			"r" (hd_params.head));

	sread = sec++;
	while (totalNeedSects) {
		if ((hd_params.sect - sread) <= totalNeedSects) {
			nsect = hd_params.sect - sread;
		} else {
			nsect = totalNeedSects;
		}

		do_hd_read_out(dev, nsect, sec, head, cyl, WIN_READ, &hd_params);

		totalNeedSects -= nsect;
		sread += nsect;
		if (sread == hd_params.sect) {
			sread = 0;
			sec = 1;
			if (head == (hd_params.head - 1)) {
				++cyl;
				head = 0;
			} else {
				++head;
			}
		}
	}

	/*
	 *  This code segment is very important, it can make sure the final left sectors(<63 sectors) can be loaded successfully before
	 *  executing CLI command in head.s, This fault spent me three days, i want to cry hahahaha, this event let me have a deep understand is that
	 *  the sync not only by high level app, but also should be concern in kernel. the correct logic sometimes can not make you have the right result,
	 *  in kernel the nop[1...n] command is very important sometimes, sync anytime anywhere.
	 */
	if (!totalNeedSects) {
		int retries = 10000;
		repeat:
		if (!do_controller_ready(retries)) {
			retries = 10000;
			goto repeat;
		};
	}
}

void set_seg_limit(void* addr, unsigned long limit){
   limit -=1;              /* limit的粒度G设置为1(4k) */
   set_limit(addr, limit);
}

/* Just for test HD I/O in VM whether can work well */
void do_hd_read_request_in_vm(void) {
	HdParamsT hd_params;

	hd_params.cyl   = *(unsigned short *) (0  + 0x90080);
	hd_params.head  = *(unsigned  char *) (2  + 0x90080);
	hd_params.wpcom = *(unsigned short *) (5  + 0x90080);
	hd_params.ctl   = *(unsigned  char *) (8  + 0x90080);
	hd_params.lzone = *(unsigned short *) (12 + 0x90080);
	hd_params.sect  = *(unsigned  char *) (14 + 0x90080);

	unsigned int block, dev = 0;
	unsigned int sec, head, cyl, sread;
	unsigned int nsect;
	unsigned int totalNeedSects = 8; /* 读取硬盘1M地址处开始的4K OS code. */
	block = 0x100000 / 512;          /* 1M，因为现代硬盘的引导区已经扩展到1M了(不是以前的1个扇区了)，所以OS代码是放在1M硬盘空间的开始处的. */

	do_reset_hd(dev, &hd_params); /* reset hd. */
	do_hd_read_out(dev, hd_params.sect, 0, 0, 0, WIN_RESTORE, &hd_params); /* recalibrate HD. */

	__asm__("divl %4":"=a" (block),"=d" (sec):"0" (block),"1" (0),
			"r" (hd_params.sect));
	__asm__("divl %4":"=a" (cyl),"=d" (head):"0" (block),"1" (0),
			"r" (hd_params.head));

	sread = sec++;
	while (totalNeedSects) {
		if ((hd_params.sect - sread) <= totalNeedSects) {
			nsect = hd_params.sect - sread;
		} else {
			nsect = totalNeedSects;
		}

		do_hd_read_out(dev, nsect, sec, head, cyl, WIN_READ, &hd_params);

		totalNeedSects -= nsect;
		sread += nsect;
		if (sread == hd_params.sect) {
			sread = 0;
			sec = 1;
			if (head == (hd_params.head - 1)) {
				++cyl;
				head = 0;
			} else {
				++head;
			}
		}
	}

	/*
	 *  This code segment is very important, it can make sure the final left sectors(<63 sectors) can be loaded successfully before
	 *  executing CLI command in head.s, This fault spent me three days, i want to cry hahahaha, this event let me have a deep understand is that
	 *  the sync not only by high level app, but also should be concern in kernel. the correct logic sometimes can not make you have the right result,
	 *  in kernel the nop[1...n] command is very important sometimes, sync anytime anywhere.
	 */
	if (!totalNeedSects) {
		int retries = 10000;
		repeat:
		if (!do_controller_ready(retries)) {
			retries = 10000;
			goto repeat;
		};
	}
}
