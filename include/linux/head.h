#ifndef _HEAD_H
#define _HEAD_H

typedef struct desc_struct {
	unsigned long a,b;
} desc_table[256];

//extern unsigned long pg_dir[1024];
extern unsigned long* pg_dir;
extern desc_table idt,gdt;

#define GDT_NUL 0
#define GDT_CODE 1
#define GDT_DATA 2
#define GDT_TMP 3

#define LDT_NUL 0
#define LDT_CODE 1
#define LDT_DATA 2

#define OS_BASE_ADDR 0x500000
#define KERNEL_LINEAR_ADDR_PAGES 0x40000  /* 内核线性地址空间大小，这里是1G */
#define USER_LINEAR_ADDR_START 0x40000000 /* 用户的线性地址空间是从1G开始的 */
#define LINEAR_ADDR_SWAP_PAGES 0x8000     /* 32K个pages管理128M线性地址空间，用来映射>1G的物理内存。分配在内核1G线性地址空间的高地址段896M~1024M。 */

#endif
