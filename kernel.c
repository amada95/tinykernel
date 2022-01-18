/*
* kernel.c
* Kernel core
*/

#include "vga.h"

void kernel_entry(void)
{
	char *str = "hello, world!";			// str for testing (hardcoded)

	vga_init(WHITE, CYAN);				// clear video memory

	vga_print_string(str, WHITE, CYAN);		// print tests to screen
	vga_print_newline(BLACK, WHITE);
	vga_print_char('a', BLACK, WHITE);
	vga_print_int(40967, BRIGHT_GREEN, RED);
	vga_print_newline(BLACK, WHITE);
	vga_print_newline(BLACK, WHITE);
	vga_print_string(":D", WHITE, BLUE);

	return;
}
