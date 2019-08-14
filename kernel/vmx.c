/*
 * vmx.c
 *
 *  Created on: Aug 13, 2019
 *      Author: outman
 *      This module concern the implementation of the VMX feature.
 *      Including:
 *      1. Init VMXON region and guest-VMCS fields for VMXON and VMLAUNCH.
 *      2. Capture and diagnose VM-EXIT reason, and forward it to corresponding module to handle,  such as page-fault error.
 *      3. VMRESUNME
 *
 */

#include <linux/head.h>
#include <linux/sched.h>
#include <asm/system.h>
#include <linux/common.h>

void ia32_sysenter();
unsigned long support_64arch_check();

extern long user_stack[PAGE_SIZE>>2];
extern union task_union init_task;
extern void vm_exit_handler(void);
extern union task_union vm_defualt_task;
extern unsigned long tty_io_semaphore, load_os_addr;
extern desc_table idt;

/* 官方文档规定，VMXON_REGION的地址是64bits，所以这里用来保存vmxon_region的物理地址。 */
struct vmxon_region_address {unsigned long address[2];} vmxon_region_address;
struct vmcs_region_address {unsigned long address[2];} vmcs_region_address;
unsigned long processor_physical_address_width = 0;
unsigned long vmcs_size = 0;
unsigned long vmcs_memory_type = 0;

void read_msr(unsigned long index,unsigned long* msr_values) {
	__asm__ ("xorl %%eax,%%eax\n\t"  \
             "xorl %%edx,%%edx\n\t"  \
			 "rdmsr\n\t"             \
			 :"=a" (msr_values[0]),"=d" (msr_values[1]):"c" (index));
}

void write_msr(unsigned long index,unsigned long eax_value,unsigned long edx_value) {
	__asm__ ("wrmsr\n\t"             \
			 ::"a" (eax_value),"d" (edx_value),"c" (index));
}

/* 判断是否支持VMX feature. */
int vmx_support_verify() {
	int ecx_value = 0;
	__asm__("movl $0x01,%%eax;"   \
			"cpuid;"              \
			:"=c" (ecx_value):);
	return 	ecx_value & 0x20;  /* Bit 5 of ecx indicate whether support VMX, 1: support, 0: not support. */
}

void vmx_capability_verify() {
	if (vmx_support_verify()) {
		unsigned long msr_index = IA32_VMX_BASIC;
		unsigned long msr_values[2] = {0,};
		read_msr(msr_index,msr_values);
		unsigned long vmcs_revision = msr_values[0];
		unsigned long vmcs_size = msr_values[1] & (0x1FFF);          /* bit:32~44, 表示vmcs的大小。 */
		unsigned long vmcs_memory_type = msr_values[1] & (0x3C0000); /* bit:50~53, 表示VMCS占用内存类型：WB,UC,WT */
		int bit55 = (msr_values[1] & (1<<(55-32)));
		printk("IA32_VMX_BASIC: %u:%u, bit55: %u\n\r", msr_values[1], msr_values[0], bit55);
		if (bit55) {
			msr_index = IA32_VMX_PINBASED_CTLS;
			read_msr(msr_index,msr_values);
			printk("IA32_VMX_PINBASED_CTLS: %u:%u\n\r", msr_values[1], msr_values[0]);
		}
		else {

		}
	}
	else {
		panic("Processor can not support VMX feature.");
	}
}

/*
 * 进入VMX operation env需要一下5个步骤：
 *
 * 1. Create a VMXON region in non-pageable memory of a size specified by IA32_VMX_BASIC MSR and aligned to a
      4-KByte boundary. Software should read the capability MSRs to determine width of the physical addresses that
      may be used for the VMXON region and ensure the entire VMXON region can be addressed by addresses with
      that width. Also, software must ensure that the VMXON region is hosted in cache-coherent memory.
   2. Initialize the version identifier in the VMXON region (the first 31 bits) with the VMCS revision identifier reported
      by capability MSRs. Clear bit 31 of the first 4 bytes of the VMXON region.
   3. Ensure the current processor operating mode meets the required CR0 fixed bits (CR0.PE = 1, CR0.PG = 1).
      Other required CR0 fixed bits can be detected through the IA32_VMX_CR0_FIXED0 and IA32_VMX_CR0_FIXED1 MSRs.
      注意：”这里仅需要设置PE和PG让CPU处于保护且分页状态即可，其他的状态位不需要现在就根据FIXED msr进行设置，这里会迷惑人，其他的FIXED bit是在执行VM entry操作时设置“。
   4. Enable VMX operation by setting CR4.VMXE = 1. Ensure the resultant CR4 value supports all the CR4 fixed bits
      reported in the IA32_VMX_CR4_FIXED0 and IA32_VMX_CR4_FIXED1 MSRs.
      注意： ”这里也是仅需要设置VMXE bit位就行了，其他的不需要也不能在这里设置，一旦设置就会报错，因为那是LOAD VM的时候需要设置的，而VMXON操作不需要，这里浪费了一些时间“。
   5. Ensure that the IA32_FEATURE_CONTROL MSR (MSR index 3AH) has been properly programmed and that its
      lock bit is set (Bit 0 = 1). This MSR is generally configured by the BIOS using WRMSR.
 */

void vmx_env_entry() {
	vmxon_region_address.address[0] = get_free_page(PAGE_IN_REAL_MEM_MAP);

	/*
	 * For Intel 64 and IA-32 processors that support x2APIC, a value of 1 reported by CPUID.01H:ECX[21] indicates that
       the processor supports x2APIC and the extended topology enumeration leaf (CPUID.0BH)
	 */
	unsigned long x2apic_support = 0;
	__asm__ ("movl $0x01,%%eax\n\t"   \
			 "cpuid\n\t"              \
			 :"=c" (x2apic_support):);

	if (x2apic_support & (1<<21)) {
		printk("Current processor support x2APIC feature(%08x)\n\r", x2apic_support);
	}
	else {
		printk("Current processor doesn't support x2APIC feature(%08x)\n\r", x2apic_support);
	}


	if (vmx_support_verify()) {
		unsigned long init = 0;
		unsigned long fixed0 = 0;
		unsigned long fixed1 = 0;

		unsigned long msr_index = IA32_VMX_BASIC;
		unsigned long msr_values[2] = {0,};
		read_msr(msr_index,msr_values);
		unsigned long vmcs_revision = msr_values[0];
		/* vmxon_region仅需要你初始化processor_revision这个field，其它的都不需要你init. */
		*((unsigned long *)vmxon_region_address.address[0]) = vmcs_revision;

		vmcs_size = msr_values[1] & (0x1FFF);          /* bit:32~44, 表示vmcs的大小。 */
		vmcs_memory_type = msr_values[1] & (0x3C0000); /* bit:50~53, 表示VMCS占用内存类型：WB,UC,WT */
		if (!(msr_values[1] & (1<<(48-32)))) {
			processor_physical_address_width = 0xFFFFFFFC;  /* IA32_VMX_BASIC, bit48； 0:32bit, 1:64bit, 2^32-4 */
		}

		msr_index = IA32_FEATURE_CONTROL;
		read_msr(msr_index,msr_values);
		printk("IA32_FEATURE_CONTROL,(%u:%u)\n\r", msr_values[1],msr_values[0]);

		__asm__ ("movl %%cr0,%%edx\n\t"  \
				 "btsl $0,%%edx\n\t"    /* 开启保护模式 */   \
				 "btsl $31,%%edx\n\t"   /* 开启分页模式 */   \
				 "movl %%edx,%%cr0\n\t"  \

				 "movl %%cr4,%%edx\n\t"  \
				 "btsl $13,%%edx\n\t"   /* 开启VMX feature */   \
		         "movl %%edx,%%cr4\n\t"  \
				 "vmxon %0\n\t"         /* 进入VMX Operation ENV, VMX root */  \
				 ::"m" (*(&vmxon_region_address)));
	}
	else {
		panic("Processor can not support VMX feature.");
	}

	vm_entry();
}

void write_vmcs_field(unsigned long field_encoding, unsigned long field_value) {
	__asm__ ("vmwrite %%ecx,%%edx\n\t" \
			 ::"c" (field_value),"d" (field_encoding));
}

unsigned long read_vmcs_field(unsigned long field_encoding) {
	unsigned field_value = 0;
	__asm__ ("vmread %%edx,%%eax\n\t"  \
			 :"=a" (field_value):"d" (field_encoding));
	return field_value;
}

