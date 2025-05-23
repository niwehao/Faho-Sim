	.text
	.file	"strpbrk.c"
	.section	.text.strpbrk,"ax",@progbits
	.globl	strpbrk                         // -- Begin function strpbrk
	.type	strpbrk,@function
strpbrk:                                // @strpbrk
.Lfunc_begin0:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r14, r0
	call r23, strcspn
	add r0, r14, r0
	lbs r1, r0, 0
	and r1, r1, 255
	jeq r1, 0, .LBB0_1
// %bb.2:
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.LBB0_1:
	move r0, 0
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	strpbrk, .Lfunc_end0-strpbrk
	.section	.stack_sizes,"o",@progbits,.text.strpbrk
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.strpbrk,"ax",@progbits
                                        // -- End function
	.addrsig
