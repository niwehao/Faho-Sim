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
	movq	$0x000000000, 128(%rdi,%rsi,8)
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
	leaq	4(%rbp), %rdi
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
	movq	64(%rdi), %rax
	subq	(%rdi), %rax
	cvtsi2sdq	%rax, %xmm0
	movq	72(%rdi), %rax
	mulsd	.LC1(%rip), %xmm0
	subq	8(%rdi), %rax
	cvtsi2sdq	%rax, %xmm1
	addsd	%xmm1, %xmm0
	addsd	128(%rdx), %xmm0
	movsd	%xmm0, 128(%rdx)
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
	movsd	128(%rdi,%rsi,8), %xmm0
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
	movl	$2621440, %r13d
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
.LFB44:
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
	subq	$488, %rsp
	.cfi_def_cfa_offset 544
	movq	%fs:40, %rax
	movq	%rax, 472(%rsp)
	xorl	%eax, %eax
	call	input_params
	xorl	%esi, %esi
	movl	$1, %edi
	movl	%eax, 36(%rsp)
	movq	%rax, %rbx
	sarq	$32, %rax
	movq	%rax, 16(%rsp)
	movl	%eax, 32(%rsp)
	leaq	128(%rsp), %rax
	movq	%rdx, 104(%rsp)
	movq	%rax, %rdx
	movq	%rax, 8(%rsp)
	call	dpu_alloc@PLT
	testl	%eax, %eax
	jne	.L128
	subq	$8, %rsp
	.cfi_def_cfa_offset 552
	leaq	.LC8(%rip), %rdi
	xorl	%esi, %esi
	pushq	152(%rsp)
	.cfi_def_cfa_offset 560
	pushq	152(%rsp)
	.cfi_def_cfa_offset 568
	pushq	152(%rsp)
	.cfi_def_cfa_offset 576
	call	dpu_load@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 544
	movl	%eax, %edi
	testl	%eax, %eax
	jne	.L129
	leaq	124(%rsp), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 552
	pushq	152(%rsp)
	.cfi_def_cfa_offset 560
	pushq	152(%rsp)
	.cfi_def_cfa_offset 568
	pushq	152(%rsp)
	.cfi_def_cfa_offset 576
	call	dpu_get_nr_dpus@PLT
	movl	%eax, 32(%rsp)
	addq	$32, %rsp
	.cfi_def_cfa_offset 544
	testl	%eax, %eax
	jne	.L130
	movl	124(%rsp), %edx
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	104(%rsp), %rax
	sarq	$32, %rax
	testl	%eax, %eax
	je	.L131
.L26:
	movl	36(%rsp), %r15d
	movl	124(%rsp), %r13d
	movl	%r15d, %eax
	andl	$-8, %eax
	addl	$8, %eax
	testb	$1, %r15b
	cmove	%r15d, %eax
	xorl	%edx, %edx
	movl	%eax, 24(%rsp)
	leal	-1(%r15), %eax
	movl	%eax, %r14d
	divl	%r13d
	movl	%r14d, 44(%rsp)
	leal	1(%rax), %ebx
	movl	%ebx, %esi
	andl	$-8, %esi
	movl	%esi, %eax
	addl	$8, %eax
	testb	$1, %bl
	cmovne	%eax, %ebx
	imull	%ebx, %r13d
	salq	$2, %r13
	movq	%r13, %rdi
	call	malloc@PLT
	movq	%r13, %rdi
	movq	%rax, A(%rip)
	movq	%rax, %rbp
	call	malloc@PLT
	movq	%r13, %rdi
	movq	%rax, B(%rip)
	movq	%rax, %r12
	call	malloc@PLT
	movq	%r13, %rdi
	movq	%rax, C(%rip)
	call	malloc@PLT
	xorl	%edi, %edi
	movq	%rax, C2(%rip)
	movq	%rax, %r13
	call	srand@PLT
	movl	%r15d, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC10(%rip), %rsi
	movl	%r15d, 36(%rsp)
	xorl	%r15d, %r15d
	call	__printf_chk@PLT
	movl	36(%rsp), %eax
	testl	%eax, %eax
	je	.L33
	.p2align 4,,10
	.p2align 3
.L32:
	call	rand@PLT
	movl	%eax, 0(%rbp,%r15,4)
	call	rand@PLT
	movl	%eax, (%r12,%r15,4)
	movq	%r15, %rax
	addq	$1, %r15
	cmpq	%r14, %rax
	jne	.L32