void guest_idle_loop() {
	printk("VM-entry success based on EPT and VPID(Mem-Virtualization)\n\r");
	printk("Welcome to guest environment.\n\r");

	load_os_addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
	printk("load_os_addr: %08x\n\r", load_os_addr);

	unsigned long idt_addr = get_gdt_idt_addr(IDT_IDENTITY_NO);
	printk("idt_addr: %08x\n\r", idt_addr);
	struct desc_struct * guest_idt_p = (struct desc_struct *) idt_addr;
	set_hd_intr_gate_in_vm(guest_idt_p);

	sti();
	do_hd_read_request_in_vm();
	cli();

	__asm__ ("guest_loop:\n\t"            \
			 "xorl %%eax,%%eax\n\t"       \
			 "nop\n\t"                    \
			 "jmp guest_loop\n\t"         \
			 ::);
}

void init_vmcs_field(unsigned long capability_msr_index, unsigned long field_encoding) {
	unsigned long msr_values[2] = {0,};
	read_msr(capability_msr_index,msr_values);
	printk("IA32_VMX_TRUE_XXX_CTLS: %08x:%08x\n\r", msr_values[1], msr_values[0]);
	unsigned long init_value = msr_values[0] & msr_values[1];
	write_vmcs_field(IA32_VMX_PINBASED_CTLS_ENCODING, init_value);
	unsigned long read_value = read_vmcs_field(IA32_VMX_PINBASED_CTLS_ENCODING);
	printk("init:read(%08x:%08x)\n\r", init_value, read_value);
}

void init_vmcs_pinbased_ctls() {
	unsigned long msr_values[2] = {0,};
	unsigned long init_value = 0;
	unsigned long read_value = 0;
	read_msr(IA32_VMX_PINBASED_CTLS,msr_values);
	printk("IA32_VMX_PINBASED_CTLS: %08x:%08x\n\r", msr_values[1], msr_values[0]);
	init_value = msr_values[0] & msr_values[1];
	read_msr(IA32_VMX_TRUE_PINBASED_CTLS,msr_values);
	printk("IA32_VMX_TRUE_PINBASED_CTLS: %08x:%08x\n\r", msr_values[1], msr_values[0]);
	init_value |= (msr_values[0] & msr_values[1]); /* Refer to algorithm 3. chapter 31.5.1 */

	/*
	 *  If this control is 1, external interrupts cause VM exits. Otherwise, they are delivered normally
		through the guest interrupt-descriptor table (IDT). If this control is 1, the value of RFLAGS.IF
		does not affect interrupt blocking.
	 */
	if ((msr_values[0] & (1<<0)) || (msr_values[1] & (1<<0))) {
		init_value |= (1<<0);  /* External-interrupt exiting. */
	}

	write_vmcs_field(IA32_VMX_PINBASED_CTLS_ENCODING, init_value);
	read_value = read_vmcs_field(IA32_VMX_PINBASED_CTLS_ENCODING);
	printk("init:read(%08x:%08x)\n\r", init_value, read_value);
}

void init_vmcs_procbased_ctls() {
	unsigned long msr_values[2] = {0,};
	unsigned long init_value = 0;
	unsigned long read_value = 0;
	unsigned long enable_flag = 0;

	/* Using algorithm 3 to init. */
	read_msr(IA32_VMX_PROCBASED_CTLS,msr_values);
	//printk("IA32_VMX_PROCBASED_CTLS: %08x:%08x\n\r", msr_values[1], msr_values[0]);
	init_value = msr_values[0] & msr_values[1];
	read_msr(IA32_VMX_TRUE_PROCBASED_CTLS,msr_values);
	//printk("IA32_VMX_TRUE_PROCBASED_CTLS: %08x:%08x\n\r", msr_values[1], msr_values[0]);

	init_value |= (msr_values[0] & msr_values[1]);

	if ((msr_values[0] & (1<<31)) || (msr_values[1] & (1<<31))) {
		init_value |= (1<<31);  /* Activate secondary processor controls */
	}
	if ((msr_values[0] & (1<<21)) || (msr_values[1] & (1<<21))) {
		init_value |= (1<<21);  /* Enable Use_TPR_shadow */
	}


	write_vmcs_field(IA32_VMX_PROCBASED_CTLS_ENCODING, init_value);
	read_value = read_vmcs_field(IA32_VMX_PROCBASED_CTLS_ENCODING);
	printk("init:read(%08x:%08x)\n\r", init_value, read_value);

	/* Init secondary process-controls and turn on virtual-APIC */
	if (init_value & (1<<31)) {
		unsigned long backup_value = init_value;
		read_msr(IA32_VMX_PROCBASED_CTLS2,msr_values);
		printk("IA32_VMX_PROCBASED_CTLS2: %08x:%08x\n\r", msr_values[1], msr_values[0]);
		init_value = (msr_values[0] & msr_values[1]);

		if ((msr_values[0] & (1<<0)) || (msr_values[1] & (1<<0))) {
			init_value |= (1<<0);  /* Enable Virtualize APIC accesses */
		}

		if ((msr_values[0] & (1<<1)) || (msr_values[1] & (1<<1))) {
			init_value |= (1<<1);  /* Enable EPT in non-root env, turn on physical-addr virtualization. */
		}

		if ((msr_values[0] & (1<<5)) || (msr_values[1] & (1<<5))) {
			init_value |= (1<<5);  /* Enable VPID,flush cached-mapping-lines of vTLB associated with VPID, don't need to flush the whole vTLB. */
		}

		if ((msr_values[0] & (1<<14)) || (msr_values[1] & (1<<14))) {
			init_value |= (1<<14);  /* Enable VMCS shadowing */
		}

		/*
		 * If the “virtualize x2APIC mode” VM-execution control is 1, the “virtualize APIC accesses” VM-execution control
           must be 0.
         */
		if (init_value & (1<<4)) {
			init_value &= (~(1<<0));
		}

		/* Virtualize APIC accesses has been enabled. */
		if (init_value & (1<<0)) {
			unsigned long apic_access_addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
			write_vmcs_field(IA32_VMX_APIC_ACCESS_ADDR_FULL_ENCODING, apic_access_addr);
			write_vmcs_field(IA32_VMX_APIC_ACCESS_ADDR_FULL_ENCODING, 0x00);
		}

		/*
		 * If the “use TPR shadow” VM-execution control is 0, the following VM-execution controls must also be 0:
         * “virtualize x2APIC mode”, “APIC-register virtualization”, and “virtual-interrupt delivery”.
         */
		if (backup_value & (1<<21)) {
			if ((msr_values[0] & (1<<8)) || (msr_values[1] & (1<<8))) {
				init_value |= (1<<8);   /* Enable APIC-register virtualization    */
			}
			if ((msr_values[0] & (1<<9)) || (msr_values[1] & (1<<9))) {
				init_value |= (1<<9);   /* Enable Virtual-interrupt delivery      */
			}

			/*
			 * If the “use TPR shadow” VM-execution control is 1, the virtual-APIC address must satisfy the following checks:
               — Bits 11:0 of the address must be 0.
               — The address should not set any bits beyond the processor’s physical-address width.
               Allocate a page for apic-page regardless of whether enable-apic-registers has been set to 1.
			 */
			unsigned long apic_page_addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
			write_vmcs_field(IA32_VMX_VIRTUAL_APIC_ADDR_FULL_ENCODING, apic_page_addr);
			write_vmcs_field(IA32_VMX_VIRTUAL_APIC_ADDR_HIGH_ENCODING, 0x00);

			/*
			 * If the “use TPR shadow” VM-execution control is 1 and the “virtual-interrupt delivery” VM-execution control is
               0, bits 31:4 of the TPR threshold VM-execution control field must be 0
             */
			if (!(init_value & (1<<9))) {
				read_value = read_vmcs_field(IA32_VMX_TPR_THRESHOLD_ENCODING);
				write_vmcs_field(IA32_VMX_TPR_THRESHOLD_ENCODING, read_value & 0x000F);
			}

			/*
			 *  The following check is performed if the “use TPR shadow” VM-execution control is 1 and the “virtualize APIC
			    accesses” and “virtual-interrupt delivery” VM-execution controls are both 0: the value of bits 3:0 of the TPR
				threshold VM-execution control field should not be greater than the value of bits 7:4 of VTPR (see Section 29.1.1).
			 */
			if (!(init_value & (1<<0)) && !(init_value & (1<<9))) {
				unsigned long addr = read_vmcs_field(IA32_VMX_VIRTUAL_APIC_ADDR_FULL_ENCODING);
				unsigned long tpr_threshold = read_vmcs_field(IA32_VMX_TPR_THRESHOLD_ENCODING);
				if (init_value & (1<<8)) { /* Enable apic registers has been set to 1  */
					unsigned long vtpr_value = *((unsigned long*)addr + 32); /* VTPR offset is 0x80 at APIC-PAGE */
					if ((tpr_threshold & 0xF) > ((vtpr_value>>4) & 0xF)) {
						panic("the value of bits 3:0 of the TPR	threshold VM-execution control field should not greater than the value of bits 7:4 of VTPR");
					}
				}
			}
		}
		else {
			init_value &= (~(1<<4));   /* Disable virtualize x2APIC mode          */
			init_value &= (~(1<<8));   /* Disable APIC-register virtualization    */
			init_value &= (~(1<<9));   /* Disable Virtual-interrupt delivery      */
		}

		/*
		 * If the “virtual-interrupt delivery” VM-execution control is 1,
		 * the “external-interrupt exiting” VM-execution control must be 1.
         */
		if (init_value & (1<<9)) {
			read_value = read_vmcs_field(IA32_VMX_PINBASED_CTLS_ENCODING);
			read_value |= 1;       /* Enable External-interrupt exiting */
			write_vmcs_field(IA32_VMX_PINBASED_CTLS_ENCODING, read_value);
			read_value = read_vmcs_field(IA32_VMX_PINBASED_CTLS_ENCODING);
			printk("IA32_VMX_PINBASED_CTLS_ENCODING(%08x)\n\r", read_value);
		}

		/* If the “process posted interrupts” VM-execution control is 1, the following must be true:1
			— The “virtual-interrupt delivery” VM-execution control is 1.
			— The “acknowledge interrupt on exit” VM-exit control is 1.  This check will handle in method (init_vmcs_exit_ctrl_fields)
			— The posted-interrupt notification vector has a value in the range 0–255 (bits 15:8 are all 0).
			— Bits 5:0 of the posted-interrupt descriptor address are all 0.
			— The posted-interrupt descriptor address does not set any bits beyond the processor's physical-address	width.
		*/
		read_value = read_vmcs_field(IA32_VMX_PINBASED_CTLS_ENCODING);
		if (read_value & (1<<7)) {
			init_value |= (1<<9);      /* Enable Virtual-interrupt delivery      */
			read_value = read_vmcs_field(IA32_VMX_POSTED_INTERRUPT_NOTIFICATION_VECTOR_ENCODING);
			if (read_value > 255) {
				panic("Posted-interrupt notification vector has a value greater than the range 0–255");
			}
			read_value = read_vmcs_field(IA32_VMX_POSTED_INTERRUPT_DESCRIPTOR_ADDR_FULL_ENCODING);
			if (read_value & 0x3F) {
				panic("Bits 5:0 of the posted-interrupt descriptor address are not all 0.");
			}
		}

		/*
		 * If the “VMCS shadowing” VM-execution control is 1, the VMREAD-bitmap and VMWRITE-bitmap addresses
			must each satisfy the following checks:
			— Bits 11:0 of the address must be 0.  4K aligned.
			— The address must not set any bits beyond the processor’s physical-address width.
	    */
		if (init_value & (1<<14)) {
			read_value = read_vmcs_field(IA32_VMX_MSR_BITMAPS_ADDR_FULL_ENCODING);
			if (read_value & 0x0FFF) {
				panic("Bits 11:0 of the MSR_bitmaps address must be 0");
			}
		}

		write_vmcs_field(IA32_VMX_SECONDARY_PROCBASED_CTLS_ENCODING, init_value);
		read_value = read_vmcs_field(IA32_VMX_SECONDARY_PROCBASED_CTLS_ENCODING);
		printk("init:read(%08x:%08x)\n\r", init_value, read_value);
	}
}

