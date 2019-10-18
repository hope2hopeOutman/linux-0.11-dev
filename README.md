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
		
6.  support-SMP

    看了近两周的Intel文档(volume3 8|9|10|11 4章)终于有眉目了，SMP的关键是APIC（或其extensions xAPIC或x2APIC）,
    
    processors之间的通信是靠IPI中断来通信的，之前一直苦思冥想BSP在完成自己和AP的初始化后(既AP处理完最后一个SIPI)，
    
    是如何与AP通信将AP的CRx设置为保护模式的，还有设置相应的GDT，IDT，CS，EIP指向内核代码段，执行相应的中断处理函数，
    
    说白了就是AP如何能像BSP那样执行内核代码。
    
    这里的把实现思路阐述一下：
    
    前提：BSP和AP都完成了BIOS相应的初始化操作，BIOS将硬盘或其他类型的外设的第一个扇区的OS引导程序加载到内存的0x7c00处，
    
    这时BSP设置自己的EIP=0x7c00并跳转到该地址处执行，此时所有的AP是处于halt状态的。
    
    6.1 首先BSP执行内核引导程序
    
        内核引导程序要干的事包括：
       
        6.1.1 首先在1M的内存空间内指定的位置初始化一个中断描述符表(也叫IDT别搞错了),一个GDT表，这些在保护模式下要用的。
       
        6.1.2 修改实地址模式下的IDT表(这叫中断向量表，每个表项占4字节，表示中断处理函数的入口地址)，主要是在没有用到的>16的索引项
       
              中插入引导程序定义的中断处理函数，因为AP要用该中断处理函数处理BSP发给它的IPI中断消息。
	   
        6.1.3 发送IPI消息给每个AP，等待每个AP初始化完。
       
        6.1.4 设置CR0进入保护模式，并跳转到head.s继续执行对剩余内核代码的加载工作（如果内核远大于1M的话）
       
    6.2 AP处理IPI中断
    
        6.2.1 由于CPU reset后BSP和AP的IDTR都设置为0x0000，而BIOS默认是将IDT表放置在0x0000处的，
       
              所以通过修改实地址模式下的IDT表中的中断处理函数入口地址，可以将IPI中的vector number与引导程序自定义的中断处理函数绑定起来，
	   
              这样BSP发送IPI给AP，AP就可以执行IDT中相应的os引导程序定义的中断处理函数来响应了。
	   
        6.2.2 IPI中断的处理的主要工作是：执行LIDTR和LGDTR指令加载最新的IDT和GDT表，然后将AP设置为保护模式。
	
       
    6.3 做这些工作的主要目的就是初始化AP的主要寄存器，是AP能顺利的执行内核程序，响应内核发出的各种中断。
    
        我一直想，intel是不是应该提供类似: CPUID.IDTR, CPUID.GDTR， CPUID.CS EIP等等这样的指令，方便processor之间直接修改对方的寄存器
    
        这样就方便多了，不用再通过IPI这种方式了，反正在Intel的官方文档中没有找到类似的指令，有大牛知道的话，可以告知一下。
    
        不过这样做的话，是有点危险，系统分分钟崩溃的节奏。
    
    6.4 实现BSP根据AP的负载情况调度进程到指定的AP上运行就。
    
        BSP根据AP的负载情况，调度进程到指定的AP上运行已经调试成功，代码里有详细的注释
	
	（本来逻辑上看BSP调度AP运行进程相对会简单点，但实现起来也是复杂的很），
	
	下一步将实现AP自主调度进程运行，这里主要涉及到磁盘块的同步(尤其是磁盘块的高速缓冲区的同步)，
	
	开启AP的timer，也要实现对硬盘请求的同步等等，比BSP调度AP的方式要复杂一点。
	
   6.5   实现AP自主调用进程，不需要BSP调度。
   
        6.5.1  已经实现将BSP上的8253 timer替换为APIC timer，为AP开启APIC timer做好准备。
	
        6.5.2  终于实现BSP和AP自主调度进程运行了
   
         历史性的一天啊，里面有太多太多值得回味的地方，逻辑层的山路十八弯啊，太多大坑和tricky值得你去填和思考，
	 详细实现和感悟，请看实现里的注释吧。
	 
 
 7. support-VMX (minimum KVM)
 
    看了近一个月的VMX，东西太多了从第chapter 23~33,
    
    终于搞明白了virtualization based on precessor-level是怎么搞得了，
    
    包括内存和中断的虚拟化，不过对于在non-root VM 状态下不能进行task switch有点费解，
    
    难道VM在non-root状态下只能通过ljmp tss触发VM-EXIT回到VMM状态，通过调整VMCS去实现进程切换？
    
    下面终于可以开始VMX了，不过要先把OS迁到qemu，bochs不支持VMX (Nested VM).
    
  
