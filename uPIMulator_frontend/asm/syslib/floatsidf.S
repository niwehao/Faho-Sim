	.text
	.file	"floatsidf.c"
	.section	.text.__floatsidf,"ax",@progbits
	.globl	__floatsidf                     // -- Begin function __floatsidf
	.type	__floatsidf,@function
__floatsidf:                            // @__floatsidf
.Lfunc_begin0:
// %bb.0:
	jeq r0, 0, .LBB0_1
// %bb.2:
	and r1, r0, -2147483648
	move.s d4, r1
	move r3, 0
	asr r1, r0, 31
	add r0, r0, r1
	xor r6, r0, r1
	clz r0, r6
	add r1, r0, 21
	move.u d6, r6
	move r2, r5
	lslx r4, r7, r1, sh32, .LBB0_4
// %bb.3:
	lsl r5, r6, r1
	or r4, r5, r4
	lsl r5, r7, r1, true, .LBB0_5
.LBB0_1:
	move.s d0, 0
	jump r23
.LBB0_4:
	lsl r1, r7, r1
	movd d4, d2
	move r4, r1
.LBB0_5:
	xor r5, r5, 0
	xor r4, r4, 1048576
	sub r0, 1054, r0
	move.s d0, r0
	move r7, 0
	lsl r6, r1, 20
	add r1, r5, r7
	addc r0, r4, r6
	or r1, r1, r3
	or r0, r0, r2
	jump r23
.Lfunc_end0:
	.size	__floatsidf, .Lfunc_end0-__floatsidf
	.section	.stack_sizes,"o",@progbits,.text.__floatsidf
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__floatsidf,"ax",@progbits
                                        // -- End function
	.addrsig
