	.file	"kernel.c"
	.text
	.globl	vga_buffer
	.bss
	.align 8
	.type	vga_buffer, @object
	.size	vga_buffer, 8
vga_buffer:
	.zero	8
	.section	.rodata
.LC0:
	.string	"hello, world"
	.text
	.globl	kmain
	.type	kmain, @function
kmain:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	.LC0(%rip), %rax
	movq	%rax, -8(%rbp)
	movl	$3, %esi
	movl	$15, %edi
	call	vga_init@PLT
	movq	-8(%rbp), %rax
	movl	$3, %edx
	movl	$15, %esi
	movq	%rax, %rdi
	call	vga_print_string@PLT
	movl	$15, %esi
	movl	$0, %edi
	call	vga_print_newline@PLT
	movl	$15, %edx
	movl	$0, %esi
	movl	$97, %edi
	call	vga_print_char@PLT
	movl	$4, %edx
	movl	$10, %esi
	movl	$40967, %edi
	call	vga_print_int@PLT
	movl	$0, %esi
	movl	$15, %edi
	call	vga_print_newline@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	kmain, .-kmain
	.ident	"GCC: (GNU) 11.1.0"
	.section	.note.GNU-stack,"",@progbits
