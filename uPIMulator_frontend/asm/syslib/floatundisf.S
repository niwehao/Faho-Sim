	.text
	.file	"floatundisf.c"
	.section	.text.__floatundisf,"ax",@progbits
	.globl	__floatundisf                   // -- Begin function __floatundisf
	.type	__floatundisf,@function
__floatundisf:                          // @__floatundisf
.Lfunc_begin0:
// %bb.0:
	move.s d2, 0
	jneq r1, r3, .LBB0_24
// %bb.23:
	jeq r0, r2, .LBB0_1
.LBB0_24:
// %bb.2:
	clz.u d4, r0, nmax, .LBB0_4
// %bb.3:
	clz r2, r1
	add r5, r2, 32
.LBB0_4:
	xor r2, r5, 63
	jgtu r5, 39, .LBB0_18
// %bb.5:
	sub r3, 64, r5
	jeq r3, 26, .LBB0_15
// %bb.6:
	jneq r3, 25, .LBB0_8
// %bb.7:
	lslx r4, r1, 1
	lsl_add r0, r4, r0, 1
	lsl r1, r1, 1, true, .LBB0_15
.LBB0_1:
	move r0, 0
	jump r23
.LBB0_18:
	add r3, r5, -40
	lslx r4, r1, r3, sh32, .LBB0_20
// %bb.19:
	lsl r5, r0, r3
	or r4, r5, r4
	lsl r5, r1, r3
	and r0, r5, 8388607
	lsl_add r0, r0, r2, 23
	add r0, r0, 1065353216
	jump r23
.LBB0_20:
	lsl r4, r1, r3
	move r5, 0
	and r0, r5, 8388607
	lsl_add r0, r0, r2, 23
	add r0, r0, 1065353216
	jump r23
.LBB0_8:
	sub r8, 38, r5
	lsrx r6, r0, r8, sh32, .LBB0_10
// %bb.9:
	lsr r7, r1, r8
	or r7, r6, r7
	lsr r6, r0, r8
	add r8, r5, 26
	lslx r4, r1, r8, sh32, .LBB0_13
	jump .LBB0_12
.LBB0_13:
	lsl r4, r1, r8
	move r5, 0, true, .LBB0_14
.LBB0_10:
	lsr.u d6, r0, r8
	add r8, r5, 26
	lslx r4, r1, r8, sh32, .LBB0_13
.LBB0_12:
	lsl r5, r0, r8
	or r4, r5, r4
	lsl r5, r1, r8
.LBB0_14:
	move.s d0, 0
	sub zero, r5, r1
	subc r0, r4, r0, xnz
	move.u d0, r0
	or r1, r7, r1
	or r0, r6, r0
.LBB0_15:
	lsrx r4, r0, 2
	lsr_add r5, r4, r1, 2
	lsr r4, r0, 2
	and r5, r5, 1
	and r4, r4, 0
	or r1, r5, r1
	or r0, r4, r0
	add r1, r1, 1
	addc r0, r0, 0
	and r5, r1, 67108864
	and r4, r0, 0
	move.s d6, 0
	jneq r5, r7, .LBB0_17
// %bb.25:
	jneq r4, r6, .LBB0_17
// %bb.26:
// %bb.16:
	lsrx r3, r0, 2
	lsr_add r5, r3, r1, 2
	lsr r4, r0, 2
	and r0, r5, 8388607
	lsl_add r0, r0, r2, 23
	add r0, r0, 1065353216
	jump r23
.LBB0_17:
	lsrx r2, r0, 3
	lsr_add r5, r2, r1, 3
	lsr r4, r0, 3
	move r2, r3
	and r0, r5, 8388607
	lsl_add r0, r0, r2, 23
	add r0, r0, 1065353216
	jump r23
.Lfunc_end0:
	.size	__floatundisf, .Lfunc_end0-__floatundisf
	.section	.stack_sizes,"o",@progbits,.text.__floatundisf
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__floatundisf,"ax",@progbits
                                        // -- End function
	.addrsig