/************* Check CR3-count whether exceed the maximum limit. **************/
void init_vmcs_cr3_target_count() {
	unsigned long msr_values[2] = {0,};
	unsigned long init_value = 0;
	unsigned long read_value = 0;
	read_msr(IA32_VMX_MISC,msr_values);
	//printk("IA32_VMX_MISC: %08x:%08x\n\r", msr_values[1], msr_values[0]);
	init_value = (msr_values[0] & (0x1FF0000)) >> 16;  /* 取16~24位，得到CR3-target count */
	init_value > 4 ? 4 : init_value;
	/* if cr3-target count=0, then mov value,cr3 always trigger VM exit. */
	write_vmcs_field(IA32_VMX_CR3_TARGET_COUNT_ENCODING, init_value);
	read_value = read_vmcs_field(IA32_VMX_CR3_TARGET_COUNT_ENCODING);
	//printk("init:read(%08x:%08x)\n\r", init_value, read_value);
}

void init_vmcs_exec_ctrl_fields() {
	init_vmcs_pinbased_ctls();
	init_vmcs_procbased_ctls();
	init_vmcs_cr3_target_count();
}

void init_vmcs_exit_ctrl_fields() {
	unsigned long msr_values[2] = {0,};
	unsigned long init_value = 0;
	unsigned long read_value = 0;
	read_msr(IA32_VMX_EXIT_CTLS,msr_values);
	//printk("IA32_VMX_EXIT_CTLS: %08x:%08x\n\r", msr_values[1], msr_values[0]);
	init_value = msr_values[0] & msr_values[1];
	read_msr(IA32_VMX_TRUE_EXIT_CTLS,msr_values);
	//printk("IA32_VMX_TRUE_EXIT_CTLS: %08x:%08x\n\r", msr_values[1], msr_values[0]);
	init_value |= (msr_values[0] & msr_values[1]);

	read_value = read_vmcs_field(IA32_VMX_PINBASED_CTLS_ENCODING);
	read_value &= (1<<6);  /* Pin-Based VM-Execution Controls, bit6: Activate VMX-preemption time */
	if (!read_value) {
		init_value &= (~(1<<22));  /* bit22： Save VMX-preemption timer value， if not activate, should set to 0 */
	}

	unsigned long count = read_vmcs_field(IA32_VMX_EXIT_MSR_STORE_COUNT_ENCODING);
	unsigned long base_addr = read_vmcs_field(IA32_VMX_EXIT_MSR_STORE_ADDR_FULL_ENCODING);
	if (count) {
		if((base_addr+(count*16-1)) > processor_physical_address_width) {
			panic("IA32_VMX_EXIT_MSR_STORE_ADDR exceed address space what processor support. ");
		}
		base_addr &= (0xF);
		if (base_addr) {
			panic("The lower 4 bits of IA32_VMX_EXIT_MSR_STORE_ADDR should be 0. ");
		}
	}

	count = read_vmcs_field(IA32_VMX_EXIT_MSR_LOAD_COUNT_ENCODING);
	base_addr = read_vmcs_field(IA32_VMX_EXIT_MSR_LOAD_ADDR_FULL_ENCODING);
	if (count) {
		if((base_addr+(count*16-1)) > processor_physical_address_width) {
			panic("IA32_VMX_EXIT_MSR_LOAD_ADDR exceed address space what processor support. ");
		}
		base_addr &= (0xF);
		if (base_addr) {
			panic("The lower 4 bits of IA32_VMX_EXIT_MSR_LOAD_ADDR should be 0. ");
		}
	}

	/* If the “process posted interrupts” VM-execution control is 1, the following must be true:1
		— The “acknowledge interrupt on exit” VM-exit control is 1.  This check will handle in method (init_vmcs_exit_ctrl_fields)
	*/
	read_value = read_vmcs_field(IA32_VMX_PINBASED_CTLS_ENCODING);
	if (read_value & (1<<7)) {
		init_value |= (1<<15);   /* Enable Acknowledge interrupt on exit */
	}

	write_vmcs_field(IA32_VMX_EXIT_CTLS_ENCODING, init_value);
	read_value = read_vmcs_field(IA32_VMX_EXIT_CTLS_ENCODING);
	//printk("init:read(%08x:%08x)\n\r", init_value, read_value);
}

