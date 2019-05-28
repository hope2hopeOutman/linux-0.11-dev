/*
 *  linux/fs/exec.c
 *
 *  (C) 1991  Linus Torvalds
 */

/*
 * #!-checking implemented by tytso.
 */

/*
 * Demand-loading implemented 01.12.91 - no need to read anything but
 * the header into memory. The inode of the executable is put into
 * "current->executable", and page faults do the actual loading. Clean.
 *
 * Once more I can proudly say that linux stood up to being changed: it
 * was less than 2 hours work to get demand-loading completely implemented.
 */

#include <errno.h>
#include <string.h>
#include <sys/stat.h>
#include <a.out.h>

#include <linux/fs.h>
#include <linux/sched.h>
#include <linux/kernel.h>
#include <linux/mm.h>
#include <asm/segment.h>

extern int sys_exit(int exit_code);
extern int sys_close(int fd);

/*
 * MAX_ARG_PAGES defines the number of pages allocated for arguments
 * and envelope for the new program. 32 should suffice, this gives
 * a maximum env+arg of 128kB !
 */
#define MAX_ARG_PAGES 32

/*
 * create_tables() parses the env- and arg-strings in new user
 * memory and creates the pointer tables from them, and puts their
 * addresses on the "stack", returning the new stack pointer value.
 */
unsigned long * create_tables(char * p,int argc,int envc)
{
	unsigned long *argv,*envp;
	unsigned long * sp;

	sp = (unsigned long *) (0xfffffffc & (unsigned long) p);/* 将p的最后两位置0，align 4,这样做是因为栈是向低地址扩展的，所以将栈向减小的方向对齐肯定是没问题的。*/
	/*
	 * 知道这里为什么要多分配4个字节吗？ 因为这里建立的参数指针数组
	 * (注意不是参数列表，这个数组中的每个参数指针是指向参数列表中每个参数的首地址的)，这样可以方便的读取参数列表中的参数(参数列表就是字符串列表，每个参数的长度是不定的)
	 * 所以参数指针数组也要用NULL或'\0'作为结束符，来区分参数指针数组和参数列表，懂了吧。
	 */
	sp -= envc+1;
	envp = sp;
	sp -= argc+1;  /* 同上 */
	argv = sp;
	put_fs_long((unsigned long)envp,--sp);  /* 将env参数指针数组的首地址入栈 */
	put_fs_long((unsigned long)argv,--sp);  /* 将argv参数指针数组的首地址入栈 */
	put_fs_long((unsigned long)argc,--sp);  /* 将argv参数列表中参数的个数argc入栈，到这里你应该明白了，为什么我们应用程序的入口函数main(int argc,argv)是这一个样子了吧。 */
	while (argc-->0) {
		put_fs_long((unsigned long) p,argv++);
		while (get_fs_byte(p++)) /* nothing */ ;
	}
	/*
	 * 看到没有，这里将0放入参数指针数组的最后一位，作为结束符。
	 * 这时参数指针数组的，最后一个元素是指针为0的元素，不指向参数列表的任何一个参数，表示结束啦哈哈。
	 */
	put_fs_long(0,argv);
	while (envc-->0) {
		put_fs_long((unsigned long) p,envp++);
		while (get_fs_byte(p++)) /* nothing */ ;
	}
	put_fs_long(0,envp);  /* 同上 */
	/* 到这里，sp就指向了argc在栈中的开始位置 */
	return sp;
}

/*
 * count() counts the number of arguments/envelopes
 * argv是一个存储字符串指针的数组，所以argv是指向指针数组头的指针，所以是char**类型
 * (unsigned long *) (tmp)：将数组的第一个元素的地址转换为(unsigned long *)类型
 */
static int count(char ** argv)
{
	int i=0;
	char ** tmp;

	if (tmp = argv)
		while (get_fs_long((unsigned long *) (tmp++)))
			i++;

	return i;
}

