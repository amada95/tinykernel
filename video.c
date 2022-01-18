/*
* video.c
* Video/display core
*
* NOTE: all functions assume video memory pointer starts at protected mode baseline as shown in kernel.c
*/

void buffer_clear(char* vmem);
void buffer_put(char* vmem, char* str, unsigned int slen);

// clear video memory buffer (unsafe)
void buffer_clear(char* vmem)
{
	unsigned int i = 0;

	while(i < 4000)		// 25 lines * 80 columns * 2 bytes
	{
		vmem[i] = ' ';	 	// blank character
		vmem[i+1] = 0x07; 	// attribute byte for light grey on black screen (TODO: Macro/enumify)
		i = i + 2;
	}
	
	return;
}

// write an ascii string of length slen to video memory (unsafe)
void buffer_puts(char* vmem, char* str)
{
	unsigned int i = 0;
	unsigned int j = 0;

	while(str[j] != '\0')	// loop through str until null terminator
	{
		vmem[i] = str[j];	// set current vmem char to current str char
		vmem[i+1] = 0x07;	// attribute byte for light grey on black screen (TODO: Macro/enumify)
		i = i + 2;
		++j;
	}

	return;
}
