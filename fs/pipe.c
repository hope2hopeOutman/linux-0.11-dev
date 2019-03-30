/*
 *  linux/fs/pipe.c
 *
 *  (C) 1991  Linus Torvalds
 */

#include <signal.h>

#include <linux/sched.h>
#include <linux/mm.h>	/* for get_free_page */
#include <asm/segment.h>

int read_pipe(struct m_inode * inode, char * buf, int count)
{
	int chars, size, read = 0;

	while (count>0) {
		while (!(size=PIPE_SIZE(*inode))) {
			wake_up(&inode->i_wait);
			if (inode->i_count != 2) /* are there any writers? */
				return read;
			sleep_on(&inode->i_wait);
		}
		chars = PAGE_SIZE-PIPE_TAIL(*inode);
		if (chars > count)
			chars = count;
		if (chars > size)
			chars = size;
		count -= chars;
		read += chars;
		size = PIPE_TAIL(*inode);
		PIPE_TAIL(*inode) += chars;
		PIPE_TAIL(*inode) &= (PAGE_SIZE-1);

		unsigned long * remap_addr = (unsigned long *) inode->i_size;
		unsigned long cached_pg_table_base[1] = {0};
		int cached_pg_table_length = GET_ARRAY_LENGTH(cached_pg_table_base);
		caching_linear_addr(cached_pg_table_base, cached_pg_table_length, check_remap_linear_addr(&remap_addr));
		while (chars-->0) {
			//put_fs_byte(((char *)inode->i_size)[size++],buf++);
			put_fs_byte(((char *)remap_addr)[size++],buf++);
		}
		recov_swap_linear_addrs(cached_pg_table_base, cached_pg_table_length);
	}
	wake_up(&inode->i_wait);
	return read;
}
	
int write_pipe(struct m_inode * inode, char * buf, int count)
{
	int chars, size, written = 0;

	while (count>0) {
		while (!(size=(PAGE_SIZE-1)-PIPE_SIZE(*inode))) {
			wake_up(&inode->i_wait);
			if (inode->i_count != 2) { /* no readers */
				current->signal |= (1<<(SIGPIPE-1));
				return written?written:-1;
			}
			sleep_on(&inode->i_wait);
		}
		chars = PAGE_SIZE-PIPE_HEAD(*inode);
		if (chars > count)
			chars = count;
		if (chars > size)
			chars = size;
		count -= chars;
		written += chars;
		size = PIPE_HEAD(*inode);
		PIPE_HEAD(*inode) += chars;
		PIPE_HEAD(*inode) &= (PAGE_SIZE-1);

		unsigned long * remap_addr = (unsigned long *) inode->i_size;
		unsigned long cached_pg_table_base[1] = {0};
		int cached_pg_table_length = GET_ARRAY_LENGTH(cached_pg_table_base);
		caching_linear_addr(cached_pg_table_base, cached_pg_table_length, check_remap_linear_addr(&remap_addr));
		while (chars-->0) {
			//printk("inode->i_size: %u\n\r", inode->i_size);
			///((char *)inode->i_size)[size++]=get_fs_byte(buf++);
			((char *)remap_addr)[size++]=get_fs_byte(buf++);
			/* 这个bug搞了有2天时间，也是最后一个bug，内核保留空间映射高地址内存终于成功了，真是不疯魔不成佛啊，打完收工O(∩_∩)O哈哈~ */
		}
		recov_swap_linear_addrs(cached_pg_table_base, cached_pg_table_length);
	}
	wake_up(&inode->i_wait);
	return written;
}

int sys_pipe(unsigned long * fildes)
{
	struct m_inode * inode;
	struct file * f[2];
	int fd[2];
	int i,j;

	j=0;
	for(i=0;j<2 && i<NR_FILE;i++)
		if (!file_table[i].f_count)
			(f[j++]=i+file_table)->f_count++;
	if (j==1)
		f[0]->f_count=0;
	if (j<2)
		return -1;
	j=0;
	for(i=0;j<2 && i<NR_OPEN;i++)
		if (!current->filp[i]) {
			current->filp[ fd[j]=i ] = f[j];
			j++;
		}
	if (j==1)
		current->filp[fd[0]]=NULL;
	if (j<2) {
		f[0]->f_count=f[1]->f_count=0;
		return -1;
	}
	if (!(inode=get_pipe_inode())) {
		current->filp[fd[0]] =
			current->filp[fd[1]] = NULL;
		f[0]->f_count = f[1]->f_count = 0;
		return -1;
	}
	f[0]->f_inode = f[1]->f_inode = inode;
	f[0]->f_pos = f[1]->f_pos = 0;
	f[0]->f_mode = 1;		/* read */
	f[1]->f_mode = 2;		/* write */
	put_fs_long(fd[0],0+fildes);
	put_fs_long(fd[1],1+fildes);
	return 0;
}
