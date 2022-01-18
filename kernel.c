/*
* kernel.c
* Kernel core
*/

#include "video.h"

void kmain(void)
{
	const char *str = "hello, world";	// str for testing (hardcoded)
	char *vmem = (char*)0xb8000;		// video memory begins here, 0xb8000 designates protected mode (25 lines, 80 ASCII chars each)

	buffer_clear(vmem);			// clear video memory
	buffer_puts(vmem, (char*) str);		// print str to screen

	return;
}
