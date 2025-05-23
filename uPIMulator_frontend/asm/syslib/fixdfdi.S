	.text
	.file	"fixdfdi.c"
	.section	.text.__fixdfdi,"ax",@progbits
	.globl	__fixdfdi                       // -- Begin function __fixdfdi
	.type	__fixdfdi,@function
__fixdfdi:                              // @__fixdfdi
.Lfunc_begin0:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sd r22, -16, d14
	sd r22, -24, d16
	movd d14, d0
	move.s d16, 0
	movd d2, d16
	call r23, __ltdf2
	jgts r0, -1, .LBB0_2
// %bb.1:
	xor r1, r15, 0
	xor r0, r14, 2147483648
	call r23, __fixunsdfdi
	sub r1, r17, r1
	subc r0, r16, r0
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.LBB0_2:
	movd d0, d14
	call r23, __fixunsdfdi
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__fixdfdi, .Lfunc_end0-__fixdfdi
	.section	.stack_sizes,"o",@progbits,.text.__fixdfdi
	.long	.Lfunc_begin0
	.byte	24
	.section	.text.__fixdfdi,"ax",@progbits
                                        // -- End function
	.addrsig