7.1 成功地将OS从bochs移植到QEMU了

    也是挺苦逼的，一个APIC base address是否能relocate就耽误了近三天时间哎
	
7.2 vm-entry成功，终于进入non-root vm状态了。

    喜大普奔啊，guest vmcs的初始化搞了整整一个星期啊，东西真的是太多了，现在有一个经验，feature的难度与关联寄存器的个数绝对是正比关系，vmx这个feature的关联寄存器实在是太多了，一不小心就vm-exit了。

    执行完vmlaunch命令后，终于跳入guest_idle_loop函数，在VM状态下执行了。
    
7.3 完成基于EPT和VPID的内存虚拟化工作。

    内存虚拟化真的是太复杂了，而且里面还有好几个大坑，debug的过程能让你怀疑人生，其中一个搞了两天才发现并搞定，Guest通用寄存器值的备份问题，真的是太坑了，这个疏忽代价有点大，详细看代码里的注释吧。
    
7.4 重要进展GuestOS 中终于能执行printk打印功能了

    注意： 这里只实现了在内核态printk的打印功能，在用户态的打印printf里面有个大坑在7.5节会详细介绍。

    版本7.3中虽然完成了内存的虚拟化工作，但是由于GuestOS是共享HostOS的code和data的，所以在GuestVM中执行printk操作不会出现光标定位和srollup或scrolldown混乱的错误，因为这些参数是共享的，7.4版本是加载了GuestOS自己的image，执行自己的内核代码了，所以当这时在GuestOS中执行printk操作就有问题的因为screen cursor已经不是开始位置了，有以下两种解决问题的方法：

    设置这些跟屏幕滚动和光标定位的参数为共享参数.
设置Guest-vmcs的I/O bitmap的有关屏幕定位的端口为1，这样一旦写该端口就触发VM-EXIT，到host kernel环境下，代替GuestOS 执行print操作.
方式1比较麻烦，关键是要加锁同步；这里使用方式2，并在共享区为每个VM分配一页自定义的VM-EXIT-INFO信息，根据exit-reason及其相应的info-structure来处理。

    例如 有关打印的VM-EXIT-INFO中就会存储要打印的字符数和printbuf指针，这样在Host内核态执行guest_printk()方法来打印GuestOS中要打印的内容.
    
7.5 在VM中，终于实现task0与task1的切换。

    在VM中，要实现进程切换需要突破两大玄关，首先要将丹田之气散之任脉... hh不好意思跳戏了。

7.5.1 新老进程上下文的备份和还原必须自己实现。

      这里提3个关键点：

      1. 要将老进程导致进程切换的下一条指令的地址备份到task_struct.tss.eip中。
         当老进程再次被调度执行的话，应该从导致task_switch指令的下一条指令开始执行了，如果继续执行task_switch指令的话会陷入死循环了。

      2. 进程切换完后一定要将老进程的tss.status(desc_type)设置为available(9), 这样下次再调度老进程执行的时候不会报GP错误，如果此时老进程的        tss.desc_type=11(busy)的话就报GP异常了，根本无法触发VM-EXIT进入VMM中完成进程的切换。

         这个问题搞了整整一天，上下文的切换，某个细节遗漏了，真的能搞死你。

      3. 如果被调度的进程不是第一次运行的话(意味着被调度的进程处于内核态，不能再用iret指令一次性从栈上还原ss,esp,eflags,cs,eip内容了)，那么这个时候一定要注意：先将被调度进程的内核栈esp-=4, 然后再将被调度进程的eip设置到去该esp栈顶处。

         因为，一旦将esp寄存器的值设置为被调度进程的esp后，当你执行ret指令返回的时候，它首先会popl eip的，所以上面的操作明白了吧。