/*
 * 'copy_string()' copies argument/envelope strings from user
 * memory to free pages in kernel mem. These are in a format ready
 * to be put directly into the top of new user memory.
 *
 * Modified by TYT, 11/24/91 to add the from_kmem argument, which specifies
 * whether the string and the string array are from user or kernel segments:
 * 这里默认就是copy一个char* argv[n]类型的字符串列表;
 * 两个条件：1.数组或构成数组的成员(字符串指针)是在用户空间还是内核空间 2.字符串本身是在内核空间还是用户空间
 * 1. argv *  : 这里的argv*可以理解为取值操作，既(*argv)更好理解一点，*argv表示从数组中取一个数组元素(字符串指针)，但要知道这个数组或数组元素本身是在内核或用户空间。
 * 2. argv ** : argv**也理解为取值操作既(*(*argv))，表示字符串本身(数组元素指向的字符串)是在内核空间还是用户空间。
 * from_kmem     argv *        argv **       注意：这里的argv*指的是指针取值操作既(*argv)，同样 argv**也是指针取值操作既(*(*argv))
 *    0          user space    user space
 *    1          kernel space  user space
 *    2          kernel space  kernel space
 * 
 * We do this by playing games with the fs segment register.  Since it
 * it is expensive to load a segment register, we try to avoid calling
 * set_fs() unless we absolutely have to.
 */
static unsigned long copy_strings(int argc,char ** argv,unsigned long *page,
		unsigned long p, int from_kmem)
{
	/* 这里的argv是指向参数指针数组的指针因此是char** argv， 例如char* params[3],params作为参数的话就是char**类型。 */
	char *tmp, *pag;
	int len, offset = 0;
	unsigned long old_fs, new_fs;

	if (!p)  /* 这里的p是32个参数pages内的offset，也既是第三个参数page所表示的128K地址范围内的offset，始终指向参数表的头部,也是可用参数空间的底部。   */
		return 0;	/* bullet-proofing */
	new_fs = get_ds();  /* 内核数据段      */
	old_fs = get_fs();  /* 用户数据段    */
	if (from_kmem==2)
		set_fs(new_fs);
	unsigned long cached_linear_addrs[1] = { 0 };
	int length = GET_ARRAY_LENGTH(cached_linear_addrs);
	while (argc-- > 0) {     /* argc这里减减操作了 ，这个表达式结束了后，argc这个变量本身就会减1，尼玛忽略这里了，所以120行老是觉得有问题啊，哎晕死，耽误时间。*/
		if (from_kmem == 1)  /* 表明参数的指针数组在内核空间而参数列表在用户空间。*/
			set_fs(new_fs);  /* 所以要读取参数指针，首先要将fs段设置为指向内核数据段。*/
		if (!(tmp = (char *)get_fs_long(((unsigned long *)argv)+argc)))  /* 注意：argc会先执行--操作啊； 返回的是参数指针数组中的指针或直接指向字符串的指针， 该指针指向参数表或环境表的表项（注意这里的表项长度是不等的），这里（(unsigned long *)argv)+argc）指向 参数指针数组的最后一个非NULL元素。 */
			panic("argc is wrong");
		if (from_kmem == 1)
			set_fs(old_fs);  /* 这时将fs段设置为指向用户空间，这样根据参数指针（指向用户空间的数据段offset），就可以从用户空间的数据段取参数了。  */
		len=0;		/* remember zero-padding */
		do {
			len++;
		} while (get_fs_byte(tmp++)); /* 这里迷惑性最大了，temp是指向最后一个字符串参数的指针，所以tmp++是遍历这个字符串参数的，计算其长度的，也是以字符NULL（\0）作为结束符。  */
		if (p-len < 0) {	/* this shouldn't happen - 128kB */  /* 注意：这里的p始终是内核态分配的32个参数页的内部offset。如果p-len<0，说明内核态分配的32个页面剩余的空间不够存储该参数列表了。  */
			set_fs(old_fs);
			return 0;
		}
		while (len) {  /* 这里的len把字符串的结束符NULL（\0）也算进去了。到这里tmp指向了字符串结束符的下一个地址了，所以要--操作。   */
			/*
			 *  --p   : 是分配一个字节空间用于存储参数，因为p是指向参数表的头部的，也是可用参数空间的尾部，所以--操作分配的一个字节就是用来存储--tmp指向的结束符的。
			 *  --tmp : 指向字符串的结束符起始地址。
			 */
			--p; --tmp; --len;
			if (--offset < 0) {
				recov_swap_linear_addrs(cached_linear_addrs,length);
				offset = p % PAGE_SIZE;  /* 计算p在所在的页的offset.  */
				if (from_kmem==2)
					set_fs(old_fs);  /* 这里好像没必要啊，可能后续的操作需要用到用户态的FS， 不清楚。  */

				/* 计算该p所在页，存在于参数页数组的哪一项，如果该页不存在，那么就分配一个物理页，从这可以看出分配的存储参数和环境变量的物理页是在主存区的，
				 * 不可能在内核空间，但是物理页的指针数组是在内核空间的。
				*/
				if (!(pag = (char *) page[p/PAGE_SIZE]) &&
				    !(pag = (char *) (page[p/PAGE_SIZE] = get_free_page(PAGE_IN_MEM_MAP))))
					return 0;
				caching_linear_addr(cached_linear_addrs, length,check_remap_linear_addr((unsigned long*)&pag));
				if (from_kmem==2)
					set_fs(new_fs);

			}
			/* 如下代码表明，参数列表肯定是从用户态copy到内核态分配的物理页的，对于指向用户态参数列表的指针是在用户空间还是在内核空间，
			 * 这就需要我们判断了，所以要设置set_fs，不然的话数据段基地址错误的话，是取不到正确的参数列表的。
			 * 从这也可以看出，开启分页后，不管是在内核态还是在用户态，传给CPU的地址，都是线性地址，都需要MMU映射的。
			 * 下面的赋值操作猜猜是怎么寻址的？
			 * 因为pag得到的是16M内的实地址，而此时默认的寻址是DS:offset，DS是内核的DS所以基地址是0，这样得到的线性地址依旧在16M内，还是实地址映射，懂否哈哈。 */

			*(pag + offset) = get_fs_byte(tmp);  /* 将tmp所指的字符串反向，一个字符一个字符的复制到内核态分配的物理页pag+offset处。  */
		}
	}
	recov_swap_linear_addrs(cached_linear_addrs,length);
	if (from_kmem==2)
		set_fs(old_fs);
	return p;
}

