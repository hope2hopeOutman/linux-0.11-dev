/*
 *  linux/mm/memory.c
 *
 *  (C) 1991  Linus Torvalds
 */

/*
 * demand-loading started 01.12.91 - seems it is high on the list of
 * things wanted, and it should be easy to implement. - Linus
 */

/*
 * Ok, demand-loading was easy, shared pages a little bit tricker. Shared
 * pages started 02.12.91, seems to work. - Linus.
 *
 * Tested sharing by executing about 30 /bin/sh: under the old kernel it
 * would have taken more than the 6M I have free, but it worked well as
 * far as I could see.
 *
 * Also corrected some "invalidate()"s - I wasn't doing enough of them.
 */

#include <signal.h>

#include <asm/system.h>

#include <linux/sched.h>
#include <linux/head.h>
#include <linux/kernel.h>

volatile void do_exit(long code);

static inline volatile void oom(void)
{
	printk("out of memory\n\r");
	do_exit(SIGSEGV);
}

#define invalidate(dir_addr) \
__asm__("movl %%eax,%%cr3"::"a" ((unsigned long)dir_addr))

/* these are not to be changed without changing head.s etc */
#define MAX_PAGING_PAGES (1024*1024)     /* 4*1024*1024*1024=4G/4k=1M */
extern long PAGING_PAGES, LOW_MEM, HIGH_MEMORY, memory_end, total_memory_size;

#define MAP_NR(addr) (((addr)-LOW_MEM)>>12)
#define USED 100


#define CODE_SPACE(addr) ((((addr)+4095)&~4095) < \
		get_current_task()->start_code + get_current_task()->end_code)

#define copy_page(from,to) \
__asm__("cld ; rep ; movsl"::"S" (from),"D" (to),"c" (1024))

unsigned char mem_map [MAX_PAGING_PAGES] = {0,};
#if EMULATOR_TYPE
unsigned char linear_msr_addr_swap_map[KERNEL_MSR_REMAP_ADDR_SPACE] = {0,};
#endif
unsigned char linear_addr_swap_map[KERNEL_REMAP_ADDR_SPACE] = {0,};
unsigned long page_lock_semaphore = 0;              /* 用于同步get_free_page方法 */
unsigned long remap_linear_addr_semaphore = 0;      /* 896M~1024M */
unsigned long remap_msr_linear_addr_semaphore = 0;  /* 4k~640K    */

/* 根据linear_addr可以定位到内核页表具体的页表项，然后用phy_addr设置该页表项，完成访问>(1G-128M)物理内存的重映射。 */
void reset_swap_table_entry(unsigned long linear_addr, unsigned long phy_addr)
{
	struct task_struct* current = get_current_task();
	unsigned long* dir_item         = (unsigned long*)(current->tss.cr3 + (linear_addr >> 20) & 0xFFC);     /* 计算该线性地址所在的目录项，既相对于目录表基地址的offset */
	unsigned long table_base        = (unsigned long)(*dir_item & 0xFFFFF000);           /* 通过目录项获得对应页表的起始地址,因为内核的目录表基地址是0x00,所以可以这样直接访问 */
	unsigned long table_item_offset = (linear_addr >> 10) & 0xFFC;                       /* 计算页表项在页表中的位置，即相对于页表基地址的offset */
	unsigned long* table_entry      = (unsigned long*)(table_base + table_item_offset);  /* 页表基地址加上页表项的offset就得到对应页表项的实际物理地址了 */
	*table_entry                    = phy_addr | 7; /* 将>(512-64)M的一页物理地址，设置在该页表项中，下次再对该线性地址进行读写操作就会映射到该>(512-64)M的物理地址了哈哈 */
}

/*
 * 当完成对>1G的一页物理地址的重映射并对这一页物理内存初始化后，就会将该物理地址设置到进程用户空间对应的页表项中，这样进程在用户太就可以读写该>1G的一页物理内存了
 * 这个时候，我们要将linear_addr_swap_map数组中对应的线性地址的占用标志位设置为0，表明该线性地址可以被映射到其他>(1G-128M)的物理地址。
 */
#if EMULATOR_TYPE
void recov_msr_swap_linear(unsigned long linear_addr)
{
	if (linear_addr) {
		linear_msr_addr_swap_map[(linear_addr>>12)-KERNEL_MSR_REMAP_ADDR_START] = 0;
		/* 注意：这里是个大坑，要详细解释一下，后悔自己当初为什么不把内核地址空间分配在高地址空间>=3G
		 * 因为QEMU不支持relocate APIC base address,所以只能使用其默认值，但是其默认物理地址是>1G(0xFEE00000)的，
		 * 由于内核的地址空间是分配在低1G的地址空间，所以要访问>1G的地址空间就必须要重映射，这里用4K~640K(内核不用的低地址空间)地址范围remap >1G的物理地址，
		 * 又因为task1要在用户态能执行内核代码，在task1的>1G的地址空间copy了LOW_MEM/4M个内核页表，这样就可以在用户太访问内核代码了，
		 * 又因为(haha原谅我词穷了)所有的NR>1 task都是由task1创建的，都会默认copy task1的目录表，而此时>1G的目录表对应的页表中会存储APIC base address(0xFEE00000),
		 * 因此，当新进程(NR>1)在执行do_execve().free_page_tables().free_page()的时候，会报“trying to free nonexistent page”。
		 * 如果内存是4G的话，这段内存就只能定义为preseverd mem,而不能放到mem_map中被进程所使用。
		 * 后面会完善这块？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？ */
		reset_swap_table_entry(linear_addr, 0);
	}
}

void recov_msr_swap_linear_addrs(unsigned long* linear_addrs, int length) {
	unsigned long linear_addr = 0;
	for (int i=0;i<length;i++){
		linear_addr = *(linear_addrs+i);
		if (linear_addr) {
			recov_msr_swap_linear(linear_addr);
		}
	}
}

/* 对>3G的MSR物理地址进行重映射。返回的是被重映射的内核线性地址 */
unsigned long remap_msr_linear_addr(unsigned long phy_addr)
{
	/*
	 * 当内存>3G时,内核用于映射>3G内存的保留线性地址空间也是多进程共享资源,所以一定要加锁同步,
	 * 否则会导致多个>3G的内存页被映射到了相同的线性地址空间,导致系统崩溃,大坑一口哈哈.
	 * */
    lock_op(&remap_msr_linear_addr_semaphore);
	struct task_struct* current = get_current_task();
	unsigned long linear_addr = 0;
	for (int i=0; i< KERNEL_MSR_REMAP_ADDR_SPACE; i++)
	{
		if (linear_msr_addr_swap_map[i] == 0)
		{
			linear_msr_addr_swap_map[i] = 1;
			linear_addr = (KERNEL_MSR_REMAP_ADDR_START + i) << 12; /* 计算需要被重映射的内核空间线性地址 */
			reset_swap_table_entry(linear_addr, phy_addr & 0xFFFFF000);
			break;
		}
	}
	unlock_op(&remap_msr_linear_addr_semaphore);
	if (!linear_addr) {
		panic("Linear address has been full \n\r");
	}
	invalidate(current->tss.cr3);
	return linear_addr;
}

