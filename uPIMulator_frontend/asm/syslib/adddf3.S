	.text
	.file	"adddf3.c"
	.section	.text.__adddf3,"ax",@progbits
	.globl	__adddf3                        // -- Begin function __adddf3
	.type	__adddf3,@function
__adddf3:                               // @__adddf3
.Lfunc_begin0:
// %bb.0:
	and r7, r1, 4294967295
	and r6, r0, 2147483647
	add r5, r7, 4294967295
	addc r4, r6, 4294967295
	move r11, 4294967294
	move r10, 2146435071
	and r9, r3, 4294967295
	and r8, r2, 2147483647
	sub zero, r5, r11
	subc zero, r4, r10, xgtu, .LBB0_2
// %bb.1:
	add r5, r9, 4294967295
	addc r4, r8, 4294967295
	move r11, 4294967295
	move r10, 2146435071
	sub zero, r5, r11
	subc zero, r4, r10, geu, .LBB0_2
.LBB0_16:
	sub zero, r9, r7
	subc zero, r8, r6, xleu, .LBB0_18
// %bb.17:
	movd d4, d0
	movd d0, d2
	jump .LBB0_19
.LBB0_2:
	move r5, 1
	move r4, 2146435072
	sub zero, r7, r5
	subc zero, r6, r4, ltu, .LBB0_4
// %bb.3:
	or r5, r1, 0
	or r4, r0, 524288
	movd d0, d4
	jump r23
.LBB0_18:
	movd d4, d2
.LBB0_19:
	lsr.u d8, r0, 20
	lsr.u d2, r4, 20
	and r3, r3, 2047
	and r7, r1, 4294967295
	and r6, r0, 1048575
	and r2, r9, 2047
	jeq r2, 0, .LBB0_20
// %bb.27:
	and r11, r5, 4294967295
	and r10, r4, 1048575
	jneq r3, 0, .LBB0_35
	jump .LBB0_28
.LBB0_4:
	sub zero, r9, r5
	subc zero, r8, r4, ltu, .LBB0_6
// %bb.5:
	or r5, r3, 0
	or r4, r2, 524288
	movd d0, d4
	jump r23
.LBB0_20:
	move.u d8, r6
	move.s d10, 0
	jneq r9, r11, .LBB0_22
// %bb.71:
	jneq r8, r10, .LBB0_22
// %bb.72:
// %bb.21:
	clz r2, r1
	or r2, r2, 32
	add r8, r2, -11
	lslx r9, r7, r8, sh32, .LBB0_25
	jump .LBB0_24
.LBB0_25:
	lsl r6, r7, r8
	move r7, 0
	sub r2, 12, r2
	and r11, r5, 4294967295
	and r10, r4, 1048575
	jneq r3, 0, .LBB0_35
	jump .LBB0_28
.LBB0_6:
	move r5, 0
	move r4, 2146435072
	jneq r7, r5, .LBB0_10
// %bb.73:
	jneq r6, r4, .LBB0_10
// %bb.74:
// %bb.7:
	xor r3, r3, r1
	xor r2, r2, r0
	move r5, 0
	move r4, 2147483648
	jneq r3, r5, .LBB0_9
// %bb.75:
	jneq r2, r4, .LBB0_9
// %bb.76:
// %bb.8:
	move r1, 0
	move r0, 2146959360
.LBB0_9:
	jump r23
.LBB0_22:
	clz r2, r6
	add r8, r2, -11
	lslx r9, r7, r8, sh32, .LBB0_25
.LBB0_24:
	lsl r10, r6, r8
	or r6, r10, r9
	lsl r7, r7, r8
	sub r2, 12, r2
	and r11, r5, 4294967295
	and r10, r4, 1048575
	jneq r3, 0, .LBB0_35
.LBB0_28:
	move.u d8, r10
	move.s d12, 0
	jneq r9, r13, .LBB0_30
// %bb.77:
	jneq r8, r12, .LBB0_30
