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

#define invalidate() \
__asm__("movl %%eax,%%cr3"::"a" (0))

/* these are not to be changed without changing head.s etc */
//#define LOW_MEM 0x100000
//#define PAGING_MEMORY (15*1024*1024)
//#define PAGING_PAGES (PAGING_MEMORY>>12)
#define MAX_PAGING_PAGES (1024*1024)     /* 4*1024*1024*1024=4G/4k=1M */
extern long PAGING_PAGES, LOW_MEM, HIGH_MEMORY, memory_end, total_memory_size;

#define MAP_NR(addr) (((addr)-LOW_MEM)>>12)
#define USED 100


#define CODE_SPACE(addr) ((((addr)+4095)&~4095) < \
current->start_code + current->end_code)

#define copy_page(from,to) \
__asm__("cld ; rep ; movsl"::"S" (from),"D" (to),"c" (1024))

unsigned char mem_map [MAX_PAGING_PAGES] = {0,};
unsigned char linear_addr_swap_map[LINEAR_ADDR_SWAP_PAGES] = {0,};
/* 如果linear_addr>=1G，说明是用户空间的缺页处理 */
unsigned long get_dir_entry_offset(unsigned long linear_addr){
	return (((linear_addr>=0x40000000 ? ((linear_addr-USER_LINEAR_ADDR_START) & 0xFFFFF000) : linear_addr)>>20) & 0xffc);
}

/*
 * 当完成对>1G的一页物理地址的重映射并对这一页物理内存初始化后，就会将该物理地址设置到进程用户空间对应的页表项中，这样进程在用户太就可以读写该>1G的一页物理内存了
 * 这个时候，我们要将linear_addr_swap_map数组中对应的线性地址的占用标志位设置为0，表明该线性地址可以被映射到其他>(1G-128M)的物理地址。
 */
void recov_swap_map(unsigned long linear_addr)
{
	if (!linear_addr) {
		linear_addr_swap_map[(linear_addr>>12)+LINEAR_ADDR_SWAP_PAGES-KERNEL_LINEAR_ADDR_PAGES] = 0;
	}
}

void recov_swap_linear_addrs(unsigned long* linear_addrs, int length) {
	unsigned long linear_addr = 0;
	for (int i=0;i<length;i++){
		linear_addr = *(linear_addrs+i);
		if (!linear_addr) {
			recov_swap_map(linear_addr);
		}
	}
}

/* 根据linear_addr可以定位到内核页表具体的页表项，然后用phy_addr设置该页表项，完成访问>(1G-128M)物理内存的重映射。 */
void reset_swap_table_entry(unsigned long linear_addr, unsigned long phy_addr)
{
	unsigned long* dir_item         = (unsigned long*)((linear_addr >> 20) & 0xFFC);   /* 计算该线性地址所在的目录项，既所在的页表 */
	unsigned long* table_base       = *dir_item;                                       /* 通过目录项获得对应页表的起始地址 */
	unsigned long table_item_offset =  (linear_addr >> 10) & 0xFFC;                    /* 计算页表项在页表中的位置 */
	unsigned long* table_entry      = table_base + table_item_offset;                  /* 页表基地址加上页表项的offset就得到对应页表项的实际物理地址了 */
	*table_entry                    = phy_addr; /* 将>1G的一页物理地址，设置在该页表项中，下次再对该线性地址就行读写操作就会映射到该>(1G-128M)的物理地址了哈哈 */
}

/* 对>1G的物理地址进行重映射。返回的是被重映射的内核线性地址 */
unsigned long remap_linear_addr(unsigned long phy_addr)
{
	unsigned long linear_addr = 0;
	for (int i=0; i< LINEAR_ADDR_SWAP_PAGES; i++)
	{
		if (linear_addr_swap_map[i] == 0)
		{
			linear_addr_swap_map[i] = 1;
			linear_addr = (KERNEL_LINEAR_ADDR_PAGES-LINEAR_ADDR_SWAP_PAGES+i) << 12; /* 计算需要被重映射的内核空间线性地址 */
			reset_swap_table_entry(linear_addr, phy_addr & 0xFFFFF000);
			break;
		}
	}
	invalidate();
	return linear_addr;
}

