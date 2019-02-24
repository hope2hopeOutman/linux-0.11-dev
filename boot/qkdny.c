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

extern void hd_read_interrupt(void);
extern long params_table_addr, load_os_addr, hd_intr_cmd;

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

int do_controller_ready(int retries) {
	while (--retries && (inb_p(HD_STATUS) & 0xc0) != 0x40)
		;
	return (retries);
}

void move_params_to_memend() {
	long paramsMem = (1 << 20) + ((*(unsigned short *) 0x90002) << 10);
	paramsMem &= 0xfffff000;
	if (paramsMem > 16 * 1024 * 1024)
		paramsMem = 16 * 1024 * 1024;
	paramsMem -= 0x8000;
	params_table_addr = paramsMem;
	copy_struct((long*)0x90000, (long*)paramsMem, 512/4);
}

void set_hd_intr_gate() {
	set_intr_gate(0x2E, &hd_read_interrupt);
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

void do_hd_read_request(void) {
	int os_size = 0x20000;
	HdParamsT hd_params;

	hd_params.cyl = *(unsigned short *) 0x90080;
	hd_params.head = *(unsigned char *) (2 + 0x90080);
	hd_params.wpcom = *(unsigned short *) (5 + 0x90080);
	hd_params.ctl = *(unsigned char *) (8 + 0x90080);
	hd_params.lzone = *(unsigned short *) (12 + 0x90080);
	hd_params.sect = *(unsigned char *) (14 + 0x90080);

	unsigned int block, dev = 0;
	unsigned int sec, head, cyl, sread;
	unsigned int nsect;
	unsigned int totalNeedSects = (os_size - 0x8000) / 512;
	block = (0x100000 + 0x8000) / 512; /* 1M+32K */

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
