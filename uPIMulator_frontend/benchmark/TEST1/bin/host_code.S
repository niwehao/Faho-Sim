	.file	"app.c"
	.text
	.p2align 4
	.globl	start
	.type	start, @function
start:
.LFB37:
	.cfi_startproc
	endbr64
	movslq	%esi, %rsi
	testl	%edx, %edx
	jne	.L2
	movq	$0x000000000, 224(%rdi,%rsi,8)
.L2:
	salq	$4, %rsi
	addq	%rsi, %rdi
	xorl	%esi, %esi
	jmp	gettimeofday@PLT
	.cfi_endproc
.LFE37:
	.size	start, .-start
	.p2align 4
	.globl	stop
	.type	stop, @function
stop:
.LFB38:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movslq	%esi, %rbp
	xorl	%esi, %esi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	leaq	7(%rbp), %rdi
	salq	$4, %rdi
	addq	%rbx, %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	gettimeofday@PLT
	leaq	(%rbx,%rbp,8), %rdx
	salq	$4, %rbp
	pxor	%xmm0, %xmm0
	leaq	(%rbx,%rbp), %rdi
	pxor	%xmm1, %xmm1
	movq	112(%rdi), %rax
	subq	(%rdi), %rax
	cvtsi2sdq	%rax, %xmm0
	movq	120(%rdi), %rax
	mulsd	.LC1(%rip), %xmm0
	subq	8(%rdi), %rax
	cvtsi2sdq	%rax, %xmm1
	addsd	%xmm1, %xmm0
	addsd	224(%rdx), %xmm0
	movsd	%xmm0, 224(%rdx)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE38:
	.size	stop, .-stop
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Time (ms): %f\t"
	.text
	.p2align 4
	.globl	print
	.type	print, @function
print:
.LFB39:
	.cfi_startproc
	endbr64
	imull	$1000, %edx, %edx
	pxor	%xmm1, %xmm1
	movslq	%esi, %rsi
	movl	$1, %eax
	movsd	224(%rdi,%rsi,8), %xmm0
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	cvtsi2sdl	%edx, %xmm1
	divsd	%xmm1, %xmm0
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE39:
	.size	print, .-print
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.ascii	"\nUsage:  ./program [options]\n\nGeneral options:\n    -h   "
	.ascii	"     hel"
	.string	"p\n    -w <W>    # of untimed warmup iterations (default=1)\n    -e <E>    # of timed repetition iterations (default=3)\n    -x <X>    Weak (0) or strong (1) scaling (default=0)\n\nBenchmark-specific options:\n    -i <I>    input size (default=3932160 elements)\n"
	.section	.rodata.str1.1
.LC4:
	.string	"\nUnrecognized option!\n"
.LC5:
	.string	"hi:w:e:x:"
	.text
	.p2align 4
	.globl	input_params
	.type	input_params, @function
input_params:
.LFB41:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$1, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	xorl	%r14d, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	$3932160, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	.L12(%rip), %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	$3, 12(%rsp)
.L9:
	leaq	.LC5(%rip), %rdx
	movq	%rbp, %rsi
	movl	%r12d, %edi
	call	getopt@PLT
	testl	%eax, %eax
	js	.L21
	subl	$101, %eax
	cmpl	$19, %eax
	ja	.L10
	movslq	(%rbx,%rax,4), %rax
	addq	%rbx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L12:
	.long	.L16-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L20-.L12
	.long	.L14-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L13-.L12
	.long	.L11-.L12
	.text
