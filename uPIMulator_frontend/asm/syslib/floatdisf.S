	.text
	.file	"floatdisf.c"
	.section	.text.__floatdisf,"ax",@progbits
	.globl	__floatdisf                     // -- Begin function __floatdisf
	.type	__floatdisf,@function
__floatdisf:                            // @__floatdisf
.Lfunc_begin0:
// %bb.0:
	move.s d2, 0
	jneq r1, r3, .LBB0_23
// %bb.22:
	jeq r0, r2, .LBB0_1
.LBB0_23:
// %bb.2:
	asr.s d2, r0, 31
	xor r1, r3, r1
	xor r0, r2, r0
	sub r5, r1, r3
	subc r4, r0, r2
	clz.u d6, r4, nmax, .LBB0_4
// %bb.3:
	clz r0, r5
	add r7, r0, 32
.LBB0_4:
	xor r0, r7, 63
	jgtu r7, 39, .LBB0_17
// %bb.5:
	sub r1, 64, r7
	jeq r1, 26, .LBB0_15
// %bb.6:
	jneq r1, 25, .LBB0_8
// %bb.7:
	lslx r6, r5, 1
	lsl_add r4, r6, r4, 1
	lsl r5, r5, 1, true, .LBB0_15
.LBB0_1:
	move r0, 0
	jump r23
.LBB0_17:
	add r1, r7, -40
	lslx r6, r5, r1, sh32, .LBB0_19
// %bb.18:
	lsl r7, r4, r1
	or r6, r7, r6
	lsl r7, r5, r1, true, .LBB0_20
.LBB0_19:
	lsl r6, r5, r1
	move r7, 0, true, .LBB0_20
.LBB0_8:
	sub r10, 38, r7
	lsrx r8, r4, r10, sh32, .LBB0_10
// %bb.9:
	lsr r9, r5, r10
	or r9, r8, r9
	lsr r8, r4, r10
	add r10, r7, 26
	lslx r6, r5, r10, sh32, .LBB0_13
	jump .LBB0_12
.LBB0_13:
	lsl r6, r5, r10
	move r7, 0, true, .LBB0_14
.LBB0_10:
	lsr.u d8, r4, r10
	add r10, r7, 26
	lslx r6, r5, r10, sh32, .LBB0_13
.LBB0_12:
	lsl r7, r4, r10
	or r6, r7, r6
	lsl r7, r5, r10
.LBB0_14:
	move.s d4, 0
	sub zero, r7, r5
	subc r4, r6, r4, xnz
	move.u d4, r4
	or r5, r9, r5
	or r4, r8, r4
.LBB0_15:
	lsrx r6, r4, 2
	lsr_add r7, r6, r5, 2
	lsr r6, r4, 2
	and r7, r7, 1
	and r6, r6, 0
	or r5, r7, r5
	or r4, r6, r4
	add r5, r5, 1
	addc r4, r4, 0
	lsrx r6, r4, 2
	lsr_add r7, r6, r5, 2
	and r9, r5, 67108864
	and r8, r4, 0
	move.s d10, 0
	asr r6, r4, 2
	jneq r9, r11, .LBB0_25
// %bb.24:
	jeq r8, r10, .LBB0_20
.LBB0_25:
// %bb.16:
	lsrx r0, r6, 1
	lsr_add r7, r0, r7, 1
	lsr r6, r6, 1
	move r0, r1
.LBB0_20:
	and r1, r3, -2147483648
	move r2, 1065353216
	lsl_add r0, r2, r0, 23
	and r2, r7, 8388607
	or r1, r2, r1
	or r0, r1, r0
	jump r23
.Lfunc_end0:
	.size	__floatdisf, .Lfunc_end0-__floatdisf
	.section	.stack_sizes,"o",@progbits,.text.__floatdisf
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__floatdisf,"ax",@progbits
                                        // -- End function
	.addrsig
