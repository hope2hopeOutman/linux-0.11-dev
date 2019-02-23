# OldLinux-0.11-xx 
Mainly study linux system and try to refact it for practice.

主要工作：在较新的ubuntu平台，用较新的GCC编译0.11的代码，然后在bochs2.6.9中跑起来，具体做了哪些适配工作，请查看AdaptionListForNewerGCC.txt

分支描述：

1. hdBoot-realMode

1.1 该分支主要是将系统改为从硬盘启动，引导程序（bootsect.s和setup.s），放置在硬盘引导区的前5个扇区中（现代硬盘的前1M空间都是引导区），OS放在硬盘的第一个分区，FS在硬盘的第二分区，注意0.11的FS目前只支持64M磁盘（后面会改的）.

1.2 系统的加载是在实模式下加载的，所以对于OS>1M的kernel是有问题的，下一个分支就解决这个问题，在保护模式下加载系统，大小随意（可以任性喽呵呵）。

1.3 老的代码根文件系统的设备号放在引导区第一扇区的508和509字节处，但是对于硬盘来说，第一扇区的最后66个字节是用来存储分区表和引导区标识符的，所以这里把ROOT_DEV放在了444和445两个字节处。

1.4 新建一个MakeOSImage.c文件，用于将引导程序（bootsect.s和setup.s）放在硬盘的前五个扇区，将OS放在硬盘1M开始地址处。