// %bb.78:
// %bb.29:
	clz r3, r5
	or r3, r3, 32
	add r8, r3, -11
	lslx r9, r11, r8, sh32, .LBB0_33
	jump .LBB0_32
.LBB0_33:
	lsl r10, r11, r8
	move r11, 0, true, .LBB0_34
.LBB0_30:
	clz r3, r10
	add r8, r3, -11
	lslx r9, r11, r8, sh32, .LBB0_33
.LBB0_32:
	lsl r12, r10, r8
	or r10, r12, r9
	lsl r11, r11, r8
.LBB0_34:
	sub r3, 12, r3
.LBB0_35:
	xor r5, r1, r5
	xor r4, r0, r4
	lslx r8, r7, 3
	lsl_add r8, r8, r6, 3
	lsl r9, r7, 3
	lslx r6, r11, 3
	lsl_add r6, r6, r10, 3
	lsl r7, r11, 3
	or r7, r7, 0
	or r6, r6, 8388608
	sub r3, r2, r3, z, .LBB0_36
// %bb.37:
	move.s d10, 1
	jgtu r3, 63, .LBB0_45
// %bb.38:
	sub r12, 64, r3
	lslx r10, r7, r12, sh32, .LBB0_40
// %bb.39:
	lsl r11, r6, r12
	or r10, r11, r10
	lsl r11, r7, r12
	move.s d12, 0
	sub zero, r11, r13
	subc r10, r10, r12, xnz
	lsrx r11, r6, r3, sh32, .LBB0_43
	jump .LBB0_42
.LBB0_43:
	lsr.u d12, r6, r3
	jump .LBB0_44
.LBB0_36:
	movd d10, d6
.LBB0_45:
	move.s d12, -1
	or r7, r9, 0
	or r6, r8, 8388608
	sub zero, r5, r13
	subc zero, r4, r12, xles, .LBB0_46
.LBB0_54:
	add r7, r11, r7
	addc r6, r10, r6
	and r5, r7, 0
	and r4, r6, 16777216
	move.s d8, 0
	jneq r5, r9, .LBB0_80
// %bb.79:
	jeq r4, r8, .LBB0_56
.LBB0_80:
// %bb.55:
	and r5, r7, 1
	and r4, r6, 0
	lsrx r3, r6, 1
	lsr_add r9, r3, r7, 1
	lsr r8, r6, 1
	or r7, r9, r5
	or r6, r8, r4
	add r2, r2, 1
	move r3, 2047
	and r1, r1, 0
	and r0, r0, 2147483648
	jges r2, r3, .LBB0_57
	jump .LBB0_58
.LBB0_40:
	lsl r10, r7, r12
	move r11, 0
	move.s d12, 0
	sub zero, r11, r13
	subc r10, r10, r12, xnz
	lsrx r11, r6, r3, sh32, .LBB0_43
.LBB0_42:
	lsr r12, r7, r3
	or r13, r11, r12
	lsr r12, r6, r3
.LBB0_44:
	move.u d6, r10
	or r11, r13, r7
	or r10, r12, r6
	move.s d12, -1
	or r7, r9, 0
	or r6, r8, 8388608
	sub zero, r5, r13
	subc zero, r4, r12, xgts, .LBB0_54
.LBB0_46:
	sub r7, r7, r11
	subc r6, r6, r10
	move.s d4, 0
	jneq r7, r5, .LBB0_82
// %bb.81:
	jeq r6, r4, .LBB0_70
.LBB0_82:
// %bb.47:
	lsr.u d8, r6, 23
	move.s d4, 0
	jneq r9, r5, .LBB0_56
// %bb.83:
	jneq r8, r4, .LBB0_56
// %bb.84:
// %bb.48:
	move.u d8, r6
	jneq r9, r5, .LBB0_50
// %bb.85:
	jneq r8, r4, .LBB0_50
// %bb.86:
// %bb.49:
	clz r3, r7
	or r3, r3, 32
	add r3, r3, -8
	lslx r4, r7, r3, sh32, .LBB0_53
	jump .LBB0_52