unsigned long change_ldt(unsigned long text_size,unsigned long * page)
{
	struct task_struct* current = get_current_task();
	unsigned long code_limit,data_limit,code_base,data_base;
	int i;

	code_limit = text_size+PAGE_SIZE -1;
	//printk("change_ldt.code_limit: %u, pid: %d \n\r", code_limit, current->pid);
	code_limit &= 0xFFFFF000;
	//data_limit = 0x4000000;
	data_limit = USER_LINEAR_ADDR_LIMIT;
	code_base = get_base(current->ldt[1]);
	data_base = code_base;
	set_base(current->ldt[1],code_base);
	set_limit(current->ldt[1],code_limit);
	set_base(current->ldt[2],data_base);
	set_limit(current->ldt[2],data_limit);
    /* make sure fs points to the NEW data segment */
	__asm__("pushl $0x17\n\tpop %%fs"::);
	/*
	 * 注意：这里的env和argv参数列表是从用户地址空间的最高地址存放的，所以data_tabse+data_limit=4G，这个值超出了32位寄存器的范围，所以会有问题，
	 * 所以这里做了调整。
	 */
	//data_base += data_limit;
	data_base += (data_limit-PAGE_SIZE);
	//printk("put_page error before. \n\r");
	for (i=MAX_ARG_PAGES-1 ; i>=0 ; i--) {
		if (page[i]) {
			put_page(page[i],data_base);
		}
		data_base -= PAGE_SIZE;
	}
	//printk("put_page error after. \n\r");
	return data_limit;
}

/*
 * 'do_execve()' executes a new program.
 *  from_kmem详解：有两个参数决定这个参数的值：字符串指针和字符串。如果字符串指针和字符串都在用户空间其值为0，
 *  如果字符串指针在内核空间其字符串在用户空间其值为1，如果字符串指针和字符串都在内核空间其值为2 。
 */
