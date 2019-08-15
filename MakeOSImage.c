#include <stdio.h>	/* fprintf */
#include <string.h>
#include <stdlib.h>	/* contains exit */
#include <sys/types.h>	/* unistd.h needs this */
#include <sys/stat.h>
#include <linux/fs.h>
#include <unistd.h>	/* contains read/write */
#include <fcntl.h>
int main(int argc, char ** argv) {
	char buffer[4096];
	FILE* fpr = fopen("Image", "r");
	FILE* fpw = fopen("hd.img", "r+");
	fread(buffer, 1, 446, fpr);   /* Read the beginning 446 bytes */
	fwrite(buffer, 1, 446, fpw);
	fseek(fpr, 512, SEEK_SET);    /* Relocate at 512 offsets from beginning of Image   */
    fseek(fpw, 512, SEEK_SET);    /* Relocate at 512 offsets from beginning of hd.img */
    fread(buffer, 1, 4096, fpr);
    fwrite(buffer, 1, 4096, fpw);

    fseek(fpw, 0x100000, SEEK_SET);  /* 硬盘第一分区，从0x00处开始存储host OS的code，引导区占用1M，所以从1M开始 */

    for (int i =0; i< 128; i++)
    {
    	fread(buffer, 1, 4096, fpr);
    	fwrite(buffer, 1, 4096, fpw);
    }

    FILE* fpr_guest_os = fopen("GuestOS", "r");
    fseek(fpw, 0x500000, SEEK_SET);  /* 硬盘第一分区，从4M开始存储GuestOS的code，也是从硬盘的5M开始. */
    for (int i =0; i< 128; i++)
    {
    	fread(buffer, 1, 4096, fpr_guest_os);
    	fwrite(buffer, 1, 4096, fpw);
    }

    fclose(fpr);
    fclose(fpr_guest_os);
    fclose(fpw);
}