/* 对>3G的MSR base addr物理地址进行重映射。返回的是被重映射的内核线性地址(4K~640K) */
unsigned long check_msr_remap_linear_addr(unsigned long** phy_addr) {
	unsigned long linear_addr = 0;

	linear_addr = remap_msr_linear_addr((unsigned long)(*phy_addr));    /* 映射的一定是4K对齐的物理页 */
	*phy_addr = (unsigned long*)linear_addr;
	if (!linear_addr) {
		panic("check_remap_linear_addr is error. \n\r");
	}

	return linear_addr;
}
#endif

void recov_swap_linear(unsigned long linear_addr)
{
	if (linear_addr) {
		linear_addr_swap_map[(linear_addr>>12)+KERNEL_REMAP_ADDR_SPACE-KERNEL_LINEAR_ADDR_SPACE] = 0;
	}
}

void recov_swap_linear_addrs(unsigned long* linear_addrs, int length) {
	unsigned long linear_addr = 0;
	for (int i=0;i<length;i++){
		linear_addr = *(linear_addrs+i);
		if (linear_addr) {
			recov_swap_linear(linear_addr);
		}
	}
}

/* 对>1G的物理地址进行重映射。返回的是被重映射的内核线性地址 */
unsigned long remap_linear_addr(unsigned long phy_addr)
{
	/*
	 * 当内存>1G时,内核用于映射>1G内存的保留线性地址空间也是多进程共享资源,所以一定要加锁同步,
	 * 否则会导致多个>1G的内存页被映射到了相同的线性地址空间,导致系统崩溃,大坑一口哈哈.
	 * */
    lock_op(&remap_linear_addr_semaphore);
	struct task_struct* current = get_current_task();
	unsigned long linear_addr = 0;
	for (int i=0; i< KERNEL_REMAP_ADDR_SPACE; i++)
	{
		if (linear_addr_swap_map[i] == 0)
		{
			linear_addr_swap_map[i] = 1;
			linear_addr = ((KERNEL_LINEAR_ADDR_SPACE - KERNEL_REMAP_ADDR_SPACE) + i) << 12; /* 计算需要被重映射的内核空间线性地址 */
			reset_swap_table_entry(linear_addr, phy_addr & 0xFFFFF000);
			break;
		}
	}
	unlock_op(&remap_linear_addr_semaphore);
	if (!linear_addr) {
		panic("Linear address has been full \n\r");
	}
	invalidate(current->tss.cr3);
	return linear_addr;
}

/* 对>1G的物理地址进行重映射。返回的是被重映射的内核线性地址 */
unsigned long check_remap_linear_addr(unsigned long** phy_addr) {
	unsigned long linear_addr = 0;
	if (total_memory_size > KERNEL_LINEAR_ADDR_SPACE &&
	   (unsigned long)*phy_addr >= ((KERNEL_LINEAR_ADDR_SPACE-KERNEL_REMAP_ADDR_SPACE) << 12)) {
		linear_addr = remap_linear_addr((unsigned long)(*phy_addr));    /* 映射的一定是4K对齐的物理页 */
		*phy_addr = (unsigned long*)linear_addr;
		if (!linear_addr) {
			panic("check_remap_linear_addr is error. \n\r");
		}
	}
	return linear_addr;
}

/* 将被重映射的线性地址缓存起来，等到某个时机，统一释放。 */
unsigned long caching_linear_addr(unsigned long* addr_array, int length, unsigned long linear_addr) {
	if (linear_addr) {
		for (int i = 0; i < length; i++) {
			if (*(addr_array + i) == 0) {
				*(addr_array + i) =  linear_addr;
				return;
			}
		}
		printk("addr_array.length=%d \n\r", length);
		panic("cache for linear_addr is full. \n\r");
	}
	return linear_addr;
}

/*
 * Get physical address of first (actually last :-) free page, and mark it
 * used. If no free pages left, return 0.
 * 这里因为将保留线性地址实地址映射的那部分内存也用于分页管理了，所以当分配的未被占用的物理地址>(512-64)M时，
 * 就应该用保留线性地址remap了，而不是>512M物理内存才需要映射，这里有个概念一定要记住：内核地址空间是512M并不代表属于内核的物理地址就有512M，
 * 这个512M的地址空间指的是线性地址空间是属于内核的，而不是物理地址。
 * 所以传给%ebx寄存器的值应该是KERNEL_LINEAR_ADDR_PAGES-LINEAR_ADDR_SWAP_PAGES，从这块物理地址开始比较，而不是从512M开始。
 * 参数real_space的值有两个：0和1
 * 这个参数的值有意义的前提是，内存>512M,本版本规定的最大进程数为1K，一个进程占用8K(task_struct+dir)内核实地址映射的内存,总共占用8M。
 * 1:表示分配的物理页地址<(main_memory_start+8M/4K),也就是来自于mem_map开始8M部分，内核实地址映射的物理页,
 *   本系统是将进程的task_struct和目录表分配在开始的8M空间，是实地址映射的可以直接访问，不需要remap。
 * 0:表示分配的物理页来自于整个mem_map管理的内存页,可以来自于实地址或非实地址映射的物理页。
 */
