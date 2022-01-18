/*
* kernel.c
* Kernel core
*/

#include "vga.h"

#define G_COLOR_PRIMARY WHITE
#define G_COLOR_SECONDARY CYAN
#define G_COLOR_TERTIARY BLACK


void kernel_entry(void)
{
	vga_init(G_COLOR_PRIMARY, CYAN);

	vga_print_string("tinykernel alpha", G_COLOR_PRIMARY, G_COLOR_SECONDARY);	// print tests to screen
	vga_print_newline(G_COLOR_PRIMARY, G_COLOR_SECONDARY);
	
	unsigned int i;
	for(i = 0; i < 80; i++)
	{
		vga_print_char(223, G_COLOR_PRIMARY, G_COLOR_SECONDARY);	// ASCII code for top half block char
	}

	return;
}
