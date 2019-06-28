/*
 *  linux/kernel/printk.c
 *
 *  (C) 1991  Linus Torvalds
 */

/*
 * When in kernel-mode, we cannot use printf, as fs is liable to
 * point to 'interesting' things. Make a printf with fs-saving, and
 * all is well.
 */
#include <stdarg.h>
#include <stddef.h>
#include <asm/system.h>

#include <linux/kernel.h>

char print_buf[1024];

extern int vsprintf(char * buf, const char * fmt, va_list args);

extern unsigned long tty_io_semaphore;

int printk(const char *fmt, ...)
{
	va_list args;
	int i;

	lock_op(&tty_io_semaphore);

	va_start(args, fmt);
	i=vsprintf(print_buf,fmt,args);
	va_end(args);
	__asm__("push %%fs\n\t"
			"push %%ds\n\t"
			"pop %%fs\n\t"
			"pushl %0\n\t"
			"pushl $print_buf\n\t"
			"pushl $0\n\t"
			"call tty_write\n\t"
			"addl $8,%%esp\n\t"
			"popl %0\n\t"
			"pop %%fs"
			::"r" (i):"ax","cx","dx");
	return i;
}

char* cpy_str_to_kernel(char * dest,const char *src)
{
__asm__(
	"push %%ds\n"
	"push %%fs\n\t"
	"pop  %%ds\n\t"
	"cld\n\t"
	"1:\tlodsb\n\t"
	"stosb\n\t"
	"testb %%al,%%al\n\t"
	"jne 1b\n\t"
	"pop %%ds"
	::"S" (src),"D" (dest));
return dest;
}
