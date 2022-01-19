/*
* kernel.c
* Kernel core
*/

#include "vga.h"

void kernel_entry(void)
{
	vga_init(WHITE, CYAN);

	/* print fancy splash screen */
	unsigned int i;
	for(i = 0; i < 2; i++) vga_print_char(176, WHITE, CYAN);	// padding
	vga_print_string("  tinykernel alpha  ", WHITE, CYAN);		// title
	for(i = 0; i < 58; i++) vga_print_char(176, WHITE, CYAN);	// padding
	vga_print_newline(WHITE, CYAN);					// newline
	for(i = 0; i < 80; i++) vga_print_char(223, WHITE, CYAN);	// padding

	return;
}
