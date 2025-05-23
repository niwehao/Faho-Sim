	.text
	.file	"muldf3.c"
	.section	.text.__muldf3,"ax",@progbits
	.globl	__muldf3                        // -- Begin function __muldf3
	.type	__muldf3,@function
__muldf3:                               // @__muldf3
.Lfunc_begin0:
// %bb.0:
	sd r22, 64, d22
	add r22, r22, 72
	sd r22, -48, d14
	sd r22, -56, d16
	sd r22, -64, d18
	sd r22, -72, d20
	lsr.u d4, r0, 20
	and r10, r5, 2047
	lsr.u d4, r2, 20
	and r11, r5, 2047
	xor r5, r3, r1
	xor r4, r2, r0
	and r13, r5, 0
	and r12, r4, 2147483648
	and r21, r1, 4294967295
	and r20, r0, 1048575
	and r15, r3, 4294967295
	and r14, r2, 1048575
	add r4, r10, -1
	lsr r4, r4, 1
	jgtu r4, 1022, .LBB0_9
// %bb.1:
	add r4, r11, -1
	move r5, 0
	lsr r4, r4, 1
	jgeu r4, 1023, .LBB0_9
// %bb.2:
	sw r22, -16, r5
	sw r22, -20, r11
	sw r22, -24, r10
	sd r22, -32, d12
.LBB0_3:
	lslx r0, r15, 11
	lsl_add r0, r0, r14, 11
	lsl r1, r15, 11
	and r17, r21, 4294967295
	and r16, r20, 0
	and r19, r1, 4294965248
	and r18, r0, 0
	movd d0, d18
	movd d2, d16
	call r23, __muldi3
	sd r22, -40, d0
	lsrx r0, r14, 21
	lsr_add r1, r0, r15, 21
	lsr r0, r14, 21
	and r1, r1, 2147483647
	and r0, r0, 0
	or r15, r1, 2147483648
	or r14, r0, 0
	movd d0, d14
	movd d2, d16
	call r23, __muldi3
	movd d16, d0
	move.u d0, r20
	or r21, r1, 1048576
	or r20, r0, 0
	movd d0, d18
	movd d2, d20
	call r23, __muldi3
	movd d18, d0
	movd d0, d14
	movd d2, d20
	call r23, __muldi3
	ld d8, r22, -40
	move.u d2, r8
	and r5, r17, 4294967295
	and r4, r16, 0
	and r7, r19, 4294965248
	and r6, r18, 0
	add r3, r7, r3
	addc r2, r6, r2
	add r5, r3, r5
	addc r4, r2, r4
	move r7, 0
	and r3, r9, 4294965248
	and r2, r8, 0
	move r6, r5
	or r3, r7, r3
	or r2, r6, r2
	move.u d8, r16
	move.u d10, r18
	move.u d4, r4
	add r1, r11, r1
	addc r0, r10, r0
	add r1, r1, r9
	addc r0, r0, r8
	add r1, r1, r5
	addc r0, r0, r4
	lw r4, r22, -24
	lw r5, r22, -20
	add r4, r4, r5
	lw r5, r22, -16
	add r4, r4, r5
	and r9, r1, 0
	and r8, r0, 1048576
	move.s d10, 0
	add r5, r4, -1023
	jneq r9, r11, .LBB0_11
// %bb.55:
	jneq r8, r10, .LBB0_11
// %bb.56:
// %bb.4:
	lsr.u d6, r6, 31
	lslx r4, r1, 1
	lsl_add r8, r4, r0, 1
	lsl r9, r1, 1
	or r1, r9, r7
	or r0, r8, r6
	lslx r4, r3, 1
	lsl_add r2, r4, r2, 1
	lsl r3, r3, 1
	ld d12, r22, -32
	move r4, 2047
	jges r5, r4, .LBB0_17
	jump .LBB0_5
.LBB0_9:
	and r7, r1, 4294967295
	and r6, r0, 2147483647
	move r9, 1
	move r8, 2146435072
	sub zero, r7, r9
	subc zero, r6, r8, ltu, .LBB0_13
// %bb.10:
	or r13, r1, 0
	or r12, r0, 524288
	jump .LBB0_40
.LBB0_11:
	add r5, r5, 1
	ld d12, r22, -32
	move r4, 2047
	jges r5, r4, .LBB0_17
.LBB0_5:
	jles r5, 0, .LBB0_20
// %bb.6:
	and r1, r1, 4294967295
	and r0, r0, 1048575
	move.s d4, r5
	move r7, 0
	lsl r6, r5, 20
	or r7, r7, r1
	or r6, r6, r0
.LBB0_7:
	move r1, 1
	move r0, 2147483648
	or r13, r7, r13
	or r12, r6, r12
	sub zero, r3, r1
	subc zero, r2, r0, ltu, .LBB0_18
// %bb.8:
	add r13, r13, 1
	addc r12, r12, 0
	jump .LBB0_40
.LBB0_13:
	and r5, r3, 4294967295
	and r4, r2, 2147483647
	sub zero, r5, r9
	subc zero, r4, r8, ltu, .LBB0_15
// %bb.14:
	or r13, r3, 0
	or r12, r2, 524288
	jump .LBB0_40
.LBB0_15:
	move r9, 0
	move r8, 2146435072
	jneq r7, r9, .LBB0_26
// %bb.57:
	jneq r6, r8, .LBB0_26
// %bb.58:
// %bb.16:
	move.s d0, 0
	jneq r5, r1, .LBB0_60
// %bb.59:
	jeq r4, r0, .LBB0_39
.LBB0_60:
.LBB0_17:
	or r13, r13, 0
	or r12, r12, 2146435072
