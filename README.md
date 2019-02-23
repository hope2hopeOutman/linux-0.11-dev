# linux-0.11-dev

Mainly study linux system and try to refact it for practice.

主要工作：在较新的ubuntu平台，用相对较新的GCC编译0.11的代码，然后在bochs2.6.9中跑起来，具体做了哪些适配工作，请查看AdaptionListForNewerGCC.txt
         引导程序和OS代码还是放在软盘中，但注意文件系统放在硬盘的第二分区了，所以build.c文件中的#define DEFAULT_MINOR_ROOT 2设置为2了，这点要注意。

