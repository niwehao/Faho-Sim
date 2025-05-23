	.text
	.file	"strdup.c"
	.section	.text.strdup,"ax",@progbits
	.globl	strdup                          // -- Begin function strdup
	.type	strdup,@function
strdup:                                 // @strdup
.Lfunc_begin0:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sd r22, -16, d14
	sd r22, -24, d16
	move r14, r0
	call r23, strlen
	add r15, r0, 1
	move r0, r15
	call r23, buddy_alloc
	move r16, r0, z, .LBB0_2
// %bb.1:
	move r0, r16
	move r1, r14
	move r2, r15
	call r23, memcpy
.LBB0_2:
	move r0, r16
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	strdup, .Lfunc_end0-strdup
	.section	.stack_sizes,"o",@progbits,.text.strdup
	.long	.Lfunc_begin0
	.byte	24
	.section	.text.strdup,"ax",@progbits
                                        // -- End function
	.addrsig
