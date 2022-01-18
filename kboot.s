				# multiboot header
.set MAGIC,	0x1BADB002
.set FLAGS,	0
.set CHECKSUM,	-(MAGIC + FLAGS)

.section .multiboot

.long MAGIC
.long FLAGS
.long CHECKSUM


				# system stack
stackBottom:
.skip 1024			# maximum stack size of 512 bytes
stackTop:

.section .text
.global _start			# define _start asm entry point function
.type _start,	@function


_start:
	mov $stackTop, %esp	# move stack pointer to the top of the stack
	call kernel_entry	# call kernel entry point defined in kernel.c
	cli			# disable interrupts


hltLoop:			# put system in infinite loop
	hlt
	jmp hltLoop


.size _start,	. - _start	# run _start asm entry point