.L33:
	movl	$10, %ecx
	movl	$16, %edx
	leaq	.LC11(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	16(%rsp), %eax
	addl	104(%rsp), %eax
	movl	%eax, 48(%rsp)
	testl	%eax, %eax
	jle	.L31
	leal	0(,%rbx,4), %eax
	movl	36(%rsp), %ecx
	leaq	192(%rsp), %r14
	movl	%eax, 16(%rsp)
	movl	24(%rsp), %eax
	sall	$2, %eax
	movl	%eax, 40(%rsp)
	movl	%ebx, %eax
	salq	$2, %rax
	movq	%rax, 24(%rsp)
	movl	%ecx, %eax
	andl	$-4, %ecx
	shrl	$2, %eax
	movl	%ecx, 52(%rsp)
	salq	$4, %rax
	movq	%rax, 56(%rsp)
	movl	%ecx, %eax
	salq	$2, %rax
	movq	%rax, 64(%rsp)
	leal	1(%rcx), %eax
	movl	%eax, 80(%rsp)
	salq	$2, %rax
	movq	%rax, 88(%rsp)
	leal	2(%rcx), %eax
	movl	%eax, 84(%rsp)
	salq	$2, %rax
	movq	%rax, 96(%rsp)
	leaq	304(%rsp), %rax
	movq	%rax, 72(%rsp)
	.p2align 4,,10
	.p2align 3
.L76:
	movl	(%rsp), %ecx
	cmpl	%ecx, 32(%rsp)
	jg	.L36
	jne	.L37
	movq	$0x000000000, 432(%rsp)
.L37:
	movq	72(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
.L36:
	movl	36(%rsp), %r15d
	movq	B(%rip), %rcx
	movq	A(%rip), %rsi
	movq	C(%rip), %rdx
	testl	%r15d, %r15d
	je	.L44
	leaq	15(%rsi), %rax
	subq	%rdx, %rax
	cmpq	$30, %rax
	leaq	15(%rcx), %rax
	seta	%dil
	subq	%rdx, %rax
	cmpq	$30, %rax
	seta	%al
	testb	%al, %dil
	je	.L41
	cmpl	$2, 44(%rsp)
	jbe	.L41
	movq	56(%rsp), %rdi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L42:
	movdqu	(%rsi,%rax), %xmm0
	movdqu	(%rcx,%rax), %xmm6
	paddd	%xmm6, %xmm0
	movups	%xmm0, (%rdx,%rax)
	addq	$16, %rax
	cmpq	%rax, %rdi
	jne	.L42
	movl	36(%rsp), %edi
	cmpl	%edi, 52(%rsp)
	je	.L44
	movq	64(%rsp), %r10
	movl	(%rcx,%r10), %eax
	addl	(%rsi,%r10), %eax
	movl	%eax, (%rdx,%r10)
	movl	80(%rsp), %eax
	cmpl	%eax, %edi
	jbe	.L44
	movq	88(%rsp), %r11
	movl	(%rcx,%r11), %eax
	addl	(%rsi,%r11), %eax
	movl	%eax, (%rdx,%r11)
	cmpl	%edi, 84(%rsp)
	jnb	.L44
	movq	96(%rsp), %rdi
	movl	(%rsi,%rdi), %eax
	addl	(%rcx,%rdi), %eax
	movl	%eax, (%rdx,%rdi)
.L44:
	movl	(%rsp), %ecx
	cmpl	%ecx, 32(%rsp)
	jle	.L132
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L85:
	movl	124(%rsp), %eax
	subl	$1, %eax
	je	.L49
	movl	16(%rsp), %ecx
	movl	%ecx, 292(%rsp)
	movl	%ecx, 296(%rsp)
.L49:
	movl	%eax, %eax
	movl	40(%rsp), %esi
	movl	16(%rsp), %ecx
	movq	%r14, %rdi
	leaq	(%rax,%rax,2), %rax
	leaq	292(%rsp), %r15
	salq	$2, %rax
	movl	%esi, 292(%rsp,%rax)
	movq	8(%rsp), %rsi
	movl	%ecx, 296(%rsp,%rax)
	movl	$0, 300(%rsp,%rax)
	call	dpu_set_dpu_iterator_from@PLT
	movq	272(%rsp), %rdx
	movdqa	256(%rsp), %xmm7
	cmpb	$0, 248(%rsp)
	movl	240(%rsp), %eax
	movq	%rdx, 176(%rsp)
	movaps	%xmm7, 160(%rsp)
	je	.L54
	.p2align 4,,10
	.p2align 3
.L50:
	subq	$8, %rsp
	.cfi_def_cfa_offset 552
	leaq	(%rax,%rax,2), %rax
	pushq	184(%rsp)
	.cfi_def_cfa_offset 560
	leaq	(%r15,%rax,4), %rdi
	pushq	184(%rsp)
	.cfi_def_cfa_offset 568
	pushq	184(%rsp)
	.cfi_def_cfa_offset 576
	call	dpu_prepare_xfer@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 544
	testl	%eax, %eax
	jne	.L133
	movq	%r14, %rdi
	call	dpu_set_dpu_iterator_next@PLT
	movq	272(%rsp), %rdx
	movdqa	256(%rsp), %xmm2
	cmpb	$0, 248(%rsp)
	movl	240(%rsp), %eax
	movq	%rdx, 176(%rsp)
	movaps	%xmm2, 160(%rsp)
	jne	.L50
.L54:
	subq	$8, %rsp
	.cfi_def_cfa_offset 552
	xorl	%r8d, %r8d
	movl	$12, %ecx
	xorl	%edx, %edx
	pushq	152(%rsp)
	.cfi_def_cfa_offset 560
	leaq	.LC17(%rip), %rsi
	xorl	%edi, %edi
	pushq	152(%rsp)
	.cfi_def_cfa_offset 568
	pushq	152(%rsp)
	.cfi_def_cfa_offset 576
	call	dpu_push_xfer@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 544
	testl	%eax, %eax
	jne	.L134
	movq	8(%rsp), %rsi
	movq	%r14, %rdi
	call	dpu_set_dpu_iterator_from@PLT
	movq	272(%rsp), %rdx
	movdqa	256(%rsp), %xmm7
	cmpb	$0, 248(%rsp)
	movl	240(%rsp), %eax
	movq	%rdx, 176(%rsp)
	movaps	%xmm7, 160(%rsp)
	je	.L59
	.p2align 4,,10
	.p2align 3
.L55:
	subq	$8, %rsp
	.cfi_def_cfa_offset 552
	imull	%ebx, %eax
	pushq	184(%rsp)
	.cfi_def_cfa_offset 560
	pushq	184(%rsp)
	.cfi_def_cfa_offset 568
	pushq	184(%rsp)
	.cfi_def_cfa_offset 576
	leaq	0(%rbp,%rax,4), %rdi
	call	dpu_prepare_xfer@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 544
	testl	%eax, %eax
	jne	.L135
	movq	%r14, %rdi
	call	dpu_set_dpu_iterator_next@PLT
	movq	272(%rsp), %rdx
	movdqa	256(%rsp), %xmm3
	cmpb	$0, 248(%rsp)
	movl	240(%rsp), %eax
	movq	%rdx, 176(%rsp)
	movaps	%xmm3, 160(%rsp)
	jne	.L55
.L59:
	subq	$8, %rsp
	.cfi_def_cfa_offset 552
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	xorl	%edi, %edi
	pushq	152(%rsp)
	.cfi_def_cfa_offset 560
	leaq	.LC18(%rip), %rsi
	pushq	152(%rsp)
	.cfi_def_cfa_offset 568
	pushq	152(%rsp)
	.cfi_def_cfa_offset 576
	movq	56(%rsp), %rcx
	call	dpu_push_xfer@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 544
	testl	%eax, %eax
	jne	.L136
	movq	8(%rsp), %rsi
	movq	%r14, %rdi
	call	dpu_set_dpu_iterator_from@PLT
	movq	272(%rsp), %rdx
	movdqa	256(%rsp), %xmm1
	cmpb	$0, 248(%rsp)
	movl	240(%rsp), %eax
	movq	%rdx, 176(%rsp)
	movaps	%xmm1, 160(%rsp)
	je	.L64
	.p2align 4,,10
	.p2align 3
.L60:
	subq	$8, %rsp
	.cfi_def_cfa_offset 552
	imull	%ebx, %eax
	pushq	184(%rsp)
	.cfi_def_cfa_offset 560
	pushq	184(%rsp)
	.cfi_def_cfa_offset 568
	pushq	184(%rsp)
	.cfi_def_cfa_offset 576
	leaq	(%r12,%rax,4), %rdi
	call	dpu_prepare_xfer@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 544
	testl	%eax, %eax
	jne	.L137
	movq	%r14, %rdi
	call	dpu_set_dpu_iterator_next@PLT
	movq	272(%rsp), %rdx
	movdqa	256(%rsp), %xmm4
	cmpb	$0, 248(%rsp)
	movl	240(%rsp), %eax
	movq	%rdx, 176(%rsp)
	movaps	%xmm4, 160(%rsp)
	jne	.L60
.L64:
	subq	$8, %rsp
	.cfi_def_cfa_offset 552
	xorl	%r8d, %r8d
	leaq	.LC18(%rip), %rsi
	xorl	%edi, %edi
	pushq	152(%rsp)
	.cfi_def_cfa_offset 560
	pushq	152(%rsp)
	.cfi_def_cfa_offset 568
	pushq	152(%rsp)
	.cfi_def_cfa_offset 576
	movq	56(%rsp), %rcx
	movl	48(%rsp), %edx
	call	dpu_push_xfer@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 544
	testl	%eax, %eax
	jne	.L138
	movl	(%rsp), %esi
	cmpl	%esi, 32(%rsp)
	jle	.L139
	leaq	.LC19(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	subq	$8, %rsp
	.cfi_def_cfa_offset 552
	movl	$1, %edi
	pushq	152(%rsp)
	.cfi_def_cfa_offset 560
	pushq	152(%rsp)
	.cfi_def_cfa_offset 568
	pushq	152(%rsp)
	.cfi_def_cfa_offset 576
	call	dpu_launch@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 544
	testl	%eax, %eax
	jne	.L83
	leaq	.LC20(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L82:
	movq	8(%rsp), %rsi
	movq	%r14, %rdi
	call	dpu_set_dpu_iterator_from@PLT
	movq	272(%rsp), %rdx
	movdqa	256(%rsp), %xmm7
	cmpb	$0, 248(%rsp)
	movl	240(%rsp), %eax
	movq	%rdx, 176(%rsp)
	movaps	%xmm7, 160(%rsp)
	je	.L73
	.p2align 4,,10
	.p2align 3
.L69:
	subq	$8, %rsp
	.cfi_def_cfa_offset 552
	imull	%ebx, %eax
	pushq	184(%rsp)
	.cfi_def_cfa_offset 560
	pushq	184(%rsp)
	.cfi_def_cfa_offset 568
	pushq	184(%rsp)
	.cfi_def_cfa_offset 576
	leaq	0(%r13,%rax,4), %rdi
	call	dpu_prepare_xfer@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 544
	testl	%eax, %eax
	jne	.L140
	movq	%r14, %rdi
	call	dpu_set_dpu_iterator_next@PLT
	movq	272(%rsp), %rdx
	movdqa	256(%rsp), %xmm5
	cmpb	$0, 248(%rsp)
	movl	240(%rsp), %eax
	movq	%rdx, 176(%rsp)
	movaps	%xmm5, 160(%rsp)
	jne	.L69
.L73:
	subq	$8, %rsp
	.cfi_def_cfa_offset 552
	xorl	%r8d, %r8d
	movl	$1, %edi
	pushq	152(%rsp)
	.cfi_def_cfa_offset 560
	leaq	.LC18(%rip), %rsi
	pushq	152(%rsp)
	.cfi_def_cfa_offset 568
	pushq	152(%rsp)
	.cfi_def_cfa_offset 576
	movq	56(%rsp), %rcx
	movl	48(%rsp), %edx
	call	dpu_push_xfer@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 544
	testl	%eax, %eax
	jne	.L141
	movl	(%rsp), %ecx
	cmpl	%ecx, 32(%rsp)
	jle	.L142
	addl	$1, (%rsp)
	movl	(%rsp), %eax
	cmpl	48(%rsp), %eax
	jne	.L76
.L31:
	leaq	.LC12(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	pxor	%xmm1, %xmm1
	movl	$1, %edi
	movsd	432(%rsp), %xmm0
	imull	$1000, 104(%rsp), %eax
	leaq	.LC2(%rip), %rsi
	cvtsi2sdl	%eax, %xmm1
	movl	$1, %eax
	divsd	%xmm1, %xmm0
	movsd	%xmm1, (%rsp)
	call	__printf_chk@PLT
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC2(%rip), %rsi
	movsd	440(%rsp), %xmm0
	divsd	(%rsp), %xmm0
	call	__printf_chk@PLT
	leaq	.LC14(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC2(%rip), %rsi
	movsd	448(%rsp), %xmm0
	divsd	(%rsp), %xmm0
	call	__printf_chk@PLT
	leaq	.LC15(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC2(%rip), %rsi
	movsd	456(%rsp), %xmm0
	divsd	(%rsp), %xmm0
	call	__printf_chk@PLT
	cmpl	$0, 36(%rsp)
	je	.L35
	movq	C(%rip), %r8
	movl	44(%rsp), %eax
	xorl	%edx, %edx
	xorl	%edi, %edi
	movl	$1, %ecx
	jmp	.L78
.L88:
	movq	%rsi, %rdx
.L78:
	movl	(%r8,%rdx,4), %esi
	cmpl	%esi, 0(%r13,%rdx,4)
	leaq	1(%rdx), %rsi
	cmovne	%edi, %ecx
	cmpq	%rdx, %rax
	jne	.L88
	testb	%cl, %cl
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
	pushq	%rcx
	.cfi_def_cfa_offset 552
	pushq	152(%rsp)
	.cfi_def_cfa_offset 560
	pushq	152(%rsp)
	.cfi_def_cfa_offset 568
	pushq	152(%rsp)
	.cfi_def_cfa_offset 576
	call	dpu_free@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 544
	testl	%eax, %eax
	je	.L89
.L80:
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.3579(%rip), %r9
	movl	$219, %r8d
	pushq	%rdx
	.cfi_remember_state
	.cfi_def_cfa_offset 552
	pushq	%rax
	.cfi_def_cfa_offset 560
	jmp	.L127
	.p2align 4,,10
	.p2align 3
.L132:
	.cfi_restore_state
	leaq	368(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movq	368(%rsp), %rax
	subq	304(%rsp), %rax
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	376(%rsp), %rax
	mulsd	.LC1(%rip), %xmm0
	subq	312(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	xorl	%eax, %eax
	addsd	%xmm1, %xmm0
	addsd	432(%rsp), %xmm0
	movsd	%xmm0, 432(%rsp)
	call	__printf_chk@PLT
	movl	(%rsp), %ecx
	cmpl	%ecx, 32(%rsp)
	jne	.L48
	movq	$0x000000000, 440(%rsp)
.L48:
	leaq	320(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L139:
	leaq	384(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movq	384(%rsp), %rax
	subq	320(%rsp), %rax
	leaq	.LC19(%rip), %rsi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	392(%rsp), %rax
	mulsd	.LC1(%rip), %xmm0
	subq	328(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	xorl	%eax, %eax
	addsd	%xmm1, %xmm0
	addsd	440(%rsp), %xmm0
	movsd	%xmm0, 440(%rsp)
	call	__printf_chk@PLT
	movl	(%rsp), %ecx
	cmpl	%ecx, 32(%rsp)
	jne	.L66
	movq	$0x000000000, 448(%rsp)
.L66:
	leaq	336(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	subq	$8, %rsp
	.cfi_def_cfa_offset 552
	movl	$1, %edi
	pushq	152(%rsp)
	.cfi_def_cfa_offset 560
	pushq	152(%rsp)
	.cfi_def_cfa_offset 568
	pushq	152(%rsp)
	.cfi_def_cfa_offset 576
	call	dpu_launch@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 544
	testl	%eax, %eax
	jne	.L83
	leaq	400(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movq	400(%rsp), %rax
	subq	336(%rsp), %rax
	leaq	.LC20(%rip), %rsi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	408(%rsp), %rax
	mulsd	.LC1(%rip), %xmm0
	subq	344(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	xorl	%eax, %eax
	addsd	%xmm1, %xmm0
	addsd	448(%rsp), %xmm0
	movsd	%xmm0, 448(%rsp)
	call	__printf_chk@PLT
	movl	(%rsp), %ecx
	cmpl	%ecx, 32(%rsp)
	jne	.L68
	movq	$0x000000000, 456(%rsp)
.L68:
	leaq	352(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	jmp	.L82
	.p2align 4,,10
	.p2align 3
.L142:
	leaq	416(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movq	416(%rsp), %rax
	subq	352(%rsp), %rax
	addl	$1, (%rsp)
	cvtsi2sdq	%rax, %xmm0
	movq	424(%rsp), %rax
	mulsd	.LC1(%rip), %xmm0
	subq	360(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	(%rsp), %eax
	addsd	%xmm1, %xmm0
	addsd	456(%rsp), %xmm0
	movsd	%xmm0, 456(%rsp)
	cmpl	48(%rsp), %eax
	jne	.L76
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L41:
	movl	44(%rsp), %r8d
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L46:
	movl	(%rsi,%rax,4), %edi
	addl	(%rcx,%rax,4), %edi
	movl	%edi, (%rdx,%rax,4)
	movq	%rax, %rdi
	addq	$1, %rax
	cmpq	%r8, %rdi
	jne	.L46
	jmp	.L44
.L131:
	movl	124(%rsp), %eax
	imull	%ebx, %eax
	movl	%eax, 36(%rsp)
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
	pushq	%rsi
	.cfi_def_cfa_offset 552
	pushq	152(%rsp)
	.cfi_def_cfa_offset 560
	pushq	152(%rsp)
	.cfi_def_cfa_offset 568
	pushq	152(%rsp)
	.cfi_def_cfa_offset 576
	call	dpu_free@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 544
	testl	%eax, %eax
	jne	.L80
.L81:
	movq	472(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L143
	addq	$488, %rsp
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
.L137:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.3579(%rip), %r9
	movl	$134, %r8d
	pushq	%r11
	.cfi_def_cfa_offset 552
	pushq	%rax
	.cfi_def_cfa_offset 560
.L127:
	movq	stderr(%rip), %rdi
	leaq	.LC6(%rip), %rcx
	leaq	.LC7(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L135:
	.cfi_def_cfa_offset 544
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.3579(%rip), %r9
	pushq	%rbp
	.cfi_remember_state
	.cfi_def_cfa_offset 552
	movl	$129, %r8d
	pushq	%rax
	.cfi_def_cfa_offset 560
	jmp	.L127
.L133:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.3579(%rip), %r9
	pushq	%r13
	.cfi_remember_state
	.cfi_def_cfa_offset 552
	movl	$124, %r8d
	pushq	%rax
	.cfi_def_cfa_offset 560
	jmp	.L127
.L140:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.3579(%rip), %r9
	pushq	%r8
	.cfi_remember_state
	.cfi_def_cfa_offset 552
	movl	$174, %r8d
	pushq	%rax
	.cfi_def_cfa_offset 560
	jmp	.L127
.L134:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.3579(%rip), %r9
	pushq	%r12
	.cfi_remember_state
	.cfi_def_cfa_offset 552
	movl	$126, %r8d
	pushq	%rax
	.cfi_def_cfa_offset 560
	jmp	.L127
.L136:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.3579(%rip), %r9
	pushq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 552
	movl	$131, %r8d
	pushq	%rax
	.cfi_def_cfa_offset 560
	jmp	.L127
.L141:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.3579(%rip), %r9
	movl	$176, %r8d
	pushq	%rdi
	.cfi_remember_state
	.cfi_def_cfa_offset 552
	pushq	%rax
	.cfi_def_cfa_offset 560
	jmp	.L127
.L130:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.3579(%rip), %r9
	movl	$68, %r8d
	pushq	%rdx
	.cfi_remember_state
	.cfi_def_cfa_offset 552
	pushq	%rax
	.cfi_def_cfa_offset 560
	jmp	.L127
.L83:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	movl	$148, %r8d
	pushq	%r9
	.cfi_remember_state
	.cfi_def_cfa_offset 552
	leaq	__func__.3579(%rip), %r9
	pushq	%rax
	.cfi_def_cfa_offset 560
	jmp	.L127
.L138:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.3579(%rip), %r9
	movl	$136, %r8d
	pushq	%r10
	.cfi_remember_state
	.cfi_def_cfa_offset 552
	pushq	%rax
	.cfi_def_cfa_offset 560
	jmp	.L127
.L129:
	.cfi_restore_state
	call	dpu_error_to_string@PLT
	leaq	__func__.3579(%rip), %r9
	movl	$67, %r8d
	pushq	%rcx
	.cfi_remember_state
	.cfi_def_cfa_offset 552
	pushq	%rax
	.cfi_def_cfa_offset 560
	jmp	.L127
.L128:
	.cfi_restore_state
	movl	%eax, %edi
	call	dpu_error_to_string@PLT
	leaq	__func__.3579(%rip), %r9
	movl	$66, %r8d
	pushq	%rsi
	.cfi_remember_state
	.cfi_def_cfa_offset 552
	pushq	%rax
	.cfi_def_cfa_offset 560
	jmp	.L127
.L89:
	.cfi_restore_state
	orl	$-1, %eax
	jmp	.L81
.L143:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE44:
	.size	main, .-main
	.section	.rodata
	.type	__func__.3579, @object
	.size	__func__.3579, 5
__func__.3579:
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
