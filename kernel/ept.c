/*
 * ept.c
 *
 *  Created on: Aug 13, 2019
 *      Author: outman
 *      This module based on EPT and VPID to implement Memory-Virtualization.
 */

#include <linux/head.h>
#include <asm/system.h>
#include <linux/sched.h>

extern void init_dir_page(ulong start_addr, ulong len, ulong set);
extern void do_retries(ulong retries);
extern unsigned long tty_io_semaphore;
extern unsigned long load_guest_os_flag; /* This flag indicate do_read_intr loading data whether are GuestOS code */
extern unsigned long load_guest_os_addr;
extern unsigned short	video_port_reg;		/* Video register select port	*/
extern unsigned short	video_port_val;		/* Video register value port	*/

//extern struct vmxon_region_address {unsigned long address[2];} vmxon_region_address;
extern struct vmcs_region_address {unsigned long address[2];} vmcs_region_address;

void init_guest_cr3_shadow(exit_reason_task_switch_struct* exit_reason_task_switch);
void reset_guest_tss_status(ulong task_nr, ulong status);

void init_page_dir(unsigned long page_addr) {
	/* 实地址映射4G线性地址空间,物理地址的开始4K用于存储PD; 1M~5M空间(4M大小)用于存储PT,用来实地址映射4G物理地址空间 */
	for (int i=0;i<256;i++) {
		*((unsigned long*) page_addr + i) = GUEST_SPACE_KERNEL_PAGE_TABLES_ADDR + 0x1000*i + 7;  /* Guest页表分配在1M~5M了 */
	}
}

void init_page_table(unsigned long page_addr, unsigned long guest_phy_addr) {
	/* 实地址映射4G线性地址空间,物理地址的开始4K用于存储PD; 1M后的4M空间用于存储PT,用来实地址映射4G物理地址空间 */
	for (int i=0;i<1024;i++) {
		*((unsigned long*) page_addr + i) = ((guest_phy_addr - GUEST_SPACE_KERNEL_PAGE_TABLES_ADDR)>>12)*0x400000 + 0x1000*i + 7;
	}
}

unsigned long get_ept_pt_entry(unsigned long guest_phy_addr) {
	unsigned long ept_pml4_addr = read_vmcs_field(IA32_VMX_EPT_POINTER_FULL_ENCODING);
	unsigned long ept_pdpt_addr = *((unsigned long*) (ept_pml4_addr & ~0xFFF));  /* PDPT表默认是预先分配好的 */
	unsigned long ept_pdpt_index = guest_phy_addr>>30;
	/*
	 * 我靠自己挖的巨坑啊，太大意了，浪费了好多时间啊/(ㄒoㄒ)/~~
	 * 这个"ept_pdpt_addr & ~0xFFF + ept_pdpt_index*8"表达式，由于忘记加优先级了，导致访问的一直是epdpt表的0表项(1G)物理地址空间，
	 * 所以当要映射>1G的物理地址空间，总是失败。
	 * */
	unsigned long ept_pdpt_entry = (ept_pdpt_addr & ~0xFFF) + ept_pdpt_index*8;
	unsigned long ept_pd_phy_addr = *((unsigned long*)ept_pdpt_entry);
	if (!(ept_pd_phy_addr & 0x07)) {
		return 0;  /* ept_pd不存在,出错返回 */
	}
	else {
		ept_pd_phy_addr &= ~0xFFF;
	}

	unsigned long ept_pd_index = (guest_phy_addr>>21) & 0x1FF;
	unsigned long ept_pd_entry = ept_pd_phy_addr + ept_pd_index*8;
	unsigned long ept_pt_phy_addr = *((unsigned long*)ept_pd_entry);
	if (!(ept_pt_phy_addr & 0x07)) {
		return 0; /* ept_pt不存在,出错返回 */
	}
	else {
		ept_pt_phy_addr &= ~0xFFF;
	}

	unsigned long ept_pt_index = (guest_phy_addr>>12) & 0x1FF;
	unsigned long ept_pt_entry = ept_pt_phy_addr + ept_pt_index*8;
	return ept_pt_entry;
}

void free_ept_page(ulong guest_page_phy_addr) {
	ulong ept_pt_entry = get_ept_pt_entry(guest_page_phy_addr);
	ulong page_phy_addr = *(ulong *)ept_pt_entry;
	if (page_phy_addr & 0x7) {
		free_page(page_phy_addr & (~0xFFF));
	}
	else {
		panic("free_ept_page free a nonexist page\n\r");
	}
	*(ulong *)ept_pt_entry = 0;  /* 释放该被占用的ept表项 */
}