/* 对>1G的物理地址进行重映射。返回的是被重映射的内核线性地址 */
unsigned long check_remap_linear_addr(unsigned long** phy_addr) {
	unsigned long linear_addr = 0;
	if (total_memory_size > 0x40000 && (unsigned long)*phy_addr >= ((1 << 30) - (128 << 20))) {
		linear_addr = remap_linear_addr((unsigned long)(*phy_addr));    /* 映射的一定是4K对齐的物理页 */
		*phy_addr = (unsigned long*)linear_addr;
	}
	return linear_addr;
}
/* 将被重映射的线性地址缓存起来，等到某个时机，统一释放。 */
void caching_linear_addr(unsigned long* addr_array, int length, unsigned long linear_addr) {
	if (!linear_addr) {
		for (int i = 0; i < length; i++) {
			if (*(addr_array + i) == 0) {
				*(addr_array + i) =  linear_addr;
				return;
			}
		}
		panic("cache for linear_addr is full. \n\r");
	}
}

/*
 * Get physical address of first (actually last :-) free page, and mark it
 * used. If no free pages left, return 0.
 * 这里因为将保留线性地址实地址映射的那部分内存也用于分页管理了，所以当分配的没被占用的物理地址大于（1G-128M）时，
 * 就应该用保留线性地址remap了，而不是>1G物理内存，这里有个概念一定要记住：内核地址空间是1G并不代表属于内核的物理地址就有1G，
 * 这个1G的地址空间指的是线性地址空间是属于内核的，而不是物理地址。
 * 所以传给%ebx寄存器的值应该是KERNEL_LINEAR_ADDR_PAGES-LINEAR_ADDR_SWAP_PAGES，从这块物理地址开始比较，而不是从1G开始。
 */
unsigned long get_free_page()
{

register unsigned long __res asm("ax");
unsigned long compare_addr = 0;
if (memory_end > KERNEL_LINEAR_ADDR_PAGES)
{
	compare_addr = KERNEL_LINEAR_ADDR_PAGES-LINEAR_ADDR_SWAP_PAGES;
}
else
{
	compare_addr = KERNEL_LINEAR_ADDR_PAGES;
}

__asm__("std ; repne ; scasb\n\t"
	"jne 2f\n\t"
	"movb $1,1(%%edi)\n\t"
	"sall $12,%%ecx\n\t"
	"addl %2,%%ecx\n\t"
	"shl $12,%%ebx\n\t"
    "cmp %%ebx,%%ecx\n\t"          /* 根据内存的实际大小和要访问的物理地址页，决定是否需要remap该物理地址才能初始化它 */
    "jle 1f\n\t"
	"pushl %%ecx\n\t"              /* 可用的物理页地址且>(1G-128M) */
	"call remap_linear_addr\n\t"   /* 将该物理页地址与内核的后128M(1G线性地址空间)某个线性地址页绑定  */
	"popl %%ecx\n\t"               /* 弹出要被remap的>(1G-128)的物理地址 */
	"movl %%ecx,%%ebx\n\t"         /* 将被重映射的>1G-128M的物理地址存储在ebx中，后面的函数返回值会用到 */
	"pushl %%eax\n\t"              /* 将被remap的线性地址入栈,调用remap_linear_addr后的返回值放在eax中，为后面调用recov_swap_map做准备 */
	"movl $0x0,%%ecx\n\t"
	"movl %%ecx,%%cr3\n\t"         /* 重置CR3内核目录表寄存器，达到刷新TLB的作用，因为有些线性地址被重映射了 */
	"movl %%eax,%%edx\n\t"         /* 将内核地址空间后128M的被重映射的线性地址，放入edx */
	"movl $1024,%%ecx\n\t"
	"leal 4092(%%edx),%%edi\n\t"   /* 将该线性地址对应的实际物理地址(>(1G-128M))初始化为0 */
	"rep ; stosl\n\t"
	"call recov_swap_map\n\t"      /* 释放该被remap的线性地址，这样该线性地址就可以被映射到其他>1G-128M的物理地址了 */
	"popl %%eax\n\t"               /* 这时弹出被remap的线性地址 */
	"movl %%ebx,%%eax\n\t"         /* 将被重映射到物理地址>1G-128M放在eax中作为返回值 */
	"jmp 2f\n\t"
	"1:\n\t"
	"movl %%ecx,%%edx\n\t"         /* 这时ecx存储是的内核实地址映射的物理地址 */
	"movl $1024,%%ecx\n\t"
	"leal 4092(%%edx),%%edi\n\t"   /* 将该物理地址页初始化为0 */
	"rep ; stosl\n\t"
	"movl %%edx,%%eax\n"           /* 将该物理地址页放入eax，作为返回值。 */
	"2:"
	"cld;"
	:"=a" (__res)
	:"0" (0),"r" (LOW_MEM),"c" (PAGING_PAGES),
	"D" (mem_map+PAGING_PAGES-1), "b" (compare_addr));
return __res;
}