unsigned long get_free_page(int real_space)
{
/*
 * 首先获得同步锁，然后才能执行页面请求操作
 * 这里还没有配置MTRR,所以page_lock_semaphore是不会缓存的，施加的是bus-lock，
 * 后面会将共享变量设置为WB类型，这样施加的就是cacheline-lock,这样效率就高多了。
 */
lock_op(&page_lock_semaphore);

register unsigned long __res asm("ax");
unsigned long compare_addr = KERNEL_LINEAR_ADDR_SPACE;
unsigned long paging_num = PAGING_PAGES;  /* Granularity: 4K */
unsigned long paging_end = mem_map+(PAGING_PAGES-1);
unsigned long paging_start = LOW_MEM;     /* Granularity: Byte */
unsigned long permanent_real_addr_mapping_space = 0x2000;   /* Granularity 4K (32M permanent real-address mapping space) */

if (memory_end > KERNEL_LINEAR_ADDR_SPACE)  /* 判断实际的物理内存是否>512M,只有>512M才会在内核空间开辟保留空间用于映射>(512M-64M)的物理内存。 */
{
	if (real_space) { /* 这里将会在分页内存区的开始8M(这个值由最大进程数确定)空间，寻找空闲页，用于存储task_struct和目录表 */
		//paging_num = NR_TASKS*2;               /* Granularity is 4K. 64*2*4K = 512K实地址映射空间有点小了 */
		paging_num = permanent_real_addr_mapping_space;
		/* 从main_memory_start开始的paging_num个物理页专用于存储进程的task_struc和dir的，这部分物理页是肯定在内核的实地址寻址空间的 */
		paging_end = mem_map + (paging_num -1);
	}
	else {
		/* 如果分配的物理页不是用于task_struct和dir, 那么要从内存的最高物理页开始查找，查找的总的物理页数不包括task_struc和dir专用的物理页。 */
		/*
		paging_num = (PAGING_PAGES-NR_TASKS*2);
		paging_start += ((NR_TASKS*2)<<12);
		*/
		paging_num = (PAGING_PAGES-permanent_real_addr_mapping_space);
		paging_start += (permanent_real_addr_mapping_space<<12);
	}
	/* 当分配的物理页大于(512-64)M的时候，就得remap了，才能对该物理页进行初始化操作。 */
	compare_addr = KERNEL_LINEAR_ADDR_SPACE-KERNEL_REMAP_ADDR_SPACE;
}

__asm__("std ; repne ; scasb\n\t"
	"jne 2f\n\t"
	"movb $1,1(%%edi)\n\t"
	"sall $12,%%ecx\n\t"          /* 这里自己动手挖了个大坑，差点把自己埋了，当paging_num = (PAGING_PAGES-NR_TASKS*2)时，计算地址的时候要加上NR_TASKS*2，mama */
	"addl %2,%%ecx\n\t"
	"shl $12,%%ebx\n\t"
    "cmp %%ebx,%%ecx\n\t"          /* 根据内存的实际大小和要访问的物理地址页，决定是否需要remap该物理地址才能初始化它 */
    "jl 1f\n\t"
	"pushl %%ecx\n\t"              /* 可用的物理页地址且>(512M-64M),ecx中存储的新分配物理页地址的granularity是byte */
	"call remap_linear_addr\n\t"   /* 将该物理页地址与内核的后128M(1G线性地址空间)某个线性地址页绑定  */
	"popl %%ecx\n\t"               /* 弹出要被remap的>(1G-128)的物理地址 */
	"pushl %%ecx\n\t"              /* 将被重映射的>(512-64)M的物理地址存储栈中，后面的函数返回值会用到 */
	"pushl %%eax\n\t"              /* 将被remap的线性地址入栈,调用remap_linear_addr后的返回值放在eax中，为后面调用recov_swap_linear做准备 */
	//"movl $0x0,%%ecx\n\t"        /* 这里不能用目录地址0了，应该根据current->tss.cr3设置，从而让TLB失效。这里也是个巨坑，其实在remap_linear_addr中已经刷新过了，这里再设置成dir=0就有问题了。 */
	//"movl %%ecx,%%cr3\n\t"       /* 重置CR3内核目录表寄存器，达到刷新TLB的作用，因为有些线性地址被重映射了 */
	"movl %%eax,%%edx\n\t"         /* 将内核地址空间后128M的被重映射的线性地址，放入edx */
	"xorl %%eax,%%eax\n\t"         /* 将eax清零，后面的rep stosl指令要用eax中的值初始化这个物理页,这又是自己挖的坑啊想哭 */
	"movl $1024,%%ecx\n\t"
	"leal 4092(%%edx),%%edi\n\t"   /* 将该线性地址对应的实际物理地址(>(1G-128M))初始化为0 */
	"rep ; stosl\n\t"
	"call recov_swap_linear\n\t"   /* 释放该被remap的线性地址，这样该线性地址就可以被映射到其他>1G-128M的物理地址了 */
	"popl %%eax\n\t"               /* 这时弹出是被选定的用于remap的线性地址 */
	"popl %%eax\n\t"               /* 这时弹出的是被remp的物理地址>512M-64M */
	"jmp 2f\n\t"
	"1:\n\t"
	"movl %%ecx,%%edx\n\t"         /* 这时ecx存储是的内核实地址映射的物理地址 */
	"movl $1024,%%ecx\n\t"
	"leal 4092(%%edx),%%edi\n\t"   /* 将该物理地址页初始化为0 */
	"rep ; stosl\n\t"
	"movl %%edx,%%eax\n\t"         /* 将该物理地址页放入eax，作为返回值。 */
	"2:\n\t"
	"cld\n\t"
	"lea page_lock_semaphore,%%ebx\n\t"
	"pushl %%eax\n\t"              /* eax作为get_free_page函数的返回值,这里必须要备份一下,因为下面unlock_op函数调用会重置eax,作为返回值,即使该函数是void类型 */
	"pushl %%ebx\n\t"
	"call unlock_op\n\t"
	"popl %%ebx\n\t"
	"popl %%eax\n\t"
	:"=a" (__res)
	:"0" (0),"r" (paging_start),"c" (paging_num),
	"D" (paging_end), "b" (compare_addr));

/* 要在返回之前释放同步锁
 * 在此处调用该解锁方法,GCC编译的时候有问题,会遗漏一些操作,对于这种嵌入式混合汇编,觉的GCC在处理上下文依赖关系上,还是不完善.
 * */
//unlock_op(&page_lock_semaphore);
return __res;
}

/*
 * Free a page of memory at physical address 'addr'. Used by
 * 'free_page_tables()'
 */
int free_page(unsigned long addr)
{
	unsigned long addr_bk = addr;
	if (addr < LOW_MEM) return 1;
	if (addr >= HIGH_MEMORY){
		printk("nonexistent page: %p, high_mem: %u \n\r", addr, HIGH_MEMORY);
		panic("trying to free nonexistent page");
	}
	addr -= LOW_MEM;
	addr >>= 12;

	if (mem_map[addr]--) {
		return 1;
	}
	else {
		mem_map[addr]=0;
	}
	printk("free free address: %u \n\r", addr_bk);
	panic("trying to free free page");
	return 0;

}

/*
 * This function frees a continuos block of page tables, as needed
 * by 'exit()'. As does copy_page_tables(), this handles only 4Mb blocks.
 */