unsigned long get_phy_addr(unsigned long guest_phy_addr) {
	unsigned long ept_pml4_addr = read_vmcs_field(IA32_VMX_EPT_POINTER_FULL_ENCODING);
	unsigned long ept_pdpt_addr = *((unsigned long*) (ept_pml4_addr & ~0xFFF));  /* PDPT表默认是预先分配好的 */
	unsigned long ept_pdpt_index = guest_phy_addr>>30;
	/*
	 * 我靠自己挖的巨坑啊，太大意了，浪费了好多时间啊/(ㄒoㄒ)/~~
	 * 这个"ept_pdpt_addr & ~0xFFF + ept_pdpt_index*8"表达式，由于忘记加优先级了，导致访问的一直是epdpt表的0表项(1G)物理地址空间，
	 * 所以当要映射>1G的物理地址空间，总是失败。
	 * */
	unsigned long ept_pdpt_entry = (ept_pdpt_addr & ~0xFFF) + ept_pdpt_index*8;
	unsigned long ept_pd_phy_addr = *((unsigned long*)ept_pdpt_entry);
	if (!(ept_pd_phy_addr & 0x07)) {
		unsigned long addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
		*((unsigned long*)ept_pdpt_entry) = addr + 7;
		ept_pd_phy_addr = addr;
	}
	else {
		ept_pd_phy_addr &= ~0xFFF;
	}

	unsigned long ept_pd_index = (guest_phy_addr>>21) & 0x1FF;
	unsigned long ept_pd_entry = ept_pd_phy_addr + ept_pd_index*8;
	unsigned long ept_pt_phy_addr = *((unsigned long*)ept_pd_entry);
	if (!(ept_pt_phy_addr & 0x07)) {
		unsigned long addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
		*((unsigned long*)ept_pd_entry) = addr + 7;
		ept_pt_phy_addr = addr;
	}
	else {
		ept_pt_phy_addr &= ~0xFFF;
	}

	unsigned long ept_pt_index = (guest_phy_addr>>12) & 0x1FF;
	unsigned long ept_pt_entry = ept_pt_phy_addr + ept_pt_index*8;
	unsigned long ept_page_phy_addr = *((unsigned long*)ept_pt_entry);
	if (!(ept_page_phy_addr & 0x07)) {
		/*
		 * 1. Host-kernel-code的实地址空间是12M,Guest-phy-addr的前12M地址空间就实地址映射到这12M实际内存地址，这样VM就共享host主机的12M内核地址空间了，
		 *    这样就可以在这个12M，尤其是4K～640K的内存空间开辟共享页，供Host与VM通信，也就是所谓的IPC.
		 * 2. 因为GuestOS也有2G的物理内存(虚拟的)，所以EPT就要映射这2G的虚拟内存.
		 */
		if ((guest_phy_addr>>20) < 2048) {
			if ((guest_phy_addr>>20) >= 1 && (guest_phy_addr>>20) < 5) {
				/*
				 * 1. 因为在Guest环境中，对其内核空间也是实地址映射的，这里将GPT(Guest-page-table)也是分配在GPA(Guest-physical-addr)的1M~5M地址空间的，
				 *    用于映射Guest的4G物理地址空间，因此如果得到的GPA在这个区间的话，说明它是GPT，所以要进行初始化使其实地址映射内核空间。
				 *    那么这部分空间就不能共享host相同的1~5M页表空间了，总之host和guest的目录表和页表是不能共享的。
				 * 2. 如果Guest的目录表也分配在<1M的guest-phy-addr空间，那么host的<1M地址空间肯定有一页是不能被Guest共享的，
				 *    因为Guest的<1M中的一页会被EPT映射到mem-map中，所以这一页是不可能映射到Host的<1M地址空间了，也就不能共享了。
				 * 3. 当然你可以强制共享host相同位置(1M~5M)的页表，这样就不用再重新分配和映射了，但是这样有个问题，会引起page的RWX和Access位的混乱,
				 *    想想看是不是这样，因此，这里为Guest的GDP和GPT在PAGE_IN_REAL_MEM_MAP空间单独分配page用于管理Guest的地址空间。
				 * 4. 因此1M~5M用于存储映射GuestOS的4G linear-addr-space的所有页表,所以不能共享Host的页表。
				 * 5. 当Guest-phy-space > 1G的时候，内核只能实地址映射1G的guest-phy-addr，> 1G的guest-addr-space要用保留的内核线性地址空间remap，
				 *    所以这里只初始化1G的guest-phy-addr-space.
				 */
				if ((guest_phy_addr>>20) == 1) {
					unsigned long addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
					*((unsigned long*)ept_pt_entry) = ((addr + 7) | (1<<6) | (6<<3)); /* bit6: ignore PAE memtype,bit3~5: memtype */
					ept_page_phy_addr = addr;
					init_page_table(ept_page_phy_addr, guest_phy_addr);
				}
			}
			else {
			    if ((guest_phy_addr>>20)>= ((GUEST_SPACE_REAL_MAP_KERNEL_PAGE_TABLES_ADDR>>20) + 4)) {
					/* 这部分的guest-phy-addr到phy-addr的映射就是通过get_free_page分配了，而不是实地址映射了 */
					unsigned long addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
					*((unsigned long*)ept_pt_entry) = ((addr + 7) | (1<<6) | (6<<3));
					ept_page_phy_addr = addr;
				}
				/*
				 * 1. 共享host 4K~1M的内核空间,尤其是4K～640K用于Host与Guest之间的通信.
				 * 2. 0~4K空间是Host的目录表，这里不能共享，因为在初始化EPT-paging-structure的时候就已经为GuestOS
				 *    分配了实际物理page(通过get_free_page方式)，GuestOS的目录表是已经映射过了，所以代码不会执行到这里.
				 */
			    else if ((guest_phy_addr>>20) < 1) {/* 这个分支可以合并到下面的else分支里，这里保留是为了让自己别忘了上面注释. */
					*((unsigned long*)ept_pt_entry) = (((guest_phy_addr & ~0xFFF) + 7) | (1<<6) | (6<<3));  /* 实地址映射到host相同的page */
					ept_page_phy_addr = guest_phy_addr;
				}
				else {
					/*
					 * 1. GuestOS-Code是存放在12M～16M这4M之间的，其中还包括磁盘的高速缓冲区,
					 *    这部分空间Host没有利用，是专用于实地址映射GuestOS的内核Code和高速缓冲区的,
					 *    因此这部分guest-phy-addr到phy-addr的映射也是实地址映射.
					 * 2. 5M~12M是用于存储Host-Code和host的磁盘高速缓冲区，这里也是实地址映射了，共享这部分Host代码了
					 */
					*((unsigned long*)ept_pt_entry) = (((guest_phy_addr & ~0xFFF) + 7) | (1<<6) | (6<<3));  /* 实地址映射到host相同的page */
					ept_page_phy_addr = guest_phy_addr;
					/*
					 * 12M~13M是用于存储GuestOS-Code，所以要page by page分配并从硬盘读取相应页数据复制到该空间,
					 * 因为内核的代码还不超过1M所以就只加载1M的内核代码.
					 * GuestOS的code是从硬盘的5M地址处开始存储的，所以这里用guest_phy_addr作为参数每次读取一页.
					 * 如果不是存储在硬盘的5M地址处的话，这里要调整.
					 */
					if ((guest_phy_addr>>20) >= 12 && (guest_phy_addr>>20) < 13) {
#if 0
						do_retries(100000000);
						do_hd_read_request_in_vm((guest_phy_addr & ~0xFFF)-0x700000, 8);
#endif

					}
				}
				//printk("guest_phy_addr:ept_page_phy_addr: (%08x:%08x)\n\r", guest_phy_addr,ept_page_phy_addr);
			}
		}
	}
	return ept_page_phy_addr & ~0xFFF;
}

unsigned long get_guest_phy_addr(unsigned long guest_linear_addr) {
	unsigned long cr3_guest_phy_addr = read_vmcs_field(GUEST_CR3_ENCODING);
	unsigned long dir_phy_addr = get_phy_addr(cr3_guest_phy_addr);
	//printk("dir_phy_addr: %08x\n\r", dir_phy_addr);
	unsigned long pd_index = guest_linear_addr>>22;
	unsigned long pd_entry = dir_phy_addr + pd_index*4;
	unsigned long pt_guest_phy_addr = *((unsigned long*) pd_entry);
	//printk("pt_guest_phy_addr: %08x\n\r", pt_guest_phy_addr);  //0x101007
	unsigned long pt_phy_addr = get_phy_addr(pt_guest_phy_addr);
	//printk("pt_phy_addr: %08x\n\r", pt_phy_addr);
	unsigned long pt_index = (guest_linear_addr>>12) & 0x3FF;
	unsigned long guest_phy_addr =  *((unsigned long*)(pt_phy_addr + pt_index*4));
	return guest_phy_addr;
}

unsigned long get_spec_phy_addr(unsigned long guest_linear_addr) {
	/* 这里得到的永远都是内核态段的基地址 */
	unsigned long guest_cs_base  = read_vmcs_field(GUEST_CS_BASE_ENCODING);
	//printk("guest_cs_base: %08x\n\r", guest_cs_base);
	unsigned long guest_phy_addr = get_guest_phy_addr(guest_linear_addr);
	unsigned long  phy_addr_base = get_phy_addr(guest_phy_addr);
	//printk("guest_linear_offset:%08x,guest_phy_addr:%08x,phy_addr_base:%08x\n\r", guest_linear_offset, guest_phy_addr, phy_addr_base);
	return phy_addr_base + (guest_linear_addr & 0xFFF);                  /* 返回变量具体的实际物理地址. */
}