void init_vmcs_entry_ctrl_fields() {
	unsigned long msr_values[2] = {0,};
	unsigned long init_value = 0;
	unsigned long read_value = 0;
	read_msr(IA32_VMX_ENTRY_CTLS,msr_values);
	//printk("IA32_VMX_ENTRY_CTLS: %08x:%08x\n\r", msr_values[1], msr_values[0]);
	init_value = msr_values[0] & msr_values[1];
	read_msr(IA32_VMX_TRUE_ENTRY_CTLS,msr_values);
	//printk("IA32_VMX_TRUE_ENTRY_CTLS: %08x:%08x\n\r", msr_values[1], msr_values[0]);
	init_value |= (msr_values[0] & msr_values[1]);

	write_vmcs_field(IA32_VMX_ENTRY_CTLS_ENCODING, init_value);
	read_value = read_vmcs_field(IA32_VMX_ENTRY_CTLS_ENCODING);
	//printk("init:read(%08x:%08x)\n\r", init_value, read_value);

	init_value = read_vmcs_field(IA32_VMX_ENTRY_INTERRUPTION_INFORMATION_ENCODING);
	init_value &= (0x7FFFFFFF);   /* bit31 set to 0, Don't inject event when vm entry. */
	write_vmcs_field(IA32_VMX_ENTRY_INTERRUPTION_INFORMATION_ENCODING, init_value);

	unsigned long count = read_vmcs_field(IA32_VMX_ENTRY_MSR_LOAD_COUNT_ENCODING);
	unsigned long base_addr = read_vmcs_field(IA32_VMX_ENTRY_MSR_LOAD_ADDR_FULL_ENCODING);
	if (count) {
		if((base_addr+(count*16-1)) > processor_physical_address_width) {
			panic("IA32_VMX_ENTRY_MSR_LOAD_ADDR exceed address space what processor support. ");
		}
		base_addr &= (0xF);
		if (base_addr) {
			panic("The lower 4 bits of IA32_VMX_ENTRY_MSR_LOAD_ADDR should be 0. ");
		}
	}
}

void init_vmcs_ctrl_fields() {
	if (vmx_support_verify()) {
		unsigned long msr_index = IA32_VMX_BASIC;
		unsigned long msr_values[2] = {0,};
		read_msr(msr_index,msr_values);
		unsigned long vmcs_revision = msr_values[0];
		unsigned long vmcs_size = msr_values[1] & (0x1FFF);          /* bit:32~44, 表示vmcs的大小。 */
		unsigned long vmcs_memory_type = msr_values[1] & (0x3C0000); /* bit:50~53, 表示VMCS占用内存类型：WB,UC,WT */
		int bit55 = (msr_values[1] & (1<<(55-32)));
		unsigned long init_value = 0;
		unsigned long read_value = 0;
		printk("IA32_VMX_BASIC: %u:%u, bit55: %u\n\r", msr_values[1], msr_values[0], bit55);
		if (bit55) {
			init_vmcs_exec_ctrl_fields();
			init_vmcs_exit_ctrl_fields();
			init_vmcs_entry_ctrl_fields();
		}
		else {
		}
	}
	else {
		panic("Processor can not support VMX feature.");
	}
}

void init_vmcs_host_state() {
	unsigned long msr_values[2] = {0,};
	unsigned long init_value = 0;
	unsigned long read_value = 0;

	/* Init host CR0 */
	read_msr(IA32_VMX_CR0_FIXED0,msr_values);
	//printk("IA32_VMX_CR0_FIXED0: %08x:%08x\n\r", msr_values[1], msr_values[0]);
	init_value = msr_values[0];
	read_msr(IA32_VMX_CR0_FIXED1,msr_values);
	//printk("IA32_VMX_CR0_FIXED1: %08x:%08x\n\r", msr_values[1], msr_values[0]);
	init_value &= msr_values[0];
	write_vmcs_field(HOST_CR0_ENCODING, init_value);
	read_value = read_vmcs_field(HOST_CR0_ENCODING);
	//printk("init:read(%08x:%08x)\n\r", init_value, read_value);

	/* Init host CR4 */
	read_msr(IA32_VMX_CR4_FIXED0,msr_values);
	//printk("IA32_VMX_CR4_FIXED0: %08x:%08x\n\r", msr_values[1], msr_values[0]);
	init_value = msr_values[0];
	read_msr(IA32_VMX_CR4_FIXED1,msr_values);
	//printk("IA32_VMX_CR4_FIXED1: %08x:%08x\n\r", msr_values[1], msr_values[0]);
	init_value &= msr_values[0];
	write_vmcs_field(HOST_CR4_ENCODING, init_value);
	read_value = read_vmcs_field(HOST_CR4_ENCODING);
	//printk("init:read(%08x:%08x)\n\r", init_value, read_value);

	/* Init host segment selector */
	write_vmcs_field(HOST_ES_ENCODING, 0x10);
	read_value = read_vmcs_field(HOST_ES_ENCODING);
	//printk("Read HOST_ES_ENCODING: %u\n\r", read_value);
	write_vmcs_field(HOST_CS_ENCODING, 0x08);
	read_value = read_vmcs_field(HOST_CS_ENCODING);
	//printk("Read HOST_CS_ENCODING: %u\n\r", read_value);
	write_vmcs_field(HOST_SS_ENCODING, 0x10);
	read_value = read_vmcs_field(HOST_SS_ENCODING);
	//printk("Read HOST_SS_ENCODING: %u\n\r", read_value);
	write_vmcs_field(HOST_DS_ENCODING, 0x10);
	read_value = read_vmcs_field(HOST_DS_ENCODING);
	//printk("Read HOST_DS_ENCODING: %u\n\r", read_value);
	write_vmcs_field(HOST_FS_ENCODING, 0x10);
	read_value = read_vmcs_field(HOST_FS_ENCODING);
	//printk("Read HOST_FS_ENCODING: %u\n\r", read_value);
	write_vmcs_field(HOST_GS_ENCODING, 0x10);
	read_value = read_vmcs_field(HOST_GS_ENCODING);
	//printk("Read HOST_GS_ENCODING: %u\n\r", read_value);
    write_vmcs_field(HOST_TR_ENCODING, 0x20);
	read_value = read_vmcs_field(HOST_TR_ENCODING);
	//printk("Read HOST_TR_ENCODING: %u\n\r", read_value);

	write_vmcs_field(HOST_FS_BASE_ENCODING, 0x00);
	write_vmcs_field(HOST_GS_BASE_ENCODING, 0x00);
	write_vmcs_field(HOST_TR_BASE_ENCODING, &(init_task.task.tss));

	write_vmcs_field(HOST_IA32_SYSENTER_CS_ENCODING,  0x08);
	write_vmcs_field(HOST_IA32_SYSENTER_ESP_ENCODING, 0xA0000);
	write_vmcs_field(HOST_IA32_SYSENTER_EIP_ENCODING, ia32_sysenter);

	write_vmcs_field(HOST_GDTR_BASE_ENCODING, (unsigned long)&gdt);
	read_value = read_vmcs_field(HOST_GDTR_BASE_ENCODING);
	//printk("Read HOST_GDTR_ENCODING: %08x\n\r", read_value);
	write_vmcs_field(HOST_IDTR_BASE_ENCODING, (unsigned long)&idt);
	read_value = read_vmcs_field(HOST_IDTR_BASE_ENCODING);
	//printk("Read HOST_IDTR_ENCODING: %08x\n\r", read_value);

	write_vmcs_field(HOST_RSP_ENCODING, PAGE_SIZE+(unsigned long)&init_task);
	read_value = read_vmcs_field(HOST_RSP_ENCODING);
	//printk("Read HOST_RSP_ENCODING: %08x\n\r", read_value);
	write_vmcs_field(HOST_RIP_ENCODING, vm_exit_handler);
	read_value = read_vmcs_field(HOST_RIP_ENCODING);
	//printk("Read HOST_RIP_ENCODING: %08x\n\r", read_value);

	/* Check whether support 64-arch */
	if (processor_physical_address_width == 0xFFFFFFFC) {
		read_value = read_vmcs_field(IA32_VMX_ENTRY_CTLS_ENCODING);
		read_value &= (~(1<<9)); /* 如果processor不支持64-arch,那么这里一定要把bit9设置为0. */
		write_vmcs_field(IA32_VMX_ENTRY_CTLS_ENCODING, read_value);

		read_value = read_vmcs_field(IA32_VMX_EXIT_CTLS_ENCODING);
		read_value &= (~(1<<9)); /* 如果processor不支持64-arch,那么这里一定要把bit9设置为0. */
		write_vmcs_field(IA32_VMX_EXIT_CTLS_ENCODING, read_value);
	}
	else {
		panic("Now can not support 64-arch.");
	}
}

