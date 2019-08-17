/*
 * common.c
 *
 *  Created on: Aug 13, 2019
 *      Author: outman
 */

#include <linux/common.h>
#include <linux/head.h>


/*
 *  Because of current processor doesn't support vmcs_shadow, so in Guest-Env using vmread or vmwrite will cause VM-EXIT,
 *  So using sgdt and sidt to get gdt/idt base-addr instead of vmread.
 */
unsigned long get_gdt_idt_addr(unsigned long gdt_idt_identity) {
	unsigned char table_base[8] = {0,}; /* 16-bit limit stored in low two bytes, and idt_base stored in high 4bytes. */
	unsigned long base_addr = 0;
	if (gdt_idt_identity == GDT_IDENTITY_NO) {
		__asm__ ("sgdt %1\n\r"   \
				 "movl %2,%%eax\n\r" \
				 :"=a" (base_addr):"m" (*table_base),"m" (*(char*)(table_base+2)));
	} else {
		__asm__ ("sidt %1\n\r"   \
				 "movl %2,%%eax\n\r" \
				 :"=a" (base_addr):"m" (*table_base),"m" (*(char*)(table_base+2)));
	}

	return base_addr;
}