/* 这个方法有局限性,因为GuestOS中的free_page_tables会将guest-dir-item > 1G的目录项及其guest-pt清空的，所以就访问不到其对应的guest-phy-addr了，
 * 这时就无法释放对应的ept-pt-entry了，所以有问题.
 * 要想使用该方法就得该GuestOS里的free_page_tables方法了，但这样感觉GuestOS的就有点不太common了. */
void free_ept_pages(ulong guest_cr3_addr) {
	ulong ept_cr3_entry = get_phy_addr(guest_cr3_addr);
	ulong* dir = (unsigned long *)(ept_cr3_entry + (KERNEL_LINEAR_ADDR_LIMIT / PAGE_TABLE_SIZE) * 4);
	ulong size = (USER_LINEAR_ADDR_LIMIT >> 22); // (size/4M)目录项个数

	for ( ; size-->0 ; dir++) {
		if (!(1 & *dir))
			continue;
		ulong pt_guest_phy_addr = (*dir & (~0xFFF));
		ulong* pt_phy_addr = (ulong* )get_phy_addr(pt_guest_phy_addr);
		ulong pt_size = 1024;
		for ( ; pt_size-->0 ; pt_phy_addr++) {
			if (!(1 & *pt_phy_addr))
				continue;
			ulong page_guest_phy_addr = (*pt_phy_addr & (~0xFFF));
			ulong page_phy_addr = get_phy_addr(page_guest_phy_addr);
			free_page(page_phy_addr);
			ulong* ept_pt_entry_4_guest_page = (ulong* )get_ept_pt_entry(page_guest_phy_addr);
			*ept_pt_entry_4_guest_page = 0x00;
		}
		ulong* ept_pt_entry_4_guest_pt = (ulong* )get_ept_pt_entry(pt_guest_phy_addr);
		*ept_pt_entry_4_guest_pt = 0x00;
		*dir = 0x00;
	}
}

void flush_tlb() {
	/* 刷新Guest TLB */
	ulong eptp_addr = read_vmcs_field(IA32_VMX_EPT_POINTER_FULL_ENCODING);
	//printk("eptp_addr: %08x\n\r", eptp_addr);
	struct desc_type {
		ulong pad1;
		ulong pad2;
	} ept_desc[2] = {{eptp_addr & (~0xFFF),0},{0,0}};

	unsigned long inv_type = 2;  /* Single-Context */
	__asm__ ("invept %1,%%eax\n\t" \
			::"a" (inv_type),"m" (*(struct desc_type*)ept_desc));

	ulong vpid = read_vmcs_field(IA32_VMX_VPID_ENCODING);
	struct desc_type vpid_desc[2] = {{vpid,0},};
	__asm__ ("invvpid %1,%%eax\n\t" \
			::"a" (inv_type),"m" (*(struct desc_type*)vpid_desc));
	//printk("flush vpid:%u success.\n\r",vpid);
}

void set_guest_cr3_shadow_entry(ulong cr3, ulong phy_addr) {
	ulong* dir_entry = (ulong *)(cr3 + (phy_addr>>22)*4);
	if (!(*dir_entry & 0x07)) {
		*dir_entry = get_free_page(PAGE_IN_REAL_MEM_MAP) + 7;
	}
	ulong pt_base = (*dir_entry & (~0xFFF));
	ulong* pt_entry = (ulong *)(pt_base + ((phy_addr>>12) & 0x3FF)*4);
	if (!(*pt_entry & 0x07)) {
		*pt_entry = phy_addr + 7;
	}
	else {
		printk("cr3:%08x,phy_addr: %08x\n\r",cr3, *pt_entry);
		panic("CR3.pt.entry not empty error\n\r");
	}
}

void do_vm_page_fault() {
	/* Start: 判断Guest-CR3对应的物理页是否存在,这里一定是存在的，在init_guest_kernel_space中已经分配并初始化了，所以就注释掉了 */
#if 0
	unsigned long guest_physical_full_addr = read_vmcs_field(IA32_VMX_GUEST_PHYSICAL_ADDR_FULL_ENCODING);
	unsigned long guest_physical_high_addr = read_vmcs_field(IA32_VMX_GUEST_PHYSICAL_ADDR_HIGH_ENCODING);
	unsigned long guest_eip = read_vmcs_field(GUEST_RIP_ENCODING);
	unsigned long guest_esp = read_vmcs_field(GUEST_RSP_ENCODING);
	//printk("guest_linear_addr: %08x,guest_physical_addr: %08x, guest_eip: %08x\n\r", guest_linear_addr,guest_physical_full_addr, guest_eip);
	//printk("guest_physical_addr(%08x:%08x)\n\r", guest_physical_full_addr, guest_physical_high_addr);
	unsigned long cr3_guest_phy_addr = read_vmcs_field(GUEST_CR3_ENCODING);
	printk("cr3_guest_phy_addr: %08x\n\r", cr3_guest_phy_addr);
	unsigned long ept_pml4_addr = read_vmcs_field(IA32_VMX_EPT_POINTER_FULL_ENCODING);
	printk("ept_pml4_addr: %08x\n\r", ept_pml4_addr);
	unsigned long ept_pdpt_addr = *((unsigned long*) (ept_pml4_addr & ~0xFFF));  /* PDPT表默认是预先分配好的 */
	printk("ept_pdpt_addr: %08x\n\r", ept_pdpt_addr);
	unsigned long ept_pdpt_index = cr3_guest_phy_addr>>30;
	unsigned long ept_pdpt_entry = (ept_pdpt_addr & ~0xFFF) + ept_pdpt_index*8;
	unsigned long ept_pd_phy_addr = *((unsigned long*)ept_pdpt_entry);
	printk("ept_pd_phy_addr: %08x\n\r", ept_pd_phy_addr);
	if (!(ept_pd_phy_addr & 0x07)) {
		unsigned long addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
		*((unsigned long*)ept_pdpt_entry) = addr + 7;
		ept_pd_phy_addr = addr;
	}
	else {
		ept_pd_phy_addr &= ~0xFFF;
	}

	unsigned long ept_pd_index = (cr3_guest_phy_addr>>21) & 0x1FF;
	unsigned long ept_pd_entry = ept_pd_phy_addr + ept_pd_index*8;
	unsigned long ept_pt_phy_addr = *((unsigned long*)ept_pd_entry);
	printk("ept_pt_phy_addr: %08x\n\r", ept_pt_phy_addr);
	if (!(ept_pt_phy_addr & 0x07)) {
		unsigned long addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
		*((unsigned long*)ept_pd_entry) = addr + 7;
		ept_pt_phy_addr = addr;
	}
	else {
		ept_pt_phy_addr &= ~0xFFF;
	}

	unsigned long ept_pt_index = (cr3_guest_phy_addr>>12) & 0x1FF;
	unsigned long ept_pt_entry = ept_pt_phy_addr + ept_pt_index*8;
	unsigned long ept_page_phy_addr = *((unsigned long*)ept_pt_entry);
	printk("ept_page_phy_addr: %08x\n\r", ept_page_phy_addr);
	if (!(ept_page_phy_addr & 0x07)) {
		unsigned long addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
		*((unsigned long*)ept_pt_entry) = addr + 7;
		ept_page_phy_addr = addr;
		/* 至此，已经为guest CR3分配一个实际物理页了，下面开始初始化该物理页，实地址映射guest linear addr. */
		init_page_dir(ept_page_phy_addr);
	}
#endif
	/* End: 判断Guest-CR3对应的物理页是否存在 */

	unsigned long guest_linear_addr = read_vmcs_field(IA32_VMX_GUEST_LINEAR_ADDR_ENCODING);
	/* 判断Guest-linear-addr所在的页表的物理页是否存在 */
	unsigned long guest_phy_addr = get_guest_phy_addr(guest_linear_addr);
	//printk("guest_linear_addr: %08x,guest_phy_addr: %08x\n\r",guest_linear_addr, guest_phy_addr);
	/* 判断Guest-linear-addr自身的物理页是否存在 */
	unsigned long ept_phy_addr = get_phy_addr(guest_phy_addr);
	//printk("ept_phy_addr: %08x\n\r", ept_phy_addr);
	//printk("guest_linear_addr: %08x,guest_phy_addr: %08x,ept_phy_addr: %08x\n\r",guest_linear_addr, guest_phy_addr, ept_phy_addr);
	unsigned long cr3_guest_phy_addr = read_vmcs_field(GUEST_CR3_ENCODING);
	//set_guest_cr3_shadow_entry(cr3_guest_phy_addr, ept_phy_addr);
}

