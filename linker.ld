/*
* linker.ld
* Kernel linker script
*/

/* kernel entry point */
ENTRY(_start)

SECTIONS
{
	/* allocate 1M of space */
	. = 1M;

	/* text section (+multiboot) */
	.text BLOCK(4K) : ALIGN(4K)
	{
		*(.multiboot)
		*(.text)
	}

	/* read only data section */
	.rodata BLOCK(4K) : ALIGN(4K)
	{
		*(.rodata)
	}

	/* data section */
	.data BLOCK (4K) : ALIGN(4K)
	{
		*(.data)
	}

	/* bss section */
	.bss BLOCK(4K) : ALIGN(4K)
	{
		*(COMMON)
		*(.bss)
	}
}
