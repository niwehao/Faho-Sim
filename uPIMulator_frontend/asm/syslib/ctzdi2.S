	.text
	.file	"ctzdi2.c"
	.section	.text.__ctzdi2,"ax",@progbits
	.globl	__ctzdi2                        // -- Begin function __ctzdi2
	.type	__ctzdi2,@function
__ctzdi2:                               // @__ctzdi2
.Lfunc_begin0:
// %bb.0:
	jeq r1, 0, .LBB0_1
// %bb.2:
	move r2, r1
	add r3, r2, -1
	andn r2, r2, r3
	cao r2, r2
	jeq r1, 0, .LBB0_4
.LBB0_5:
	move r0, 0
	or r0, r2, r0
	jump r23
.LBB0_1:
	move r2, r0
	add r3, r2, -1
	andn r2, r2, r3
	cao r2, r2
	jneq r1, 0, .LBB0_5
.LBB0_4:
	move r0, 32
	or r0, r2, r0
	jump r23
.Lfunc_end0:
	.size	__ctzdi2, .Lfunc_end0-__ctzdi2
	.section	.stack_sizes,"o",@progbits,.text.__ctzdi2
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__ctzdi2,"ax",@progbits
                                        // -- End function
	.addrsig