void init_vmcs_guest_state() {
	unsigned long msr_values[2] = {0,};
	unsigned long init_value = 0;
	unsigned long read_value = 0;

	unsigned long suppport_64 = support_64arch_check();

	/* Init Guest CR0 */
	read_msr(IA32_VMX_CR0_FIXED0,msr_values);
	//printk("IA32_VMX_CR0_FIXED0: %08x:%08x\n\r", msr_values[1], msr_values[0]);
	init_value = msr_values[0];
	read_msr(IA32_VMX_CR0_FIXED1,msr_values);
	//printk("IA32_VMX_CR0_FIXED1: %08x:%08x\n\r", msr_values[1], msr_values[0]);
	init_value &= msr_values[0];
	write_vmcs_field(GUEST_CR0_ENCODING, init_value);
	read_value = read_vmcs_field(GUEST_CR0_ENCODING);
	//printk("GUEST_CR0_ENCODING init:read(%08x:%08x)\n\r", init_value, read_value);

	/* Init host CR4 */
	read_msr(IA32_VMX_CR4_FIXED0,msr_values);
	//printk("IA32_VMX_CR4_FIXED0: %08x:%08x\n\r", msr_values[1], msr_values[0]);
	init_value = msr_values[0];
	read_msr(IA32_VMX_CR4_FIXED1,msr_values);
	//printk("IA32_VMX_CR4_FIXED1: %08x:%08x\n\r", msr_values[1], msr_values[0]);
	init_value &= msr_values[0];
	write_vmcs_field(GUEST_CR4_ENCODING, init_value);
	read_value = read_vmcs_field(GUEST_CR4_ENCODING);
	//printk("GUEST_CR4_ENCODING init:read(%08x:%08x)\n\r", init_value, read_value);

	read_value = read_vmcs_field(IA32_VMX_ENTRY_CTLS_ENCODING);
	//printk("IA32_VMX_ENTRY_CTLS_ENCODING : %08x\n\r", read_value);

	/* Check whether support debug, configured in VM-Entry Controls. */
	if (read_value & (1<<2)) { /* Load debug controls whether has been set. */
		if (1) {
			/* Reserved bits: 2~5, 16~63, should set to 0. */
			//write_msr(IA32_DEBUGCTL,0xFFC3,0);
			/*
			 * If the “load debug controls” VM-entry control is 1, DR7 is loaded from the DR7 field with the exception that
             * bit 12 and bits 15:14 are always 0 and bit 10 is always 1. The values of these bits in the DR7 field are ignored.
             *  */
			write_vmcs_field(GUEST_DR7_ENCODING, (1<<10));
			write_vmcs_field(GUEST_IA32_DEBUGCTL_FULL_ENCODING, 0x00);
			write_vmcs_field(GUEST_IA32_DEBUGCTL_HIGH_ENCODING, 0x00);
		}
		else {
			init_value = read_value & (~(1<<2));
			write_vmcs_field(IA32_VMX_ENTRY_CTLS_ENCODING, init_value);  /* Don't load Debug controls. */
		}
	}

	/* Check whether support performance monitor feature, configured in VM-Entry Controls. */
	if (read_value & (1<<13)) {
		unsigned long isSupportPerformanceMonitor = 0;
		__asm__ ("movl 0x0A,%%eax\n\t"  \
				 "cpuid\n\t"            \
				 :"=a" (isSupportPerformanceMonitor):);
		/*
		 * bits:0~7  indicates whether support performance monitor feature.
		 * bits:8~15 indicates the number of performance monitor count.
		 * */
		if (isSupportPerformanceMonitor & (0xFF) > 0) {
			unsigned long performanceMonitorCount = 0;
			__asm__ ("movl 0x0A,%%eax\n\t"  \
					 "cpuid\n\t"            \
					 :"=a" (performanceMonitorCount):);
			performanceMonitorCount &= (0xFF00);
			performanceMonitorCount >>= 8;
			/* Reserved bits: n~31, 35~63, should set to 0.  */
			unsigned long msr_values[2] = {0,0};
			read_msr(IA32_PERF_GLOBAL_CTRL, msr_values);
			msr_values[0] &= ((1<<performanceMonitorCount) - 1);
			msr_values[1] &= ((1<<(35-32)) - 1);

			//write_msr(IA32_PERF_GLOBAL_CTRL,msr_values[0],msr_values[1]);
			write_vmcs_field(GUEST_IA32_PERF_GLOBAL_CTRL_FULL_ENCODING, msr_values[0]);
			write_vmcs_field(GUEST_IA32_PERF_GLOBAL_CTRL_HIGH_ENCODING, msr_values[1]);
		}
		else {
			init_value = read_value & (~(1<<13));
			write_vmcs_field(IA32_VMX_ENTRY_CTLS_ENCODING, init_value);  /* Don't load IA32_PERF_GLOBAL_CTRL controls. */
		}
	}

	/* Check whether support PAT feature, configured in VM-Entry Controls. */
	if (read_value & (1<<14)) {
		unsigned long isSupportPAT = 0;
		__asm__ ("movl 0x01,%%eax\n\t"  \
				 "cpuid\n\t"            \
				 :"=d" (isSupportPAT):);
		if (isSupportPAT & (1<<16)) { /* bit16: indicates whether support page attribute table. */
			/*
			 * Memory type :  0 (UC), 1 (WC), 4 (WT), 5 (WP), 6 (WB), or 7 (UC-).\
			 * 0~2, 8~10, 16~18, 24~26, 32~34, 40~42, 48~50, 56~58 should be set one of the above memory type value.
			 * */
			//write_msr(IA32_PAT,0,0);
			write_vmcs_field(GUEST_IA32_PAT_FULL_ENCODING, 0x00);
			write_vmcs_field(GUEST_IA32_PAT_HIGH_ENCODING, 0x00);
		}
		else {
			init_value = read_value & (~(1<<14));
			write_vmcs_field(IA32_VMX_ENTRY_CTLS_ENCODING, init_value);  /* Don't load IA32_PAT controls. */
		}
	}

	/* Check whether support extended feature, configured in VM-Entry Controls. */
	if (read_value & (1<<15)) {
		unsigned long isSupportEFER = 0;
		__asm__ ("movl 0x80000001,%%eax\n\t"  \
				 "cpuid\n\t"            \
				 :"=d" (isSupportEFER):);
		if ((isSupportEFER & (1<<20)) || (isSupportEFER & (1<<29))) { /* bit20/29: indicates whether support extended feature. */
            /* Reserved bits: 1~7,9, 12~63, should set to 0. */
			unsigned long msr_values[2] = {0,0};
			read_msr(IA32_EFER, msr_values);
			msr_values[0] &= ((~0xFE) & (~(1<<9)));
			msr_values[1] = 0;

			/*
			 * Bit 10 (corresponding to IA32_EFER.LMA) must equal the value of the “IA-32e mode guest” VM-entry control,
			 * It must also be identical to bit 8 (LME) if bit 31 in the CR0 field (corresponding to CR0.PG) is 1.
			 * bit9: the value of the “IA-32e mode guest” VM-entry control.
			 *  */
			if (read_value & (1<<9)) {
				msr_values[0] |= ((1<<10) || (1<<8));
			}
			else {
				msr_values[0] &= (~(1<<10) & ~(1<<8));
			}

			//write_msr(IA32_PAT,msr_values[0],msr_values[1]);
			write_vmcs_field(GUEST_IA32_EFER_FULL_ENCODING, msr_values[0]);
			write_vmcs_field(GUEST_IA32_EFER_HIGH_ENCODING, msr_values[1]);
		}
		else {
			init_value = read_value & (~(1<<15));
			write_vmcs_field(IA32_VMX_ENTRY_CTLS_ENCODING, init_value);  /* Don't load Extend Feature controls. */
		}
	}

	/* Check whether support IA32_BNDCFGS feature, configured in VM-Entry Controls. */
	if (read_value & (1<<16)) {
		unsigned long isSupportMemProtectExtension = 0;
		__asm__ ("movl 0x07,%%eax\n\t"  \
				 "movl 0x00,%%ecx\n\t"  /* sub-leaf */ \
				 "cpuid\n\t"            \
				 :"=b" (isSupportMemProtectExtension):);
		/* isSupportMemProtectExtension[bit14]:  MPX. Supports Intel® Memory Protection Extensions if 1. */
		if (isSupportMemProtectExtension & (1<<14)) {
			/* Reserved bits: 2~11. */
			unsigned long msr_values[2] = {0,0};
			read_msr(IA32_BNDCFGS, msr_values);
			msr_values[0] &= ~((1<<12)-4);
			//write_msr(IA32_BNDCFGS, msr_values[0], msr_values[1]);

			write_vmcs_field(GUEST_IA32_BNDCFGS_FULL_ENCODING, msr_values[0]);
			write_vmcs_field(GUEST_IA32_BNDCFGS_HIGH_ENCODING, msr_values[1]);
		}
		else {
			init_value = read_value & (~(1<<16));
			write_vmcs_field(IA32_VMX_ENTRY_CTLS_ENCODING, init_value);  /* Don't load IA32_BNDCFGS controls. */
		}
	}

	/* Init GUEST segment selector */
	write_vmcs_field(GUEST_ES_ENCODING, 0x10);
	//printk("Read GUEST_ES_ENCODING: %04x\n\r",read_vmcs_field(GUEST_ES_ENCODING));
	write_vmcs_field(GUEST_CS_ENCODING, 0x08);
	//printk("Read GUEST_CS_ENCODING: %04x\n\r",read_vmcs_field(GUEST_CS_ENCODING));
	write_vmcs_field(GUEST_SS_ENCODING, 0x10);
	//printk("Read GUEST_SS_ENCODING: %04x\n\r",read_vmcs_field(GUEST_SS_ENCODING));
	write_vmcs_field(GUEST_DS_ENCODING, 0x10);
	//printk("Read GUEST_DS_ENCODING: %04x\n\r",read_vmcs_field(GUEST_DS_ENCODING));
	write_vmcs_field(GUEST_FS_ENCODING, 0x10);
	//printk("Read GUEST_FS_ENCODING: %04x\n\r",read_vmcs_field(GUEST_FS_ENCODING));
	write_vmcs_field(GUEST_GS_ENCODING, 0x10);
	//printk("Read GUEST_GS_ENCODING: %04x\n\r",read_vmcs_field(GUEST_GS_ENCODING));
	write_vmcs_field(GUEST_TR_ENCODING, 0x20);
	//printk("Read GUEST_TR_ENCODING: %04x\n\r",read_vmcs_field(GUEST_TR_ENCODING));
	write_vmcs_field(GUEST_LDTR_ENCODING, 0x28);
	//printk("Read GUEST_LDTR_ENCODING: %04x\n\r",read_vmcs_field(GUEST_LDTR_ENCODING));


	/* Init base_addr for Guest segment */
	write_vmcs_field(GUEST_ES_BASE_ENCODING, 0x00);
	//printk("Read GUEST_ES_BASE_ENCODING: %08x\n\r",read_vmcs_field(GUEST_ES_BASE_ENCODING));
	write_vmcs_field(GUEST_CS_BASE_ENCODING, 0x00);
	//printk("Read GUEST_CS_BASE_ENCODING: %08x\n\r",read_vmcs_field(GUEST_CS_BASE_ENCODING));
	write_vmcs_field(GUEST_SS_BASE_ENCODING, 0x00);
	//printk("Read GUEST_SS_BASE_ENCODING: %08x\n\r",read_vmcs_field(GUEST_SS_BASE_ENCODING));
	write_vmcs_field(GUEST_DS_BASE_ENCODING, 0x00);
	//printk("Read GUEST_DS_BASE_ENCODING: %08x\n\r",read_vmcs_field(GUEST_DS_BASE_ENCODING));
	write_vmcs_field(GUEST_FS_BASE_ENCODING, 0x00);
	//printk("Read GUEST_FS_BASE_ENCODING: %08x\n\r",read_vmcs_field(GUEST_FS_BASE_ENCODING));
	write_vmcs_field(GUEST_GS_BASE_ENCODING, 0x00);
	//printk("Read GUEST_GS_BASE_ENCODING: %08x\n\r",read_vmcs_field(GUEST_GS_BASE_ENCODING));
	//write_vmcs_field(GUEST_LDTR_BASE_ENCODING, &vm_defualt_task.task.ldt);
	unsigned long ldt_addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
	write_vmcs_field(GUEST_LDTR_BASE_ENCODING, ldt_addr);
	//printk("Read GUEST_LDTR_BASE_ENCODING: %08x\n\r",read_vmcs_field(GUEST_LDTR_BASE_ENCODING));
	unsigned long tr_addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
	write_vmcs_field(GUEST_TR_BASE_ENCODING, tr_addr);
	//printk("Read GUEST_TR_BASE_ENCODING: %08x\n\r",read_vmcs_field(GUEST_TR_BASE_ENCODING));

	/* Init the base_addr for Guest GDTR and IDTR registers */
	unsigned long gdt_base_addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
	unsigned long idt_base_addr = get_free_page(PAGE_IN_REAL_MEM_MAP);

	/* Init guest GDT */
	*((unsigned long *) (gdt_base_addr+8))  = 0x0000FFFF;  /* CS, base(16 bits):limit(16 bits)*/
	*((unsigned long *) (gdt_base_addr+12)) = 0x00C39B00;  /* CS, base(8 bits):type(16 bits):base(8 bits) */

	*((unsigned long *) (gdt_base_addr+16)) = 0x0000FFFF;  /* DS, base(16 bits):limit(16 bits)*/
	*((unsigned long *) (gdt_base_addr+20)) = 0x00C39300;  /* DS, base(8 bits):type(16 bits):base(8 bits) */

	set_vm_guest_tss_desc(gdt_base_addr+32, tr_addr);
	set_ldt_desc(gdt_base_addr+40, ldt_addr);
	_set_limit((char*)(gdt_base_addr+32), 0x1000);
	_set_limit((char *)(gdt_base_addr+40), 0x1000);

	write_vmcs_field(GUEST_GDTR_BASE_ENCODING, gdt_base_addr);
	//printk("Read GUEST_GDTR_BASE_ENCODING: %08x\n\r",read_vmcs_field(GUEST_GDTR_BASE_ENCODING));
	write_vmcs_field(GUEST_IDTR_BASE_ENCODING, idt_base_addr);
	//write_vmcs_field(GUEST_IDTR_BASE_ENCODING, idt);
	printk("Read GUEST_IDTR_BASE_ENCODING: %08x\n\r",read_vmcs_field(GUEST_IDTR_BASE_ENCODING));

	/* Init limit for Guest segment */
	write_vmcs_field(GUEST_ES_LIMIT_ENCODING, 0x3FFFFFFF);
	write_vmcs_field(GUEST_CS_LIMIT_ENCODING, 0x3FFFFFFF);
	write_vmcs_field(GUEST_SS_LIMIT_ENCODING, 0x3FFFFFFF);
	write_vmcs_field(GUEST_DS_LIMIT_ENCODING, 0x3FFFFFFF);
	write_vmcs_field(GUEST_FS_LIMIT_ENCODING, 0x3FFFFFFF);
	write_vmcs_field(GUEST_GS_LIMIT_ENCODING, 0x3FFFFFFF);
	write_vmcs_field(GUEST_LDTR_LIMIT_ENCODING, 0x1000);
	write_vmcs_field(GUEST_TR_LIMIT_ENCODING,   0x1000);
	write_vmcs_field(GUEST_GDTR_LIMIT_ENCODING, 0x1000);
	write_vmcs_field(GUEST_IDTR_LIMIT_ENCODING, 0x1000);

	/*
	 * Init access-rights for Guest segment
	 * Type(bits0~3): CS:9,11,13,15; SS: 3,7; DS FS GS ES:3, 7
	 * S(系统段或代码/数据段，bit4): 1: 表示代码段或数据段，0： 系统段
	 * DPL(bits5~6).  default set to 0;
	 * P(bit7): usable, must be 1;
	 * Reserved(bit8~11): must be 0.
	 * D/B(bit14): for IA-32 arch, this bit always set to 1 for data and code segment, For system descriptor, always set to 0.
	 * G(bit15) : granularity, 1: 4K, 0: byte.
	 * — If any bit in the limit field in the range 11:0  is 0, G must be 0.   Max limit: 0xFFFFFFFF
     * — If any bit in the limit field in the range 31:20 is 1, G must be 1.   Max limit: 0xFFFFFFFF
	 * Unusable(bit16): 0: usable, 1 : unusable.
	 * Reserved(bit17~31): usable flag is 1, must be 0.
	 *
	 * */
	write_vmcs_field(GUEST_ES_ACCESS_RIGHTS_ENCODING, 0xC093);
	write_vmcs_field(GUEST_CS_ACCESS_RIGHTS_ENCODING, 0xC09B);
	write_vmcs_field(GUEST_SS_ACCESS_RIGHTS_ENCODING, 0xC093);
	write_vmcs_field(GUEST_DS_ACCESS_RIGHTS_ENCODING, 0xC093);
	write_vmcs_field(GUEST_FS_ACCESS_RIGHTS_ENCODING, 0xC093);
	write_vmcs_field(GUEST_GS_ACCESS_RIGHTS_ENCODING, 0xC093);

	write_vmcs_field(GUEST_LDTR_ACCESS_RIGHTS_ENCODING, 0x82);
	write_vmcs_field(GUEST_TR_ACCESS_RIGHTS_ENCODING,   0x8B);

	write_vmcs_field(GUEST_RSP_ENCODING, &user_stack[PAGE_SIZE>>2]);
	write_vmcs_field(GUEST_RIP_ENCODING, guest_idle_loop);

	read_value = read_vmcs_field(IA32_VMX_ENTRY_INTERRUPTION_INFORMATION_ENCODING);
	/*
	 * The IF flag (RFLAGS[bit 9]) must be 1 if the valid bit (bit 31) in the VM-entry interruption-information field
     * is 1 and the interruption type (bits 10:8) is external interrupt.
	 * */
	if ((read_value & (1<<31)) && !(read_value & 0x700)) {
		write_vmcs_field(GUEST_RFLAGS_ENCODING, 0x202);
	}
	else {
		write_vmcs_field(GUEST_RFLAGS_ENCODING, 0x02);
	}

	write_vmcs_field(GUEST_ACTIVITY_STATE_ENCODING, 0x00);
	write_vmcs_field(GUEST_INTERRUPTIBILITY_STATE_ENCODING, 0x00);
	write_vmcs_field(GUEST_PENDING_DEBUG_EXCEPTIONS_ENCODING, 0x00);

	read_value = read_vmcs_field(IA32_VMX_PROCBASED_CTLS_ENCODING);
	if (read_value & (1<<31)) {
		read_value = read_vmcs_field(IA32_VMX_SECONDARY_PROCBASED_CTLS_ENCODING);
		if (read_value & (1<<14)) {

		}
		else {
			write_vmcs_field(GUEST_VMCS_LINK_POINTER_FULL_ENCODING, 0xFFFFFFFF);
			write_vmcs_field(GUEST_VMCS_LINK_POINTER_HIGH_ENCODING, 0xFFFFFFFF);
		}
	}
	else {
		write_vmcs_field(GUEST_VMCS_LINK_POINTER_FULL_ENCODING, 0xFFFFFFFF);
		write_vmcs_field(GUEST_VMCS_LINK_POINTER_HIGH_ENCODING, 0xFFFFFFFF);
	}

	/*
	 * Checks on Guest Page-Directory-Pointer-Table Entries, PDPTEs
	 * When CRO.PE and CR0.PG are set to 1, CR4.PAE = 1, and  “IA-32e mode guest” VM-entry control is 0;
	 * Should check PDPTEs.
	 * This don't support IA32e arch.
	 * */
	read_value = read_vmcs_field(GUEST_CR0_ENCODING);
	unsigned long read_value1 = read_vmcs_field(GUEST_CR4_ENCODING);
	unsigned long read_value2 = read_vmcs_field(IA32_VMX_ENTRY_CTLS_ENCODING);
	if ((read_value & (1<<31)) && (read_value1 & (1<<5)) && !(read_value2 & (1<<9))) {
		//todo Check PDPTEs.
		/*
		 * First need to check enable EPT control in Secondary process control.
		 * • If the control is 0, the PDPTEs are loaded from the page-directory-pointer table referenced by the physical
             address in the value of CR3 being loaded by the VM entry (see Section 26.3.2.1). The values loaded are treated
             as physical addresses in VMX non-root operation.
           • If the control is 1, the PDPTEs are loaded from corresponding fields in the guest-state area (see Section
             24.4.2). The values loaded are treated as guest-physical addresses in VMX non-root operation.
		 */
	}
	else {
		write_vmcs_field(GUEST_CR3_ENCODING, 0x00);  /* 设值VM entry后，CR3的初始化值。 */
	}

	/* Load MSR registers from MSR fields */
	/* Write IA32_SYSENTER CS/ESP/EIP MSR field before load */
	write_vmcs_field(GUEST_IA32_SYSENTER_CS_ENCODING,  0x08);
	write_vmcs_field(GUEST_IA32_SYSENTER_ESP_ENCODING, 0xA0000);  /* ESP allocate at Low 1M mem */
	write_vmcs_field(GUEST_IA32_SYSENTER_EIP_ENCODING, ia32_sysenter);

	/* 26.3.2.5 Updating Non-Register State */
	/*
	 *  If the “virtual-interrupt delivery” VM-execution control is 1, VM entry loads the values of RVI and SVI from the
		guest interrupt-status field in the VMCS (see Section 24.4.2). After doing so, the logical processor first causes PPR
		virtualization (Section 29.1.3) and then evaluates pending virtual interrupts (Section 29.2.1).
		If a virtual interrupt is recognized, it may be delivered in VMX non-root operation immediately after VM entry
		(including any specified event injection) completes; see Section 26.6.5. See Section 29.2.2 for details regarding
		the delivery of virtual interrupts.
	 * */

	/* 26.4 LOADING MSRS from MSR area defined by msr-count and msr-base-addr fields */

	/*
	 * 26.3.1.5 Checks on Guest Non-Register State
	 * Init VMCS link pointer
	 */
	read_value = read_vmcs_field(IA32_VMX_SECONDARY_PROCBASED_CTLS_ENCODING);
	if (read_value & (1<<14)) {
		unsigned long addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
		/* Lowest 32Bits: 设置VMCS show 的revision且bit31=1,type=shadow. */
		*((unsigned long*)addr) = (*((unsigned long*)vmcs_region_address.address[0]) | (1<<31));
		/* 低32位：设置VMCS show 的base-addr */
		write_vmcs_field(IA32_VMX_VMCS_LINK_POINTER_FULL_ENCODING, addr);
		/* 高32位：设置VMCS shadow的base addr，默认为0. */
		write_vmcs_field(IA32_VMX_VMCS_LINK_POINTER_HIGH_ENCODING, 0x00);
	}

	/*
	 * Check Enable EPT whether has been turn on in IA32_VMX_SECONDARY_PROCBASED_CTLS
	 * if Enable-EPT =1, we should init EPT paging structure.
	 */
	if (read_value & (1<<1)) {
		read_msr(IA32_VMX_EPT_VPID_CAP, msr_values);
		printk("IA32_VMX_EPT_VPID_CAP(%08x:%08x)\n\r", msr_values[0], msr_values[1]);
		unsigned long ept_pml4_addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
		/*  If the “enable EPT” VM-execution control is 1, the EPTP VM-execution control field
		    (see Table 24-8 in Section 24.6.11) must satisfy the following checks:4
				— The EPT memory type (bits 2:0) must be a value supported by the processor as indicated in the
				  IA32_VMX_EPT_VPID_CAP MSR (see Appendix A.10).
				— Bits 5:3 (1 less than the EPT page-walk length) must be 3, indicating an EPT page-walk length of 4; see Section 28.2.2.
				— Bit 6 (enable bit for accessed and dirty flags for EPT) must be 0 if bit 21 of the IA32_VMX_EPT_VPID_CAP
				  MSR (see Appendix A.10) is read as 0, indicating that the processor does not support accessed and dirty flags for EPT.
				— Reserved bits 11:7 and 63:N (where N is the processor’s physical-address width) must all be 0.
		*/
		if (msr_values[0] & (1<<8)) {  /* Indicate support memory-type uncacheable, value:0 */
			ept_pml4_addr &= (~0x07);
		}
		if (msr_values[0] & (1<<14)) { /* Indicate support memory-type write-back(WB), value:6 */
			ept_pml4_addr &= (~0x07);
			ept_pml4_addr |= 0x06;
		}

		if (msr_values[0] & (1<<6)) {  /* Bit 6 indicates support for a page-walk length of 4 */
			ept_pml4_addr &= (~0x38);  /* ~0B00111000 */
			ept_pml4_addr |= 0x18;     /*  0B00011000 */
		}

		if (msr_values[0] & (1<<21)) { /* If bit 21 is read as 1, accessed and dirty flags for EPT are supported */
			ept_pml4_addr |= (1<<6);   /* 0B1000000 */
		}

		write_vmcs_field(IA32_VMX_EPT_POINTER_FULL_ENCODING, ept_pml4_addr);
		write_vmcs_field(IA32_VMX_EPT_POINTER_HIGH_ENCODING, 0x00);
		printk("EPT_full: %08x, EPT_high: %08x\n\r", read_vmcs_field(IA32_VMX_EPT_POINTER_FULL_ENCODING),
				                                     read_vmcs_field(IA32_VMX_EPT_POINTER_HIGH_ENCODING));

		if (msr_values[0] & (1<<6)) {  /* Bit 6 indicates support for a page-walk length of 4 */
			/* We can init maximum 4 EPT-PML4 entries, here just init one entry(512G physical space is enough)  */
			unsigned long ept_pdpt_addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
			*((unsigned long*)(ept_pml4_addr & ~0xFFF)) = ept_pdpt_addr + 7;  /* Set bit 0,1,2 */

			/*
			 * IA32-ARCH just support 4G addressing space, so we should init 4 PDPT-entries for it.
			 * Note: each EPT paging-structure entry is a 8 bytes field.
			 * 这里其实挺绕的，还是详细解释下吧，关于EPT paging-structure与Guest paging-structure之间是如何映射。
			 * 1. 只要记住一点，CR3中存储的页目录(Guest-phy-addr)，相对与EPT paging-structure就是一个普通的物理页,这个普通物理页就是存储在EPT Page-Table Entry
			 *    中的实际物理页地址，当然CR3中存储的是Geust-phy-addr要经过EPT的PDE和PTE转换才能得到这个实际物理页地址，CR3与EPT PDPT-entry不是1:1对应关系，
			 *    但CR3与EPT的Page-Table Entry是1:1的对应关系，因为它就是EPT paging-structure管理的普通物理页，这点一定要搞清楚。
			 * 2. Guest-phy-addr在EPT paging-structure中，其实就是linear-addr,EPT paging-structure也就是按照线性地址处理的，不过表项的映射稍微有点不同，
			 *    我们知道EPT paging-structure entry占8字节所以一张表只能存储512项(9位索引: 遍历表项)，而线性地址是32位(10位索引: 遍历表项)
			 *    所以48位的Guest-phy-addr会被分为5份(IA32 ARCH的GUEST-phy-addr前面的会补齐16位)：
			 *       PML4-entry           PDPT-entry           PD-entry             PT-entry            PageIn-offset
			 *    000000000(9bits)     000000000(9bits)     000000000(9bits)     000000000(9bits)    000000000000(12bits)
			 *    通过以上partition遍历EPT paging-structure得到实际物理页地址，对于32位系统来说PDPT-entry部分只有低2位有效，所以最大只有4个PDPT-entry能被利用，
			 *    每个PDPT-entry可以管理1G物理地址空间，所以一共可以管理4G物理地址空间，这就对上了O(∩_∩)O哈哈~。
			 *    总之： EPT paging-structure 是通过4级分页映射来管理Guest paging-structure.
			 */
			unsigned long ept_pd_addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
			*((unsigned long*)ept_pdpt_addr) = ept_pd_addr + 7;

			ept_pd_addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
			*((unsigned long*)ept_pdpt_addr + 2) = ept_pd_addr + 7;

			ept_pd_addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
			*((unsigned long*)ept_pdpt_addr + 4) = ept_pd_addr + 7;

			ept_pd_addr = get_free_page(PAGE_IN_REAL_MEM_MAP);
			*((unsigned long*)ept_pdpt_addr + 6) = ept_pd_addr + 7;
		}
	}

	/*
	 * Check Enable VPID whether has been turn on in IA32_VMX_SECONDARY_PROCBASED_CTLS
	 * if Enable-VPID =1, we should set a 16bit value in VPID field.
	 */
	if (read_value & (1<<5)) {
		/* VM entry will check and ensures that this value is never 0x0000 */
		write_vmcs_field(IA32_VMX_VPID_ENCODING, 0x01);
	}
}



