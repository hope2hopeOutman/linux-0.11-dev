#ifndef _HEAD_H
#define _HEAD_H

#define EMULATOR_TYPE 0x01   /* 0x00: bochs, 0x01: qemu */
#define PAGE_SIZE 4096

typedef struct desc_struct {
	unsigned long a,b;
} desc_table[256];

struct apic_info {
	unsigned long bsp_flag;        /* 1: BSP, 0: AP */
	unsigned long apic_id;
	unsigned long apic_regs_addr;
	unsigned long kernel_stack;
	/*
	 * 每次调用shedule方法，就会将task分配到指定processorN上运行，就会递增相应load_per_apic上的数值，表示processor的负载，
	 * 数值越大表明该processorN比较繁忙，可以将task调度到其他processor上运行。
	 * 这里将BSP用作Master processor，APs用作slave processor，slave上任务的运行全靠master调度，这时AP上的apic timer都是禁用的，不能定时自主调度任务，
	 * 这里这样做的目的是：想先易后难，等这一步走通了，后面会开启所有processor的apic timer，让每个processor都能定时自主调度任务。
	 * 为什么要这样？通过我之前的惨痛经历和教训来看，内核代码的改造，一定要先易后难，先把技术链路打通能运行起来，然后再迭代优化，一股脑把自己的想法一次性全堆上，调试起来会搞死你。
	 */
	unsigned long load_per_apic;
	struct task_struct *current;
	unsigned long vm_entry_flag;  /* 1: have entered non-root vm env, 0: host env (VMM) */
};

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

/*
 * 因为QEMU的APIC base addresss是不能通过wrmsr进行relocate，所以在paging模式下，要想访问APIC的registers必须要remap
 * 1M的低地址范围内，4K~640K没有被使用，所以可以用来remap >3G物理地址空间的APIC base address.
 * */
#if EMULATOR_TYPE
#define KERNEL_MSR_REMAP_ADDR_START 0x0001   /* granularity 4K,起始地址空间是4K. */
#define KERNEL_MSR_REMAP_ADDR_SPACE 0x009F   /* granularity 4K,可用于remap APIC base address的地址空间大小，636K=159*4K=0x9F*4K */

#define IA32_VMX_BASIC                0x480
#define IA32_VMX_PINBASED_CTLS        0x481
#define IA32_VMX_PROCBASED_CTLS       0x482
#define IA32_VMX_PROCBASED_CTLS2      0x48B
#define IA32_VMX_EXIT_CTLS            0x483
#define IA32_VMX_ENTRY_CTLS           0x484
#define IA32_VMX_CR0_FIXED0           0x486
#define IA32_VMX_CR0_FIXED1           0x487
#define IA32_VMX_CR4_FIXED0           0x488
#define IA32_VMX_CR4_FIXED1           0x489
#define IA32_VMX_EPT_VPID_CAP         0x48C
#define IA32_VMX_TRUE_PINBASED_CTLS   0x48D
#define IA32_VMX_TRUE_PROCBASED_CTLS  0x48E
#define IA32_VMX_TRUE_EXIT_CTLS       0x48F
#define IA32_VMX_TRUE_ENTRY_CTLS      0x490
#define IA32_FEATURE_CONTROL          0x3A
#define IA32_VMX_MISC                 0x485

#define IA32_VMX_VPID_ENCODING                                   0x0000
#define IA32_VMX_POSTED_INTERRUPT_NOTIFICATION_VECTOR_ENCODING   0x0002
#define IA32_VMX_EPTP_INDEX_ENCODING                             0x0004
#define IA32_VMX_MSR_BITMAPS_ADDR_FULL_ENCODING                  0x2004
#define IA32_VMX_MSR_BITMAPS_ADDR_HIGH_ENCODING                  0x2005
#define IA32_VMX_VIRTUAL_APIC_ADDR_FULL_ENCODING                 0x2012
#define IA32_VMX_VIRTUAL_APIC_ADDR_HIGH_ENCODING                 0x2013
#define IA32_VMX_APIC_ACCESS_ADDR_FULL_ENCODING                  0x2014
#define IA32_VMX_APIC_ACCESS_ADDR_HIGH_ENCODING                  0x2015
#define IA32_VMX_POSTED_INTERRUPT_DESCRIPTOR_ADDR_FULL_ENCODING  0x2016
#define IA32_VMX_POSTED_INTERRUPT_DESCRIPTOR_ADDR_HIGH_ENCODING  0x2017

