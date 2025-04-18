	.file	"app.c"
	.text
	.p2align 4
	.globl	start
	.type	start, @function
start:
.LFB36:
	.cfi_startproc
	endbr64
	movslq	%esi, %rsi
	testl	%edx, %edx
	jne	.L2
	movq	$0x000000000, 128(%rdi,%rsi,8)
.L2:
	salq	$4, %rsi
	addq	%rsi, %rdi
	xorl	%esi, %esi
	jmp	gettimeofday@PLT
	.cfi_endproc
.LFE36:
	.size	start, .-start
	.p2align 4
	.globl	stop
	.type	stop, @function
stop:
.LFB37:
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
	leaq	4(%rbp), %rdi
	salq	$4, %rdi
	addq	%rbx, %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	gettimeofday@PLT
	movq	%rbp, %rax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	salq	$4, %rax
	addq	%rbx, %rax
	movq	64(%rax), %rdx
	subq	(%rax), %rdx
	cvtsi2sdq	%rdx, %xmm0
	movq	72(%rax), %rdx
	mulsd	.LC1(%rip), %xmm0
	subq	8(%rax), %rdx
	cvtsi2sdq	%rdx, %xmm1
	addsd	%xmm1, %xmm0
	addsd	128(%rbx,%rbp,8), %xmm0
	movsd	%xmm0, 128(%rbx,%rbp,8)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE37:
	.size	stop, .-stop
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Time (ms): %f\t"
	.text
	.p2align 4
	.globl	print
	.type	print, @function
