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

extern unsigned long tty_io_semaphore;
extern unsigned long load_guest_os_flag; /* This flag indicate do_read_intr loading data whether are GuestOS code */
extern unsigned long load_guest_os_addr;
extern unsigned short	video_port_reg;		/* Video register select port	*/
extern unsigned short	video_port_val;		/* Video register value port	*/

void init_page_dir(unsigned long page_addr) {
	/* 实地址映射4G线性地址空间,物理地址的开始4K用于存储PD; 1M~5M空间(4M大小)用于存储PT,用来实地址映射4G物理地址空间 */
	for (int i=0;i<256;i++) {
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
				 * 2. 当然也可以共享host相同位置(1M~5M)的页表，这样就不用再重新分配和映射了，但是这样有个问题，会引起page的RWX和Access位的混乱,
				 *    想想看是不是这样，因此，这里为Guest的GDP和GPT在PAGE_IN_REAL_MEM_MAP空间单独分配page用于管理Guest的地址空间。
				 * 3. 因此1M~5M用于存储映射GuestOS的4G linear-addr-space的所有页表,所以不能共享Host的页表。
				 * 4. 当Guest-phy-space > 1G的时候，内核只能实地址映射1G的guest-phy-addr，> 1G的guest-addr-space要用保留的内核线性地址空间remap，
				 *    所以这里只初始化1G的guest-phy-addr-space.
				 */
				if ((guest_phy_addr>>20) == 1) {
					unsigned long addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
					*((unsigned long*)ept_pt_entry) = addr + 7;
					ept_page_phy_addr = addr;
					init_page_table(ept_page_phy_addr, guest_phy_addr);
				}
			}
			else {
			    if ((guest_phy_addr>>20)>= 16) {
					/* 这部分的guest-phy-addr到phy-addr的映射就是通过get_free_page分配了，而不是实地址映射了 */
					unsigned long addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
					*((unsigned long*)ept_pt_entry) = addr + 7;
					ept_page_phy_addr = addr;
				}
				/*
				 * 1. 共享host 4K~1M的内核空间,尤其是4K～640K用于Host与Guest之间的通信.
				 * 2. 0~4K空间是Host的目录表，这里不能共享，因为在初始化EPT-paging-structure的时候就已经为GuestOS
				 *    分配了实际物理page(通过get_free_page方式)，GuestOS的目录表是已经映射过了，所以代码不会执行到这里.
				 */
			    else if ((guest_phy_addr>>20) < 1) {/* 这个分支可以合并到下面的else分支里，这里保留是为了让自己别忘了上面注释. */
					*((unsigned long*)ept_pt_entry) = (guest_phy_addr & ~0xFFF) + 7;  /* 实地址映射到host相同的page */
					ept_page_phy_addr = guest_phy_addr;
				}
				else {
					/*
					 * 1. GuestOS-Code是存放在12M～16M这4M之间的，其中还包括磁盘的高速缓冲区,
					 *    这部分空间Host没有利用，是专用于实地址映射GuestOS的内核Code和高速缓冲区的,
					 *    因此这部分guest-phy-addr到phy-addr的映射也是实地址映射.
					 * 2. 5M~12M是用于存储Host-Code和host的磁盘高速缓冲区，这里也是实地址映射了，共享这部分Host代码了
					 */
					*((unsigned long*)ept_pt_entry) = (guest_phy_addr & ~0xFFF) + 7;  /* 实地址映射到host相同的page */
					ept_page_phy_addr = guest_phy_addr;
					/*
					 * 12M~13M是用于存储GuestOS-Code，所以要page by page分配并从硬盘读取相应页数据复制到该空间,
					 * 因为内核的代码还不超过1M所以就只加载1M的内核代码.
					 * GuestOS的code是从硬盘的5M地址处开始存储的，所以这里用guest_phy_addr作为参数每次读取一页.
					 * 如果不是存储在硬盘的5M地址处的话，这里要调整.
					 */
					if ((guest_phy_addr>>20) >= 12 && (guest_phy_addr>>20) < 13) {
						if ((guest_phy_addr & ~0xFFF) == 0x500000) {
							printk("OS_start_addr: %08x\n\r", guest_phy_addr);
						}
						load_guest_os_addr = guest_phy_addr & ~0xFFF;
						do_hd_read_request_in_vm((guest_phy_addr & ~0xFFF)-0x700000, 8);
					}
				}
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

unsigned long get_spec_phy_addr(unsigned long guest_linear_offset) {
	unsigned long guest_cs          = read_vmcs_field(GUEST_CS_ENCODING);
	unsigned long guest_linear_addr = (guest_cs & ~0xFFF) + guest_linear_offset;
	unsigned long guest_phy_addr    = get_guest_phy_addr(guest_linear_addr);
	unsigned long  phy_addr_base    = get_phy_addr(guest_phy_addr);
	printk("guest_linear_offset:%08x,guest_phy_addr:%08x,phy_addr_base:%08x\n\r", guest_linear_offset, guest_phy_addr, phy_addr_base);
	return phy_addr_base + (guest_linear_addr & 0xFFF);                  /* 返回变量具体的实际物理地址. */
}

void flush_tlb() {
	/* 刷新Guest TLB */
	unsigned long eptp_addr = read_vmcs_field(IA32_VMX_EPT_POINTER_FULL_ENCODING);
	unsigned long ept_desc[32] = {eptp_addr,0,};
	unsigned long inv_type = 1;  /* Single-Context */
	__asm__ ("invept %1,%%eax\n\t" \
			::"a" (inv_type),"m" (*(char*)ept_desc));
}

void do_vm_page_fault() {
	unsigned long guest_linear_addr = read_vmcs_field(IA32_VMX_GUEST_LINEAR_ADDR_ENCODING);
	unsigned long guest_physical_full_addr = read_vmcs_field(IA32_VMX_GUEST_PHYSICAL_ADDR_FULL_ENCODING);
	unsigned long guest_physical_high_addr = read_vmcs_field(IA32_VMX_GUEST_PHYSICAL_ADDR_HIGH_ENCODING);
	unsigned long guest_eip = read_vmcs_field(GUEST_RIP_ENCODING);
	unsigned long guest_esp = read_vmcs_field(GUEST_RSP_ENCODING);
	//printk("guest_linear_addr: %08x,guest_physical_addr: %08x, guest_eip: %08x\n\r", guest_linear_addr,guest_physical_full_addr, guest_eip);
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

	//flush_tlb();
}

void vm_exit_diagnose() {
		unlock_op(&tty_io_semaphore);
		unsigned long vm_exit_reason        = read_vmcs_field(IA32_VMX_EXIT_REASON_ENCODING);
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
		printk("exit_reason: %08x, vm_exit_qualification: %08x, guest_eip: %08x\n\r", vm_exit_reason, vm_exit_qualification, guest_eip);
		if (vm_exit_reason == VM_EXIT_REASON_EXTERNAL_INTERRUPT) {
			__asm__ ("exit_external_intr_loop:\n\t"      \
					 "xorl %%eax,%%eax\n\t"              \
					 "nop\n\t"                           \
					 "jmp exit_external_intr_loop\n\t"   \
					 ::);
		}
		if (vm_exit_reason == VM_EXIT_REASON_TASK_SWITCH) {
			/* 得提供一个方法,在VMM下能访问要被调度的任务的task_struct,这样就可以通过存储在tss结构体中的信息来初始化guest要被调度新任务,
			 * 例如有关guest_ip ldt cs,ds 等field初始化为新任务的相应信息，这样就可以调度新任务在guest中执行了. */
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
		else if (vm_exit_reason == VM_EXIT_REASON_IO_INSTRUCTION) {
			exit_reason_io_vedio_struct* exit_reason_io_vedio = (exit_reason_io_vedio_struct*) VM_EXIT_SLEF_DEFINED_INFO_ADDR;
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
	//printk("cr3_guest_phy_addr: %08x\n\r", cr3_guest_phy_addr);
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
	load_guest_os_flag = 1;
	set_hd_intr_gate();
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
	for (unsigned long i = 0x00; i< 0x2000;i++) {  /* i (Granularity: 4K) */
		unsigned long guest_linear_addr = i*0x1000;
		unsigned long guest_phy_addr = get_guest_phy_addr(guest_linear_addr);
		unsigned long phy_addr = get_phy_addr(guest_phy_addr);
	}
}

void init_guest_gdt() {
	/* Init guest GDT */
	unsigned long guest_phy_gdt_addr = read_vmcs_field(GUEST_GDTR_BASE_ENCODING);
	unsigned long guest_phy_ldt_addr = read_vmcs_field(GUEST_LDTR_BASE_ENCODING);
	unsigned long guest_phy_tr_addr  = read_vmcs_field(GUEST_TR_BASE_ENCODING);

	unsigned long gdt_base_addr = get_phy_addr(guest_phy_gdt_addr);
	*((unsigned long *) (gdt_base_addr+8))  = 0x0000FFFF;  /* CS, base(16 bits):limit(16 bits)*/
	*((unsigned long *) (gdt_base_addr+12)) = 0x00C39B00;  /* CS, base(8 bits):type(16 bits):base(8 bits) */

	*((unsigned long *) (gdt_base_addr+16)) = 0x0000FFFF;  /* DS, base(16 bits):limit(16 bits)*/
	*((unsigned long *) (gdt_base_addr+20)) = 0x00C39300;  /* DS, base(8 bits):type(16 bits):base(8 bits) */

	set_vm_guest_tss_desc(gdt_base_addr+32, guest_phy_tr_addr);
	set_ldt_desc(gdt_base_addr+40, guest_phy_ldt_addr);
	_set_limit((char*)(gdt_base_addr+32), 0x1000);
	_set_limit((char*)(gdt_base_addr+40), 0x1000);
}

void set_io_bitmap(unsigned long bitmap) {
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

