	.text
	.file	"fixsfdi.c"
	.section	.text.__fixsfdi,"ax",@progbits
	.globl	__fixsfdi                       // -- Begin function __fixsfdi
	.type	__fixsfdi,@function
__fixsfdi:                              // @__fixsfdi
.Lfunc_begin0:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r14, r0
	move r1, 0
	call r23, __ltsf2
	jgts r0, -1, .LBB0_2
// %bb.1:
	xor r0, r14, -2147483648
	call r23, __fixunssfdi
	move.s d2, 0
	sub r1, r3, r1
	subc r0, r2, r0
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.LBB0_2:
	move r0, r14
	call r23, __fixunssfdi
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__fixsfdi, .Lfunc_end0-__fixsfdi
	.section	.stack_sizes,"o",@progbits,.text.__fixsfdi
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.__fixsfdi,"ax",@progbits
                                        // -- End function
	.addrsig
