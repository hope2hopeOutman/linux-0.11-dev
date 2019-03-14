#ifndef _HEAD_H
#define _HEAD_H

typedef struct desc_struct {
	unsigned long a,b;
} desc_table[256];

//extern unsigned long pg_dir[1024];
extern unsigned long* pg_dir;
extern desc_table idt,gdt;


extern void recov_swap_map(unsigned long linear_addr);

extern void recov_swap_linear_addrs(unsigned long* linear_addrs, int length);


/* 根据linear_addr可以定位到内核页表具体的页表项，然后用phy_addr设置该页表项，完成访问>(1G-128M)物理内存的重映射。 */
extern void reset_swap_table_entry(unsigned long linear_addr, unsigned long phy_addr);

/* 对>1G的物理地址进行重映射。返回的是被重映射的内核线性地址 */
extern unsigned long remap_linear_addr(unsigned long phy_addr);

/* 对>1G的物理地址进行重映射。返回的是被重映射的内核线性地址 */
extern unsigned long check_remap_linear_addr(unsigned long** phy_addr);
/* 将被重映射的线性地址缓存起来，等到某个时机，统一释放。 */
extern void caching_linear_addr(unsigned long* addr_array, int length, unsigned long linear_addr);

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
#define PAGE_IN_REAL_MEM_MAP 1            /* 表示分配的物理地址来自于内核实地址映射的空间，mem_map开始的一部分是内核实地址映射的 */
#define PAGE_IN_MEM_MAP 0                 /* 表示分配的物理地址来自于整个mem_map管理的内存 */

#endif
