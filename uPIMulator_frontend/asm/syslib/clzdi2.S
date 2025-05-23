	.text
	.file	"clzdi2.c"
	.section	.text.__clzdi2,"ax",@progbits
	.globl	__clzdi2                        // -- Begin function __clzdi2
	.type	__clzdi2,@function
__clzdi2:                               // @__clzdi2
.Lfunc_begin0:
// %bb.0:
	jeq r0, 0, .LBB0_1
// %bb.2:
	move r2, r0
	clz r2, r2
	jeq r0, 0, .LBB0_4
.LBB0_5:
	move r0, 0
	or r0, r2, r0
	jump r23
.LBB0_1:
	move r2, r1
	clz r2, r2
	jneq r0, 0, .LBB0_5
.LBB0_4:
	move r0, 32
	or r0, r2, r0
	jump r23
.Lfunc_end0:
	.size	__clzdi2, .Lfunc_end0-__clzdi2
	.section	.stack_sizes,"o",@progbits,.text.__clzdi2
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__clzdi2,"ax",@progbits
                                        // -- End function
	.addrsig