7.5.2 Guest-CR3还有个备份目录表结构(这里称之为Guest-CR3-shadow)，用于控制对EPT-page-structure转换后得到的实际物理页的访问。

      详解请看我的另一篇文章: 关于QEMU中EPT的实现机制。

      这个问题搞了我整整一周，本来内存管理就挺复杂的，为了实现内存虚拟化在此基础上又搞个EPT(4层映射)，关键QEMU还在里面加了私货哎，一言难尽啊，感兴趣的看文章吧。

7.5.3 关于GuestOS中，用户态下实现printf的打印功能

      这里面有个巨坑，为了解决这个问题耗费了一天时间，关键是GDB有的时候太不给力，打了断点了(b和hb都搞了)，死活就是不起作用，尼玛只有自己手工计算要打印内容的实际物理地址了。

      开过代码的朋友都应该知道，内核态是如何打印用户态的string的，就是通过get-fs-byte这个宏定义，因为进入系统调用后会将fs设置为指向LDT的ds的，所以这样内核态就可以访问用户态的数据了。

      但是printf函数也是类似printk的实现机制，通过设置io_map触发VM-EXIT进入VMM，由VMM获取要打印内容的地址，进行打印的，所以这个时候传给VMM的print_buf的地址就要注意了： 一定要加上段的基地址(printk要加上内核ds.base,printf要加上用户态ds.base)。

      printk里没加ds.base也能work well,那是因为内核的基地址是从0x00开始的，如果不是从0x00开始的话也会出现打印的内容不对的情况。

      详细的实现过程，请看ttyio.c的tty_write函数里的comments吧，里面有详细的推到过程。
      
      
7.5.4 终于成功的在自己写的GuestOS运行了第一个HelloWord应用程序了

      又是历史性的一天，在VM中，自己写的GuestOS中终于成功运行了第一条hello world应用程序，里面太多的弯弯绕，留待后面详细解释。

      石锤了，qemu中为什么要为每个Guest-cr3创建一个guest-cr3-shadow,就是为了销毁一个guest process做准备的；通过一次vm-exit销毁该进程 占用的所有ept物理页，尼玛效率啊。 当我们在GuestOS中通过free_page_tables销毁一个进程的时候，还要记得把对应的ept-page-structure中ept-page表项页释放了，不然的话新建的进程就会用老进程的代码跑了，想想看是不是这样，而在VM中的GuestOS是无法释放ept表项的，所以要vm-exit到VMM做这些事 ，guest-cr3-shadow给了我们一次性释放进程占用的所有ept表项的能力。
      
      
7.6 HostOS和GuestOS终于能够相安无事愉快的在一起工作了

    今天是真正历史性的一天，排除一个VM task_switch中隐藏的大bug后，系统终于能够很稳定的工作了，HostOS终于能够成功的将GuestOS调度到指定的AP上并成功运行了，至此内核虚拟化的工作算是彻底走通了，有一个感受任何事没有验证过千万别想当然了，之前7.5.4成功地在BSP上运行GuestOS了，想当然的以为BSP将GuestOS调度AP上运行也不会有问题，其实问题多了去了.

    下面就来讲讲遇到的大问题有哪些：

7.6.1 GuestOS中对HD的访问

      由于QEMU在processor reset和init后会将BSP.lint0设置为ExtINT(Directly connect to 8259A PIC), 所以运行在AP上的GuestOS要想收到来自8259A的HD_INTR，有两种方式：

      通过BSP中转后，传递给AP