#define IA32_VMX_EPT_POINTER_FULL_ENCODING    0x201A
#define IA32_VMX_EPT_POINTER_HIGH_ENCODING    0x201B

#define IA32_VMX_GUEST_PHYSICAL_ADDR_FULL_ENCODING 0x2400
#define IA32_VMX_GUEST_PHYSICAL_ADDR_HIGH_ENCODING 0x2401

#define IA32_VMX_VMCS_LINK_POINTER_FULL_ENCODING    0x2800
#define IA32_VMX_VMCS_LINK_POINTER_HIGH_ENCODING    0x2801

#define IA32_VMX_PINBASED_CTLS_ENCODING             0x4000
#define IA32_VMX_PROCBASED_CTLS_ENCODING            0x4002
#define IA32_VMX_TPR_THRESHOLD_ENCODING             0x401C
#define IA32_VMX_SECONDARY_PROCBASED_CTLS_ENCODING  0x401E
#define IA32_VMX_CR3_TARGET_COUNT_ENCODING          0x400A

#define IA32_VMX_EXIT_CTLS_ENCODING                 0x400C
#define IA32_VMX_EXIT_MSR_STORE_COUNT_ENCODING      0x400E
#define IA32_VMX_EXIT_MSR_STORE_ADDR_FULL_ENCODING  0x2006
#define IA32_VMX_EXIT_MSR_STORE_ADDR_HIGH_ENCODING  0x2007

#define IA32_VMX_EXIT_MSR_LOAD_COUNT_ENCODING       0x4010
#define IA32_VMX_EXIT_MSR_LOAD_ADDR_FULL_ENCODING   0x2008
#define IA32_VMX_EXIT_MSR_LOAD_ADDR_HIGH_ENCODING   0x2009

#define IA32_VMX_ENTRY_CTLS_ENCODING                      0x4012
#define IA32_VMX_ENTRY_MSR_LOAD_COUNT_ENCODING            0x4014
#define IA32_VMX_ENTRY_MSR_LOAD_ADDR_FULL_ENCODING        0x200A
#define IA32_VMX_ENTRY_MSR_LOAD_ADDR_HIGH_ENCODING        0x200B
#define IA32_VMX_ENTRY_INTERRUPTION_INFORMATION_ENCODING  0x4016

#define IA32_VMX_VM_INSTRUCTION_ERROR_ENCODING            0x4400
#define IA32_VMX_EXIT_REASON_ENCODING                     0x4402
#define IA32_VMX_EXIT_INTR_INFO_ENCODING                  0x4404
#define IA32_VMX_EXIT_INTR_ERROR_CODE_ENCODING            0x4406
#define IA32_VMX_IDT_VECTOR_INFO_ENCODING                 0x4408
#define IA32_VMX_IDT_VECTOR_ERROR_CODE_ENCODING           0x440A
#define IA32_VMX_VM_EXIT_INSTRUCTION_LEN_ENCODING         0x440C
#define IA32_VMX_VM_EXIT_INSTRUCTION_INFO_ENCODING        0x440E

#define IA32_VMX_EXIT_QUALIFICATION_ENCODING    0x6400
#define IA32_VMX_GUEST_LINEAR_ADDR_ENCODING     0x640A

/*========== Host area =============*/
#define HOST_CR0_ENCODING  0x6C00
#define HOST_CR3_ENCODING  0x6C02
#define HOST_CR4_ENCODING  0x6C04

#define HOST_ES_ENCODING   0x0C00
#define HOST_CS_ENCODING   0x0C02
#define HOST_SS_ENCODING   0x0C04
#define HOST_DS_ENCODING   0x0C06
#define HOST_FS_ENCODING   0x0C08
#define HOST_GS_ENCODING   0x0C0A
#define HOST_TR_ENCODING   0x0C0C