void vm_exit_diagnose(ulong eax,ulong ebx, ulong ecx, ulong edx, ulong esi, ulong edi, ulong ebp) {
		unlock_op(&tty_io_semaphore);
		unsigned long vm_exit_reason        = read_vmcs_field(IA32_VMX_EXIT_REASON_ENCODING) & 0xFFFF;
		unsigned long vm_exit_qualification = read_vmcs_field(IA32_VMX_EXIT_QUALIFICATION_ENCODING);
		unsigned long guest_eip = read_vmcs_field(GUEST_RIP_ENCODING);
		/*
		 *  当开启 "External-interrupt exiting" Pin-Based VM-Execution Controls, 当HD-Read-INTR到来时会触发中断，
		 *  使得VM-EXIT，然后执行到该处，即使如上我们CLI关闭了external中断，但是在执行下面的printk函数时，当其在显示和调整显示
		 *  位置的过程中还是会执行STI指令开启中断(con_write中的set_origin和set_cursor)，这时当前的打印还没有unlock_op自己占用的锁，
		 *  这时相同的中断又来了，但是IDT已经是host IDT了，会执行system_call.s中的hd_interrupt方法，它里面也会执行printk，
		 *  这时就会发生死锁，这也是为什么打印完exit_reason后，程序就停在那不动了，进入不了exit_external_intr_loop循环.
		 *
		 *  假设HOST OS就是不允许GUEST OS直接访问硬件IO(开启 "External-interrupt exiting")，那么就不得不通过这种VM-EXIT方式来处理外界的IO中断了。
		 *  实现思路如下:
		 *             1. 首先要开辟一个共享区域用于VMM和VM之间的消息传递.
		 *                例如不同类型的中断对应共享区不同的offset，这样VMM就可以根据exit_reason到相应的共享区offset取到对应的context信息，
		 *                帮助VM在VMM环境下完成相应的中断操作.
		 *             2. 假设VM环境下发生读取硬盘的操作，这时要先把读取的块数、起始位置和存放位置这些参数存储在共享区，随后VM再执行硬盘IO操作，
		 *                当第一个HD-read-INTR到来时，会触发VM-EXIT进入VMM.
		 *             3. VMM通过这些参将读取的blocks存储到VM指定的位置，最后执行VMresume就OK了.
		 *  这种实现肯定效率上有损失的，所以APIC-virtualization要是硬件能支持，那持效率就高多了，这也是为什么只有Intel的企业级芯片才支持这个feature.
		 *  本系统通过开关的形式支持这两种外部I/O的访问方式: (1) VM直接访问外部I/O, (2) VM通过VM-EXIT访问外部I/O.
		 */
		//printk("exit_reason: %08x, vm_exit_qualification: %08x, guest_eip: %08x\n\r", vm_exit_reason, vm_exit_qualification, guest_eip);
		if (vm_exit_reason == VM_EXIT_REASON_EXTERNAL_INTERRUPT) {
			__asm__ ("exit_external_intr_loop:\n\t"      \
					 "xorl %%eax,%%eax\n\t"              \
					 "nop\n\t"                           \
					 "jmp exit_external_intr_loop\n\t"   \
					 ::);
		}
		else if (vm_exit_reason == VM_EXIT_REASON_TRIPLE_FAULT) {
			printk("vm_exit_reason: %08x\n\r", vm_exit_reason);
			panic("Triple fault\n\r");
		}
		else if (vm_exit_reason == VM_EXIT_REASON_TASK_SWITCH) {
			/* 得提供一个方法,在VMM下能访问要被调度的任务的task_struct,这样就可以通过存储在tss结构体中的信息来初始化guest要被调度新任务,
			 * 例如有关guest_ip ldt cs,ds 等field初始化为新任务的相应信息，这样就可以调度新任务在guest中执行了.
			 * 1. 这里还是将这些寄存器的加载工作放在guestOS中来实现比较好,因为在GuestOS的内核太访问每个任务的task_struct比较方便，
			 *    这样就不需要VMM来维护GuestOS中每个任务的状态信息了,yes就这样干 */
			unsigned long vm_exit_instruction_len  = read_vmcs_field(IA32_VMX_VM_EXIT_INSTRUCTION_LEN_ENCODING);
			unsigned long vm_exit_instruction_info = read_vmcs_field(IA32_VMX_VM_EXIT_INSTRUCTION_INFO_ENCODING);
			unsigned long vm_exit_guest_rip        = read_vmcs_field(GUEST_RIP_ENCODING);

			/* Start: 备份老任务的执行上下文 */
			exit_reason_task_switch_struct* exit_reason_task_switch = (exit_reason_task_switch_struct*) VM_EXIT_REASON_TASK_SWITCH_INFO_ADDR;
			exit_reason_task_switch->old_task_tss.eax = eax;
			exit_reason_task_switch->old_task_tss.ebx = ebx;
			exit_reason_task_switch->old_task_tss.ecx = ecx;
			exit_reason_task_switch->old_task_tss.edx = edx;
			exit_reason_task_switch->old_task_tss.esi = esi;
			exit_reason_task_switch->old_task_tss.edi = edi;
			exit_reason_task_switch->old_task_tss.ebp = ebp;
			/* 保存老任务的内核栈指针，当重新调度老任务执行时，当执行到iret时，会从其内核栈中弹出相应的用户态ss,esp,eflags,cs和eip,返回用户态执行. */
			exit_reason_task_switch->old_task_tss.esp = read_vmcs_field(GUEST_RSP_ENCODING);
			/* 保存老任务执行ljmp的后一条指令，当重新执行老任务时会从该命令执行，而不会再执行ljmp了. */
			exit_reason_task_switch->old_task_tss.eip = vm_exit_guest_rip + vm_exit_instruction_len;
			exit_reason_task_switch->old_task_tss.cs  = read_vmcs_field(GUEST_CS_ENCODING);
			exit_reason_task_switch->old_task_tss.ss  = read_vmcs_field(GUEST_SS_ENCODING);
			exit_reason_task_switch->old_task_tss.ds  = read_vmcs_field(GUEST_DS_ENCODING);
			exit_reason_task_switch->old_task_tss.fs  = read_vmcs_field(GUEST_FS_ENCODING);
			exit_reason_task_switch->old_task_tss.es  = read_vmcs_field(GUEST_ES_ENCODING);
			exit_reason_task_switch->old_task_tss.gs  = read_vmcs_field(GUEST_GS_ENCODING);
			exit_reason_task_switch->old_task_tss.cr3 = read_vmcs_field(GUEST_CR3_ENCODING);
			/* End: 备份老任务的执行上下文 */

			write_vmcs_field(GUEST_RIP_ENCODING, exit_reason_task_switch->task_switch_entry);
			write_vmcs_field(IA32_VMX_CR3_TARGET_VALUE0_ENCODING, exit_reason_task_switch->new_task_cr3);

			/* 将老进程的tss.status状态设置为available,为下一次调度做准备 */
			reset_guest_tss_status(exit_reason_task_switch->old_task_nr, GUEST_TSS_STATUS_AVAILABLE);

			/*
			 * 初始化VM中新进程的guest-cr3-shadow(用于控制对EPT-page-structure转化后得到的实际物理页的访问)
			 * 对于第一次运行的进程，一定要初始化它的guest_cr3_shadow目录表结构
			 */
			if (!exit_reason_task_switch->new_task_executed) {
				init_guest_cr3_shadow(exit_reason_task_switch);
			}

			flush_tlb();

			printk("task_switch.old(NR[%u],CR3[%08x]):new(NR[%u],CR3[%08x])\n\r", exit_reason_task_switch->old_task_nr,
																				  read_vmcs_field(GUEST_CR3_ENCODING),
																				  exit_reason_task_switch->new_task_nr,
																				  exit_reason_task_switch->new_task_cr3);

#if 0
			/*    这里是关于mov-to-cr3导致内存不可访问的详细排查过程，也提出了很tricky的临时解决方案，但是总觉得不完美，
			 *    最后功夫不负有心人啊，最终找到了根本原因，完美解决了该问题。
			 *
			 *    详细介绍为什么通过mov-to-cr3将当前cr3存储的目录表地址，改成新任务的目录表地址为什么不行,
			 *    总是报can not access memory at address xxxxx.
			 *    实现的思路是这样的： 和非VMX环境下的进程切换一样，在fork一个新进程的时候，会为新进程分配一个自有的目录表，
			 *    不过这个目录表的前256目录项和父进程相应的目录项的值是一样的都指向相同的页表，这样就共享了1G的内核地址空间了，
			 *    这样做也节省了内存和不必要的内核页表copy，另外的1024-256个目录项用于管理进程的用户态地址空间共3G大小，这个
			 *    是每个进程私有的，要按需同缺页分配了。
			 *    所以在GuestOS中也是想通过这种思路，来实现每个进程都有自己独立的4G地址空间(通过mov-to-cr3)，并通过自己维护进程上相文来实现进程的切换,
			 *    但是每次运行完该指令后，GDB就报can not access memory at address xxxxx错误.
			 *    先后做了如下check:
			 *      1. 看看新任务的目录页和老任务的目录页是不是完全一样的，结果显示是一样的，按理cr3中存储的新任务的目录表(guest-phy-addr)通过EPT-page-structure
			 *         就可以映射到共享的内核页表了，可老是报can not access memory at address xxxxx错误，但是CR3的值已经是新任务的目录表了，已经切到新任务了，
			 *         当你通过ni调试指令继续执行下去的话，就是在新任务中执行mov-to-cr3后续的指令；为了验证任务是否是在VM中运行的，故意在mov-to-cr3指令后加了一条cpuid,
			 *         指令强制vm-exit到VMM中，也确实返回到VMM中了，这说明切换是成功了但有问题。
			 *      2. 继续看手册，详细研究了paging cache这块，突然发现ept-page-structure本身也有cache，mov-to-cr3仅仅刷新的是TLB而不是EPT cache，到这里真是如获至宝
			 *         啊，终于找到问题所在了，所以赶紧刷新EPT-cache，通过invept,invvpid，将与当前VPID相关的EPT-page-structure全刷一遍，但结果给了我又一记闷棍，还是
			 *         报同样错误，到底是哪出错了呢，继续想，折腾。
			 *      3. 为了验证是否与EPT-cache想关，在fork新进程的时候只分配了一个空目录表，没有将其初始化使其共享内核空间，这时竟然还是报相同错误，CR3已经是新任务的
			 *         目录表了，执行ni竟然还能继续执行随后的指令，尼玛这肯定是用的ept-cache里的老映射了，无疑了，激动啊，但仔细一想，我不是通过invept和invvpid都flush
			 *         过了吗，不可能还用老的map啊，迷惑了
			 *      4. 突然灵光乍现，记得手册上说在VM中可以调用VMFUNC实现eptp-switching，难道不同进程的目录表要对应不同的eptp，通过这种方式实现进程拥有自己独立的4G
			 *         地址空间，这就是为mov different-value to cr3,做准备的吧，又兴奋起来了，赶紧试一把;
			 *         在执行mov-to-cr3执行之前，先用VMfunc指令将当前eptp替换为新任务的eptp，然后tm还是相同的错误，要崩溃了，垃圾intel你这是要闹哪样。
			 *      5. 静下心，仔细复盘一下，突然想到了为什么在VM中不能执行task_swich指令，这条指令会强制VM-EXIT的，之前还吐槽为啥就不支持任务切换呢，
			 *         到这里我的理解是：
			 *         手册上说通过设置vm-execute control是可以执行mov-to-cr3和mov-from-cr3指令的，
			 *         但是执行mov-to-cr3我的理解是不改变CR3的值，这条指令仅仅是为了刷新TLB，因为任务切换后是一定要flush TLB的，
			 *         压根就不支持chenge cr3 to different value.
			 *      6. 目前的方式1: 就是通过EPT更改Guest-CR3的实际目录页地址，以达到进程切换到自己的4G地址空间。
			 *         不过这种方式有个缺点，因为是共享相同的EPT-page-structure，这样每次进程切换就会flush EPT-cache，效率有一定损失。
			 *      7. 还有一种方式: 为每个进程分配自己的ept-page-structure，不改变Guest-CR3的值，通过vmfunc改变eptp从而能实现每个进程都有独立的4G地址空间，
			 *         目前的方式2: 就是通过这种方式实现的，但是这种方式的确定就是会占用更多的内存空间，但是每次任务切换由于每个任务都有自己独立的EPT所以EPT-cache
			 *         中的内容是不需每次都flush的，这样效率更高.
			 */


			/* 方式1: Prepare for task-switch by sharing the same eptp */
			ulong cr3_phy_addr = get_phy_addr(GUEST_KERNEL_CR3_PHY_ADDR);
			/*
			 * 这里是通过共享同一个EPT-page-structure和相同的CR3(guest-phy-addr and guest-cr3-shadow)实现task-switch.
			 * 1. 首先获取新的要被调度的任务cr3的实际物理地址，通过ept-page-structure转换得到.
			 * 2. 然后将新任务cr3的实际物理地址更新到CR3_DEFAULT_GUEST_PHY_ADDR对应的ept-pt-entry中(其实这一步操作可以在VM中完成，这样就不用触发VM-EXIT了，效率比较高),
			 *    这样当回到VM中，CR3寄存器的值虽然没变，但是其对应的目录表已经换成新任务的目录表了，
			 *    进程运行在新任务的地址空间了，从而实现任务切换,这有点太tricky了^_^。
			 *    这样做有个缺点就是CR3对应的guest-cr3-shadow(CR3中实地址映射的内存页)，管理的实际物理内存就是Guest的所有进程占用的内存页了，
			 *    无法区分Guest中每个进程占用的实际物理内存页有哪些.
			 */
			ulong new_cr3_phy_addr = get_phy_addr(exit_reason_task_switch->new_task_cr3);
			printk("task0_cr3:task1_crs (%08x:%08x)\n\r", cr3_phy_addr, new_cr3_phy_addr);

			ulong ept_pt_entry = get_ept_pt_entry(GUEST_KERNEL_CR3_PHY_ADDR);
			*(ulong* )ept_pt_entry = new_cr3_phy_addr + 7;
			printk("ept_pt_entry: %08x\n\r", ept_pt_entry);

			/*
			 *  方式2: Prepare for task-switch by eptp-switching
			 *  这种方式会为每个进程分配自己独立的EPT-page-structure,这样就能最大化的保留EPT-cache了，但会占用更多的内存。
			 */
			ulong ept_list_addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
			write_vmcs_field(IA32_VMX_EPTP_LIST_ADDRESS_FULL_ENCODING, ept_list_addr);
			printk("ept_list_addr: %08x\n\r", ept_list_addr);
			ulong task0_ept_pml4_addr = read_vmcs_field(IA32_VMX_EPT_POINTER_FULL_ENCODING);
			ulong task1_ept_pml4_addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
			*(ulong* )(ept_list_addr)     = task0_ept_pml4_addr;
			*(ulong* )(ept_list_addr + 8) = (task1_ept_pml4_addr | (task0_ept_pml4_addr & 0xFFF));

			*(ulong* )task1_ept_pml4_addr = *(ulong* )(task0_ept_pml4_addr & (~0xFFF));
			task1_ept_pml4_addr |= (task0_ept_pml4_addr & 0xFFF);

			/* 这种方式也试过了，就是为了解决mov different value to cr3 */
			__asm__ ("vmclear %0\n\t"    \
					 "vmptrld %0\n\t"    \
					 "vmlaunch\n\t"      \
					 ::"m" (*(&vmcs_region_address)));
#endif

		}
		else if (vm_exit_reason == VM_EXIT_REASON_EXEC_CPUID) {
			//flush_tlb();
			exit_reason_cpuid* exit_reason_cpuid_info_p = (exit_reason_cpuid*)VM_EXIT_REASON_CPUID_INFO_ADDR;
			if (exit_reason_cpuid_info_p->exit_reason_no == VM_EXIT_REASON_CPUID_FOR_FREE_EPT_PAGE) {
				ulong guest_page_phy_addr = exit_reason_cpuid_info_p->exit_info.free_ept_page_info.guest_page_phy_addr;
				free_ept_page(guest_page_phy_addr);
			}
			unsigned long vm_exit_instruction_len  = read_vmcs_field(IA32_VMX_VM_EXIT_INSTRUCTION_LEN_ENCODING);
			unsigned long vm_exit_guest_rip        = read_vmcs_field(GUEST_RIP_ENCODING);
			write_vmcs_field(GUEST_RIP_ENCODING, vm_exit_guest_rip + vm_exit_instruction_len);
		}
		else if (vm_exit_reason == VM_EXIT_REASON_VMREAD) {
			__asm__ ("exit_vmread_loop:\n\t"    \
					 "xorl %%eax,%%eax\n\t"     \
					 "nop\n\t"                  \
					 "jmp exit_vmread_loop\n\t" \
					 ::);
		}
		else if (vm_exit_reason == VM_EXIT_REASON_VMWRITE) {
			__asm__ ("exit_vmwrite_loop:\n\t"       \
					 "xorl %%eax,%%eax\n\t"         \
					 "nop\n\t"                      \
					 "jmp exit_vmwrite_loop\n\t"    \
					 ::);
		}
		else if (vm_exit_reason == VM_EXIT_REASON_CONTROL_REGS_ACCESS) {
			unsigned long vm_exit_instruction_len  = read_vmcs_field(IA32_VMX_VM_EXIT_INSTRUCTION_LEN_ENCODING);
			unsigned long vm_exit_guest_rip        = read_vmcs_field(GUEST_RIP_ENCODING);
			write_vmcs_field(GUEST_CR3_ENCODING, eax);
			write_vmcs_field(GUEST_RIP_ENCODING, vm_exit_guest_rip + vm_exit_instruction_len);
			flush_tlb();
		}
		else if (vm_exit_reason == VM_EXIT_REASON_IO_INSTRUCTION) {
			exit_reason_io_vedio_struct* exit_reason_io_vedio = (exit_reason_io_vedio_struct*) VM_EXIT_REASON_IO_INFO_ADDR;
			if (exit_reason_io_vedio->exit_reason_no != VM_EXIT_REASON_IO_INSTRUCTION) {
				panic("Incorrect exit_reason_no\n\r");
			}
			unsigned long spec_phy_addr = get_spec_phy_addr((unsigned long)exit_reason_io_vedio->print_buf);
			//printk("spec_phy_addr: %08x\n\r", spec_phy_addr);
			guest_printk((unsigned char*)spec_phy_addr, exit_reason_io_vedio->print_size);
			unsigned long vm_exit_instruction_len  = read_vmcs_field(IA32_VMX_VM_EXIT_INSTRUCTION_LEN_ENCODING);
			unsigned long vm_exit_instruction_info = read_vmcs_field(IA32_VMX_VM_EXIT_INSTRUCTION_INFO_ENCODING);
			unsigned long vm_exit_guest_rip        = read_vmcs_field(GUEST_RIP_ENCODING);
			/*printk("inst_len: %08x, inst_info: %08x, exit_guest_rip: %08x\n\r", vm_exit_instruction_len
					                                                          , vm_exit_instruction_info
																			  , vm_exit_guest_rip);*/
			write_vmcs_field(GUEST_RIP_ENCODING, vm_exit_guest_rip + vm_exit_instruction_len);
		}
		else if (vm_exit_reason == VM_EXIT_REASON_EPT_VIOLATION) {
			do_vm_page_fault();
		}
		else if (vm_exit_reason == VM_EXIT_REASON_EPT_MISCONFIGURATION) {
			__asm__ ("exit_ept_misconfig_loop:\n\t"      \
					 "xorl %%eax,%%eax\n\t"              \
					 "nop\n\t"                           \
					 "jmp exit_ept_misconfig_loop\n\t"   \
					 ::);
		}
		else {
			printk("Can't handle this kind of exit error:%08x\n\r", vm_exit_reason);
			panic("Can't handle this kind of exit error");
		}
}