.L10:
	movq	stderr(%rip), %rdi
	leaq	.LC4(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
.L20:
	movq	stderr(%rip), %rdi
	leaq	.LC3(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	xorl	%edi, %edi
	call	exit@PLT
.L11:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, %r14d
	jmp	.L9
.L13:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, %r15d
	jmp	.L9
.L14:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, %r13d
	jmp	.L9
.L16:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, 12(%rsp)
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L21:
	movl	12(%rsp), %edx
	salq	$32, %r15
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	movl	%r13d, %eax
	salq	$32, %r14
	popq	%rbx
	.cfi_def_cfa_offset 48
	orq	%r15, %rax
	popq	%rbp
	.cfi_def_cfa_offset 40
	orq	%r14, %rdx
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE41:
	.size	input_params, .-input_params
	.section	.rodata.str1.1
.LC6:
	.string	"host/app.c"
.LC7:
	.string	"%s:%d(%s): DPU Error (%s)\n"
.LC8:
	.string	"./bin/dpu_code"
.LC9:
	.string	"__sys_used_mram_end"
.LC10:
	.string	"a=%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB42:
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
	subq	$184, %rsp
	.cfi_def_cfa_offset 208
	movq	%fs:40, %rax
	movq	%rax, 168(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %rbp
	movl	$7, 12(%rsp)
	movq	%rbp, %rdx
	call	dpu_alloc@PLT
	testl	%eax, %eax
	jne	.L35
	subq	$8, %rsp
	.cfi_def_cfa_offset 216
	xorl	%esi, %esi
	leaq	.LC8(%rip), %rdi
	pushq	40(%rsp)
	.cfi_def_cfa_offset 224
	pushq	40(%rsp)
	.cfi_def_cfa_offset 232
	pushq	40(%rsp)
	.cfi_def_cfa_offset 240
	call	dpu_load@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 208
	testl	%eax, %eax
	jne	.L36
	subq	$8, %rsp
	.cfi_def_cfa_offset 216
	movl	$1, %edi
	pushq	40(%rsp)
	.cfi_def_cfa_offset 224
	pushq	40(%rsp)
	.cfi_def_cfa_offset 232
	pushq	40(%rsp)
	.cfi_def_cfa_offset 240
	call	dpu_launch@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 208
	testl	%eax, %eax
	jne	.L37
	leaq	80(%rsp), %rbx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	dpu_set_dpu_iterator_from@PLT
	movq	160(%rsp), %rax
	movdqa	144(%rsp), %xmm1
	cmpb	$0, 136(%rsp)
	movq	%rax, 64(%rsp)
	movaps	%xmm1, 48(%rsp)
	je	.L26
	leaq	12(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L28:
	subq	$8, %rsp
	.cfi_def_cfa_offset 216
	movq	%rbp, %rdi
	pushq	72(%rsp)
	.cfi_def_cfa_offset 224
	pushq	72(%rsp)
	.cfi_def_cfa_offset 232
	pushq	72(%rsp)
	.cfi_def_cfa_offset 240
	call	dpu_prepare_xfer@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 208
	testl	%eax, %eax
	jne	.L38
	movq	%rbx, %rdi
	call	dpu_set_dpu_iterator_next@PLT
	movq	160(%rsp), %rax
	movdqa	144(%rsp), %xmm0
	cmpb	$0, 136(%rsp)
	movq	%rax, 64(%rsp)
	movaps	%xmm0, 48(%rsp)
	jne	.L28
.L26:
	subq	$8, %rsp
	.cfi_def_cfa_offset 216
	xorl	%r8d, %r8d
	movl	$32, %ecx
	xorl	%edx, %edx
	pushq	40(%rsp)
	.cfi_def_cfa_offset 224
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	pushq	40(%rsp)
	.cfi_def_cfa_offset 232
	pushq	40(%rsp)
	.cfi_def_cfa_offset 240
	call	dpu_push_xfer@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 208
	testl	%eax, %eax
	jne	.L39
	subq	$8, %rsp
	.cfi_def_cfa_offset 216
	pushq	40(%rsp)
	.cfi_def_cfa_offset 224
	pushq	40(%rsp)
	.cfi_def_cfa_offset 232
	pushq	40(%rsp)
	.cfi_def_cfa_offset 240
	call	dpu_free@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 208
	testl	%eax, %eax
	jne	.L40
	movl	12(%rsp), %edx
	xorl	%eax, %eax
	movl	$1, %edi
	leaq	.LC10(%rip), %rsi
	call	__printf_chk@PLT
	movq	168(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L41
	addq	$184, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L38:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.3565(%rip), %r9
	movl	$39, %r8d
	pushq	%rsi
	.cfi_def_cfa_offset 216
	pushq	%rax
	.cfi_def_cfa_offset 224
.L34:
	movq	stderr(%rip), %rdi
	leaq	.LC6(%rip), %rcx
	leaq	.LC7(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L37:
	.cfi_def_cfa_offset 208
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.3565(%rip), %r9
	movl	$37, %r8d
	pushq	%rdi
	.cfi_remember_state
	.cfi_def_cfa_offset 216
	pushq	%rax
	.cfi_def_cfa_offset 224
	jmp	.L34
.L36:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.3565(%rip), %r9
	pushq	%r8
	.cfi_remember_state
	.cfi_def_cfa_offset 216
	movl	$35, %r8d
	pushq	%rax
	.cfi_def_cfa_offset 224
	jmp	.L34
.L35:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	movl	$34, %r8d
	pushq	%r9
	.cfi_remember_state
	.cfi_def_cfa_offset 216
	leaq	__func__.3565(%rip), %r9
	pushq	%rax
	.cfi_def_cfa_offset 224
	jmp	.L34
.L41:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
.L40:
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.3565(%rip), %r9
	movl	$42, %r8d
	pushq	%rdx
	.cfi_remember_state
	.cfi_def_cfa_offset 216
	pushq	%rax
	.cfi_def_cfa_offset 224
	jmp	.L34
.L39:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.3565(%rip), %r9
	movl	$41, %r8d
	pushq	%rcx
	.cfi_def_cfa_offset 216
	pushq	%rax
	.cfi_def_cfa_offset 224
	jmp	.L34
	.cfi_endproc
.LFE42:
	.size	main, .-main
	.section	.rodata
	.type	__func__.3565, @object
	.size	__func__.3565, 5
__func__.3565:
	.string	"main"
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