#define HOST_FS_BASE_ENCODING     0x6C06
#define HOST_GS_BASE_ENCODING     0x6C08
#define HOST_TR_BASE_ENCODING     0x6C0A
#define HOST_GDTR_BASE_ENCODING   0x6C0C
#define HOST_IDTR_BASE_ENCODING   0x6C0E

#define HOST_IA32_SYSENTER_CS_ENCODING   0x4C00
#define HOST_IA32_SYSENTER_ESP_ENCODING  0x6C10
#define HOST_IA32_SYSENTER_EIP_ENCODING  0x6C12

#define HOST_RSP_ENCODING    0x6C14
#define HOST_RIP_ENCODING    0x6C16
/*========== Host area =============*/

/*========== Guest area ============*/
#define GUEST_CR0_ENCODING  0x6800
#define GUEST_CR3_ENCODING  0x6802
#define GUEST_CR4_ENCODING  0x6804

#define GUEST_ES_ENCODING   0x0800
#define GUEST_CS_ENCODING   0x0802
#define GUEST_SS_ENCODING   0x0804
#define GUEST_DS_ENCODING   0x0806
#define GUEST_FS_ENCODING   0x0808
#define GUEST_GS_ENCODING   0x080A
#define GUEST_LDTR_ENCODING 0x080C
#define GUEST_TR_ENCODING   0x080E

#define GUEST_GDTR_BASE_ENCODING   0x6816
#define GUEST_IDTR_BASE_ENCODING   0x6818
#define GUEST_DR7_ENCODING    0x681A
#define GUEST_RSP_ENCODING    0x681C
#define GUEST_RIP_ENCODING    0x681E

#define GUEST_RFLAGS_ENCODING     0x6820
#define GUEST_ES_BASE_ENCODING    0x6806
#define GUEST_CS_BASE_ENCODING    0x6808
#define GUEST_SS_BASE_ENCODING    0x680A
#define GUEST_DS_BASE_ENCODING    0x680C
#define GUEST_FS_BASE_ENCODING    0x680E
#define GUEST_GS_BASE_ENCODING    0x6810
#define GUEST_LDTR_BASE_ENCODING  0x6812
#define GUEST_TR_BASE_ENCODING    0x6814

#define GUEST_ES_LIMIT_ENCODING   0x4800
#define GUEST_CS_LIMIT_ENCODING   0x4802
#define GUEST_SS_LIMIT_ENCODING   0x4804
#define GUEST_DS_LIMIT_ENCODING   0x4806
#define GUEST_FS_LIMIT_ENCODING   0x4808
#define GUEST_GS_LIMIT_ENCODING   0x480A
#define GUEST_LDTR_LIMIT_ENCODING 0x480C
#define GUEST_TR_LIMIT_ENCODING   0x480E
#define GUEST_GDTR_LIMIT_ENCODING 0x4810
#define GUEST_IDTR_LIMIT_ENCODING 0x4812

#define GUEST_ES_ACCESS_RIGHTS_ENCODING    0x4814
#define GUEST_CS_ACCESS_RIGHTS_ENCODING    0x4816
#define GUEST_SS_ACCESS_RIGHTS_ENCODING    0x4818
#define GUEST_DS_ACCESS_RIGHTS_ENCODING    0x481A
#define GUEST_FS_ACCESS_RIGHTS_ENCODING    0x481C
#define GUEST_GS_ACCESS_RIGHTS_ENCODING    0x481E
#define GUEST_LDTR_ACCESS_RIGHTS_ENCODING  0x4820
#define GUEST_TR_ACCESS_RIGHTS_ENCODING    0x4822

#define GUEST_INTERRUPTIBILITY_STATE_ENCODING      0x4824
#define GUEST_ACTIVITY_STATE_ENCODING              0x4826
#define GUEST_VMX_PREEMPTION_TIMER_VALUE_ENCODING  0x482E
#define GUEST_PENDING_DEBUG_EXCEPTIONS_ENCODING    0x6822

#define GUEST_IA32_SYSENTER_CS_ENCODING            0x482A
#define GUEST_IA32_SYSENTER_ESP_ENCODING           0x6824
#define GUEST_IA32_SYSENTER_EIP_ENCODING           0x6826

