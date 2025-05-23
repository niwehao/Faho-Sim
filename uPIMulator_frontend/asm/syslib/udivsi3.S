	.text
	.file	"udivsi3.c"
	.section	.text.__udivsi3,"ax",@progbits
	.globl	__udivsi3                       // -- Begin function __udivsi3
	.type	__udivsi3,@function
__udivsi3:                              // @__udivsi3
.Lfunc_begin0:
// %bb.0:
	move r2, r0
	move r0, 0
	jeq r2, 0, .LBB0_8
// %bb.1:
	jeq r1, 0, .LBB0_8
// %bb.2:
	clz r3, r1
	clz r5, r2
	sub r4, r3, r5
	jgtu r4, 31, .LBB0_8
// %bb.3:
	jneq r4, 31, .LBB0_5
// %bb.4:
	move r0, r2
	jump r23
.LBB0_5:
	add r6, r4, 1
	sub r0, 31, r4
	lsl r0, r2, r0
	lsr r4, r2, r6
	not r2, r3
	add r2, r2, r5
	move r3, 0
.LBB0_6:                                // =>This Inner Loop Header: Depth=1
	lsr r5, r0, 31
	lsl_add r6, r5, r4, 1
	lsl r4, r4, 1
	lsl r0, r0, 1
	or r0, r3, r0
	nor r3, r4, r5
	add r3, r3, r1
	asr r4, r3, 31
	and r3, r4, 1
	and r4, r4, r1
	add r5, r2, 1
	sub r7, r5, r2, ltu
	sub r4, r6, r4
	move r2, r5
	jneq r7, 1, .LBB0_6
// %bb.7:
	lsl_add r0, r3, r0, 1
.LBB0_8:
	jump r23
.Lfunc_end0:
	.size	__udivsi3, .Lfunc_end0-__udivsi3
	.section	.stack_sizes,"o",@progbits,.text.__udivsi3
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__udivsi3,"ax",@progbits
                                        // -- End function
	.addrsig
