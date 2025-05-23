	.text
	.file	"cmpdi2.c"
	.section	.text.__cmpdi2,"ax",@progbits
	.globl	__cmpdi2                        // -- Begin function __cmpdi2
	.type	__cmpdi2,@function
__cmpdi2:                               // @__cmpdi2
.Lfunc_begin0:
// %bb.0:
	move r5, 0
	jges r0, r2, .LBB0_2
// %bb.1:
	move r4, r5
	move r0, r4
	jump r23
.LBB0_2:
	move r4, 2
	jgts r0, r2, .LBB0_6
// %bb.3:
	move r4, r5
	jltu r1, r3, .LBB0_6
// %bb.4:
	move r4, 2
	jgtu r1, r3, .LBB0_6
// %bb.5:
	move r4, 1
.LBB0_6:
	move r0, r4
	jump r23
.Lfunc_end0:
	.size	__cmpdi2, .Lfunc_end0-__cmpdi2
	.section	.stack_sizes,"o",@progbits,.text.__cmpdi2
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__cmpdi2,"ax",@progbits
                                        // -- End function
	.addrsig
