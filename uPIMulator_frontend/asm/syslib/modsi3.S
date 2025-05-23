	.text
	.file	"modsi3.c"
	.section	.text.__modsi3,"ax",@progbits
	.globl	__modsi3                        // -- Begin function __modsi3
	.type	__modsi3,@function
__modsi3:                               // @__modsi3
.Lfunc_begin0:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	call r23, __div32
	move r0, r1
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__modsi3, .Lfunc_end0-__modsi3
	.section	.stack_sizes,"o",@progbits,.text.__modsi3
	.long	.Lfunc_begin0
	.byte	8
	.section	.text.__modsi3,"ax",@progbits
                                        // -- End function
	.addrsig