int free_page_tables(unsigned long from,unsigned long size, struct task_struct* task_p)
{
	struct task_struct* current = get_current_task();
	unsigned long *pg_table = 0;
	unsigned long * dir = 0;
	unsigned long nr = 0, pti_size = 1024;

	if (from & 0x3fffff)
		panic("free_page_tables called with wrong alignment");
	if (!from) {
		//printk("Free pg_dir, currentPid: %d, fid: %d \n\r", current->pid, current->father);
		panic("Trying to free up swapper memory space");
	}

	/*
	 * 这里一定要注意，对于NR>1的普通进程，前面的KERNEL_LINEAR_ADDR_LIMIT/PAGE_TABLE_SIZE个目录项(1G内核空间)是不能释放的，这点一定要注意。
	 * 获得该任务的用户地址空间目录项的起始地址,这里的cr3是long类型所以要*4计算offset,这点又被坑了 *
	 */
	dir = (unsigned long *)(task_p->tss.cr3 + (KERNEL_LINEAR_ADDR_LIMIT / PAGE_TABLE_SIZE) * 4);

	if (task[0] == task_p || task[1] == task_p) {
		panic("Task0 or Task1 can not be released, fatal error.\n\r");
	}
	//printk("limit size: %u \n\r", size);
	size = USER_LINEAR_ADDR_LIMIT;
	size = size >> 22;  // (size/4M)目录项个数

	for ( ; size-->0 ; dir++) {
		if (!(1 & *dir))
			continue;

		pg_table = (unsigned long *) (0xfffff000 & *dir);

		unsigned long cached_pg_table_base[1] = {0};
		int cached_pg_table_length = GET_ARRAY_LENGTH(cached_pg_table_base);
		caching_linear_addr(cached_pg_table_base, cached_pg_table_length, check_remap_linear_addr(&pg_table));

		for (nr=0 ; nr<pti_size ; nr++) {
			/* 这里再详细解释下吧，为什么要加这个判断条件，
			 * 当task0创建task1的时候，因为task1在用户模式执行的还是内核代码，所以在>=1G的地址空间，映射的是<LOW_MEN的内核代码空间，
			 * 所以会分配LOW_MEM/4M个页表用于映射内核代码空间，这些页表存储的页地址肯定都是<LOW_MEM的，所以是不能释放的，其实在free_page里也有判断。
			 * 当task1创建新的进程时，会copy自己的目录表，因此NR>1的进程也是有机会在用户空间运行内核代码的，不过内核是不会给它这个机会的，
			 * 因为会紧接着执行do_execve并调用该方法释放>=1G地址空间的页表映射的。
			 */
			if (*pg_table >= LOW_MEM) {
				if (!free_page(0xfffff000 & *pg_table)) {
					//printk("error linear addr: %p \n\r", pg_table);
					panic("free_page_tables1: trying to free free page");
				}
			}
			*pg_table = 0;
			pg_table++;
		}
		if (!free_page(0xfffff000 & *dir))
			panic("free_page_tables2: trying to free free page");
		*dir = 0;
		recov_swap_linear_addrs(cached_pg_table_base, cached_pg_table_length);
	}
	invalidate(current->tss.cr3);
	return 0;
}

/*
 *  Well, here is one of the most complicated functions in mm. It
 * copies a range of linerar addresses by copying only the pages.
 * Let's hope this is bug-free, 'cause this one I don't want to debug :-)
 *
 * Note! We don't copy just any chunks of memory - addresses have to
 * be divisible by 4Mb (one page-directory entry), as this makes the
 * function easier. It's used only by fork anyway.
 *
 * NOTE 2!! When from==0 we are copying kernel space for the first
 * fork(). Then we DONT want to copy a full page-directory entry, as
 * that would lead to some serious memory waste - we just copy the
 * first 160 pages - 640kB. Even that is more than we need, but it
 * doesn't take any more memory - we don't copy-on-write in the low
 * 1 Mb-range, so the pages can be shared with the kernel. Thus the
 * special case for nr=xxxx.
 */
