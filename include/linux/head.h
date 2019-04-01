#ifndef _HEAD_H
#define _HEAD_H

typedef struct desc_struct {
	unsigned long a,b;
} desc_table[256];

//extern unsigned long pg_dir[1024];
extern unsigned long* pg_dir;
extern desc_table idt,gdt;


extern void recov_swap_linear(unsigned long linear_addr);

extern void recov_swap_linear_addrs(unsigned long* linear_addrs, int length);


/* 根据linear_addr可以定位到内核页表具体的页表项，然后用phy_addr设置该页表项，完成访问>(1G-128M)物理内存的重映射。 */
extern void reset_swap_table_entry(unsigned long linear_addr, unsigned long phy_addr);

/* 对>1G的物理地址进行重映射。返回的是被重映射的内核线性地址 */
extern unsigned long remap_linear_addr(unsigned long phy_addr);

/* 对>1G的物理地址进行重映射。返回的是被重映射的内核线性地址 */
extern unsigned long check_remap_linear_addr(unsigned long** phy_addr);
/* 将被重映射的线性地址缓存起来，等到某个时机，统一释放。 */
extern unsigned long caching_linear_addr(unsigned long* addr_array, int length, unsigned long linear_addr);

#define GDT_NUL 0
#define GDT_CODE 1
#define GDT_DATA 2
#define GDT_TMP 3

#define LDT_NUL 0
#define LDT_CODE 1
#define LDT_DATA 2
#define PAGE_TABLE_SIZE 0x400000  /* 一个页表可以管理1024个page，共可以管理4M内存空间 */
#define OS_BASE_ADDR    0x500000  /* 内核代码加载在5M物理地址起始处 */

#if 0
/**************************************************************************************************************************/
/* 要想调整OS的内核线性地址空间及起始地址和用户线性地址空间及起始地址，需要修改下面的6个系统参数。内核512M地址空间参数设置如下： */
#define KERNEL_LINEAR_ADDR_SPACE 0x20000     /* granularity 4K,内核线性地址空间大小512M */
#define KERNEL_REMAP_ADDR_SPACE  0x4000      /* granularity 4K,内核保留的用于remap的线性地址空间大小64M */
#define USER_LINEAR_ADDR_START   0x20000000  /* granularity(byte) 用户的线性地址空间是从512M开始的,也就是用户空间有3.5G */
#define KERNEL_LINEAR_ADDR_START 0x0000      /* granularity(byte) 内核的线性地址空间是从0开始的,limit是512M */
#define USER_LINEAR_ADDR_LIMIT   0xE0000000  /* granularity(byte) 用户的线性地址空间limit=3.5G */
#define KERNEL_LINEAR_ADDR_LIMIT 0x20000000  /* granularity(byte) 内核的线性地址空间limit=512M */
/**************************************************************************************************************************/

#else
/**************************************************************************************************************************/
/* 要想调整OS的内核线性地址空间及起始地址和用户线性地址空间及起始地址，需要修改下面的6个系统参数。内核1024M地址空间参数设置如下： */
#define KERNEL_LINEAR_ADDR_SPACE 0x40000     /* granularity 4K,内核线性地址空间大小1024M */
#define KERNEL_REMAP_ADDR_SPACE  0x8000      /* granularity 4K,内核保留的用于remap的线性地址空间大小128M */
#define USER_LINEAR_ADDR_START   0x40000000  /* granularity(byte) 用户的线性地址空间是从1024M开始的,也就是用户空间有3G大小 */
#define KERNEL_LINEAR_ADDR_START 0x0000      /* granularity(byte) 内核的线性地址空间是从0开始的,limit是1024M */
#define USER_LINEAR_ADDR_LIMIT   0xC0000000  /* granularity(byte) 用户的线性地址空间limit=3G */
#define KERNEL_LINEAR_ADDR_LIMIT 0x40000000  /* granularity(byte) 内核的线性地址空间limit=1G */
/**************************************************************************************************************************/
#endif

#define PAGE_IN_REAL_MEM_MAP 1               /* 表示分配的物理地址来自于内核实地址映射的空间，mem_map开始的一部分是内核实地址映射的 */
#define PAGE_IN_MEM_MAP 0                    /* 表示分配的物理地址来自于整个mem_map管理的内存 */

#define GET_ARRAY_LENGTH(array) (sizeof(array)/sizeof(array[0]))
#define GET_DIR_ENTRY_OFFSET(linear_addr) (linear_addr >> 22)
#define NR_TASKS 64

#define MAX_ARG_PAGES 32

#define OS_INIT_PARAMS_LIMIT      0x0008   /* granularity 4K,系统初始化参数总大小设置为32K，足够了。 */
#define OS_INIT_PARAMS_ADDR       0x90000  /* granularity byte,系统初始化参数在boot阶段存放的地址，后面会复制到内核高地址空间。 */



#endif