/*
 * Free a page of memory at physical address 'addr'. Used by
 * 'free_page_tables()'
 */
void free_page(unsigned long addr)
{
	if (addr < LOW_MEM) return;
	if (addr >= HIGH_MEMORY){
		printk("nonexistent page: %p, high_mem: %u \n\r", addr, HIGH_MEMORY);
		panic("trying to free nonexistent page");
	}
	addr -= LOW_MEM;
	addr >>= 12;
	if (mem_map[addr]--) return;
	mem_map[addr]=0;
	panic("trying to free free page");
}

/*
 * This function frees a continuos block of page tables, as needed
 * by 'exit()'. As does copy_page_tables(), this handles only 4Mb blocks.
 */
int free_page_tables(unsigned long from,unsigned long size, struct task_struct* task_p)
{
	unsigned long *pg_table;
	unsigned long * dir, nr;
	unsigned long cached_dir_base[1] = {0};
	int cached_dir_length = 1;

	if (from & 0x3fffff)
		panic("free_page_tables called with wrong alignment");
	if (!from) {
		printk("Free pg_dir, currentPid: %d, fid: %d \n\r", current->pid, current->father);
		panic("Trying to free up swapper memory space");
	}

	dir = task_p->dir_addr + (((from ? (from-USER_LINEAR_ADDR_START) : from)>>20) & 0xffc);  /* 获得该任务的目录表基地址 */
	caching_linear_addr(cached_dir_base,cached_dir_length,check_remap_linear_addr(&dir));

	size = (size + 0x3fffff) >> 22;
	dir = (unsigned long *) ((from>>20) & 0xffc); /* dir_base_entry */
	for ( ; size-->0 ; dir++) {
		if (!(1 & *dir))
			continue;

		pg_table = (unsigned long *) (0xfffff000 & *dir);

		unsigned long cached_pg_table_base[1] = {0};
		int cached_pg_table_length = 1;
		caching_linear_addr(cached_pg_table_base, cached_pg_table_length, &pg_table);

		for (nr=0 ; nr<1024 ; nr++) {
			if (1 & *pg_table)
				free_page(0xfffff000 & *pg_table);
			*pg_table = 0;
			pg_table++;
		}
		free_page(0xfffff000 & *dir);
		*dir = 0;
		recov_swap_linear_addrs(cached_pg_table_base, cached_pg_table_length);
	}
	recov_swap_linear_addrs(cached_dir_base, cached_dir_length);
	invalidate();
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
	unsigned long * from_page_table;
	unsigned long * to_page_table;
	unsigned long this_page;
	unsigned long * from_dir, * to_dir;
	unsigned long nr;
	unsigned long cached_dir_base[2] = {0,0};
	int cached_dir_length = 2;

	if ((from&0x3fffff) || (to&0x3fffff))
		panic("copy_page_tables called with wrong alignment");
	unsigned long *new_dir_page = (unsigned long*)get_free_page();  /* 为新进程分配一页物理内存用于存储目录表 */
	if (!new_dir_page) {
		panic("Can not allocate a physical page for new process's dir-table. \n\r ");
	}
	new_task->dir_addr = new_dir_page;
	/*
	 * 内核pg_dir = 0，用户pg_dir存储在task_struct中，计算该from线性地址所在的目录项，也就是落在那个页表中。
	 * 因为这段代码是在内核态运行的，内核基地址base=0，所以current->dir_addr+目录项offset得到的就是目录项的实际物理地址。
	 * 如果内存>1G,目录项的物理地址>(1G-128M),那么需要对它进行remap,麻烦啊
	 */
	from_dir = current->dir_addr + get_dir_entry_offset(from);
	caching_linear_addr(cached_dir_base,cached_dir_length,check_remap_linear_addr(&from_dir));

	/*
	 * 计算to线性地址所在的目录项,注意：这里要加上新分配目录页的基地址.
	 * 这里新的目录页也要判断是否需要remap。
	 */
	to_dir = new_dir_page + get_dir_entry_offset(to);
	caching_linear_addr(cached_dir_base, cached_dir_length, check_remap_linear_addr(&to_dir));

	size = ((unsigned) (size+0x3fffff)) >> 22;                      /* 因为每个页表能管理4M物理内存，所以这里(size+(4M-1))/4M确保，不够整除的部分也能被copy. */

	for( ; size-->0 ; from_dir++,to_dir++) {
		if (1 & *to_dir)                                            /* to线性地址所在的目录项已经存在了，则出错。 */
			panic("copy_page_tables: already exist");
		if (!(1 & *from_dir))                                       /* 判断from线性地址所在的目录项是否存在。 */
			continue;
		unsigned long cached_page_table_base[2] = {0,0};
		int cached_page_table_length = 2;
		/* 读取目录项中存储的某个页表的物理地址，因为页表的地址是4K对齐的，所以要&0xfffff000擦除有可能出错的bit位。 */
		from_page_table = (unsigned long *) (0xfffff000 & *from_dir);
		caching_linear_addr(cached_page_table_base, cached_page_table_length, check_remap_linear_addr(&from_page_table));

		if (!(to_page_table = (unsigned long *) get_free_page())) { /* 获取一页空闲的物理内存，用于存储要copy来自from的页表。 */
			return -1;	/* Out of memory, see freeing */
		}
		else {
			caching_linear_addr(cached_page_table_base, cached_page_table_length, check_remap_linear_addr(&to_page_table));
		}
		*to_dir = ((unsigned long) to_page_table) | 7;  /* 将获取的新的页表物理地址，或7后赋值给to线性地址所在的目录项。 */
		/*
		 * 这里需要改了，原来OS加载到0x0000开始地址处的时候，当fork task1的时候，这里要copy的内核代码只需要640k,所以需要copy 640K/4K=160(0xA0)个页表项；
		 * 注意这里是页表项，因为每个页表也占用1页4K,而每个页表项占用4字节用于记录一个物理页的地址，所以一个页表有1024个页表项，共可管理4M物理空间。
		 * 这里把OS加载到了5M地址处，所以要copy的是从0x0000~0x500000+640K地址空间占用的页表。
		 */
		//nr = (from==0)?0xA0:1024;
		//nr = (from==0 && size == 0) ? 512:1024;
		nr = 1024;

        /* 注意：这里的from_page_table是一个页表的基地址，也就是第一个页表项的地址，所以通过*from_page_table取页表项中记录的物理页地址。 */
		for ( ; nr-- > 0 ; from_page_table++,to_page_table++) {
			this_page = *from_page_table;   /* 这里的this_page页表项记录的是物理页地址。 */
			if (!(1 & this_page)) /* 判断该物理页是否存在。 */
				continue;
			this_page &= ~2;    /* 将新分配的页表项设置为只读。 */
			*to_page_table = this_page;  /* 将该物理页地址copy到新分配的页表对应的页表项中。 */
			/*
			 * 这里如果要Copy的物理页地址<=LOW_MEM说明是task0 fork task1,则这时，不能把task0对应的页表项设置为只读，只能将task1的所有页表项都设置为只读，
			 * 当task1运行的时候要进行堆栈操作时，发现共享task0的堆栈对于自己是只读的，所以为出发wp异常，这时缺页异常管理函数，会在分页内存区为其分配一页内存为其
			 * 用户态堆栈，其内核太堆栈和task_struct占用一个分页。
			 *
			 * 对于要Copy的物理页地址>LOW_MEM时，这时一定是task1或其子孙执行 fork操作，这时要把父子进程的页表项都设置为只读，谁先执行先触发WP异常，在处理WP的时候，
			 * 会将另一个进程的页表项都设置为可写。
			 *
			 */
			/*if (this_page > LOW_MEM) {
				*from_page_table = this_page;    将父进程的页表项页设置为只读。
				this_page -= LOW_MEM;
				this_page >>= 12;
				mem_map[this_page]++;            这时内存占用计数等于2，说明有两个进程的页表项指向同一块物理内存页。
			}*/

			/* 这里判断是不是进程0 创建 进程1可以根据limit size的大小来判定，如果size=1G那么肯定是task0 fork task1了 */
			if (size != 256) {                   /* size现在的单位是4M(granularity) */
				*from_page_table = this_page;    //将父进程的页表项页设置为只读。
			    this_page -= LOW_MEM;
				this_page >>= 12;
			    mem_map[this_page]++;            //这时内存占用计数等于2，说明有两个进程的页表项指向同一块物理内存页。
			}
		}
		recov_swap_linear_addrs(cached_page_table_base, cached_page_table_length);
	}
	recov_swap_linear_addrs(cached_dir_base,cached_dir_length);
	invalidate();
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
	unsigned long tmp, *page_table;

    /* NOTE !!! This uses the fact that kernel_pg_dir=0 */

	if (page < LOW_MEM || page >= HIGH_MEMORY)
		printk("Trying to put page %p at %p,low_mem: %u,high_mem: %u\n",page,address,LOW_MEM,HIGH_MEMORY);
	if (mem_map[(page-LOW_MEM)>>12] != 1)  /* 在将线性地址页和某个物理地址页关联起来之前，要通过get_free_page先占据该物理页 */
		printk("mem_map disagrees with %p at %p\n",page,address);
	//page_table = (unsigned long *) ((address>>20) & 0xffc);
	unsigned long cached_linear_addrs[2] = {0,};
	int length = 2;
	page_table = current->dir_addr + get_dir_entry_offset(address);   /* 获得目录项的实际物理地址 */
	caching_linear_addr(cached_linear_addrs,length,check_remap_linear_addr(&page_table)); /* 如果该进程的目录表的实际物理地址超出内核的地址空间，要remap */
	if ((*page_table)&1)
		page_table = (unsigned long *) (0xfffff000 & *page_table);    /* 获得该线性地址所在的页表的基地址 */
	else {
		if (!(tmp=get_free_page()))
			return 0;
		*page_table = tmp|7;                      /* 蒋新获得的物理页设置为RWX，然后将其地址复制到对应的目录项中 */
		page_table = (unsigned long *) tmp;       /* 然后将page_table指向新分配的页表 */
	}
	/* 到这里，page_table已经指向了对应页表的基地址了，所以也要判断该页表的物理地址是否超出内核的寻址范围，并进行必要的remap. */
	caching_linear_addr(cached_linear_addrs,length,check_remap_linear_addr(&page_table));
	page_table[(address>>12) & 0x3ff] = page | 7;         /* 将该线性地址页address放置在对应的页表项中，并设置成RWX */
	recov_swap_linear_addrs(cached_linear_addrs, length); /* 释放被占用的内核线性地址 */
    /* no need for invalidate */
	return page;
}
/* 处理写保护异常，table_entry是页表中某个页表项的物理地址，不是线性地址搞清楚喽。 */
void un_wp_page(unsigned long * table_entry)
{
	//printk("table_entry: %p \n\r", table_entry);
	unsigned long old_page,new_page;

	unsigned long linear_addr = check_remap_linear_addr(&table_entry);
	old_page = 0xfffff000 & *table_entry;
	if (old_page >= LOW_MEM && mem_map[MAP_NR(old_page)]==1) {
		*table_entry |= 2;
		recov_swap_map(linear_addr);
		invalidate();
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
	if (!(new_page=get_free_page()))
		oom();
	if (old_page >= LOW_MEM)         /* 这里理解了吧，为什么要加这个判断了。 */
		mem_map[MAP_NR(old_page)]--;
	*table_entry = new_page | 7;
	invalidate();
	copy_page(old_page,new_page);
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

	unsigned long* dir_item = current->dir_addr + get_dir_entry_offset(address);
	unsigned long linear_addr = check_remap_linear_addr(&dir_item);

	un_wp_page((unsigned long *)
		(((address>>10) & 0xffc) + (0xfffff000 & *dir_item)));

	recov_swap_map(linear_addr);
}

void write_verify(unsigned long address)
{
	unsigned long page;

	if (!( (page = *((unsigned long *) ((address>>20) & 0xffc)) )&1))
		return;
	page &= 0xfffff000;
	page += ((address>>10) & 0xffc);
	if ((3 & *(unsigned long *) page) == 1)  /* non-writeable, present */
		un_wp_page((unsigned long *) page);
	return;
}

void get_empty_page(unsigned long address)
{
	unsigned long tmp;

	if (!(tmp=get_free_page()) || !put_page(tmp,address)) {
		free_page(tmp);		/* 0 is ok - ignored */
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
static int try_to_share(unsigned long address, struct task_struct * p)
{
	unsigned long from;
	unsigned long to;
	unsigned long* from_page;
	unsigned long* to_page;
	unsigned long phys_addr;

	//from_page = to_page = ((address>>20) & 0xffc);  /* 计算在目录表中的offset */
	//from_page += ((p->start_code>>20) & 0xffc);     /* 加上该进程在目录表中所占用的64M目录项的基地址，就得到对应目录项的实际物理地址了 */
	//to_page += ((current->start_code>>20) & 0xffc); /* 同上 */

	/*
	 * 当为每个进程都分配独立的目录表的时候，就不能项上面那样共享page了。
	 * 如果两个进程运行相同的程序，那么他们避让共享同一个inode节点，由于他们的地址空间的基地址是一样的，都是从1G开始的，
	 * 所以他们所产生的相同的线性地址必然对应的相同的物理页，所以只要有一个进程加载对应的物理页，另一个进程执行时就可以共享。
	 * 这里的start_code对于task1和task0都是0，而对于NR>1的进程他们的start_code都是1G，这里就先这样操作吧。
	 */
	from_page = p->dir_addr + get_dir_entry_offset(address+p->start_code);            /* 这时的from_page指向的是对应的目录项的物理地址 */
	to_page   = current->dir_addr + get_dir_entry_offset(address+current->start_code);/* 同上 */
    /* is there a page-directory at from? */
	unsigned long cached_linear_addrs[4];
	int length = 4;
	caching_linear_addr(cached_linear_addrs,length,check_remap_linear_addr(&from_page));  /* 对from_page物理地址进行remap，如果需要的话 */
	from = *(unsigned long *) from_page;  /* 将目录项上存储的页表的物理基地址赋值给from */
	if (!(from & 1))
		return 0;
	from &= 0xfffff000;    /* 这里仅仅是为了align */
	/* 这里的address是相对于start_code的offset，所以取其中间10位的值然后再*4就得到其在页表中的offset，既页表项的物理地址。 */
	from_page = (unsigned long *)(from + ((address>>10) & 0xffc));
	caching_linear_addr(cached_linear_addrs,length,check_remap_linear_addr(&from_page)); /* 这里from_page存储的物理地址又变了，所以要再次remap */
	phys_addr = *(unsigned long *) from_page;  /* 将页表项中存储的物理地址取出赋值给phys_addr */
    /* is the page clean and present? */
	if ((phys_addr & 0x41) != 0x01)
		return 0;
	phys_addr &= 0xfffff000;
	if (phys_addr >= HIGH_MEMORY || phys_addr < LOW_MEM)
		return 0;
	caching_linear_addr(cached_linear_addrs,length,check_remap_linear_addr(&to_page));
	to = *(unsigned long *) to_page;   /* 将页表的物理基地址赋值为to */
	if (!(to & 1))
		if ((to = get_free_page()))
			*(unsigned long *) to_page = to | 7;  /* 将新分配的页表的物理基地址赋值到对应的目录项上 */
		else
			oom();
	to &= 0xfffff000;
	/* to:页表的物理基地址 + (((address>>10) & 0xffc):页表项的offset = 页表项的物理地址，这时的to_page变为页表项的物理地址了，要remap */
	to_page = (unsigned long *)(to + ((address>>10) & 0xffc));
	caching_linear_addr(cached_linear_addrs,length,check_remap_linear_addr(&to_page));
	if (1 & *(unsigned long *) to_page)
		panic("try_to_share: to_page already exists");
/* share them: write-protect */
	*(unsigned long *) from_page &= ~2;   /* 将来自from的页表项存储的物理页地址设置为RX */
	*(unsigned long *) to_page = *(unsigned long *) from_page;  /* 将该要共享的物理页的地址赋值给对应的to页表对应的页表项中 */
	recov_swap_linear_addrs(cached_linear_addrs,length);
	invalidate();
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
 */
static int share_page(unsigned long address)
{
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
		if (try_to_share(address,*p))
			return 1;
	}
	return 0;
}
/* 注意：这里的address是出错的线性地址 */
void do_no_page(unsigned long error_code,unsigned long address)
{
	int nr[4];
	unsigned long tmp;
	unsigned long* page;
	int block,i;

	address &= 0xfffff000;
	tmp = address - current->start_code;  /* 这里的current.start_code等于进程地址空间的base,这里的tmp是相对于base的offset */
	//printk("addr: %d, errcode: %d, tmp: %d \n\r", address, error_code, );
	if (!current->executable || tmp >= current->end_data) {
		get_empty_page(address);
		return;
	}
	if (share_page(tmp))
		return;
	if (!(page = (unsigned long*)get_free_page()))
		oom();
/* remember that 1 block is used for header */
	block = 1 + tmp/BLOCK_SIZE;
	for (i=0 ; i<4 ; block++,i++){
		nr[i] = bmap(current->executable,block);
	}
	//printk("nr0: %d, nr1: %d ,nr2: %d, nr3: %d\n\r", nr[0], nr[1], nr[2], nr[3]);
	bread_page((unsigned long)page,current->executable->i_dev,nr);
	//printk("pageCode: %u\n\r", *(unsigned long*)page);
	i = tmp + 4096 - current->end_data;

	unsigned long linear_addr = 0;
	if (i>0) {
		linear_addr = remap_linear_addr((unsigned long)page);
	}
	if (linear_addr){
		tmp = (unsigned long)linear_addr + 4096;
	}
	else {
		tmp = (unsigned long)page + 4096;
	}

	while (i-- > 0) {
		tmp--;
		*(char *)tmp = 0;
	}

	recov_swap_map(linear_addr);

	if (put_page((unsigned long)page,address))
		return;
	free_page((unsigned long)page);
	oom();
}

void mem_init(long start_mem, long end_mem)
{
	int paging_pages_num = PAGING_PAGES,i = PAGING_PAGES;
	//int memory_end = end_mem;

	while (paging_pages_num-->0) {
		/*
		 * 如果内存>1G的话，就得用896M~1024M作为保留线性地址空间，映射>1G的物理内存，
		 * 所以这段128M的物理内存的管理就有两种方式了：
		 * 1. 不参加分页管理，由内核单独管理并使用，但内核如果要用的话，也得用896M~1024M的线性地址散射了，注意这里不能再进行实地址1对1映射了，
		 *    因为与物理地址对应的线性地址有可能被映射到其他>1G的物理地址了。
		 * 2. 参加分页管理，这样就可以被内核与进程共同使用了，我选择这种方式，这样内存好管理。
		 */

		/* 这是128M内存由内核单独管理和使用的方式，这里不用了，以后的使用和管理不方便 */
		/*if (end_mem > KERNEL_LINEAR_ADDR_PAGES)
		{
			if (memory_end <= KERNEL_LINEAR_ADDR_PAGES && memory_end > (KERNEL_LINEAR_ADDR_PAGES-LINEAR_ADDR_SWAP_PAGES))
			{
				mem_map[--i]=1;   内核这部分保留地址空间不参与分页管理，由内核单独使用
			}
			else {
				mem_map[--i]=0;
			}
			memory_end--;
		}
		else
		{
			mem_map[--i]=0;
		}*/

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