int copy_page_tables(unsigned long from,unsigned long to,long size,struct task_struct* new_task)
{
	struct task_struct* current = get_current_task();
	unsigned long * from_page_table = 0;
	unsigned long * to_page_table = 0;  /* 这两个变量也是，一定要初始化为0，凡是有++或--操作的一定要先初始化，不然栈上的old_value会是你的噩梦。 */
	unsigned long this_page = 0;
	unsigned long * from_dir = 0, * to_dir = 0;
	unsigned long nr,dir_count = 0;    /* 这里dir_count一定要初始化为0，不然会有问题的，这是个巨坑啊，想想为什么一定要设置为0? */
	int kernel_dir_item_num = KERNEL_LINEAR_ADDR_LIMIT / PAGE_TABLE_SIZE; /* 内核地址空间/4M得到内核占用的目录项个数 */
	int currentIsTask0Flag = 0;
	if (task[0] == current) {
		currentIsTask0Flag = 1;
	}
	if ((from&0x3fffff) || (to&0x3fffff))
		panic("copy_page_tables called with wrong alignment");
	unsigned long *new_dir_page = (unsigned long*)get_free_page(PAGE_IN_REAL_MEM_MAP);  /* 为新进程分配一页物理内存用于存储目录表 */
	//printk("new_dir=%p, nr=%d, f_pid=%d, f_nr: %d\n\r",new_dir_page, new_task->task_nr, new_task->father, new_task->father_nr);

	if (!new_dir_page) {
		panic("Can not allocate a physical page for new process's dir-table. \n\r ");
	}
	new_task->tss.cr3 = (long)new_dir_page;
	/*
	 * V1: 内核pg_dir = 0，用户pg_dir存储在task_struct中，计算该from线性地址所在的目录项，也就是落在那个页表中。
	 *     因为这段代码是在内核态运行的，内核基地址base=0，所以current->dir_addr+目录项offset得到的就是目录项的实际物理地址。
	 *     如果内存>512M,目录项的物理地址>(512-64)M,那么需要对它进行remap,麻烦啊
	 * V2: 嘿嘿这里将进程的task_struct和目录表都分配在了内核实地址寻址空间了，不用麻烦了，访问他俩不用remap了mm.
	 */
	from_dir = (unsigned long*)current->tss.cr3;
	/*
	 * V1: 计算to线性地址所在的目录项,注意：这里要加上新分配目录页的基地址.
	 *     这里新的目录页也要判断是否需要remap。
	 * V2: new_dir_page是实地址映射的，可以直接访问，不需要remap了。
	 */
	to_dir = new_dir_page;
	//size = ((unsigned) (size+0x3fffff)) >> 22;                      /* 因为每个页表能管理4M物理内存，所以这里(size+(4M-1))/4M确保，不够整除的部分也能被copy. */

	if (currentIsTask0Flag) {
		size = kernel_dir_item_num;
	}
	else {
		/* 这里如果是fork普通进程的话，要把内核地址空间的映射页copy一份，这样从用户态进入内核态就不需要切换CR3了，size=1024,复制父进程的整个目录表和页表 */
		size = 1024;
	}

	for( ; size-->0 ; from_dir++,to_dir++) {
		dir_count++;      /* 记录遍历过的目录数 */
		if (1 & *to_dir)                                            /* to线性地址所在的目录项已经存在了，则出错。 */
			panic("copy_page_tables: already exist");
		if (!(1 & *from_dir))                                       /* 判断from线性地址所在的目录项是否存在。 */
			continue;
		unsigned long cached_page_table_base[4] = {0,};
		int cached_page_table_length = GET_ARRAY_LENGTH(cached_page_table_base);
		/* 读取目录项中存储的某个页表的物理地址，因为页表的地址是4K对齐的，所以要&0xfffff000擦除RWX位。 */
		from_page_table = (unsigned long *) (0xfffff000 & *from_dir);
		caching_linear_addr(cached_page_table_base, cached_page_table_length, check_remap_linear_addr(&from_page_table));

		if (dir_count <= kernel_dir_item_num) {   /* 对于每个新进程来说，前面的kernel_dir_item_num个目录页是内核空间都一样的，共享task0的目录页，所以不需要分配相应的页表。 */
			*to_dir = *from_dir;
			/*
			 * 1. task0 fork task1有点特殊，因为task1在用户态运行的时候还是执行内核代码，因此要把内核空间的代码复制一份到task1的用户空间,
			 *    当task1 fork新进程的话，这个新进程在没有调用do_execve之前，在用户太下运行的还是内核代码，所以复制task1的整个目录表就可以了。
			 * 2. dir_count <= ((LOW_MEM+0x3fffff)>>22)这个条件加在这里好危险啊，当dir_count>((LOW_MEM+0x3fffff)>>22)时，没有分配分配新的页表，
			 *    这时to_page_table指向上一次分配的老的页表的末尾(也就是新分配的)，这样就有可能把老的页表覆盖了。
			 * 3. 当task0 fork task1时，仅仅复制内核代码段占用的目录项及页表，其余部分千万别复制，因为如果把内核实地址映射的所有页表项都复制了，当后面执行free_page_tables
			 *    的时候，会把实地址映射的所有内存页都释放，这样会出大问题，所以这里仅仅复制内核代码占用的目录项和页表，又因为内核段是<12M不在分页内存管理区，所以通过判断内存页是否>LOW_MEM
			 *    就知道当前进程要分配的物理页是不是自己通过get_free_page获得的，释放自己占用的物理页，系统才不会崩溃，这里的处理挺tricky的。
			 */
			if (currentIsTask0Flag && dir_count <= ((LOW_MEM+0x3fffff)>>22)) {
			    if (!(to_page_table = (unsigned long *) get_free_page(PAGE_IN_MEM_MAP))) { /* 获取一页空闲的物理内存，用于存储要copy来自from的页表。 */
					return -1; /* Out of memory, see freeing */
				}
				/*
				 * task0 fork task1时，因为基地址是512M了所以这里要把目录表前512M/4M个目录项复制到后面512M开始地址空间对弈的目录项中。
				 * fork返回后执行task1时，执行的还是内核的代码，但是这时已经在用户态了，所以将线性地址映射到内核代码空间就可以直接执行内核代码do_execve了。
				 */
				*(to_dir + kernel_dir_item_num) = ((unsigned long) to_page_table) | 7;
				caching_linear_addr(cached_page_table_base,	cached_page_table_length,check_remap_linear_addr(&to_page_table));
			}
		} else {
			//printk("start to allocate pg_table, dir_count: %u \n\r", dir_count);
			if (!(to_page_table = (unsigned long *) get_free_page(PAGE_IN_MEM_MAP))) { /* 获取一页空闲的物理内存，用于存储要copy来自from的页表。 */
				return -1;	/* Out of memory, see freeing */
			}
			*to_dir = ((unsigned long) to_page_table) | 7;  /* 将获取的新的页表物理地址，设置RWX=7后赋值给to线性地址所在的目录项。 */
			caching_linear_addr(cached_page_table_base, cached_page_table_length, check_remap_linear_addr(&to_page_table));
		}

		/*
		 * 这里需要改了，原来OS加载到0x0000开始地址处的时候，当fork task1的时候，这里要copy的内核代码只需要640k,所以需要copy 640K/4K=160(0xA0)个页表项；
		 * 注意这里是页表项，因为每个页表也占用1页4K,而每个页表项占用4字节用于记录一个物理页的地址，所以一个页表有1024个页表项，共可管理4M物理空间。
		 * 这里就统一设置copy整个页表了。
		 */
		nr = 1024;

        /* 注意：这里的from_page_table是一个页表的基地址，也就是第一个页表项的地址，所以通过*from_page_table取页表项中记录的物理页地址。 */
		if (((currentIsTask0Flag && dir_count <= ((LOW_MEM+0x3fffff)>>22)) || !currentIsTask0Flag) && to_page_table) {
			for ( ; nr-- > 0 ; from_page_table++,to_page_table++) {
				this_page = *from_page_table;   /* 这里的this_page页表项记录的是物理页地址。 */
				if (!(1 & this_page))        /* 判断该物理页是否存在。 */
					continue;
				//if (this_page >= LOW_MEM) { /* 注意：前1G的内核地址空间对应的目录项一定不要设置为只读，这里是对于新进程的,对于所有fork操作。 */
				this_page &= ~2;   /* 对于子进程来说，所有的页表项都设置为只读。 */

				//}
				/* 将即将共享的页表项设置为只读。 */
				*to_page_table = this_page;  /* 将该物理页地址copy到新分配的页表对应的页表项中。 */
				/*
				 * 这里如果要Copy的物理页地址<=LOW_MEM说明是task0 fork task1,则这时，不能把task0对应的页表项设置为只读，只能将task1的所有页表项都设置为只读，
				 * 当task1运行的时候要进行堆栈操作时，发现共享task0的堆栈对于自己是只读的，所以触发wp异常，这时缺页异常管理函数，会在分页内存区为其分配一页内存为其
				 * 用户态堆栈，其内核太堆栈和task_struct占用一个分页。
				 *
				 * 对于要Copy的物理页地址>LOW_MEM时，这时一定是task1或其子孙执行fork操作，这时要把父子进程的页表项都设置为只读，谁先执行先触发WP异常，在处理WP的时候，
				 * 会将另一个进程的页表项都设置为可写。

				 * 这里判断是不是task0创建task1可以根据currentIsTask0Flag来判定，true是task0 fork task1了,
				 * 如果是task0创建task1,那么只需将task1的页表项都设置为只读即可，task0是决不可以设置为只读的，
				 * 如果是task1创建子进程或其他NR>1的进程创建子进程，那么两个进程的页表项都要设置为只读。
				 */
				/*
				 * 在fork操作中，父进程在什么情况下页表项也设置为只读呢？
				 * 1. task0 fork task1的时候，task0的页表项不能设置为只读。
				 * 2. task1 fork taskN的时候，物理地址>LOW_MEM的页表项都设置为只读
				 * 3. taskN(N>1) fork taskM的时候，物理地址>LOW_MEM的页表项都设置为只读。
				 */
				if (!currentIsTask0Flag) {  /* 如果不是task0 fork task1的话, 物理地址>LOW_MEM的页表项都设置为只读 */
					if (this_page >= LOW_MEM) {
						mem_map[((this_page-LOW_MEM)>>12)]++; //这时内存占用计数等于2，说明有两个进程的页表项指向同一块物理内存页。
						*from_page_table = this_page;         //将父进程的页表项页设置为只读。
					}
				}
			}
		}
		recov_swap_linear_addrs(cached_page_table_base, cached_page_table_length);
	}
	invalidate(current->tss.cr3);
	return 0;
}