/*
 * 1.0版本： 初始化Guest内核空间，共享host的内核空间，后面制作一个GuestOS image，这样就不用共享host内核了
 * 2.0版本： 初始化Guest内核空间，仅共享host的4K~1M的内核空间(因为有些系统信息例如硬盘参数等还存储在4K~1M地址空间，所以GuestOS共享该空间就可以直接用了),
 *          5M开始处就是GuestOS的代码了，1M~5M之间是Guest内核态的页表空间,0~4K是guest内核态的目录表空间，这个空间不能共享host的目录表。
 */
void init_guest_kernel_space() {
	/* =============== 判断Guest-CR3对应的物理页是否存在,如果不存在分配一个Page并初始化 ===============*/
	unsigned long cr3_guest_phy_addr = read_vmcs_field(GUEST_CR3_ENCODING);
	printk("cr3_guest_phy_addr: %08x\n\r", cr3_guest_phy_addr);
	unsigned long ept_pml4_addr = read_vmcs_field(IA32_VMX_EPT_POINTER_FULL_ENCODING);
	printk("ept_pml4_addr: %08x\n\r", ept_pml4_addr);
	unsigned long ept_pdpt_addr = *((unsigned long*) (ept_pml4_addr & ~0xFFF));  /* PDPT表默认是预先分配好的 */
	printk("ept_pdpt_addr: %08x\n\r", ept_pdpt_addr);
	unsigned long ept_pdpt_index = cr3_guest_phy_addr>>30;
	unsigned long ept_pdpt_entry = (ept_pdpt_addr & ~0xFFF) + ept_pdpt_index*8;
	unsigned long ept_pd_phy_addr = *((unsigned long*)ept_pdpt_entry);
	printk("ept_pd_phy_addr: %08x\n\r", ept_pd_phy_addr);
	if (!(ept_pd_phy_addr & 0x07)) {
		unsigned long addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
		*((unsigned long*)ept_pdpt_entry) = addr + 7;
		ept_pd_phy_addr = addr;
	}
	else {
		ept_pd_phy_addr &= ~0xFFF;
	}

	unsigned long ept_pd_index = (cr3_guest_phy_addr>>21) & 0x1FF;
	unsigned long ept_pd_entry = ept_pd_phy_addr + ept_pd_index*8;
	unsigned long ept_pt_phy_addr = *((unsigned long*)ept_pd_entry);
	if (!(ept_pt_phy_addr & 0x07)) {
		unsigned long addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
		*((unsigned long*)ept_pd_entry) = addr + 7;
		ept_pt_phy_addr = addr;
	}
	else {
		ept_pt_phy_addr &= ~0xFFF;
	}
	printk("ept_pt_phy_addr: %08x\n\r", ept_pt_phy_addr);

	unsigned long ept_pt_index = (cr3_guest_phy_addr>>12) & 0x1FF;
	unsigned long ept_pt_entry = ept_pt_phy_addr + ept_pt_index*8;
	unsigned long ept_page_phy_addr = *((unsigned long*)ept_pt_entry);
	//printk("ept_page_phy_addr: %08x\n\r", ept_page_phy_addr);
	if (!(ept_page_phy_addr & 0x07)) {
		unsigned long addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
		*((unsigned long*)ept_pt_entry) = ((addr + 7) | (1<<6) | (6<<3));
		ept_page_phy_addr = addr;
		/* 至此，已经为guest CR3分配一个实际物理页了，下面开始初始化该物理页，实地址映射guest linear addr. */
		init_page_dir(ept_page_phy_addr);  //todo resume
		printk("GuestOS task0.cr3.ept_page_phy_addr: %08x\n\r", ept_page_phy_addr);
	}
	/* ============================================= Init Guest-CR3 End =============================================*/

	/*
	 * 初始化VM的内核空间，使其实地址映射到host kernel的44M空间(data+code+permanent_real_addr_map_space).
	 * 这里着重讲下为什么permanent_real_addr_map_space这一地址空间为什么必须要大于: (8M+16K+4K(PML4)+4K(EPDPT))+(4M+4K) = 12M+28K
	 * 我们知道Guest的地址空间有EPT表映射，EPT表包括：EPML4表,EPDPT表,EDP表和EPT表，这也就决定了EPT的四级映射结构。
	 * 首先EPT中的各类表的表项都占用8个字节。
	 * 1. EPML表占用一页4K，并只有4个有效Entry	  (管理4*512G地址空间)
	 * 2. EPDPT表中存储了512个EDP表             (管理512G地址空间)
	 * 3. EDP表中存储了512个EPT表               (管理1G地址空间)
	 * 4. EPT表中存储了512个Page                (管理2M地址空间)
	 * 由此可推出： 每个EPT表可以映射2M的地址空间，从而每个EDP表可以管理1G的地址空间。
	 * 因此对于拥有4G地址空间的Guest，需要4个EDP表才能完整的映射4G地址空间，对应的EPT表需要2K个。
	 * 从而可得出： EPT-paging-structure总共需要占用： 4*4K + 2K*4K + 4K(EPML4表) + 4K(EPDPT表) = 8M+6*4K
	 *          Guest-paging-structure总共需要占用： 4K(Guest DP) + 1K*4K(PT) = 4M + 4K
	 *          最终至多占用： 8M+4M+6*4K+4K = 12M+7*4k
	 * 这也是为什么要把permanent_real_addr_map_space(PAGE_IN_REAL_MEM_MAP)调整为32M，而不是之前默认的NR_TASKS*2*4K=512K。
	 *
	 * 这里还要注意，如果guest_linear_addr的地址空间不包括1M～5M(用于存放guest PTs)，这样的话只需要很小的空间就行了，想想为什么？
	 * 如果你能自己想明白这个问题，那么你就完全理解了EPT的映射机制了。
	 * 解释下吧：因为这里1M～5M用于存储guest PTs(1K个页表用于映射Guest整个4G地址空间)，所以这1K个页表要是都分配的话要占用4M空间,
	 * 所以在get_phy_addr方法中是按需分配整个空间的页表的，不在这个空间的guest_linear_addr是不分配page的，而是直接实地址映射到host page.
	 * 而guest_linear_addr一旦落在1M~5M这个空间，在PAGE_IN_REAL_MEM_MAP空间中会实际分配一个page给它并初始化为PT表。
	 * 这样一来所用的空间一定是>4M，所以NR_TASKS*2*4K=512K的空间就不够用了。
	 *
	 * 例如：guest_linear_addr < 1M 或 5M <= guest_linear_addr <= 44M
	 * 1M 占用 EDP的一个目录项，要分配一个EPT表，占用guest DP一个目录项，要分配一个GPT页表，这就占用了2个page了.
	 * 5~44M 占用10个GPT页表((44-5+1)/4 = 10*4M)管理这40M空间要分配10个page,而这个10个page是有EPT管理的，因此要占用((44-5+1)/2 = 20*2M) 20个EPT表，这就占用30个page了
	 * 这些guest_linear_addr本身是普通的page，不是Guest DP 或 GUEST PT,所以是直接映射到host相同的page上的，因此不分配page.
	 * 所以总共才需要32个page, 128K的空间。
	 *
	 * 基于EPT虚拟化GPA(Guest-phy-addr)本身就挺复杂的，逻辑上相对与普通paging就拔高一个维度，
	 * 我这里又将其映射到host的kernel，使其能共享host的kernel地址空间，又进一步复杂化，尼玛搞死人啊O(∩_∩)O哈哈~，
	 * 后面会基于本OS，制作一个Guest-OS image将其加载到VM中运行，这样就不用共享host kernel了，不会这么复杂了。
	 */
	/*load_guest_os_flag = 1;
	set_hd_intr_gate();*/
	/*
	 * GuestOS的内核空间的Guest-linear-addr到Guest-physical-addr的映射有两种情况：
	 * 1. guest-phy-space<=1G
	 *    因为内核的linear-addr-space是1G,所以实地址映射整个Guest-phy-space
	 * 2. guest-phy-space> 1G
	 *    内核1G的linear-addr-space要预留128M的linear-space用于映射guest-phy-addr>1G的内存
	 *
	 * 目前在host state状态下，开辟了128M的permanent_real_addr_mapping_space用于模拟GuestOS的整个2G的虚拟物理内存，
	 * 这样做主要是为了后面的调试方便，等整个GuestOS调通以后，会在Host的整个mem_map中调用get_free_page分配.
	 * 这里先通过EPT-paging-structure映射GuestOS 32M内核空间, Guest-phy-addr --> phy-addr.
	 */
#if 1
	for (unsigned long i = 0x00; i< 0x2000;i++) {  /* i (Granularity: 4K) */
		unsigned long guest_linear_addr = i*0x1000;
		unsigned long guest_phy_addr = get_guest_phy_addr(guest_linear_addr);
		unsigned long phy_addr = get_phy_addr(guest_phy_addr);
	}
#endif
}

