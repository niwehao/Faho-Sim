	.text
	.file	"floatunsidf.c"
	.section	.text.__floatunsidf,"ax",@progbits
	.globl	__floatunsidf                   // -- Begin function __floatunsidf
	.type	__floatunsidf,@function
__floatunsidf:                          // @__floatunsidf
.Lfunc_begin0:
// %bb.0:
	jeq r0, 0, .LBB0_1
// %bb.2:
	clz r1, r0
	add r4, r1, 21
	move.u d6, r0
	lslx r0, r7, r4, sh32, .LBB0_4
// %bb.3:
	lsl r2, r6, r4
	or r2, r2, r0
	lsl r3, r7, r4, true, .LBB0_5
.LBB0_1:
	move.s d0, 0
	jump r23
.LBB0_4:
	lsl r2, r7, r4
	move r3, 0
.LBB0_5:
	xor r3, r3, 0
	xor r2, r2, 1048576
	sub r0, 1054, r1
	move.s d0, r0
	move r5, 0
	lsl r4, r1, 20
	add r1, r3, r5
	addc r0, r2, r4
	jump r23
.Lfunc_end0:
	.size	__floatunsidf, .Lfunc_end0-__floatunsidf
	.section	.stack_sizes,"o",@progbits,.text.__floatunsidf
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__floatunsidf,"ax",@progbits
                                        // -- End function
	.addrsig
