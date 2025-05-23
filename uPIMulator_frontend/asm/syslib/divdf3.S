	.text
	.file	"divdf3.c"
	.section	.text.__divdf3,"ax",@progbits
	.globl	__divdf3                        // -- Begin function __divdf3
	.type	__divdf3,@function
__divdf3:                               // @__divdf3
.Lfunc_begin0:
// %bb.0:
	sd r22, 88, d22
	add r22, r22, 96
	sd r22, -72, d14
	sd r22, -80, d16
	sd r22, -88, d18
	sd r22, -96, d20
	lsr.u d4, r0, 20
	and r4, r5, 2047
	lsr.u d6, r2, 20
	and r5, r7, 2047
	xor r7, r3, r1
	xor r6, r2, r0
	and r17, r7, 0
	and r16, r6, 2147483648
	and r19, r1, 4294967295
	and r18, r0, 1048575
	and r15, r3, 4294967295
	and r14, r2, 1048575
	add r6, r4, -1
	lsr r6, r6, 1
	jgtu r6, 1022, .LBB0_7
// %bb.1:
	add r7, r5, -1
	move r6, 0
	lsr r7, r7, 1
	jgeu r7, 1023, .LBB0_7
// %bb.2:
	sd r22, -24, d18
	sd r22, -16, d16
.LBB0_3:
	or r3, r15, 0
	or r2, r14, 1048576
	sub r0, r4, r5
	add r0, r6, r0
	sw r22, -56, r0
	lsrx r0, r2, 21
	lsr_add r1, r0, r3, 21
	sd r22, -64, d2
	lsr r0, r2, 21
	sub r2, 1963258675, r1
	move.u d20, r2
	and r19, r1, 4294967295
	and r18, r0, 0
	movd d0, d18
	movd d2, d20
	call r23, __muldi3
	neg r0, r0
	move.u d0, r0
	movd d2, d20
	call r23, __muldi3
	lsrx r2, r0, 31
	lsr_add r3, r2, r1, 31
	lsr r2, r0, 31
	and r21, r3, 4294967295
	and r20, r2, 0
	movd d0, d20
	movd d2, d18
	call r23, __muldi3
	neg r0, r0
	move.u d2, r0
	movd d0, d20
	call r23, __muldi3
	lsrx r2, r0, 31
	lsr_add r3, r2, r1, 31
	lsr r2, r0, 31
	and r21, r3, 4294967295
	and r20, r2, 0
	movd d0, d20
	movd d2, d18
	call r23, __muldi3
	neg r0, r0
	move.u d2, r0
	movd d0, d20
	call r23, __muldi3
	lsrx r2, r0, 31
	lsr_add r3, r2, r1, 31
	lsr r2, r0, 31
	add r0, r3, -1
	lsl r14, r15, 11
	move.u d20, r0
	movd d0, d18
	movd d2, d20
	call r23, __muldi3
	movd d18, d0
	move.u d2, r14
	movd d0, d20
	call r23, __muldi3
	move.u d0, r0
	add r1, r19, r1
	addc r0, r18, r0
	move.s d2, 0
	sd r22, -48, d2
	sub r15, r3, r1
	subc r14, r2, r0
	move.u d0, r14
	movd d2, d20
	call r23, __muldi3
	movd d18, d0
	and r1, r15, 4294967295
	and r0, r14, 0
	movd d2, d20
	call r23, __muldi3
	move.u d0, r0
	add r1, r19, r1
	addc r0, r18, r0
	add r15, r1, 4294967294
	addc r14, r0, 4294967295
	ld d16, r22, -24
	lslx r0, r17, 2
	lsl_add r0, r0, r16, 2
	lsl r1, r17, 2
	and r19, r1, 4294967292
	and r18, r0, 0
	and r21, r15, 4294967295
	and r20, r14, 0
	movd d0, d20
	movd d2, d18
	call r23, __muldi3
	sd r22, -40, d0
	move.u d0, r14
	sd r22, -32, d0
	movd d2, d18
	call r23, __muldi3
	movd d18, d0
	lsrx r0, r16, 30
	lsr_add r1, r0, r17, 30
	lsr r0, r16, 30
	and r1, r1, 4290772991
	and r0, r0, 0
	or r15, r1, 4194304
	or r14, r0, 0
	movd d0, d20
	movd d2, d14
	call r23, __muldi3
	movd d20, d0
	ld d0, r22, -32
	movd d2, d14
	call r23, __muldi3
	ld d2, r22, -40
	move.u d2, r2
	and r5, r19, 4294967292
	and r4, r18, 0
	add r3, r3, r5
	addc r2, r2, r4
	and r5, r21, 4294967295
	and r4, r20, 0
	add r3, r3, r5
	addc r2, r2, r4
	move.u d4, r18
	move.u d6, r20
	move.u d2, r2
	add r1, r7, r1
	addc r0, r6, r0
	add r1, r1, r5
	addc r0, r0, r4
	add r19, r1, r3
	addc r18, r0, r2
	lsr.u d0, r18, 21
	ld d2, r22, -48
	jneq r1, r3, .LBB0_9
// %bb.40:
	jneq r0, r2, .LBB0_9
// %bb.41:
// %bb.4:
	move r15, 0
	lsl r14, r17, 21
	movd d0, d18
	ld d16, r22, -64
	movd d2, d16
	call r23, __muldi3
	sub r1, r15, r1
	subc r0, r14, r0
	lw r3, r22, -56
	add r3, r3, -1
	move r2, 1024
	jges r3, r2, .LBB0_10
.LBB0_5:
	jgts r3, -1023, .LBB0_13
