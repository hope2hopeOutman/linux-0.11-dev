# linux-0.11-dev
Mainly study linux system and try to refact it for practice.

主要工作：在较新的ubuntu平台，用较新的GCC编译0.11的代码，然后在bochs2.6.9中跑起来，具体做了哪些适配工作，请查看AdaptionListForNewerGCC.txt

分支描述：

1. hdBoot-realMode

1.1 该分支主要是将系统改为从硬盘启动，引导程序（bootsect.s和setup.s），放置在硬盘引导区的前5个扇区中（现代硬盘的前1M空间都是引导区），OS放在硬盘的第一个分区，FS在硬盘的第二分区，注意0.11的FS目前只支持64M磁盘（后面会改的）.

1.2 系统的加载是在实模式下加载的，所以对于OS>1M的kernel是有问题的，下一个分支就解决这个问题，在保护模式下加载系统，大小随意（可以任性喽呵呵）。

1.3 老的代码根文件系统的设备号放在引导区第一扇区的508和509字节处，但是对于硬盘来说，第一扇区的最后66个字节是用来存储分区表和引导区标识符的，所以这里把ROOT_DEV放在了444和445两个字节处。

1.4 新建一个MakeOSImage.c文件，用于将引导程序（bootsect.s和setup.s）放在硬盘的前五个扇区，将OS放在硬盘1M开始地址处。

2. hdBoot-protectMode-keepLoader

2.1 该分支实现在保护模式下加载OS code这样就不会受到实地址模式下1M寻址空间的限制，可以加载理论上最大4G的kernel。

2.2 具体实现步骤是：在实地址模式下，先从硬盘第一分区加载32K的kernel code代码，放在0x10000处，然后将该32K kernel code搬运到0x0000内存起始地址处，
    随后开启保护模式并跳转到0x0000地址处执行对剩下kernel的加载，由于这时已经是保护模式了，可以32为寻址了，所以就任性了呵呵。
    qkdny.c这个代码就是负责搬运剩余的kernel的，因为它是链接在head.s后的，所以系统运行后不会被覆盖的，一直会保留到系统shutdown.

2.3 后面会再出一个版本将qkdny.c放在kernel的开始4k内，这样当kernel完全加载完后，开始初始化内核目录表的时候，就会覆盖loader（head.s的一部分+qkdny.c）,这样就可以节省
    一部分内存了，不过对于现代内存容量来说就可以忽略了，这里仅仅是个practice,主要是想学习下GCC 和 LD。
    
3. hdBoot-protectMode-eraseLoader

   该分支把加载代码编译成整好占用开始的4K地址空间，这样当代码加载完后，初始化目录表就会覆盖掉加载代码。

4. support4GAddrSpacePerProcess

   该分支实现了根据内存的实际大小动态初始化内核目录表和页表，从而支持内核对4G内存的寻址，将目录表放在内存开始出0x0000
   页表占用4M从地址1M开始，内核代码被放置在了5M地址开始处，能够成功管理<64M的内存了，对于>64M的内存会出错，因为我们知道该内核是所有进程
   共用一个目录表且地址空间是64M大小，起始地址是nr*64M,所以当物理内存>64M后，进程1的地址空间和内核空间就重叠了，会有地址冲突错误的，
   所以下面支持每个进程都有自己独立的4G寻址空间，都有自己独立的目录表。
   本来打算该分支实现的，但工作量有点大，而且实现的方式有两种，所以就不在此分支上开发了，后面会开两个分支用两种方式实现进程4G寻址。
   
   这两种实现方式的详细过程，请参考boot/head.s里的注释，有详细的阐述。
   