void init_guest_gdt() {
	/* Init guest GDT */
	unsigned long guest_phy_gdt_addr = read_vmcs_field(GUEST_GDTR_BASE_ENCODING);
	unsigned long guest_phy_ldt_addr = read_vmcs_field(GUEST_LDTR_BASE_ENCODING);
	unsigned long guest_phy_tr_addr  = read_vmcs_field(GUEST_TR_BASE_ENCODING);
#if 1
	unsigned long gdt_base_addr = get_phy_addr(guest_phy_gdt_addr);
#else
	unsigned long gdt_base_addr = guest_phy_gdt_addr;  // todo comments
#endif
	*((unsigned long *) (gdt_base_addr+8))  = 0x0000FFFF;  /* CS, base(16 bits):limit(16 bits)*/
	*((unsigned long *) (gdt_base_addr+12)) = 0x00C39B00;  /* CS, base(8 bits):type(16 bits):base(8 bits) */

	*((unsigned long *) (gdt_base_addr+16)) = 0x0000FFFF;  /* DS, base(16 bits):limit(16 bits)*/
	*((unsigned long *) (gdt_base_addr+20)) = 0x00C39300;  /* DS, base(8 bits):type(16 bits):base(8 bits) */

	set_vm_guest_tss_desc(gdt_base_addr+32, guest_phy_tr_addr);
	set_ldt_desc(gdt_base_addr+40, guest_phy_ldt_addr);
	_set_limit((char*)(gdt_base_addr+32), 0x1000);
	_set_limit((char*)(gdt_base_addr+40), 0x1000);
}