// %bb.6:
	ld d16, r22, -16
	jump .LBB0_24
.LBB0_7:
	and r7, r1, 4294967295
	and r6, r0, 2147483647
	move r11, 1
	move r10, 2146435072
	sub zero, r7, r11
	subc zero, r6, r10, ltu, .LBB0_11
// %bb.8:
	or r17, r1, 0
	or r16, r0, 524288
	jump .LBB0_24
.LBB0_9:
	lsrx r0, r18, 1
	lsr_add r19, r0, r19, 1
	lsr r18, r18, 1
	move r15, 0
	lsl r14, r17, 20
	movd d0, d18
	ld d16, r22, -64
	movd d2, d16
	call r23, __muldi3
	sub r1, r15, r1
	subc r0, r14, r0
	lw r3, r22, -56
	move r2, 1024
	jlts r3, r2, .LBB0_5
.LBB0_10:
	ld d16, r22, -16
.LBB0_23:
	or r17, r17, 0
	or r16, r16, 2146435072
	jump .LBB0_24
.LBB0_11:
	and r9, r3, 4294967295
	and r8, r2, 2147483647
	sub zero, r9, r11
	subc zero, r8, r10, ltu, .LBB0_14
// %bb.12:
	or r17, r3, 0
	or r16, r2, 524288
	jump .LBB0_24
.LBB0_13:
	add r2, r3, 1023
	lslx r3, r1, 1
	lsl_add r4, r3, r0, 1
	lsl r5, r1, 1
	sub zero, r5, r17
	subc r0, r4, r16, xgtu
	and r5, r19, 4294967295
	and r4, r18, 1048575
	move.s d2, r2
	move r7, 0
	lsl r6, r3, 20
	move.u d0, r0
	add r1, r5, r1
	addc r0, r4, r0
	add r1, r1, r7
	addc r0, r0, r6
	ld d16, r22, -16
	or r17, r1, r17
	or r16, r0, r16
	jump .LBB0_24
.LBB0_14:
	move r11, 0
	move r10, 2146435072
	jneq r7, r11, .LBB0_17
// %bb.42:
	jneq r6, r10, .LBB0_17
// %bb.43:
// %bb.15:
	jneq r9, r11, .LBB0_23
// %bb.44:
	jneq r8, r10, .LBB0_23
// %bb.45:
.LBB0_16:
	move r17, 0
	move r16, 2146959360
	jump .LBB0_24
.LBB0_17:
	jneq r9, r11, .LBB0_18
// %bb.46:
	jneq r8, r10, .LBB0_18
// %bb.47:
.LBB0_24:
	movd d0, d16
	ld d20, r22, -96
	ld d18, r22, -88
	ld d16, r22, -80
	ld d14, r22, -72
	ld d22, r22, -8
	jump r23
.LBB0_18:
	move.s d10, 0
	jneq r7, r11, .LBB0_49
// %bb.48:
	jeq r6, r10, .LBB0_25
.LBB0_49:
// %bb.19:
	jneq r9, r11, .LBB0_51
// %bb.50:
	jeq r8, r10, .LBB0_23
.LBB0_51:
// %bb.20:
	lsr.u d12, r6, 20
	move.s d10, 0
	move r6, 0
	jneq r13, r11, .LBB0_32
// %bb.52:
	jneq r12, r10, .LBB0_32
// %bb.53:
// %bb.21:
	move.u d6, r18
	jneq r7, r11, .LBB0_27
// %bb.54:
	jneq r6, r10, .LBB0_27
// %bb.55:
// %bb.22:
	clz r0, r1
	or r0, r0, 32, true, .LBB0_28
.LBB0_25:
	jneq r9, r11, .LBB0_24
// %bb.56:
	jneq r8, r10, .LBB0_24
// %bb.57:
	jump .LBB0_16
.LBB0_27:
	clz r0, r18
.LBB0_28:
	add r1, r0, -11
	lslx r6, r19, r1, sh32, .LBB0_30
// %bb.29:
	lsl r7, r18, r1
	or r18, r7, r6
	lsl r19, r19, r1, true, .LBB0_31
.LBB0_30:
	lsl r18, r19, r1
	move r19, 0
.LBB0_31:
	sub r6, 12, r0
.LBB0_32:
	lsr.u d0, r8, 20
	sd r22, -16, d16
	sd r22, -24, d18
	jneq r1, r11, .LBB0_3
// %bb.58:
	jneq r0, r10, .LBB0_3
// %bb.59:
// %bb.33:
	move.u d0, r14
	move.s d8, 0
	jneq r1, r9, .LBB0_35
// %bb.60:
	jneq r0, r8, .LBB0_35
// %bb.61:
// %bb.34:
	clz r0, r3
	or r0, r0, 32, true, .LBB0_36
.LBB0_35:
	clz r0, r14
.LBB0_36:
	add r1, r0, -11
	lslx r2, r15, r1, sh32, .LBB0_38
// %bb.37:
	lsl r3, r14, r1
	or r14, r3, r2
	lsl r15, r15, r1, true, .LBB0_39
.LBB0_38:
	lsl r14, r15, r1
	move r15, 0
.LBB0_39:
	add r0, r0, r6
	add r6, r0, -12, true, .LBB0_3
.Lfunc_end0:
	.size	__divdf3, .Lfunc_end0-__divdf3
	.section	.stack_sizes,"o",@progbits,.text.__divdf3
	.long	.Lfunc_begin0
	.byte	96
	.section	.text.__divdf3,"ax",@progbits
                                        // -- End function
	.addrsig