print:
.LFB38:
	.cfi_startproc
	endbr64
	imull	$1000, %edx, %edx
	pxor	%xmm1, %xmm1
	movslq	%esi, %rsi
	movl	$1, %eax
	movsd	128(%rdi,%rsi,8), %xmm0
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	cvtsi2sdl	%edx, %xmm1
	divsd	%xmm1, %xmm0
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE38:
	.size	print, .-print
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.ascii	"\nUsage:  ./program [options]\n\nGeneral options:\n    -h   "
	.ascii	"     hel"
	.string	"p\n    -w <W>    # of untimed warmup iterations (default=1)\n    -e <E>    # of timed repetition iterations (default=3)\n    -x <X>    Weak (0) or strong (1) scaling (default=0)\n\nBenchmark-specific options:\n    -i <I>    input size (default=2621440 elements)\n"
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
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$1, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$2621440, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	.LC5(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	.L12(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%edi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	$0, 8(%rsp)
	movl	$3, 4(%rsp)
.L9:
	movq	%r13, %rdx
	movq	%rbx, %rsi
	movl	%ebp, %edi
	call	getopt@PLT
	testl	%eax, %eax
	js	.L21
	subl	$101, %eax
	cmpl	$19, %eax
	ja	.L10
	movslq	(%r12,%rax,4), %rax
	addq	%r12, %rax
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
	.p2align 4,,10
	.p2align 3
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
	.p2align 4,,10
	.p2align 3
.L11:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, 8(%rsp)
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L13:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, %r15d
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L14:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, %r14d
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L16:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, 4(%rsp)
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L21:
	movq	8(%rsp), %rcx
	movl	4(%rsp), %edx
	salq	$32, %r15
	movl	%r14d, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	orq	%r15, %rax
	salq	$32, %rcx
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	orq	%rcx, %rdx
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
.LFE40:
	.size	input_params, .-input_params
	.section	.rodata.str1.1
.LC6:
	.string	"host/app.c"
.LC7:
	.string	"%s:%d(%s): DPU Error (%s)\n"
.LC8:
	.string	"./bin/dpu_code"
.LC9:
	.string	"Allocated %d DPU(s)\n"
.LC10:
	.string	"nr_elements\t%u\t"
.LC11:
	.string	"NR_TASKLETS\t%d\tBL\t%d\n"
.LC12:
	.string	"CPU "
.LC13:
	.string	"CPU-DPU "
.LC14:
	.string	"DPU Kernel "
.LC15:
	.string	"DPU-CPU "
.LC16:
	.string	"Load input data\n"
.LC17:
	.string	"DPU_INPUT_ARGUMENTS"
.LC18:
	.string	"__sys_used_mram_end"
.LC19:
	.string	"Run program on DPU(s) \n"
.LC20:
	.string	"Retrieve results\n"
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"[\033[32mOK\033[0m] Outputs are equal\n"
	.align 8
.LC22:
	.string	"[\033[31mERROR\033[0m] Outputs differ!\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB43:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$472, %rsp
	.cfi_def_cfa_offset 528
	movq	%fs:40, %rax
	movq	%rax, 456(%rsp)
	xorl	%eax, %eax
	call	input_params
	xorl	%esi, %esi
	movl	$1, %edi
	movq	%rax, %rbx
	movl	%eax, 56(%rsp)
	movq	%rax, %rbp
	leaq	112(%rsp), %rax
	sarq	$32, %rbx
	movq	%rdx, 88(%rsp)
	movq	%rax, %rdx
	movl	%ebx, 12(%rsp)
	movq	%rax, 16(%rsp)
	call	dpu_alloc@PLT
	testl	%eax, %eax
	jne	.L132
	subq	$8, %rsp
	.cfi_def_cfa_offset 536
	leaq	.LC8(%rip), %rdi
	xorl	%esi, %esi
	pushq	136(%rsp)
	.cfi_def_cfa_offset 544
	pushq	136(%rsp)
	.cfi_def_cfa_offset 552
	pushq	136(%rsp)
	.cfi_def_cfa_offset 560
	call	dpu_load@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 528
	movl	%eax, %edi
	testl	%eax, %eax
	jne	.L133
	leaq	108(%rsp), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 536
	pushq	136(%rsp)
	.cfi_def_cfa_offset 544
	pushq	136(%rsp)
	.cfi_def_cfa_offset 552
	pushq	136(%rsp)
	.cfi_def_cfa_offset 560
	call	dpu_get_nr_dpus@PLT
	movl	%eax, 32(%rsp)
	addq	$32, %rsp
	.cfi_def_cfa_offset 528
	testl	%eax, %eax
	jne	.L134
	movl	108(%rsp), %edx
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	88(%rsp), %rax
	sarq	$32, %rax
	testl	%eax, %eax
	je	.L135
.L26:
	movl	56(%rsp), %r12d
	movl	108(%rsp), %r15d
	movl	%r12d, %eax
	movq	%rax, 80(%rsp)
	movl	%r12d, %eax
	andl	$-8, %eax
	addl	$8, %eax
	testb	$1, %r12b
	cmove	%r12d, %eax
	xorl	%edx, %edx
	movl	%eax, 24(%rsp)
	leal	-1(%r12), %eax
	movl	%eax, 64(%rsp)
	divl	%r15d
	leal	1(%rax), %ebp
	movl	%ebp, %eax
	andl	$-8, %eax
	addl	$8, %eax
	testb	$1, %bpl
	cmovne	%eax, %ebp
	imull	%ebp, %r15d
	salq	$2, %r15
	movq	%r15, %rdi
	call	malloc@PLT
	movq	%r15, %rdi
	movq	%rax, A(%rip)
	movq	%rax, %r13
	call	malloc@PLT
	movq	%r15, %rdi
	movq	%rax, B(%rip)
	movq	%rax, %r14
	call	malloc@PLT
	movq	%r15, %rdi
	movq	%rax, C(%rip)
	call	malloc@PLT
	xorl	%edi, %edi
	movq	%rax, C2(%rip)
	movq	%rax, %r15
	call	srand@PLT
	movl	%r12d, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC10(%rip), %rsi
	movl	%r12d, 56(%rsp)
	xorl	%r12d, %r12d
	call	__printf_chk@PLT
	movl	56(%rsp), %eax
	testl	%eax, %eax
	je	.L33
	movq	%rbx, 32(%rsp)
	movq	%r12, %rbx
	movq	80(%rsp), %r12
	.p2align 4,,10
	.p2align 3
.L32:
	call	rand@PLT
	movl	%eax, 0(%r13,%rbx,4)
	call	rand@PLT
	movl	%eax, (%r14,%rbx,4)
	addq	$1, %rbx
	cmpq	%r12, %rbx
	jne	.L32
	movq	32(%rsp), %rbx
.L33:
	movl	$10, %ecx
	movl	$16, %edx
	leaq	.LC11(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	88(%rsp), %eax
	addl	%ebx, %eax
	movl	%eax, 60(%rsp)
	testl	%eax, %eax
	jle	.L31
	leal	0(,%rbp,4), %eax
	movl	56(%rsp), %ecx
	movl	24(%rsp), %r12d
	leaq	176(%rsp), %rbx
	movd	%eax, %xmm7
	movd	%eax, %xmm1
	movl	%eax, 32(%rsp)
	movl	%ebp, %eax
	salq	$2, %rax
	pshufd	$0xe0, %xmm7, %xmm7
	sall	$2, %r12d
	movq	%rax, 24(%rsp)
	movl	%ecx, %eax
	andl	$-4, %ecx
	shrl	$2, %eax
	movq	%xmm7, 48(%rsp)
	movd	%r12d, %xmm7
	leaq	272(%rsp), %r12
	subl	$1, %eax
	movl	%ecx, 68(%rsp)
	punpckldq	%xmm1, %xmm7
	addq	$1, %rax
	movq	%xmm7, 40(%rsp)
	salq	$4, %rax
	movq	%rax, 72(%rsp)
	.p2align 4,,10
	.p2align 3
.L79:
	movl	(%rsp), %ecx
	cmpl	%ecx, 12(%rsp)
	jg	.L36
	jne	.L37
	movq	$0x000000000, 416(%rsp)
.L37:
	leaq	288(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
.L36:
	movl	56(%rsp), %eax
	movq	B(%rip), %rdx
	movq	A(%rip), %rsi
	movq	C(%rip), %rcx
	testl	%eax, %eax
	je	.L45
	leaq	4(%rsi), %rdi
	movq	%rcx, %rax
	leaq	4(%rdx), %r8
	subq	%rdi, %rax
	cmpq	$8, %rax
	movq	%rcx, %rax
	seta	%dil
	subq	%r8, %rax
	cmpq	$8, %rax
	seta	%al
	testb	%al, %dil
	je	.L41
	cmpl	$1, 56(%rsp)
	je	.L41
	cmpl	$2, 64(%rsp)
	jbe	.L91
	movq	72(%rsp), %rdi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L43:
	movdqu	(%rsi,%rax), %xmm0
	movdqu	(%rdx,%rax), %xmm6
	paddd	%xmm6, %xmm0
	movups	%xmm0, (%rcx,%rax)
	addq	$16, %rax
	cmpq	%rax, %rdi
	jne	.L43
	movl	68(%rsp), %eax
	movl	56(%rsp), %r8d
	cmpl	%r8d, %eax
	je	.L45
	subl	%eax, %r8d
	cmpl	$1, %r8d
	je	.L47
.L42:
	movl	%eax, %edi
	movq	(%rsi,%rdi,4), %xmm0
	movq	(%rdx,%rdi,4), %xmm1
	paddd	%xmm1, %xmm0
	movq	%xmm0, (%rcx,%rdi,4)
	movl	%r8d, %edi
	andl	$-2, %edi
	addl	%edi, %eax
	cmpl	%edi, %r8d
	je	.L45
.L47:
	movl	(%rdx,%rax,4), %edx
	addl	(%rsi,%rax,4), %edx
	movl	%edx, (%rcx,%rax,4)
.L45:
	movl	(%rsp), %ecx
	cmpl	%ecx, 12(%rsp)
	jle	.L136
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L88:
	movl	108(%rsp), %eax
	subl	$1, %eax
	je	.L52
	movq	48(%rsp), %rcx
	movq	%rcx, 272(%rsp)
.L52:
	movq	40(%rsp), %rcx
	movl	%eax, %eax
	movq	16(%rsp), %rsi
	movq	%rbx, %rdi
	leaq	(%rax,%rax,2), %rax
	movq	%rcx, (%r12,%rax,4)
	movl	$0, 280(%rsp,%rax,4)
	call	dpu_set_dpu_iterator_from@PLT
	movq	256(%rsp), %rdx
	movdqa	240(%rsp), %xmm7
	cmpb	$0, 232(%rsp)
	movl	224(%rsp), %eax
	movq	%rdx, 160(%rsp)
	movaps	%xmm7, 144(%rsp)
	je	.L57
	.p2align 4,,10
	.p2align 3
.L53:
	subq	$8, %rsp
	.cfi_def_cfa_offset 536
	leaq	(%rax,%rax,2), %rax
	pushq	168(%rsp)
	.cfi_def_cfa_offset 544
	leaq	(%r12,%rax,4), %rdi
	pushq	168(%rsp)
	.cfi_def_cfa_offset 552
	pushq	168(%rsp)
	.cfi_def_cfa_offset 560
	call	dpu_prepare_xfer@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 528
	testl	%eax, %eax
	jne	.L137
	movq	%rbx, %rdi
	call	dpu_set_dpu_iterator_next@PLT
	movq	256(%rsp), %rdx
	movdqa	240(%rsp), %xmm2
	cmpb	$0, 232(%rsp)
	movl	224(%rsp), %eax
	movq	%rdx, 160(%rsp)
	movaps	%xmm2, 144(%rsp)
	jne	.L53
.L57:
	subq	$8, %rsp
	.cfi_def_cfa_offset 536
	xorl	%r8d, %r8d
	movl	$12, %ecx
	xorl	%edx, %edx
	pushq	136(%rsp)
	.cfi_def_cfa_offset 544
	leaq	.LC17(%rip), %rsi
	xorl	%edi, %edi
	pushq	136(%rsp)
	.cfi_def_cfa_offset 552
	pushq	136(%rsp)
	.cfi_def_cfa_offset 560
	call	dpu_push_xfer@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 528
	testl	%eax, %eax
	jne	.L138
	movq	16(%rsp), %rsi
	movq	%rbx, %rdi
	call	dpu_set_dpu_iterator_from@PLT
	movq	256(%rsp), %rdx
	movdqa	240(%rsp), %xmm7
	cmpb	$0, 232(%rsp)
	movl	224(%rsp), %eax
	movq	%rdx, 160(%rsp)
	movaps	%xmm7, 144(%rsp)
	je	.L62
	.p2align 4,,10
	.p2align 3
.L58:
	subq	$8, %rsp
	.cfi_def_cfa_offset 536
	imull	%ebp, %eax
	pushq	168(%rsp)
	.cfi_def_cfa_offset 544
	pushq	168(%rsp)
	.cfi_def_cfa_offset 552
	pushq	168(%rsp)
	.cfi_def_cfa_offset 560
	leaq	0(%r13,%rax,4), %rdi
	call	dpu_prepare_xfer@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 528
	testl	%eax, %eax
	jne	.L139
	movq	%rbx, %rdi
	call	dpu_set_dpu_iterator_next@PLT
	movq	256(%rsp), %rdx
	movdqa	240(%rsp), %xmm3
	cmpb	$0, 232(%rsp)
	movl	224(%rsp), %eax
	movq	%rdx, 160(%rsp)
	movaps	%xmm3, 144(%rsp)
	jne	.L58
.L62:
	subq	$8, %rsp
	.cfi_def_cfa_offset 536
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	xorl	%edi, %edi
	pushq	136(%rsp)
	.cfi_def_cfa_offset 544
	leaq	.LC18(%rip), %rsi
	pushq	136(%rsp)
	.cfi_def_cfa_offset 552
	pushq	136(%rsp)
	.cfi_def_cfa_offset 560
	movq	56(%rsp), %rcx
	call	dpu_push_xfer@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 528
	testl	%eax, %eax
	jne	.L140
	movq	16(%rsp), %rsi
	movq	%rbx, %rdi
	call	dpu_set_dpu_iterator_from@PLT
	movq	256(%rsp), %rdx
	movdqa	240(%rsp), %xmm7
	cmpb	$0, 232(%rsp)
	movl	224(%rsp), %eax
	movq	%rdx, 160(%rsp)
	movaps	%xmm7, 144(%rsp)
	je	.L67
	.p2align 4,,10
	.p2align 3
.L63:
	subq	$8, %rsp
	.cfi_def_cfa_offset 536
	imull	%ebp, %eax
	pushq	168(%rsp)
	.cfi_def_cfa_offset 544
	pushq	168(%rsp)
	.cfi_def_cfa_offset 552
	pushq	168(%rsp)
	.cfi_def_cfa_offset 560
	leaq	(%r14,%rax,4), %rdi
	call	dpu_prepare_xfer@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 528
	testl	%eax, %eax
	jne	.L141
	movq	%rbx, %rdi
	call	dpu_set_dpu_iterator_next@PLT
	movq	256(%rsp), %rdx
	movdqa	240(%rsp), %xmm4
	cmpb	$0, 232(%rsp)
	movl	224(%rsp), %eax
	movq	%rdx, 160(%rsp)
	movaps	%xmm4, 144(%rsp)
	jne	.L63
.L67:
	subq	$8, %rsp
	.cfi_def_cfa_offset 536
	xorl	%r8d, %r8d
	leaq	.LC18(%rip), %rsi
	xorl	%edi, %edi
	pushq	136(%rsp)
	.cfi_def_cfa_offset 544
	pushq	136(%rsp)
	.cfi_def_cfa_offset 552
	pushq	136(%rsp)
	.cfi_def_cfa_offset 560
	movq	56(%rsp), %rcx
	movl	64(%rsp), %edx
	call	dpu_push_xfer@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 528
	testl	%eax, %eax
	jne	.L142
	movl	(%rsp), %ecx
	cmpl	%ecx, 12(%rsp)
	jle	.L143
	leaq	.LC19(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	subq	$8, %rsp
	.cfi_def_cfa_offset 536
	movl	$1, %edi
	pushq	136(%rsp)
	.cfi_def_cfa_offset 544
	pushq	136(%rsp)
	.cfi_def_cfa_offset 552
	pushq	136(%rsp)
	.cfi_def_cfa_offset 560
	call	dpu_launch@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 528
	testl	%eax, %eax
	jne	.L86
	leaq	.LC20(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L85:
	movq	16(%rsp), %rsi
	movq	%rbx, %rdi
	call	dpu_set_dpu_iterator_from@PLT
	movq	256(%rsp), %rdx
	movdqa	240(%rsp), %xmm1
	cmpb	$0, 232(%rsp)
	movl	224(%rsp), %eax
	movq	%rdx, 160(%rsp)
	movaps	%xmm1, 144(%rsp)
	je	.L76
	.p2align 4,,10
	.p2align 3
.L72:
	subq	$8, %rsp
	.cfi_def_cfa_offset 536
	imull	%ebp, %eax
	pushq	168(%rsp)
	.cfi_def_cfa_offset 544
	pushq	168(%rsp)
	.cfi_def_cfa_offset 552
	pushq	168(%rsp)
	.cfi_def_cfa_offset 560
	leaq	(%r15,%rax,4), %rdi
	call	dpu_prepare_xfer@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 528
	testl	%eax, %eax
	jne	.L144
	movq	%rbx, %rdi
	call	dpu_set_dpu_iterator_next@PLT
	movq	256(%rsp), %rdx
	movdqa	240(%rsp), %xmm5
	cmpb	$0, 232(%rsp)
	movl	224(%rsp), %eax
	movq	%rdx, 160(%rsp)
	movaps	%xmm5, 144(%rsp)
	jne	.L72
.L76:
	subq	$8, %rsp
	.cfi_def_cfa_offset 536
	xorl	%r8d, %r8d
	movl	$1, %edi
	pushq	136(%rsp)
	.cfi_def_cfa_offset 544
	leaq	.LC18(%rip), %rsi
	pushq	136(%rsp)
	.cfi_def_cfa_offset 552
	pushq	136(%rsp)
	.cfi_def_cfa_offset 560
	movq	56(%rsp), %rcx
	movl	64(%rsp), %edx
	call	dpu_push_xfer@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 528
	testl	%eax, %eax
	jne	.L145
	movl	(%rsp), %ecx
	cmpl	%ecx, 12(%rsp)
	jle	.L146
	addl	$1, (%rsp)
	movl	(%rsp), %eax
	cmpl	60(%rsp), %eax
	jne	.L79
.L31:
	leaq	.LC12(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	pxor	%xmm7, %xmm7
	movl	$1, %edi
	movsd	416(%rsp), %xmm0
	imull	$1000, 88(%rsp), %eax
	leaq	.LC2(%rip), %rbp
	movq	%rbp, %rsi
	cvtsi2sdl	%eax, %xmm7
	movl	$1, %eax
	divsd	%xmm7, %xmm0
	movsd	%xmm7, (%rsp)
	call	__printf_chk@PLT
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%rbp, %rsi
	movl	$1, %edi
	movl	$1, %eax
	movsd	424(%rsp), %xmm0
	divsd	(%rsp), %xmm0
	call	__printf_chk@PLT
	leaq	.LC14(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%rbp, %rsi
	movl	$1, %edi
	movl	$1, %eax
	movsd	432(%rsp), %xmm0
	divsd	(%rsp), %xmm0
	call	__printf_chk@PLT
	leaq	.LC15(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%rbp, %rsi
	movl	$1, %edi
	movl	$1, %eax
	movsd	440(%rsp), %xmm0
	divsd	(%rsp), %xmm0
	call	__printf_chk@PLT
	cmpl	$0, 56(%rsp)
	je	.L35
	movq	C(%rip), %rsi
	movq	80(%rsp), %rdi
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movl	$1, %edx
.L81:
	movl	(%rsi,%rax,4), %ebx
	cmpl	%ebx, (%r15,%rax,4)
	cmovne	%ecx, %edx
	addq	$1, %rax
	cmpq	%rdi, %rax
	jne	.L81
	testb	%dl, %dl
	jne	.L35
	leaq	.LC22(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	A(%rip), %rdi
	call	free@PLT
	movq	B(%rip), %rdi
	call	free@PLT
	movq	C(%rip), %rdi
	call	free@PLT
	movq	C2(%rip), %rdi
	call	free@PLT
	pushq	%rdx
	.cfi_def_cfa_offset 536
	pushq	136(%rsp)
	.cfi_def_cfa_offset 544
	pushq	136(%rsp)
	.cfi_def_cfa_offset 552
	pushq	136(%rsp)
	.cfi_def_cfa_offset 560
	call	dpu_free@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 528
	testl	%eax, %eax
	je	.L93
.L83:
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.0(%rip), %r9
	movl	$219, %r8d
	movq	%rax, %rbp
	pushq	%rax
	.cfi_remember_state
	.cfi_def_cfa_offset 536
	pushq	%rbp
	.cfi_def_cfa_offset 544
	jmp	.L131
	.p2align 4,,10
	.p2align 3
.L136:
	.cfi_restore_state
	leaq	352(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movq	352(%rsp), %rax
	subq	288(%rsp), %rax
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	360(%rsp), %rax
	mulsd	.LC1(%rip), %xmm0
	subq	296(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	xorl	%eax, %eax
	addsd	%xmm1, %xmm0
	addsd	416(%rsp), %xmm0
	movsd	%xmm0, 416(%rsp)
	call	__printf_chk@PLT
	movl	(%rsp), %ecx
	cmpl	%ecx, 12(%rsp)
	jne	.L51
	movq	$0x000000000, 424(%rsp)
.L51:
	leaq	304(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	jmp	.L88
	.p2align 4,,10
	.p2align 3
.L143:
	leaq	368(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movq	368(%rsp), %rax
	subq	304(%rsp), %rax
	leaq	.LC19(%rip), %rsi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	376(%rsp), %rax
	mulsd	.LC1(%rip), %xmm0
	subq	312(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	xorl	%eax, %eax
	addsd	%xmm1, %xmm0
	addsd	424(%rsp), %xmm0
	movsd	%xmm0, 424(%rsp)
	call	__printf_chk@PLT
	movl	(%rsp), %ecx
	cmpl	%ecx, 12(%rsp)
	jne	.L69
	movq	$0x000000000, 432(%rsp)
.L69:
	leaq	320(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	subq	$8, %rsp
	.cfi_def_cfa_offset 536
	movl	$1, %edi
	pushq	136(%rsp)
	.cfi_def_cfa_offset 544
	pushq	136(%rsp)
	.cfi_def_cfa_offset 552
	pushq	136(%rsp)
	.cfi_def_cfa_offset 560
	call	dpu_launch@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 528
	testl	%eax, %eax
	jne	.L86
	leaq	384(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movq	384(%rsp), %rax
	subq	320(%rsp), %rax
	leaq	.LC20(%rip), %rsi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	392(%rsp), %rax
	mulsd	.LC1(%rip), %xmm0
	subq	328(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	xorl	%eax, %eax
	addsd	%xmm1, %xmm0
	addsd	432(%rsp), %xmm0
	movsd	%xmm0, 432(%rsp)
	call	__printf_chk@PLT
	movl	(%rsp), %esi
	cmpl	%esi, 12(%rsp)
	jne	.L71
	movq	$0x000000000, 440(%rsp)
.L71:
	leaq	336(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L146:
	leaq	400(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movq	400(%rsp), %rax
	subq	336(%rsp), %rax
	addl	$1, (%rsp)
	cvtsi2sdq	%rax, %xmm0
	movq	408(%rsp), %rax
	mulsd	.LC1(%rip), %xmm0
	subq	344(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	(%rsp), %eax
	addsd	%xmm1, %xmm0
	addsd	440(%rsp), %xmm0
	movsd	%xmm0, 440(%rsp)
	cmpl	%eax, 60(%rsp)
	jne	.L79
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L41:
	movq	80(%rsp), %r8
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L49:
	movl	(%rsi,%rax,4), %edi
	addl	(%rdx,%rax,4), %edi
	movl	%edi, (%rcx,%rax,4)
	addq	$1, %rax
	cmpq	%r8, %rax
	jne	.L49
	jmp	.L45
.L91:
	movl	56(%rsp), %r8d
	xorl	%eax, %eax
	jmp	.L42
.L135:
	movl	108(%rsp), %eax
	imull	%ebp, %eax
	movl	%eax, 56(%rsp)
	jmp	.L26
.L35:
	leaq	.LC21(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	A(%rip), %rdi
	call	free@PLT
	movq	B(%rip), %rdi
	call	free@PLT
	movq	C(%rip), %rdi
	call	free@PLT
	movq	C2(%rip), %rdi
	call	free@PLT
	pushq	%rcx
	.cfi_def_cfa_offset 536
	pushq	136(%rsp)
	.cfi_def_cfa_offset 544
	pushq	136(%rsp)
	.cfi_def_cfa_offset 552
	pushq	136(%rsp)
	.cfi_def_cfa_offset 560
	call	dpu_free@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 528
	testl	%eax, %eax
	jne	.L83
.L84:
	movq	456(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L147
	addq	$472, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L141:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.0(%rip), %r9
	movl	$134, %r8d
	pushq	%r10
	.cfi_def_cfa_offset 536
	movq	%rax, %rbp
	pushq	%rax
	.cfi_def_cfa_offset 544
.L131:
	movq	stderr(%rip), %rdi
	leaq	.LC6(%rip), %rcx
	leaq	.LC7(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movl	$1, %edi
	call	exit@PLT
.L139:
	.cfi_def_cfa_offset 528
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.0(%rip), %r9
	pushq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 536
	movl	$129, %r8d
	pushq	%rax
	.cfi_def_cfa_offset 544
	movq	%rax, %rbp
	jmp	.L131
.L137:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.0(%rip), %r9
	pushq	%r13
	.cfi_remember_state
	.cfi_def_cfa_offset 536
	movl	$124, %r8d
	pushq	%rax
	.cfi_def_cfa_offset 544
	movq	%rax, %rbp
	jmp	.L131
.L144:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.0(%rip), %r9
	movl	$174, %r8d
	pushq	%rdi
	.cfi_remember_state
	.cfi_def_cfa_offset 536
	movq	%rax, %rbp
	pushq	%rax
	.cfi_def_cfa_offset 544
	jmp	.L131
.L138:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.0(%rip), %r9
	pushq	%r12
	.cfi_remember_state
	.cfi_def_cfa_offset 536
	movl	$126, %r8d
	pushq	%rax
	.cfi_def_cfa_offset 544
	movq	%rax, %rbp
	jmp	.L131
.L140:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.0(%rip), %r9
	movl	$131, %r8d
	pushq	%r11
	.cfi_remember_state
	.cfi_def_cfa_offset 536
	movq	%rax, %rbp
	pushq	%rax
	.cfi_def_cfa_offset 544
	jmp	.L131
.L145:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.0(%rip), %r9
	movl	$176, %r8d
	pushq	%rsi
	.cfi_remember_state
	.cfi_def_cfa_offset 536
	movq	%rax, %rbp
	pushq	%rax
	.cfi_def_cfa_offset 544
	jmp	.L131
.L134:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.0(%rip), %r9
	movl	$68, %r8d
	movq	%rax, %rbp
	pushq	%rax
	.cfi_remember_state
	.cfi_def_cfa_offset 536
	pushq	%rbp
	.cfi_def_cfa_offset 544
	jmp	.L131
.L86:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.0(%rip), %r9
	pushq	%r8
	.cfi_remember_state
	.cfi_def_cfa_offset 536
	movq	%rax, %rbp
	movl	$148, %r8d
	pushq	%rax
	.cfi_def_cfa_offset 544
	jmp	.L131
.L142:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	movl	$136, %r8d
	pushq	%r9
	.cfi_remember_state
	.cfi_def_cfa_offset 536
	movq	%rax, %rbp
	leaq	__func__.0(%rip), %r9
	pushq	%rax
	.cfi_def_cfa_offset 544
	jmp	.L131
.L133:
	.cfi_restore_state
	call	dpu_error_to_string@PLT
	leaq	__func__.0(%rip), %r9
	movl	$67, %r8d
	movq	%rax, %rbp
	pushq	%rax
	.cfi_remember_state
	.cfi_def_cfa_offset 536
	pushq	%rbp
	.cfi_def_cfa_offset 544
	jmp	.L131
.L132:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.0(%rip), %r9
	movl	$66, %r8d
	movq	%rax, %rbp
	pushq	%rax
	.cfi_remember_state
	.cfi_def_cfa_offset 536
	pushq	%rbp
	.cfi_def_cfa_offset 544
	jmp	.L131
.L93:
	.cfi_restore_state
	orl	$-1, %eax
	jmp	.L84
.L147:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE43:
	.size	main, .-main
	.section	.rodata
	.type	__func__.0, @object
	.size	__func__.0, 5
__func__.0:
	.string	"main"
	.local	C2
	.comm	C2,8,8
	.local	C
	.comm	C,8,8
	.local	B
	.comm	B,8,8
	.local	A
	.comm	A,8,8
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1093567616
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