#define GUEST_VMCS_LINK_POINTER_FULL_ENCODING      0x2800
#define GUEST_VMCS_LINK_POINTER_HIGH_ENCODING      0x2801
#define GUEST_IA32_DEBUGCTL_FULL_ENCODING          0x2802
#define GUEST_IA32_DEBUGCTL_HIGH_ENCODING          0x2803

#define GUEST_IA32_PAT_FULL_ENCODING               0x2804
#define GUEST_IA32_PAT_HIGH_ENCODING               0x2805
#define GUEST_IA32_EFER_FULL_ENCODING              0x2806
#define GUEST_IA32_EFER_HIGH_ENCODING              0x2807
#define GUEST_IA32_PERF_GLOBAL_CTRL_FULL_ENCODING  0x2808
#define GUEST_IA32_PERF_GLOBAL_CTRL_HIGH_ENCODING  0x2809
#define GUEST_IA32_BNDCFGS_FULL_ENCODING           0x2812
#define GUEST_IA32_BNDCFGS_HIGH_ENCODING           0x2813

/*========== Guest area End ============*/

#define IA32_DEBUGCTL           0x1D9
#define IA32_PERF_GLOBAL_CTRL   0x38F
#define IA32_PAT                0x277
#define IA32_EFER               0xC0000080
#define IA32_BNDCFGS            0xD90

#endif

#define PAGE_IN_REAL_MEM_MAP 1               /* 表示分配的物理地址来自于内核实地址映射的空间，mem_map开始的一部分是内核实地址映射的 */
#define PAGE_IN_MEM_MAP 0                    /* 表示分配的物理地址来自于整个mem_map管理的内存 */

#define GET_ARRAY_LENGTH(array) (sizeof(array)/sizeof(array[0]))
#define GET_DIR_ENTRY_OFFSET(linear_addr) (linear_addr >> 22)
#define NR_TASKS 64

#define MAX_ARG_PAGES 32

#define OS_INIT_PARAMS_LIMIT      0x0008   /* granularity 4K,系统初始化参数总大小设置为32K，足够了。 */
#define OS_INIT_PARAMS_ADDR       0x90000  /* granularity byte,系统初始化参数在boot阶段存放的地址，后面会复制到内核高地址空间。 */

#define LOGICAL_PROCESSOR_NUM       0x04    /* 这里设置有4个processor */
#define LOGICAL_PROCESSOR_MAXIMUM   0x64    /* 这里设置processor个数的上限 */

#define BSP_APIC_REGS_DEFAULT_LOCATION  0xFEE00000    /* Default addr for APIC base address  */
#define BSP_APIC_REGS_RELOCATION  0x20000   /* BSP Local APIC Registers在内存中的remap */
#define BSP_APIC_ICR_RELOCATION   0x20300   /* BSP ICR(Interrupt command register) 在内存中的位置 */


#define SCHED_INTR_NO         0x82      /* AP响应BSP发来的进程调度IPI中断号 */

#define AP_DEFAULT_TASK_NR    0x50      /* 这个数字已经超出了任务的最大个数64,所以永远不会被schedule方法调度到,仅用来保存AP halt状态下的context */
#define APIC_TIMER_INTR_NO    0x83      /* APIC timer定时器触发的中断号 */

#define VM_EXIT_REASON_EXTERNAL_INTERRUPT     1   /* External interrupt */
#define VM_EXIT_REASON_VMREAD                 23  /* VMREAD  vmcs-shadow not support */
#define VM_EXIT_REASON_VMWRITE                25  /* VMWRITE vmcs-shadow not support */
#define VM_EXIT_REASON_EPT_VIOLATION          48  /* EPT violation        */
#define VM_EXIT_REASON_EPT_MISCONFIGURATION   49  /* EPT misconfiguration */

#define GDT_IDENTITY_NO  0
#define IDT_IDENTITY_NO  1

#define GUEST_OS_IDT_BASE_ADDR               0x502000
#define GUEST_OS_GDT_BASE_ADDR               0x503000
#define GUEST_OS_TR_BASE_ADDR                0x504000
#define GUEST_OS_LDT_BASE_ADDR               0x505000

#endif