具体的实现方式是：BSP收到HDINTR后向相应的AP发送IPI中断，AP通过该中断调用hdread/hdwrite方法响应，这里千万不要在BSP中完成hd-read/write操作，因为HostOS和GuestOS都有各自独立的文件系统，而且GuestOS运行在基于EPT虚拟化后的内存里的，所以HostOS如何读写GuestOS中的FS是个棘手问题，所以还是有GuestOS来完成HD-read/write比较好。

      这种实现方式最大的好处是: 通过加锁机制，可以实现多个(N>=2,运行在不同AP 上)GusetOS对HD的并发访问。因为所有AP发送来的HD-request/response都要汇总到BSP，有BSP统一管理，这样就方便加锁进行同步了。

      2. 关闭BSP中断，将ap.lint0连接到8259A PIC这样AP上的GuestOS就可以直接HD-request/reponse了，但是Intel文档规定了所有的processor只有一个可以directly connect to ExtINT，所以在多个GuestOS并发访问HD的时候，不仅要加锁同步，还要不停的切换ap.lint0，更为低效的是一旦一个ap.lint0连接到ExtINT后都会各自维护一个独立的hd-request list，这样只有等该ap完成了所有hd-request list后才回释放锁给其他ap使用，这样效率就太低了，而不是像上面方法那样由BSP维护一个所有processor共享的hd-request list.

        这两种方式代码里都实现了, 由方法init_apic_lint0和IPI中断号HD_IPI_INTR_NO切入代码去看就非常明白了。

7.6.2 AP在运行GuestOS的时候老是莫名其妙的pending

      每次在AP中debug GuestOS的时候当delete所有break后，运行continue指令老是随机卡死在某些代码处，但是ctrl+c后输入c回车又能运行一段程序，反复这样几次最终也能成功运行a.out这个helloworld程序，感觉是缺了heart-beat，后来抱着试一试的心态(哈哈有点像电视广告里的大妈现身说法)加入vmx-preemption timer这个功能后GuestOS就能连续运行代码了。这里实在是不知道为什么会这样，难道VM中必须要加这个功能，定时的在VM和VMM之间来回的切换才能保证VM不pending.

7..6.3 AP开启apic-timer后偶尔会导致死锁的问题

       我们知道qemu是不支持apic-base-addr relocate的，又因为本内核空间是分配在1G的低地址空间的，所以每次访问apic-registers都要先进行apic-base-addr remap然后才能访问，

       每个AP开启apic-timer后会定时执行do_timer中的send_EOI方法，该方法是加锁实现将apic-base-addr映射到8K~136K空间随机的某个页，这样processor之间会进行频繁的锁竞争，从而导致整个系统不是很稳定，偶尔会出现死锁的情况。

       现在将不同的processor.apic-base-addr映射到不同的linear-addr从而就不需要锁竞争了，大大改善了系统的稳定性。

7.6.4 VM task_switch里隐藏的一个大bug

      任务切换隐藏了一个很深的monsterbug，还是与FS段的设置与备份相关，以前的在实现多核任务调度的过程中也遇到这个问题。

      造成这个bug的根本原因还是任务系统调用后会将FS设置为0x17指向用户态，这样在内核态就可以访问用户态的数据了(还记得get_fs_byte吗)。

      当任务执行fsread/write进入内核态其FS被system_call.s设置为0x17，当要访问HD时，在发出HD_read/write后会设置状态为interruptable_state并等待HD_intr(本版本是BSP发送IPI通知AP), 然后执行schedule调度其他任务执行,这时会发生task_switch触发VM-EXIT进入VMM去进行新老任务的备份和设置，这时老任务的FS段肯定是被设置为0x17并保存在exit_reason_task_switch->old_task_tss.fs中的.

      但是当再次调度老任务的时候，这里并没有还原老任的fs所以造成任务在内核太访问用户态数据时出错, 太佩服自己了，通过纯代码逻辑推理在中断和任务切换等各种导致VM-EXIT的嵌套中，最终还是被我发现了(借我借我借我一双慧眼吧O(∩_∩)O哈哈~)。

      其实主要还是这种情况很少出现，出现了想debug但悲催的是老是跟不进去，在此再次吐槽下GDB在虚拟化里的调试有点太不稳定了，连hb中断有时也跟不进去。

      以上都是耗时比较长的大问题，还有n多小问题就不列举了，感兴趣的可以看代码里的注释，都是泪啊。




    
    
           
				 
   