/*
 * This function puts a page in memory at the wanted address.
 * It returns the physical address of the page gotten, 0 if
 * out of memory (either when trying to access page-table or
 * page.)
 * 这里的page是实际的物理地址，address是线性地址
 */
unsigned long put_page(unsigned long page,unsigned long address)
{
	struct task_struct* current = get_current_task();
	unsigned long tmp, *page_table;

    /* NOTE !!! This uses the fact that kernel_pg_dir=0 */

	if (page < LOW_MEM || page >= HIGH_MEMORY)
		printk("Trying to put page %p at %p,low_mem: %u,high_mem: %u\n",page,address,LOW_MEM,HIGH_MEMORY);
	if (mem_map[(page-LOW_MEM)>>12] != 1)  /* 在将线性地址页和某个物理地址页关联起来之前，要通过get_free_page先占据该物理页 */
		printk("mem_map disagrees with %p at %p, value: %u\n",page,address,mem_map[(page-LOW_MEM)>>12]);
	//page_table = (unsigned long *) ((address>>20) & 0xffc);
	unsigned long cached_linear_addrs[1] = {0};
	int length = GET_ARRAY_LENGTH(cached_linear_addrs);

	page_table = current->tss.cr3;
	page_table += GET_DIR_ENTRY_OFFSET(address);   /* 获得目录项的实际物理地址:dir_base+dir_entry_offset */
	if ((*page_table)&1)
		page_table = (unsigned long *) (0xfffff000 & *page_table);    /* 获得该线性地址所在的页表的基地址 */
	else {
		if (!(tmp=get_free_page(PAGE_IN_MEM_MAP)))
			return 0;
		*page_table = tmp|7;                      /* 蒋新获得的物理页设置为RWX，然后将其地址复制到对应的目录项中 */
		page_table = (unsigned long *) tmp;       /* 注意啊：这里将page_table指向新分配的页表 */
	}
	/* 到这里，page_table已经指向了对应页表的基地址了，所以也要判断该页表的物理地址是否超出内核的寻址范围，并进行必要的remap. */
	caching_linear_addr(cached_linear_addrs,length,check_remap_linear_addr(&page_table));
	page_table[(address>>12) & 0x3ff] = page | 7;         /* 将该线性地址页address放置在对应的页表项中，并设置成RWX */
	recov_swap_linear_addrs(cached_linear_addrs, length); /* 释放被占用的内核线性地址 */
    /* no need for invalidate */
	return page;
}

unsigned long un_wp_page_semaphore = 0;

/* 处理写保护异常，table_entry是页表中某个页表项的物理地址，不是线性地址搞清楚喽。 */
void un_wp_page(unsigned long * table_entry)
{
	struct task_struct* current = get_current_task();
	//printk("table_entry: %p \n\r", table_entry);
	unsigned long* old_page = 0;
	unsigned long* new_page = 0;
	unsigned long table_entry_offset = (unsigned long)table_entry & 0xFFF;  /* table_entry存储的是页表项的绝对物理地址，所以这里要将页表项相对于页表的offset先计算出来 */
	unsigned long cached_linear_addrs[3] = {0,};
	int length = GET_ARRAY_LENGTH(cached_linear_addrs);
	unsigned long table_base_linear_addr = 0;
	caching_linear_addr(cached_linear_addrs,length,table_base_linear_addr = check_remap_linear_addr(&table_entry));
	if (table_base_linear_addr) { /* table_base_linear_addr!=0 说明该页表的物理地址超出内核地址空间了，已经remap到内核table_base_linear_addr线性地址页了 */
		table_entry += (table_entry_offset / 4); /* 因为映射后table_entry就指向线性地址页的首地址了，所以这里要+offset,得到页表项的线性地址 */
		//printk("table_base_linear_addr: %u, table_entry: %p, table_entry_offset: %u \n\r",table_base_linear_addr,  table_entry, table_entry_offset);
	}
	old_page = (unsigned long*)(0xfffff000 & *table_entry);  /* 取出页表项中存储的物理页地址 */
	/*
	 * MAP_NR(old_page)]==1，这个主要是判断两个普通的进程共享一个page时，其占有标志是2，当一个进程首先触发WP时，
	 * 会将其占有标志--，当另一个进程第一次写该页时也会触发WP,这时就要判读占有标志是否为1，为1说明另一个进程已经write on copy了
	 * 所以这里直接将自己的页表项设置为可写就行了。
	 */
	repeat:
	if ((unsigned long)old_page >= LOW_MEM && mem_map[MAP_NR((unsigned long)old_page)]==1) {
		*table_entry |= 2;
		recov_swap_linear_addrs(cached_linear_addrs, length);
		invalidate(current->tss.cr3);
		return;
	}
	/*
	 * copy on write就是在这里开始了，有两种情况：
	 * 1. old_page >= LOW_MEM && mem_map[MAP_NR(old_page)]==2
	 *    说明是task1或其子孙fork后，先执行的会触发WP异常并执行写时复制操作，轮到另一个进程执行时也会触发WP，但仅仅设置为可写就行了。
	 * 2. old_page < LOW_MEM
	 *    说明是task0 fork task1后，task1执行时触发的WP，这时会为task1分配一页内存作为task1用户态堆栈，内核态堆栈在fork task1时就建好了，
	 *    与task1的task_struct共同占用一页内存。
	 */
	if (!(new_page=(unsigned long*)get_free_page(PAGE_IN_MEM_MAP))) {
		panic("un_wp_page trigger oom \n\r");
		oom();
	}
	/*
	 * 这里理解了吧，为什么要加这个判断了。
	 * 当普通的进程fork时，会共享相同的code和data物理页，但是目录表和页表是私有的，只不过页表项中存储的内容是相同的且都被设置为只读，
	 * 当第一个进程对某个物理页执行写操作时会触发WP，这时该物理页的占用标记是2，所以会执行到这里，先把占用标记--，然后将新分配的物理页
	 * 地址设置为RWX，并赋值给对应的页表项，刷新TLB后，然后将old_page的内容分配到new_page，所以是第一个执行写操作的进程会触发write on copy.
	 */
	if ((unsigned long)old_page >= LOW_MEM) {
		/*
		 * 这是个巨坑啊,多核的时候,父子进程会并发执行的,这个时候会同时执行到这,将mem_map[MAP_NR((unsigned long)old_page)]设置为0了,
		 * 相当于释放了该内存页了,造成ESP老是报错.
		 * 这个问题搞了一天,几乎把内核又过了一遍,磁盘块和内存块的同步终于搞定了,为BSP和AP都能自主调度进程执行打下坚实的基础哈哈哈.
		 * 再次吐槽下bochs的多核调试,功能太不完善了,至少得提供打印每个CPU的通用寄存器和控制寄存器的功能吧,目前只能打印CPU0(BSP)的,
		 * 官方文档上说是用info cpu可以打印所有CPU的寄存器信息,但是用这个命令,整个bochs就挂了,直接退出了,所以调试工具真的是很重要啊,
		 * 这里就是根据很少的日志信息,结合源码硬看的,每个函数都带入并发上下文,尼玛真是佩服自己,太虐了.
		 *  */
		lock_op(&un_wp_page_semaphore);
		if (mem_map[MAP_NR((unsigned long)old_page)] == 1) {
			unlock_op(&un_wp_page_semaphore);
			goto repeat;
		}
		mem_map[MAP_NR((unsigned long)old_page)]--;
		unlock_op(&un_wp_page_semaphore);
	}
	*table_entry = (unsigned long)new_page | 7;
	invalidate(current->tss.cr3);
	caching_linear_addr(cached_linear_addrs,length,check_remap_linear_addr(&old_page));
	caching_linear_addr(cached_linear_addrs,length,check_remap_linear_addr(&new_page));
	copy_page((unsigned long)old_page,(unsigned long)new_page);
	recov_swap_linear_addrs(cached_linear_addrs, length);
}	

