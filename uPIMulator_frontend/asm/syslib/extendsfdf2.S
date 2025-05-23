	.text
	.file	"extendsfdf2.c"
	.section	.text.__extendsfdf2,"ax",@progbits
	.globl	__extendsfdf2                   // -- Begin function __extendsfdf2
	.type	__extendsfdf2,@function
__extendsfdf2:                          // @__extendsfdf2
.Lfunc_begin0:
// %bb.0:
	and r2, r0, 2147483647
	add r1, r2, -8388608
	lsr r1, r1, 24
	jgtu r1, 126, .LBB0_2
// %bb.1:
	move.u d2, r2
	lslx r1, r3, 29
	lsl_add r4, r1, r2, 29
	lsl r5, r3, 29
	add r3, r5, 0
	addc r2, r4, 939524096
	jump .LBB0_10
.LBB0_2:
	lsr r1, r2, 23
	jltu r1, 255, .LBB0_4
// %bb.3:
	move.u d2, r0
	lslx r1, r3, 29
	lsl_add r4, r1, r2, 29
	lsl r5, r3, 29
	or r3, r5, 0
	or r2, r4, 2146435072
	jump .LBB0_10
.LBB0_4:
	jeq r2, 0, .LBB0_5
// %bb.6:
	clz r1, r2
	move.u d4, r2
	add r6, r1, 21
	lslx r2, r5, r6, sh32, .LBB0_8
// %bb.7:
	lsl r3, r4, r6
	or r2, r3, r2
	lsl r3, r5, r6, true, .LBB0_9
.LBB0_5:
	move.s d2, 0
	jump .LBB0_10
.LBB0_8:
	lsl r2, r5, r6
	move r3, 0
.LBB0_9:
	xor r3, r3, 0
	xor r2, r2, 1048576
	sub r1, 905, r1
	move.s d4, r1
	move r7, 0
	lsl r6, r5, 20
	or r3, r3, r7
	or r2, r2, r6
.LBB0_10:
	and r0, r0, -2147483648
	move.s d0, r0
	move r5, 0
	move r4, r1
	or r1, r3, r5
	or r0, r2, r4
	jump r23
.Lfunc_end0:
	.size	__extendsfdf2, .Lfunc_end0-__extendsfdf2
	.section	.stack_sizes,"o",@progbits,.text.__extendsfdf2
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__extendsfdf2,"ax",@progbits
                                        // -- End function
	.addrsig