.LBB0_53:
	lsl r6, r7, r3
	move r7, 0
	sub r2, r2, r3
.LBB0_56:
	move r3, 2047
	and r1, r1, 0
	and r0, r0, 2147483648
	jlts r2, r3, .LBB0_58
.LBB0_57:
	or r5, r1, 0
	or r4, r0, 2146435072
	movd d0, d4
	jump r23
.LBB0_10:
	jneq r9, r5, .LBB0_12
// %bb.87:
	jneq r8, r4, .LBB0_12
// %bb.88:
// %bb.11:
	movd d4, d2
	movd d0, d4
	jump r23
.LBB0_12:
	move.s d10, 0
	jneq r7, r11, .LBB0_90
// %bb.89:
	jeq r6, r10, .LBB0_13
.LBB0_90:
// %bb.15:
	movd d4, d0
	jneq r9, r11, .LBB0_16
// %bb.91:
	jneq r8, r10, .LBB0_16
// %bb.92:
	jump .LBB0_70
.LBB0_50:
	clz r3, r6
	add r3, r3, -8
	lslx r4, r7, r3, sh32, .LBB0_53
.LBB0_52:
	lsl r5, r6, r3
	or r6, r5, r4
	lsl r7, r7, r3
	sub r2, r2, r3
	move r3, 2047
	and r1, r1, 0
	and r0, r0, 2147483648
	jges r2, r3, .LBB0_57
.LBB0_58:
	jgts r2, 0, .LBB0_66
// %bb.59:
	add r3, r2, 63
	sub r2, 1, r2
	lslx r4, r7, r3, sh32, .LBB0_61
// %bb.60:
	lsl r5, r6, r3
	or r4, r5, r4
	lsl r5, r7, r3
	move.s d8, 0
	sub zero, r5, r9
	subc r3, r4, r8, xnz
	lsrx r4, r6, r2, sh32, .LBB0_64
	jump .LBB0_63
.LBB0_64:
	lsr.u d4, r6, r2
	jump .LBB0_65
.LBB0_61:
	lsl r4, r7, r3
	move r5, 0
	move.s d8, 0
	sub zero, r5, r9
	subc r3, r4, r8, xnz
	lsrx r4, r6, r2, sh32, .LBB0_64
.LBB0_63:
	lsr r5, r7, r2
	or r5, r4, r5
	lsr r4, r6, r2
.LBB0_65:
	move.u d2, r3
	or r7, r5, r3
	or r6, r4, r2
	move r2, 0
.LBB0_66:
	lsrx r3, r6, 3
	lsr_add r5, r3, r7, 3
	lsr r4, r6, 3
	and r5, r5, 4294967295
	and r4, r4, 1048575
	move.s d2, r2
	move r9, 0
	lsl r8, r3, 20
	or r1, r5, r1
	or r0, r4, r0
	or r1, r1, r9
	or r0, r0, r8
	move r2, 4
	and r3, r7, 7
	sub r2, r3, r2, gtu
	move.u d4, r2
	add r1, r1, r5
	addc r0, r0, r4
	jneq r3, 4, .LBB0_68
// %bb.67:
	and r3, r1, 1
	and r2, r0, 0
	jump .LBB0_69
.LBB0_68:
	move.s d2, 0
.LBB0_69:
	add r5, r3, r1
	addc r4, r2, r0
.LBB0_70:
	movd d0, d4
	jump r23
.LBB0_13:
	movd d4, d2
	jneq r9, r11, .LBB0_70
// %bb.93:
	jneq r8, r10, .LBB0_70
// %bb.94:
// %bb.14:
	and r5, r3, r1
	and r4, r2, r0
	movd d0, d4
	jump r23
.Lfunc_end0:
	.size	__adddf3, .Lfunc_end0-__adddf3
	.section	.stack_sizes,"o",@progbits,.text.__adddf3
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__adddf3,"ax",@progbits
                                        // -- End function
	.addrsig