/*
 * This routine handles present pages, when users try to write
 * to a shared page. It is done by copying the page to a new address
 * and decrementing the shared-page counter for the old page.
 *
 * If it's in code space we exit with a segment error.
 * 注意：address是线性地址
 */
void do_wp_page(unsigned long error_code,unsigned long address)
{
	struct task_struct* current = get_current_task();
#if 0
/* we cannot do this yet: the estdio library writes to code space */
/* stupid, stupid. I really want the libc.a from GNU */
	if (CODE_SPACE(address))
		do_exit(SIGSEGV);
#endif

	/*
	 * ((address>>10) & 0xffc) 得到页表项在页表中的offset
	 * (*((unsigned long *) ((address>>20) &0xffc))) 得到页表的基地址 base。
	 * 所以base+offset就得到该页表项的物理地址了。
	 */
	//printk("error line address: %p \n\r", address);
	unsigned long* dir_base = current->tss.cr3;
	unsigned long* dir_item = dir_base + GET_DIR_ENTRY_OFFSET(address);
	un_wp_page((unsigned long *)
		(((address>>10) & 0xffc) + (0xfffff000 & *dir_item)));
}

/* address是线性地址且是4K align */
void write_verify(unsigned long address)
{
	struct task_struct* current = get_current_task();
	unsigned long * page_table_entry;  /* 注意：该变量存储的是页表项的物理地址，不是线性地址哦。 */
	unsigned long * page_table;
	/* 计算该地址对应的目录项地址，从而可以获取对应页表的基地址,也是物理地址 */
	page_table = (unsigned long *)(*((unsigned long *)(current->tss.cr3 + GET_DIR_ENTRY_OFFSET(address) * 4)));
	if (!((unsigned long)page_table & 1))
		return;
	page_table = (unsigned long*)((unsigned long)page_table & 0xfffff000);  /* 过滤掉目录项中页表基地址的RWX，这样页表基地址就是4K align了 */
	page_table_entry = page_table; /* 保存页表的物理基地址，因为后面的remap可能会将page_table映射成内核保留的线性地址。 */
	/* 这里要执行一下remap操作，因为不知道该页表是否在内核的实地址映射空间。 */
	unsigned long cached_linear_addrs[1] = {0};
	int length = GET_ARRAY_LENGTH(cached_linear_addrs);
	caching_linear_addr(cached_linear_addrs, length, check_remap_linear_addr(&page_table));
	page_table += ((address>>12) & 0x3FF);       /* 计算得到页表项的物理或线性地址 */
	page_table_entry += ((address>>12) & 0x3FF); /* 计算得到页表项的物理地址 */
	if ((3 & *page_table) == 1) { /* non-writeable, present */
		recov_swap_linear_addrs(cached_linear_addrs, length);
		un_wp_page(page_table_entry);
	}
	else {
		recov_swap_linear_addrs(cached_linear_addrs, length);
	}
	return;
}

void get_empty_page(unsigned long address)
{
	unsigned long tmp;
	//printk("Come to get_empty_page. \n\r");
	if (!(tmp=get_free_page(PAGE_IN_MEM_MAP)) || !put_page(tmp,address)) {
		if (!free_page(tmp)) /* 0 is ok - ignored */
			panic("get_empty_page: trying to free free page");
		//printk("get_empty_page trigger oom,tmp: %u, address: %u \n\r", tmp, address);
		oom();
	}
}

/*
 * try_to_share() checks the page at address "address" in the task "p",
 * to see if it exists, and if it is clean. If so, share it with the current
 * task.
 *
 * NOTE! This assumes we have checked that p != current, and that they
 * share the same executable.
 * 注意：这里的address是相对与进程线性地址空间基地址的offset
 */
