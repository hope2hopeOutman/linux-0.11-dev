# OldLinux-0.11-xx 
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