void set_io_bitmap() {
	unsigned long guest_phy_io_bitmap_a_addr = read_vmcs_field(IA32_VMX_IO_BITMAP_A_FULL_ADDR_ENCODING);
	unsigned long io_bitmap_a_base_addr = get_phy_addr(guest_phy_io_bitmap_a_addr);
	printk("video_port_reg: %08x, video_port_val: %08x\n\r", video_port_reg, video_port_val);
	/* print函数触发VM-EXIT. */
	unsigned long byte_offset = video_port_reg / 8;
	unsigned long bit_offset  = video_port_reg % 8;
	*(((unsigned char *) io_bitmap_a_base_addr) + byte_offset) |= (1<<bit_offset);

	byte_offset = video_port_val / 8;
	bit_offset  = video_port_val % 8;
	*(((unsigned char *) io_bitmap_a_base_addr) + byte_offset) |= (1<<bit_offset);
}

/* 初始化VM中新进程的guest-cr3-shadow(用于控制对EPT-page-structure转化后得到的实际物理页的访问) */
void init_guest_cr3_shadow(exit_reason_task_switch_struct* exit_reason_task_switch) {
	ulong new_cr3_page = get_free_page(PAGE_IN_REAL_MEM_MAP_FOR_GUEST_CR3);
	printk("host.new_cr3_page: %08x,guest.new_cr3_page: %08x\n\r", new_cr3_page, exit_reason_task_switch->new_task_cr3);
	if (new_cr3_page != exit_reason_task_switch->new_task_cr3) {
		panic("host.new_cr3_page != guest.new_cr3_page\n\r");
	}
	/*
	 * 一开始只初始化内核代码段和数据段共16M,4个目录项，这样其他目录项管理的页表及其page都是某个guest进程私有的，
	 * 在该进程被销毁的时候，可以通过遍历该目录表一次性销毁，这样效率更高，这应该就是Qemu建立guest-cr3-shadow的初衷吧，
	 * 当然，还可以对每个guest进程所占用的内存页进行更精细化的控制(RWX).
	 */
	init_dir_page(new_cr3_page, 1024, 1);
}