int try_to_share(unsigned long address_offset, struct task_struct * p)
{
	struct task_struct* current = get_current_task();
	unsigned long from;
	unsigned long to;
	unsigned long* from_page;
	unsigned long* to_page;
	unsigned long phys_addr;

	/*
	 * 当为每个进程都分配独立的目录表的时候，就不能项上面那样共享page了。
	 * 如果两个进程运行相同的程序，那么他们避让共享同一个inode节点，由于他们的地址空间的基地址是一样的，都是从1G开始的，
	 * 所以他们所产生的相同的线性地址必然对应的相同的物理页，所以只要有一个进程加载对应的物理页，另一个进程执行时就可以共享。
	 * 这里的start_code对于task1和task0都是0，而对于NR>1的进程他们的start_code都是1G，这里就先这样操作吧。
	 */
	unsigned long cached_linear_addrs[2] = {0,0};
	int length = GET_ARRAY_LENGTH(cached_linear_addrs);
	from_page = p->tss.cr3;
	from_page += GET_DIR_ENTRY_OFFSET(address_offset+p->start_code);            /* 这时的from_page指向的是对应的目录项的物理地址 */
	to_page   = current->tss.cr3;
	to_page   +=  GET_DIR_ENTRY_OFFSET(address_offset+current->start_code);     /* 同上，存储的是目录项的物理地址 */
    /* is there a page-directory at from? */
	from = *(unsigned long *) from_page;  /* 将目录项上存储的页表的物理基地址赋值给from */
	if (!(from & 1))
		return 0;
	from &= 0xfffff000;    /* 这里仅仅是为了align,4K对齐 */
	from_page = (unsigned long *)from;
	/* 这里from_page存储的物理地址又变了，存储的是页表的物理基地址了，所以要remap，remap后from_page存储的是页表的基地址(物理或线性,不解释了你懂得哈哈) */
	caching_linear_addr(cached_linear_addrs,length,check_remap_linear_addr(&from_page));
	/* 这里的address_offset是相对于start_code的offset，所以取其中间10位的值然后再*4就得到其在页表中的offset，既页表项的物理地址。 */
	from_page += ((address_offset>>12) & 0x3FF);  /* 这里的获得页表项的物理或线性地址 */

	phys_addr = *(unsigned long *) from_page;     /* 将页表项中存储的物理地址取出赋值给phys_addr */
    /* is the page clean and present? */
	if ((phys_addr & 0x41) != 0x01)
		return 0;
	phys_addr &= 0xfffff000;
	if (phys_addr >= HIGH_MEMORY || phys_addr < LOW_MEM)
		return 0;
	to = *(unsigned long *) to_page;   /* 注意:这时的to_page存储的是目录项地址，而目录项上存储的是页表的基地址，这里将页表的物理基地址赋值为to */
	if (!(to & 1))
		if ((to = get_free_page(PAGE_IN_MEM_MAP))) {
			*(unsigned long *) to_page = to | 7;  /* 将新分配的页表的物理基地址赋值到对应的目录项上 */
		}
		else {
			printk("try_to_share trigger oom \n\r");
			oom();
		}
	to &= 0xfffff000;

	/* 这里to_page存储的是页表的物理基地址了，所以要重新remap，才能访问该页表 */
	to_page = (unsigned long *)to;
	caching_linear_addr(cached_linear_addrs,length,check_remap_linear_addr(&to_page));
	/* （to_page:页表的基地址)+ (((address>>10) & 0xffc):页表项的offset) = 页表项的地址，这时的to_page变为页表项的物理或线性地址了 */
	to_page += ((address_offset>>12) & 0x3FF);  /* 这里的获得了页表项的物理或线性地址 */
	if (1 & *(unsigned long *) to_page)         /* 这里物理页要是已经存在了，是不合理的 */
		panic("try_to_share: to_page already exists");
    /* share them: write-protect */
	*(unsigned long *) from_page &= ~2;                         /* 将来自from的页表项存储的物理页地址设置为RX，如果是读操作可以共享，如果是写操作会触发WP */
	*(unsigned long *) to_page = *(unsigned long *) from_page;  /* 将该要共享的物理页的地址赋值给对应的to页表对应的页表项中 */
	recov_swap_linear_addrs(cached_linear_addrs,length);
	invalidate(current->tss.cr3);
	phys_addr -= LOW_MEM;
	phys_addr >>= 12;
	mem_map[phys_addr]++;
	return 1;
}

/*
 * share_page() tries to find a process that could share a page with
 * the current one. Address is the address of the wanted page relative
 * to the current data space.
 *
 * We first check if it is at all feasible by checking executable->i_count.
 * It should be >1 if there are other tasks sharing this inode.
 * 注意：这里的address是相对与进程线性地址空间基地址的offset
 */
int share_page(unsigned long address_offset)
{
	struct task_struct* current = get_current_task();
	struct task_struct ** p;

	if (!current->executable)
		return 0;
	if (current->executable->i_count < 2)
		return 0;
	for (p = &LAST_TASK ; p > &FIRST_TASK ; --p) {
		if (!*p)
			continue;
		if (current == *p)
			continue;
		if ((*p)->executable != current->executable)
			continue;
		if (try_to_share(address_offset,*p))
			return 1;
	}
	return 0;
}
/* 注意：这里的address是出错的线性地址,这地址可不是4K对齐的 */
void do_no_page(unsigned long error_code,unsigned long address)
{
	struct task_struct* current = get_current_task();
	int nr[4];
	unsigned long tmp;
	unsigned long* page;
	int block,i;

	address &= 0xfffff000;
	tmp = address - current->start_code;  /* 这里的start_code等于进程地址空间的base,这里的tmp是相对于base的offset */

	if (!current->executable || tmp >= current->end_data) {
		get_empty_page(address);
		return;
	}
	if (share_page(tmp)) {
		return;
	}
	if (!(page = (unsigned long*)get_free_page(PAGE_IN_MEM_MAP))) {
		printk("do_no_page embedded trigger oom \n\r");
		oom();
	}
    /* remember that 1 block is used for header as exec file */
	block = 1 + tmp/BLOCK_SIZE;
	for (i=0 ; i<4 ; block++,i++){
		nr[i] = bmap(current->executable,block);
	}
	//printk("nr0: %d, nr1: %d ,nr2: %d, nr3: %d\n\r", nr[0], nr[1], nr[2], nr[3]);
	bread_page((unsigned long)page,current->executable->i_dev,nr);
	i = tmp + 4096 - current->end_data;

	unsigned long linear_addr = 0;
	if (i > 0) {
		//printk("directly remap maybe have some problem \n\r");
		linear_addr = remap_linear_addr((unsigned long) page);
		if (linear_addr) {
			tmp = (unsigned long) linear_addr + 4096;
		} else {
			tmp = (unsigned long) page + 4096;
		}

		while (i-- > 0) {
			tmp--;
			*(char *) tmp = 0;
		}
	}

	recov_swap_linear(linear_addr);

	if (put_page((unsigned long)page,address))
		return;
	printk("do_no_page. put_page encounter errors.\n\r");
	if (!free_page((unsigned long)page))
		panic("do_no_page: trying to free free page");
	printk("do_no_page trigger oom \n\r");
	oom();
}

void mem_init(long start_mem, long end_mem)
{
	int paging_pages_num = PAGING_PAGES,i = PAGING_PAGES;
	while (paging_pages_num-->0) {
		mem_map[--i] = 0;
	}
}

void calc_mem(void)
{
	int i,j,k,free=0;
	long * pg_tbl;

	for(i=0 ; i<PAGING_PAGES ; i++)
		if (!mem_map[i]) free++;
	printk("%d pages free (of %d)\n\r",free,PAGING_PAGES);
	for(i=2 ; i<1024 ; i++) {
		if (1&pg_dir[i]) {
			pg_tbl=(long *) (0xfffff000 & pg_dir[i]);
			for(j=k=0 ; j<1024 ; j++)
				if (pg_tbl[j]&1)
					k++;
			printk("Pg-dir[%d] uses %d pages\n",i,k);
		}
	}
}