void vm_entry() {
	unsigned long vmcs_addr = (unsigned long*)get_free_page(PAGE_IN_REAL_MEM_MAP);
	vmcs_region_address.address[0] = vmcs_addr;
	*((unsigned long*)vmcs_addr) = *((unsigned long *)vmxon_region_address.address[0]);
	__asm__ (/*"vmclear %0\n\t"    \ */
			 "vmptrld %0\n\t"    \
			 ::"m" (*(&vmcs_region_address)));
	init_vmcs_ctrl_fields();
	/*
	 * 关于Load host/guest state为什么要加载各个段的base_address field，而不是根据段selector从GDTR或LDTR表中，加载各个段的base_address,
	 * 还是不太明白，为什么要这么做，其实觉得，各个段的base_address field本身都是多余的，因为有了GDTR和LDTR就够了啊。
	 * 后面实现了就明白了为什么要这样设计了，可能跟No-root环境下，不能进行任务切换有关吧。
	 * 后面会验证下，vm-entry后，会不会将各个段的base_address，limit和access-right field的值，自动更新到GDT对应的描述符项中。
	 * 总觉的在NON-root VMX下不能执行任务切换指令，这个限制太不合理了，不知道Intel是怎么想的。
	 * 现有的条件下，在non-root vmx环境下，要想实现任务切换，我的实现思路如下：
	 * 1. 首先设置GDT表，将新任务的LDT和TSS描述符更新到GDT表中
	 * 2. 在内核态执行ljmp tss指令，这样会导致vm-exit操作，这时将error-code（任务切换触发的异常码），更新到vmcs的error-code field
	 * 3. 在VMM (root vmx)环境下，根据异常码得到任务号，然后根据任务号到GDT中获取新任务的base_address, limit ,access-right信息，然后更新vmcs中
	 *    相应的的guest state
	 * 4. 执行vm resume操作，这时进入VM，执行的就是新任务了，从而达到任务切换的目的。
	 * 5. 在相同的processor上，执行vm resume操作很快，如果将新任务分配到其他processor模拟执行的话，代价就太大了。
	 *
	 * 经过验证如下：
	 * 1. CS，DS等段寄存器的各个field(base,limit,access-right),最后组成的段描述符必须和GDT表中相应的CS或DS描述符一致。
	 * 2. 如果不一致的话check guest state就会有问题，会做vm-exit处理。
	 * 3. 之前就是没有configure GDT表中的描述符项，以为VMLAUCH命令会根据base,limit,access-right fields的值以及段选择符，自动更新到GDT表对应的描述符项中;
	 *    事实证明是我想多了O(∩_∩)O哈哈~，所以每次执行vmlaunch命令会报错并执行vm-exit,
	 *    并在exit reason field中存储80000021(bit31=1: vmlaunch failure, 0x21: failed on check and load guest state ).
	 *  */
	init_vmcs_host_state();
	init_vmcs_guest_state();

	/*
	 * Enter VM Guest software.
	 * 注意：vmlaunch这个命令执行的时候如果出错的话，其后续的处理方式有两种。
	 * 1. 将控制直接转移到这条指令的下一条指令处，继续执行,实在VMM(root)状态下执行的。(check on vm-control and host state)
	 *    VM Entries”. Failure to pass checks on the VMX controls or on the host-state area passes control to the instruction
     *    following the VMLAUNCH or VMRESUME instruction.
	 *
	 * 2. 被看作是vm_exit退出，这时会保存guest_state, load host_state，执行host_state中定义好的RIP处执行。（check and load guest-state）
	 *    If these pass but checks on the guest-state area fail, the logical processor loads state from the host-state area of the VMCS,
	 *    passing control to the instruction referenced by the RIP field in the host-state area.
	 *
	 * 3. 在执行vmlaunch操作之前要将apic_id的值，放置到guest GDT表的第一项中（第一项默认不使用），因为VM环境下不能运行cpuid指令获取apic_id,
	 *    这样当vmlauch加载guest statue成功并进入vm state后，我们就可以通过访问GDT表的第一项内容获取apic_id了。
	 *    而且当vm-exit后进入host vmm状态后，会加载host state,这时GDTR存储的是host GDT表基地址，所以这时GDT表的第一项内容是空的，通过此方法
	 *    不仅可以在VM状态下获取当前processor的apic_id,而且还可以判断当前processor是否处于VM状态， 太秒了O(∩_∩)O哈哈哈~
	 */

	unsigned long apic_id = get_current_apic_id();
	unsigned long* guest_gdt_base = (unsigned long* ) read_vmcs_field(GUEST_GDTR_BASE_ENCODING);
	/* 注意：因为BSP的apic_id=0, 所以要加一个标志位来判定是否处于vm state,这里设置bit31为apic_id的有效标志位。 */
	apic_id |= (1<<31);
	*guest_gdt_base = apic_id;

	/*
	 * 初始化Guest内核空间，使其共享host的44M(12M(kernel)+32M(Real-map space))内核空间，
	 * 后面制作一个GuestOS image，这样就不用共享host内核了.
	 */
	init_guest_kernel_space();

	__asm__ ("vmlaunch\n\t"              \
			 "ctl_passthrough_ip:\n\t"   \
			 "xor %%eax,%%eax\n\t"       \
			 "nop\n\t"                   \
			 "nop\n\t"                   \
			 "nop\n\t"                   \
			 ::);

	unsigned long vm_exit_reason        = read_vmcs_field(IA32_VMX_EXIT_REASON_ENCODING);
	unsigned long vm_instruction_error  = read_vmcs_field(IA32_VMX_VM_INSTRUCTION_ERROR_ENCODING);
	printk("exit_reason: %08x, instruction_error: %08x\n\r", vm_exit_reason, vm_instruction_error);
}

void quit_vmx_env() {
	__asm__ ("vmxoff;" ::);
}

void ia32_sysenter() {
	printk("Come to sysenter env.\n\r");
}

unsigned long support_64arch_check() {
	unsigned long support_check = 0;
	__asm__ ("movl $0x80000001,%%eax\n\r"  \
			 "cpuid\n\r"                  \
			 :"=d" (support_check):);
	printk("edx: %08x\n\r", support_check);
	return support_check & (1<<29);
}
