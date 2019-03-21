#ifndef _MM_H
#define _MM_H

#define PAGE_SIZE 4096
#define PAGE_IN_REAL_MEM_MAP 1               /* 表示分配的物理地址来自于内核实地址映射的空间，mem_map开始的一部分是内核实地址映射的 */
#define PAGE_IN_MEM_MAP 0                    /* 表示分配的物理地址来自于整个mem_map管理的内存 */

extern unsigned long get_free_page(int real_space);
extern unsigned long put_page(unsigned long page,unsigned long address);
extern int free_page(unsigned long addr);

#endif
