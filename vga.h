/*
* vga.h
* VGA Graphics Header
*/

#ifndef VGA_H
#define VGA_H

#include "types.h"

uint16 vga_entry(unsigned char ch, uint8 f_color, uint8 b_color);
void vga_buffer_clear(uint16 **buffer, uint8 f_color, uint8 b_color);
void vga_init(uint8 f_color, uint8 b_color);
void vga_print_newline(uint8 f_color, uint8 b_color);
void vga_print_char(char ch, uint8 f_color, uint8 b_color);
void vga_print_string(char *str, uint8 f_color, uint8 b_color);
void vga_print_int(int num, uint8 f_color, uint8 b_color);

enum vga_color
{
	BLACK,
	BLUE,
	GREEN,
	CYAN,
	RED,
	MAGENTA,
	BROWN,
	GREY,
	DARK_GREY,
	BRIGHT_BLUE,
	BRIGHT_GREEN,
	BRIGHT_CYAN,
	BRIGHT_RED,
	BRIGHT_MAGENTA,
	YELLOW,
	WHITE,
};

#endif
