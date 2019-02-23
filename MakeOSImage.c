#include <stdio.h>	/* fprintf */
#include <string.h>
#include <stdlib.h>	/* contains exit */
#include <sys/types.h>	/* unistd.h needs this */
#include <sys/stat.h>
#include <linux/fs.h>
#include <unistd.h>	/* contains read/write */
#include <fcntl.h>
int main(int argc, char ** argv) {
	char buffer[2048];
	FILE* fpr = fopen("Image", "r");
	FILE* fpw = fopen("hd.img", "r+");
	fread(buffer, 1, 446, fpr);   /* Read the beginning 446 bytes */
	fwrite(buffer, 1, 446, fpw);
	fseek(fpr, 512, SEEK_SET);    /* Relocate at 512 offsets from beginning of Image   */
    fseek(fpw, 512, SEEK_SET);    /* Relocate at 512 offsets from beginning of hd.img */
    fread(buffer, 1, 2048, fpr);
    fwrite(buffer, 1, 2048, fpw);

    fseek(fpw, 0x100000, SEEK_SET); // 1M = 1024*1024 = 1048576 = 0x100000

    for (int i =0; i< 64; i++)
    {
    	fread(buffer, 1, 2048, fpr);
    	fwrite(buffer, 1, 2048, fpw);
    }

    fclose(fpr);
    fclose(fpw);
}
