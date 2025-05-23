	.text
	.file	"ffsdi2.c"
	.section	.text.__ffsdi2,"ax",@progbits
	.globl	__ffsdi2                        // -- Begin function __ffsdi2
	.type	__ffsdi2,@function
__ffsdi2:                               // @__ffsdi2
.Lfunc_begin0:
// %bb.0:
	jeq r1, 0, .LBB0_1
// %bb.4:
	add r2, r1, -1
	andn r0, r1, r2
	cao r0, r0
	add r0, r0, 1
	jump r23
.LBB0_1:
	jeq r0, 0, .LBB0_2
// %bb.3:
	add r2, r0, -1
	andn r0, r0, r2
	cao r0, r0
	add r0, r0, 33
	jump r23
.LBB0_2:
	move r0, 0
	jump r23
.Lfunc_end0:
	.size	__ffsdi2, .Lfunc_end0-__ffsdi2
	.section	.stack_sizes,"o",@progbits,.text.__ffsdi2
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__ffsdi2,"ax",@progbits
                                        // -- End function
	.addrsig