5. 4GaddressingForProcess-byPartOfReservedKernelSpace

    5.1 实现每个进程都有独立的4G线性地址空间。
    
    5.2 内核的线性地址空间是从低地址0x00开始的，其大小可以通过系统参数动态分配。
    
        关于内核线性地址空间大小的分配详解head.s中关于系统参数KERNEL_LINEAR_ADDR_SPACE的介绍。
	
    5.3 在内核线性地址空间预留一部分空间，用于映射>内核线性地址空间的物理内存，进而实现内核对整个内存的管理。
    
        地址重映射的处理有两种方式：
	
        5.3.1 内核代码在使用物理内存的时候，要先判断该物理地址是否超出自己的实地址映射范围了，如果超出就要用保留空间remap。
	
              优点：出错了好排查
	      
              缺点：有点繁琐，而且对于有些特殊设备使用物理内存要格外注意别忘了添加remap检查，详解对pipe的处理(pipe.c)。
	      
              目前实现了该remap方式。
	      
        5.3.2 在general protection 异常处理方法里实现内存的映射，这样就不用根据设备的增减动态的加入映射代码。
	
              实现的思路：
	      
		1. 首先判定read/write beyond limit异常是否发生在内核态，如果是内核太就映射，否则任由其发展哈哈
				 
		2. 由于在内核态处理该异常，所以栈不需要切换，用的还是内核栈，和普通的函数调用一样，没区别。
				 
		3. 调用remap函数完成映射，并将新的线性地址放置到出错EIP指令的oprand位置处，也就是更新出错指令的操作数。
				 
                   这里尤其要注意：千万不要修改原来存储物理地址变量的值，因为你根本就不清楚后面的context是否要用到该物理地址，
		    
                   如果此时你贸然把该变量的值重置为remap后的线性地址，后面context再用到该变量就有问题(这里是个难点)。    
		    
	        4. return出错指令继续执行。
				 
		逻辑很清楚也很简单吧，但实现起来你懂的，到现在真是深有感触啊。
				 
		首先general protection处理的异常码有很多，你得区分read/write beyond limit的异常码。
				 
		其次也是最头疼的，就是有的时候bochsout.txt文件的log里明明报的是read/write limit异常，
				 
	        但程序呢没有进入general protection 异常，也就是如何确保这种异常一定能被捕获到，这是最关键的。
		
6.  support-SMP-ARCH。

    看了近两周的Intel文档(volume3 8|9|10|11 4章)终于有眉目了，SMP的关键是APIC（或其extensions xAPIC或x2APIC）,
    processors之间的通信是靠IPI中断来通信的，之前一直苦思冥想BSP在完成自己和AP的初始化后(既AP处理完最后一个SIPI)，
    是如何与AP通信将AP的CRx设置为保护模式的，还有设置相应的GDT，IDT，CS，EIP指向内核代码段，执行相应的中断处理函数，
    说白了就是AP如何能像BSP那样执行内核代码。
    这里的把实现思路阐述一下：
    前提：BSP和AP都完成了BIOS相应的初始化操作，BIOS将硬盘或其他类型的外设的第一个扇区的OS引导程序加载到内存的0x7c00处，
    这时BSP设置自己的EIP=0x7c00并跳转到该地址处执行，此时所有的AP是处于halt状态的。
    1. 首先BSP执行内核引导程序
       内核引导程序要干的事包括：
       1.1 首先在1M的内存空间内指定的位置初始化一个中断描述符表(也叫IDT别搞错了),一个GDT表，这些在保护模式下要用的。
       1.2 修改实地址模式下的IDT表(这叫中断向量表，每个表项占4字节，表示中断处理函数的入口地址)，主要是在没有用到的>16的索引项
           中插入引导程序定义的中断处理函数，因为AP要用该中断处理函数处理BSP发给它的IPI中断消息。
       1.3 发送IPI消息给每个AP，等待每个AP初始化完。
       1.4 设置CR0进入保护模式，并跳转到head.s继续执行对剩余内核代码的加载工作（如果内核远大于1M的话）
    2. AP处理IPI中断
       2.1 由于CPU reset后BSP和AP的IDTR都设置为0x0000，而BIOS默认是将IDT表放置在0x0000处的，
           所以通过修改实地址模式下的IDT表中的中断处理函数入口地址，可以将IPI中的vector number与引导程序自定义的中断处理函数绑定起来，
           这样BSP发送IPI给AP，AP就可以执行IDT中相应的os引导程序定义的中断处理函数来响应了。
       2.2 IPI中断的处理的主要工作是：执行LIDTR和LGDTR指令加载最新的IDT和GDT表，然后将AP设置为保护模式。
    做这些工作的主要目的就是初始化AP的主要寄存器，是AP能顺利的执行内核程序，响应内核发出的各种中断。
    我一直想，intel是不是应该提供类似: CPUID.IDTR, CPUID.GDTR， CPUID.CS EIP等等这样的指令，方便processor之间直接修改对方的寄存器
    这样就方便多了，不用再通过IPI这种方式了，反正在Intel的官方文档中没有找到类似的指令，有大牛知道的话，可以告知一下。
    不过这样做的话，是有点危险，系统分分钟崩溃的节奏。
           
				 
   





