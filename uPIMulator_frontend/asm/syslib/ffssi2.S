	.text
	.file	"ffssi2.c"
	.section	.text.__ffssi2,"ax",@progbits
	.globl	__ffssi2                        // -- Begin function __ffssi2
	.type	__ffssi2,@function
__ffssi2:                               // @__ffssi2
.Lfunc_begin0:
// %bb.0:
	jeq r0, 0, .LBB0_1
// %bb.2:
	add r1, r0, -1
	andn r0, r0, r1
	cao r0, r0
	add r0, r0, 1
	jump r23
.LBB0_1:
	move r0, 0
	jump r23
.Lfunc_end0:
	.size	__ffssi2, .Lfunc_end0-__ffssi2
	.section	.stack_sizes,"o",@progbits,.text.__ffssi2
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__ffssi2,"ax",@progbits
                                        // -- End function
	.addrsig