int do_execve(unsigned long * eip,long tmp,char * filename,
	char ** argv, char ** envp)  /* 这里的tmp是call _sys_call_table 压入的返回地址，所以这里用不到。  */
{
	//printk("do_exec\n\r");
	struct task_struct* current = get_current_task();
	struct m_inode * inode;
	struct buffer_head * bh;
	struct exec ex;
	unsigned long page[MAX_ARG_PAGES];   /* 页指针数组是在内核空间，一定要注意。  */
	int i,argc,envc;
	int e_uid, e_gid;
	int retval;
	int sh_bang = 0;
	unsigned long p=PAGE_SIZE*MAX_ARG_PAGES-4;

	/*
	 * 这里eip指向的是进程的"用户态EIP"存储在内核栈中的地址，eip[1]=*(eip+1)，
	 * 我们知道发生中断时CPU会自动保存5个寄存器的值到栈中，入栈顺序是ss,esp,eflags,cs,eip,
	 * 所以内核栈eip+1地址处存储的是用户态的CS，因为进程的CS=DS，所以要是不等于0x000f，说明不是LDT中的代码段，故报错。
	 */
	if ((0xffff & eip[1]) != 0x000f)
		panic("execve called from supervisor mode");
	for (i=0 ; i<MAX_ARG_PAGES ; i++)	/* clear page-table */
		page[i]=0;
	if (!(inode=namei(filename)))		/* get executables inode */
		return -ENOENT;
	argc = count(argv);
	envc = count(envp);
	
restart_interp:
	if (!S_ISREG(inode->i_mode)) {	/* must be regular file */
		retval = -EACCES;
		goto exec_error2;
	}
	i = inode->i_mode;
	e_uid = (i & S_ISUID) ? inode->i_uid : current->euid;
	e_gid = (i & S_ISGID) ? inode->i_gid : current->egid;
	if (current->euid == inode->i_uid)
		i >>= 6;
	else if (current->egid == inode->i_gid)
		i >>= 3;
	if (!(i & 1) &&
	    !((inode->i_mode & 0111) && suser())) {
		retval = -ENOEXEC;
		goto exec_error2;
	}
	if (!(bh = bread(inode->i_dev,inode->i_zone[0]))) {
		retval = -EACCES;
		goto exec_error2;
	}
	ex = *((struct exec *) bh->b_data);	/* read exec-header */
	/*
	 * 执行shell脚本文件的话，会用到from_kmem=1和2这种情况，因为要先将shell脚本文件第一个逻辑块读入内核buf，
	 * 然后读取内核buf去初始化shell解释程序的参数和环境列表 ，这就涉及copy内核buf的内容到参数页了，所以会用到from_kmem=1或2这种情况，
	 * 普通的可执行文件是不需要的。
	*/

	if ((bh->b_data[0] == '#') && (bh->b_data[1] == '!') && (!sh_bang)) {
		/*
		 * This section does the #! interpretation.
		 * Sorta complicated, but hopefully it will work.  -TYT
		 */

		char buf[1023], *cp, *interp, *i_name, *i_arg;
		unsigned long old_fs;

		/* 此处的buf和b_data都在内核实地址寻址空间，所以不需要remap */
		strncpy(buf, bh->b_data+2, 1022);
		brelse(bh);
		iput(inode);
		buf[1022] = '\0';                /* 看到这里应该明白buf为什么是1023了吧。 */
		if ((cp = strchr(buf, '\n'))) {  /* 搜索第一个换行符并返回其位置指针。 */
			*cp = '\0';                  /* 将第一个换行符，替换成字符串结束符号。 \0的ASCII码是0，0的ASCII码可不是0哦呵呵。 */
			for (cp = buf; (*cp == ' ') || (*cp == '\t'); cp++); /* 过滤掉 #!与interpreter之间的空格和制表符。*/
		}
		if (!cp || *cp == '\0') {
			retval = -ENOEXEC; /* No interpreter name found */
			goto exec_error1;
		}
		interp = i_name = cp; /* 指向interpreter名的起始地址。  */
		i_arg = 0;
		for ( ; *cp && (*cp != ' ') && (*cp != '\t'); cp++) {  /* 假设解释器路径是 : /usr/bin/bash -e */
 			if (*cp == '/')
				i_name = cp+1;  /* i_name指向字符串中bash的首地址。  */
		}
		if (*cp) {
			*cp++ = '\0';  /* 将空格替换成字符串结束符 “\0”，注意这里要是有多个空格的话是有问题的，可以优化一下。 */
			i_arg = cp;    /* shell解释器的参数首地址赋给i_arg */
		}
		/*
		 * OK, we've parsed out the interpreter name and
		 * (optional) argument.
		 */
		if (sh_bang++ == 0) {
			/*
			 * 注意：这里的envc和envp是从用户态传递过来的参数，因此envp指向“参数指针数组”的首地址，因此*envp取得的是数组的第一个元素（是char*类型的），
			 * 第一个元素指向某个字符串的首地址，其在用户空间，而*(*envp)表示取该字符串的首字符，因此还是在用户空间，所以from_kmen=0。
			 * 而page作为页指针数组，是在内核态分配的，但是其关联的page是在主存区分配的（get_free_page），所以这里应该是在"内核态"分配这些物理页，
			 * 而不是在内核空间分配的，因为这些物理页的地址存储在内核空间的，所以只有内核态才能管理他们，ok理解了。
			 */
			p = copy_strings(envc, envp, page, p, 0);
			/* p是内核态分配页面的最高长字节的基地址，这里参数列表的argv[0]脚本文件名，没有copy，因为要执行的程序名会在下面单独处理。  */
			p = copy_strings(--argc, argv+1, page, p, 0);
		}
		/* shell脚本文件的执行，最终的参数列表是： bash -iarg1 -iarg2 example.sh -arg1 -arg2
		 * Splice in (1) the interpreter's name for argv[0]
		 *           (2) (optional) argument to interpreter
		 *           (3) filename of shell script
		 *
		 * This is done in reverse order, because of how the
		 * user environment and arguments are stored.
		 */

		/*
		 * 注意：这里的filename指针是指向参数字符串的指针（而参数字符串本身是在用户空间），filename指针本身是存储在内核栈中的，
		 * &filename这样的操作就是把filename指针构造字符串成数组(char* argv[1];)的第一个元素了，&filename是指向内核栈中存储filename指针的指针，
		 * 故“*(&filename)”得到的就是filename指针，存在于内核栈中，
		 * 而“**(&filename)”得到的就是字符串的首字符了，存在于用户空间，所以from_kmen=1.
		 * 这一步将example.sh脚本名称 copy到内核态参数页表，前面的arg1和arg2，已经在上一步copy完成了。
		*/
		p = copy_strings(1, &filename, page, p, 1);
		argc++; /* 恢复上面--argc操作，这里copy了filename所以要++argc。 */
		/*
		 *  这里只复制了解释程序的一个参数，如果解释程序有多个参数呢？？？
		 *  注意：这里的bash解释参数包括解释器名都已经读入内核空间的buf里了，
		 *  故 *(&i_arg)和*(*(&i_arg))都在内核空间，所以 from_kmem=2 。  */
		if (i_arg) {
			p = copy_strings(1, &i_arg, page, p, 2);
			argc++;  /* 这里要加上shell解释器本身参数，例如shell脚本文件中第一行： #!bash iarg1。 */
		}
		p = copy_strings(1, &i_name, page, p, 2);
		argc++;  /* 这里加上shell脚本解释器的名称，所以argv[0]表示的就是bash解释器名本身。  */
		if (!p) {
			retval = -ENOMEM;
			goto exec_error1;
		}
		/*
		 * OK, now restart the process with the interpreter's inode.
		 */
		old_fs = get_fs();
		set_fs(get_ds());  /* fs指向内核数据段。  */
		if (!(inode=namei(interp))) { /* get executables inode */  /* 因为interp指向的地址是buf中的offset，buf处于内核空间，所以要把fs设置为指向内核数据段。  */
			set_fs(old_fs);
			retval = -ENOENT;
			goto exec_error1;
		}
		set_fs(old_fs);
		goto restart_interp;
	}
	brelse(bh);
	if (N_MAGIC(ex) != ZMAGIC || ex.a_trsize || ex.a_drsize ||
		ex.a_text+ex.a_data+ex.a_bss>0x3000000 ||
		inode->i_size < ex.a_text+ex.a_data+ex.a_syms+N_TXTOFF(ex)) {
		retval = -ENOEXEC;
		goto exec_error2;
	}
	if (N_TXTOFF(ex) != BLOCK_SIZE) {
		printk("%s: N_TXTOFF != BLOCK_SIZE. See a.out.h.", filename);
		retval = -ENOEXEC;
		goto exec_error2;
	}
	/*
	 *  sh_bang=0，说明这时该inode表示的是可执行的二进制文件，不是shell脚本文件，因此要设置参数列表和环境列表 ，copy到内核态的page[]数组管理的物理页面。
	 *  sh_bang>0, 说明这时该inode表示的也是可执行二进制文件，是bash解释程序，用来执行shell脚本文件的，所以之前设置过参数了，所以这里不需要再设置了。
     */
	if (!sh_bang) {
		p = copy_strings(envc,envp,page,p,0);
		p = copy_strings(argc,argv,page,p,0);
		if (!p) {
			retval = -ENOMEM;
			goto exec_error2;
		}
	}
/* OK, This is the point of no return */
	if (current->executable)   /* 归还老的可执行文件的inode节点。 */
		iput(current->executable);
	current->executable = inode;   /* 如果执行的是shell脚本文件的话，这里的inode其实是shell解释程序，作为普通的可执行文件处理。  */
	for (i=0 ; i<32 ; i++)   /* 初始化32个信号bit的处理函数。 */
		current->sigaction[i].sa_handler = NULL;
	for (i=0 ; i<NR_OPEN ; i++)  /* 虽然 close_on_exec是个32位位图，但是只有前面的20位是有效的。 */
		if ((current->close_on_exec>>i)&1)
			sys_close(i);
	current->close_on_exec = 0;
	//printk("do_execve call free_page_tables before\n\r");
	free_page_tables(get_base(current->ldt[1]),get_limit(0x0f), current);
	//printk("do_execve call free_page_tables intermediate\n\r");
	free_page_tables(get_base(current->ldt[2]),get_limit(0x17), current);
	//printk("do_execve call free_page_tables after\n\r");
	if (last_task_used_math == current)
		last_task_used_math = NULL;
	current->used_math = 0;
	/*
	 * change_ldt(ex.a_text,page) 返回数据段的地址空间长度既64M，所以64M-MAX_ARG_PAGES*PAGE_SIZE得到进程128K参数表在64M空间内的offset.
	 *  |----------------------(64M-128K)------------------------|----------128K------------|
	 *                                                        offset
	 *                                                           |---p----|
	 *  |-----------------------------------------------------------------|-----------------|
	 *                                                                offset+p
	 *    所以p+=offset就得到了，argv和engv在64M地址空间内的offset，注意64M地址空间的最高地址存储engv,随后是argv，所以这时的p是argv第一个参数的offset。
	*/
	/* 得到argv第一个参数在64M进程地址空间的offset,这里已经改为3G地址空间的offset了，加上base就是绝对线性地址了。*/
	p += change_ldt(ex.a_text,page)-MAX_ARG_PAGES*PAGE_SIZE;
	//printk("changedLDt, executable: %p, textsize: %u \n\r",current->executable, ex.a_text);
	/*
	 * 在用户空间，高32页逻辑地址空间建立参数指针数组， 返回的p是用户空间的sp指针。
	 * 这里一定要注意：在x86架构这种分段机制下，所有的地址都是相对与段base的offset，最终会加上base形成最终的线性地址。
	 */
	p = (unsigned long) create_tables((char *)p,argc,envc);
	current->brk = ex.a_bss +
		(current->end_data = ex.a_data +
		(current->end_code = ex.a_text));
	current->start_stack = p & 0xfffff000;  /* page align.  */
	current->euid = e_uid;
	current->egid = e_gid;
	i = ex.a_text+ex.a_data;
	while (i&0xfff)  /* 代码段+数据段的长度如果不是4k（page）的倍数。  */
		put_fs_byte(0,(char *) (i++));  /* 在end_data后补0，直至（codeSize+dataSize）% 4k = 0 */
    /*
     * 这里的eip就是系统调用中断CPU自动保存在内核态堆栈的用户态EIP，eip[1]是用户态CS，
     * 所以这里将用户态EIP设置为新执行文件的逻辑地址（offset），中断返回后就从该地址处执行。
     */
	eip[0] = ex.a_entry; /* eip, magic happens :-) */
	/*
	 * 因为CPU会在内核栈中自动依次保存ss,esp,eflags,cs,eip；eip[0]=eip，所以eip[3]=esp，
	 * 用户态的堆栈指针；eip[3]=p，就是指向我们之前费了那么大劲初始化的参数和环境列表的offset。
	 */
	eip[3] = p;			 /* stack pointer */

	return 0;            /* 中断返回，在用户态执行新的可执行文件喽，心中一万个mama^_^ */
exec_error2:
	iput(inode);
exec_error1:
	for (i=0 ; i<MAX_ARG_PAGES ; i++) {
		if (!free_page(page[i]))
			panic("do_execve: trying to free free page");
	}
	return(retval);
}