/*
 * VM中，当前正在运行任务的tss-status是处于busy状态的(ltr tss-selector,会自动将GDT表中对应tss.status设置为busy)，
 * 切换到新进程运行后，该进程的tss-status一定要设置为available.
 * 不然的话，当你执行ljmp切换到新进程(busy状态)会报GA异常，也就不会触发task_switch异常导致VM-EXIT了，这真是个巨坑啊，尼玛排查了一天才搞定。
 */
void reset_guest_tss_status(ulong task_nr, ulong status) {
	ulong gdt_guest_linear_addr = read_vmcs_field(GUEST_GDTR_BASE_ENCODING);
	ulong gdt_guest_phy_addr = get_guest_phy_addr(gdt_guest_linear_addr);
	ulong gdt_phy_addr = get_phy_addr(gdt_guest_phy_addr);
	ulong* tss_high_addr = (ulong* )(gdt_phy_addr + _TSS(task_nr) + 4); /* desc_high_addr.tss_status(segment-type): bit(8~11) */
	ulong tss_status = ((*tss_high_addr & 0xF00)>>8);
	if (tss_status != GUEST_TSS_STATUS_BUSY && tss_status != GUEST_TSS_STATUS_AVAILABLE) {
		printk("Tss.status: %08x\n\r", tss_status);
		panic("The status of current process is not valid in VM env\n\r");
	}
	else {
		if (tss_status != status) {
			*tss_high_addr &= ((~0x00F00) | (9<<8));
		}
	}
}