.LBB0_40:
	movd d0, d12
	ld d20, r22, -72
	ld d18, r22, -64
	ld d16, r22, -56
	ld d14, r22, -48
	ld d22, r22, -8
	jump r23
.LBB0_18:
	move r1, 0
	move r0, 2147483648
	jneq r3, r1, .LBB0_40
// %bb.61:
	jneq r2, r0, .LBB0_40
// %bb.62:
// %bb.19:
	and r1, r7, 1
	and r0, r6, 0
	add r13, r13, r1
	addc r12, r12, r0
	jump .LBB0_40
.LBB0_20:
	sub r4, 1, r5
	jgeu r4, 64, .LBB0_40
// %bb.21:
	add r5, r5, 63
	lslx r6, r3, r5, sh32, .LBB0_34
// %bb.22:
	lsl r7, r2, r5
	or r6, r7, r6
	lsl r7, r3, r5
	move.s d10, 0
	lslx r8, r1, r5, sh32, .LBB0_23
	jump .LBB0_35
.LBB0_23:
	lsl r8, r1, r5
	move r9, 0
	sub zero, r7, r11
	subc r5, r6, r10, xnz
	lsrx r6, r2, r4, sh32, .LBB0_24
	jump .LBB0_36
.LBB0_24:
	lsr.u d6, r2, r4
	or r3, r9, r7
	or r2, r8, r6
	move.u d6, r5
	or r3, r3, r7
	or r2, r2, r6
	lsrx r5, r0, r4, sh32, .LBB0_25
	jump .LBB0_37
.LBB0_25:
	lsr.u d6, r0, r4
	jump .LBB0_7
.LBB0_26:
	jneq r5, r9, .LBB0_29
// %bb.63:
	jneq r4, r8, .LBB0_29
// %bb.64:
// %bb.27:
	move.s d0, 0
	jneq r7, r1, .LBB0_17
// %bb.65:
	jneq r6, r0, .LBB0_17
// %bb.66:
.LBB0_39:
	move r13, 0
	move r12, 2146959360
	jump .LBB0_40
.LBB0_29:
	move.s d8, 0
	jneq r7, r9, .LBB0_68
// %bb.67:
	jeq r6, r8, .LBB0_40
.LBB0_68:
// %bb.30:
	jneq r5, r9, .LBB0_70
// %bb.69:
	jeq r4, r8, .LBB0_40
.LBB0_70:
// %bb.31:
	lsr.u d8, r6, 20
	move.s d6, 0
	move r16, 0
	sd r22, -32, d12
	jneq r9, r7, .LBB0_46
// %bb.71:
	jneq r8, r6, .LBB0_46
// %bb.72:
// %bb.32:
	move.u d8, r20
	jneq r9, r7, .LBB0_41
// %bb.73:
	jneq r8, r6, .LBB0_41
// %bb.74:
// %bb.33:
	clz r0, r1
	or r0, r0, 32, true, .LBB0_42
.LBB0_34:
	lsl r6, r3, r5
	move r7, 0
	move.s d10, 0
	lslx r8, r1, r5, sh32, .LBB0_23
.LBB0_35:
	lsl r9, r0, r5
	or r8, r9, r8
	lsl r9, r1, r5
	sub zero, r7, r11
	subc r5, r6, r10, xnz
	lsrx r6, r2, r4, sh32, .LBB0_24
.LBB0_36:
	lsr r7, r3, r4
	or r7, r6, r7
	lsr r6, r2, r4
	or r3, r9, r7
	or r2, r8, r6
	move.u d6, r5
	or r3, r3, r7
	or r2, r2, r6
	lsrx r5, r0, r4, sh32, .LBB0_25
.LBB0_37:
	lsr r6, r1, r4
	or r7, r5, r6
	lsr r6, r0, r4, true, .LBB0_7
.LBB0_41:
	clz r0, r20
.LBB0_42:
	add r1, r0, -11
	lslx r8, r21, r1, sh32, .LBB0_44
// %bb.43:
	lsl r9, r20, r1
	or r20, r9, r8
	lsl r21, r21, r1, true, .LBB0_45
.LBB0_44:
	lsl r20, r21, r1
	move r21, 0
.LBB0_45:
	sub r16, 12, r0
.LBB0_46:
	lsr.u d0, r4, 20
	sw r22, -24, r10
	sw r22, -20, r11
	jneq r1, r7, .LBB0_49
// %bb.75:
	jneq r0, r6, .LBB0_49
// %bb.76:
// %bb.47:
	move.u d0, r14
	move.s d4, 0
	jneq r1, r5, .LBB0_50
// %bb.77:
	jneq r0, r4, .LBB0_50
// %bb.78:
// %bb.48:
	clz r0, r3
	or r0, r0, 32, true, .LBB0_51
.LBB0_49:
	sw r22, -16, r16
	jump .LBB0_3
.LBB0_50:
	clz r0, r14
.LBB0_51:
	add r1, r0, -11
	lslx r2, r15, r1, sh32, .LBB0_53
// %bb.52:
	lsl r3, r14, r1
	or r14, r3, r2
	lsl r15, r15, r1, true, .LBB0_54
.LBB0_53:
	lsl r14, r15, r1
	move r15, 0
.LBB0_54:
	sub r0, r16, r0
	add r0, r0, 12
	sw r22, -16, r0
	jump .LBB0_3
.Lfunc_end0:
	.size	__muldf3, .Lfunc_end0-__muldf3
	.section	.stack_sizes,"o",@progbits,.text.__muldf3
	.long	.Lfunc_begin0
	.byte	72
	.section	.text.__muldf3,"ax",@progbits
                                        // -- End function
	.addrsig
