	.file	"app.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"host/app.c"
.LC1:
	.string	"%s:%d(%s): DPU Error (%s)\n"
.LC2:
	.string	"./bin/ldmai"
.LC3:
	.string	"./bin/__new_ldmai"
.LC4:
	.string	".text"
.LC5:
	.string	"ELF IRAM size : %i\n"
.LC6:
	.string	"%i %i\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB31:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%esi, %esi
	movl	$1, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$168, %rsp
	.cfi_def_cfa_offset 192
	movq	%fs:40, %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	leaq	32(%rsp), %rbp
	movq	%rbp, %rdx
	call	dpu_alloc@PLT
	testl	%eax, %eax
	jne	.L20
	subq	$8, %rsp
	.cfi_def_cfa_offset 200
	xorl	%esi, %esi
	leaq	.LC2(%rip), %rdi
	pushq	56(%rsp)
	.cfi_def_cfa_offset 208
	pushq	56(%rsp)
	.cfi_def_cfa_offset 216
	pushq	56(%rsp)
	.cfi_def_cfa_offset 224
	call	dpu_load@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 192
	testl	%eax, %eax
	jne	.L21
	leaq	16(%rsp), %rsi
	leaq	.LC3(%rip), %rdi
	call	dpu_elf_open@PLT
	testl	%eax, %eax
	jne	.L22
	movq	16(%rsp), %rdi
	leaq	24(%rsp), %rcx
	leaq	12(%rsp), %rdx
	leaq	.LC4(%rip), %rsi
	call	dpu_elf_load_section@PLT
	testl	%eax, %eax
	jne	.L23
	movl	12(%rsp), %edx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	64(%rsp), %rbx
	leaq	.LC5(%rip), %rsi
	call	__printf_chk@PLT
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	dpu_set_dpu_iterator_from@PLT
	cmpb	$0, 120(%rsp)
	movq	136(%rsp), %rdi
	je	.L6
	.p2align 4,,10
	.p2align 3
.L8:
	movl	12(%rsp), %ecx
	movq	24(%rsp), %rdx
	xorl	%esi, %esi
	call	dpu_copy_to_mram@PLT
	testl	%eax, %eax
	jne	.L24
	movq	%rbx, %rdi
	call	dpu_set_dpu_iterator_next@PLT
	cmpb	$0, 120(%rsp)
	movq	136(%rsp), %rdi
	jne	.L8
.L6:
	subq	$8, %rsp
	.cfi_def_cfa_offset 200
	movl	$1, %edi
	pushq	56(%rsp)
	.cfi_def_cfa_offset 208
	pushq	56(%rsp)
	.cfi_def_cfa_offset 216
	pushq	56(%rsp)
	.cfi_def_cfa_offset 224
	call	dpu_launch@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 192
	testl	%eax, %eax
	jne	.L25
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	dpu_set_dpu_iterator_from@PLT
	cmpb	$0, 120(%rsp)
	movq	136(%rsp), %rdi
	je	.L10
	.p2align 4,,10
	.p2align 3
.L12:
	movq	24(%rsp), %rsi
	movl	$8, %ecx
	movl	$65536, %edx
	call	dpu_copy_from_mram@PLT
	testl	%eax, %eax
	jne	.L26
	movq	%rbx, %rdi
	call	dpu_set_dpu_iterator_next@PLT
	cmpb	$0, 120(%rsp)
	movq	136(%rsp), %rdi
	jne	.L12
.L10:
	movq	24(%rsp), %rax
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	movl	4(%rax), %ecx
	movl	(%rax), %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	subq	$8, %rsp
	.cfi_def_cfa_offset 200
	pushq	56(%rsp)
	.cfi_def_cfa_offset 208
	pushq	56(%rsp)
	.cfi_def_cfa_offset 216
	pushq	56(%rsp)
	.cfi_def_cfa_offset 224
	call	dpu_free@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 192
	testl	%eax, %eax
	jne	.L27
	movq	152(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L28
	addq	$168, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L24:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.0(%rip), %r9
	movl	$29, %r8d
	pushq	%rsi
	.cfi_def_cfa_offset 200
	movq	%rax, %rbp
	pushq	%rax
	.cfi_def_cfa_offset 208
.L18:
	movq	stderr(%rip), %rdi
	leaq	.LC0(%rip), %rcx
	leaq	.LC1(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movl	$1, %edi
	call	exit@PLT
.L26:
	.cfi_def_cfa_offset 192
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.0(%rip), %r9
	movl	$34, %r8d
	pushq	%rdx
	.cfi_remember_state
	.cfi_def_cfa_offset 200
	movq	%rax, %rbp
	pushq	%rax
	.cfi_def_cfa_offset 208
	jmp	.L18
.L25:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.0(%rip), %r9
	movl	$32, %r8d
	pushq	%rcx
	.cfi_remember_state
	.cfi_def_cfa_offset 200
	movq	%rax, %rbp
	pushq	%rax
	.cfi_def_cfa_offset 208
	jmp	.L18
.L28:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
.L27:
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.0(%rip), %r9
	movl	$39, %r8d
	movq	%rax, %rbp
	pushq	%rax
	.cfi_remember_state
	.cfi_def_cfa_offset 200
	pushq	%rbp
	.cfi_def_cfa_offset 208
	jmp	.L18
.L23:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.0(%rip), %r9
	movl	$23, %r8d
	pushq	%rdi
	.cfi_remember_state
	.cfi_def_cfa_offset 200
	movq	%rax, %rbp
	pushq	%rax
	.cfi_def_cfa_offset 208
	jmp	.L18
.L22:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.0(%rip), %r9
	pushq	%r8
	.cfi_remember_state
	.cfi_def_cfa_offset 200
	movq	%rax, %rbp
	movl	$22, %r8d
	pushq	%rax
	.cfi_def_cfa_offset 208
	jmp	.L18
.L21:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	movl	$15, %r8d
	pushq	%r9
	.cfi_remember_state
	.cfi_def_cfa_offset 200
	movq	%rax, %rbp
	leaq	__func__.0(%rip), %r9
	pushq	%rax
	.cfi_def_cfa_offset 208
	jmp	.L18
.L20:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.0(%rip), %r9
	movl	$14, %r8d
	pushq	%r10
	.cfi_def_cfa_offset 200
	movq	%rax, %rbp
	pushq	%rax
	.cfi_def_cfa_offset 208
	jmp	.L18
	.cfi_endproc
.LFE31:
	.size	main, .-main
	.section	.rodata
	.type	__func__.0, @object
	.size	__func__.0, 5
__func__.0:
	.string	"main"
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
