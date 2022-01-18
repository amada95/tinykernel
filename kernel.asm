;;kernel.asm
;;Kernel core loader

bits 32			;nasm directive - 32 bit mode
section .text		;text section - for program code

	;multiboot spec
	align 4				;set alignment to 4 bytes (double word)
	dd 0x1BADB002			;double word - magic header ID number
	dd 0x00				;double word - flags (set to zero here)
	dd - (0x1BADB002 + 0x00)	;double word - checksum. magic + flags + checksum should be equal to zero


global start		;designate entry point for this file
extern kmain		;kmain is the entry point defined in kernel.c

start:			;kernel.asm entry point
  cli				;block interrupts
  mov esp, stack_space		;set stack pointer to our stack
  call kmain			;call C entry point
  hlt				;halt CPU

section .bss		;bss section - for variables declared but not assigned a value
resb 8192			;reserve 8KB for stack
stack_space:
