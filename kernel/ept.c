/*
 * ept.c
 *
 *  Created on: Aug 13, 2019
 *      Author: outman
 *      This module based on EPT and VPID to implement Memory-Virtualization.
 */

#include <linux/head.h>

void init_page_dir(unsigned long page_addr) {
	/* 实地址映射4G线性地址空间,物理地址的开始4K用于存储PD; 1M~5M空间(4M大小)用于存储PT,用来实地址映射4G物理地址空间 */
	for (int i=0;i<1024;i++) {
		*((unsigned long*) page_addr + i) = 0x100000 + 0x1000*i + 7;
	}
}

void init_page_table(unsigned long page_addr, unsigned long guest_phy_addr) {
	/* 实地址映射4G线性地址空间,物理地址的开始4K用于存储PD; 1M后的4M空间用于存储PT,用来实地址映射4G物理地址空间 */
	for (int i=0;i<1024;i++) {
		*((unsigned long*) page_addr + i) = ((guest_phy_addr - 0x100000)>>12)*0x400000 + 0x1000*i + 7;
	}
}

unsigned long get_phy_addr(unsigned long guest_phy_addr) {
	unsigned long ept_pml4_addr = read_vmcs_field(IA32_VMX_EPT_POINTER_FULL_ENCODING);
	unsigned long ept_pdpt_addr = *((unsigned long*) (ept_pml4_addr & ~0xFFF));  /* PDPT表默认是预先分配好的 */
	unsigned long ept_pdpt_index = guest_phy_addr>>30;
	unsigned long ept_pdpt_entry = ept_pdpt_addr & ~0xFFF + ept_pdpt_index*8;
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
		/* 如果Guest-phy-addr在12M地址空间的话，那么就实地址映射到实际内存地址，这样VM就共享host主机的12M内核地址空间了 */
		if ((guest_phy_addr>>20) < 1024) {
			if ((guest_phy_addr>>20) >= 1 && (guest_phy_addr>>20) < 5) {
				/*
				 * 因为在Guest环境中，对其内核空间也是实地址映射的，这里将GPT(Guest-page-table)也是分配在GPA(Guest-physical-addr)的1M~5M地址空间的，
				 * 用于映射Guest的4G物理地址空间，因此如果得到的GPA在这个区间的话，说明它是GPT，所以要进行初始化使其实地址映射内核空间。
				 * 当然也可以共享host相同位置(1M~5M)的页表，这样就不用再重新分配和映射了，但是这样有个问题，会引起page的RWX和Access位的混乱,想想看是不是这样，
				 * 因此，这里为Guest的GDP和GPT在PAGE_IN_REAL_MEM_MAP空间单独分配page用于管理Guest的地址空间。
				 */
				unsigned long addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
				*((unsigned long*)ept_pt_entry) = addr + 7;
				ept_page_phy_addr = addr;
				init_page_table(ept_page_phy_addr, guest_phy_addr);
			}
			else {
				*((unsigned long*)ept_pt_entry) = guest_phy_addr;  /* 实地址映射到host相同的page */
				ept_page_phy_addr = guest_phy_addr;
				//printk("get_phy_addr.ept_pt_entry: %08x\n\r", ept_page_phy_addr);
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

void do_vm_page_fault() {
	unsigned long guest_linear_addr = read_vmcs_field(IA32_VMX_GUEST_LINEAR_ADDR_ENCODING);
	unsigned long guest_physical_full_addr = read_vmcs_field(IA32_VMX_GUEST_PHYSICAL_ADDR_FULL_ENCODING);
	unsigned long guest_physical_high_addr = read_vmcs_field(IA32_VMX_GUEST_PHYSICAL_ADDR_HIGH_ENCODING);
	unsigned long guest_eip = read_vmcs_field(GUEST_RIP_ENCODING);
	unsigned long guest_esp = read_vmcs_field(GUEST_RSP_ENCODING);
	printk("guest_linear_addr: %08x,guest_physical_addr: %08x, guest_eip: %08x\n\r", guest_linear_addr,guest_physical_full_addr, guest_eip);
	//printk("guest_physical_addr(%08x:%08x)\n\r", guest_physical_full_addr, guest_physical_high_addr);
	/* Start: 判断Guest-CR3对应的物理页是否存在 */
	unsigned long cr3_guest_phy_addr = read_vmcs_field(GUEST_CR3_ENCODING);
	//printk("cr3_guest_phy_addr: %08x\n\r", cr3_guest_phy_addr);
	unsigned long ept_pml4_addr = read_vmcs_field(IA32_VMX_EPT_POINTER_FULL_ENCODING);
	//printk("ept_pml4_addr: %08x\n\r", ept_pml4_addr);
	unsigned long ept_pdpt_addr = *((unsigned long*) (ept_pml4_addr & ~0xFFF));  /* PDPT表默认是预先分配好的 */
	//printk("ept_pdpt_addr: %08x\n\r", ept_pdpt_addr);
	unsigned long ept_pdpt_index = cr3_guest_phy_addr>>30;
	unsigned long ept_pdpt_entry = (ept_pdpt_addr & ~0xFFF) + ept_pdpt_index*8;
	unsigned long ept_pd_phy_addr = *((unsigned long*)ept_pdpt_entry);
	//printk("ept_pd_phy_addr: %08x\n\r", ept_pd_phy_addr);
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
	//printk("ept_pt_phy_addr: %08x\n\r", ept_pt_phy_addr);
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
	//printk("ept_page_phy_addr: %08x\n\r", ept_page_phy_addr);
	if (!(ept_page_phy_addr & 0x07)) {
		unsigned long addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
		*((unsigned long*)ept_pt_entry) = addr + 7;
		ept_page_phy_addr = addr;
		/* 至此，已经为guest CR3分配一个实际物理页了，下面开始初始化该物理页，实地址映射guest linear addr. */
		init_page_dir(ept_page_phy_addr);
	}
	/* End: 判断Guest-CR3对应的物理页是否存在 */

	/* 判断Guest-linear-addr所在的页表的物理页是否存在 */
	unsigned long guest_phy_addr = get_guest_phy_addr(guest_linear_addr);
	//printk("guest_linear_addr: %08x,guest_phy_addr: %08x\n\r",guest_linear_addr, guest_phy_addr);
	/* 判断Guest-linear-addr自身的物理页是否存在 */
	unsigned long ept_phy_addr = get_phy_addr(guest_phy_addr);
	//printk("ept_phy_addr: %08x\n\r", ept_phy_addr);
	printk("guest_linear_addr: %08x,guest_phy_addr: %08x,ept_phy_addr: %08x\n\r",guest_linear_addr, guest_phy_addr, ept_phy_addr);

	/* 刷新Guest TLB */
	unsigned long eptp_addr = read_vmcs_field(IA32_VMX_EPT_POINTER_FULL_ENCODING);
	unsigned long ept_desc[32] = {eptp_addr,0,};
	unsigned long inv_type = 1;  /* Single-Context */
	__asm__ ("invept %1,%%eax\n\t" \
			::"a" (inv_type),"m" (*(char*)ept_desc));
}

void vm_exit_diagnose() {
		//unlock_op(&tty_io_semaphore);
		unsigned long vm_exit_reason        = read_vmcs_field(IA32_VMX_EXIT_REASON_ENCODING);
		unsigned long vm_exit_qualification = read_vmcs_field(IA32_VMX_EXIT_QUALIFICATION_ENCODING);
		//unsigned long vm_instruction_error  = read_vmcs_field(IA32_VMX_VM_INSTRUCTION_ERROR_ENCODING);
		printk("exit_reason: %08x, vm_exit_qualification: %08x\n\r", vm_exit_reason, vm_exit_qualification);
		if (vm_exit_reason == VM_EXIT_REASON_EXTERNAL_INTERRUPT) {
		}
		else if (vm_exit_reason == VM_EXIT_REASON_VMREAD) {
		}
		else if (vm_exit_reason == VM_EXIT_REASON_VMWRITE) {
		}
		else if (vm_exit_reason == VM_EXIT_REASON_EPT_VIOLATION) {
			do_vm_page_fault();
		}
		else if (vm_exit_reason == VM_EXIT_REASON_EPT_MISCONFIGURATION) {
		}
		else {
			panic("Can't handle this kind of exit error");
		}
}

/* 初始化内核空间，共享host的内核空间，后面制作一个GuestOS image，这样就不用共享host内核了 */
void init_guest_kernel_space() {
	/* =============== 判断Guest-CR3对应的物理页是否存在,如果不存在分配一个Page并初始化 ===============*/
	unsigned long cr3_guest_phy_addr = read_vmcs_field(GUEST_CR3_ENCODING);
	//printk("cr3_guest_phy_addr: %08x\n\r", cr3_guest_phy_addr);
	unsigned long ept_pml4_addr = read_vmcs_field(IA32_VMX_EPT_POINTER_FULL_ENCODING);
	//printk("ept_pml4_addr: %08x\n\r", ept_pml4_addr);
	unsigned long ept_pdpt_addr = *((unsigned long*) (ept_pml4_addr & ~0xFFF));  /* PDPT表默认是预先分配好的 */
	//printk("ept_pdpt_addr: %08x\n\r", ept_pdpt_addr);
	unsigned long ept_pdpt_index = cr3_guest_phy_addr>>30;
	unsigned long ept_pdpt_entry = (ept_pdpt_addr & ~0xFFF) + ept_pdpt_index*8;
	unsigned long ept_pd_phy_addr = *((unsigned long*)ept_pdpt_entry);
	//printk("ept_pd_phy_addr: %08x\n\r", ept_pd_phy_addr);
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
	//printk("ept_pt_phy_addr: %08x\n\r", ept_pt_phy_addr);
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
	//printk("ept_page_phy_addr: %08x\n\r", ept_page_phy_addr);
	if (!(ept_page_phy_addr & 0x07)) {
		unsigned long addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
		*((unsigned long*)ept_pt_entry) = addr + 7;
		ept_page_phy_addr = addr;
		/* 至此，已经为guest CR3分配一个实际物理页了，下面开始初始化该物理页，实地址映射guest linear addr. */
		init_page_dir(ept_page_phy_addr);
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
	for (unsigned long i = 0x00; i< 0x2C00;i++) {  /* i (Granularity: 4K), 44M内核空间 */
		unsigned long guest_linear_addr = i*0x1000;
		unsigned long guest_phy_addr = get_guest_phy_addr(guest_linear_addr);
		unsigned long phy_addr = get_phy_addr(guest_phy_addr);
	}
}

