	.text
	.file	"muldc3.c"
	.section	.text.__muldc3,"ax",@progbits
	.globl	__muldc3                        // -- Begin function __muldc3
	.type	__muldc3,@function
__muldc3:                               // @__muldc3
.Lfunc_begin0:
// %bb.0:
	sd r22, 128, d22
	add r22, r22, 136
	sd r22, -112, d14
	sd r22, -120, d16
	sd r22, -128, d18
	sd r22, -136, d20
	ld d16, r22, -152
	movd d14, d6
	movd d20, d4
	movd d18, d2
	sw r22, -88, r0
	movd d0, d18
	movd d2, d14
	call r23, __muldf3
	sd r22, -64, d0
	movd d0, d20
	movd d2, d16
	call r23, __muldf3
	sd r22, -56, d0
	sd r22, -72, d18
	movd d0, d18
	sd r22, -80, d16
	movd d2, d16
	call r23, __muldf3
	movd d18, d0
	sd r22, -104, d20
	movd d0, d20
	sd r22, -96, d14
	movd d2, d14
	call r23, __muldf3
	movd d20, d0
	ld d0, r22, -64
	ld d2, r22, -56
	call r23, __subdf3
	movd d14, d0
	sd r22, -40, d20
	movd d0, d20
	sd r22, -32, d18
	movd d2, d18
	call r23, __adddf3
	movd d16, d0
	movd d0, d14
	movd d2, d14
	call r23, __unorddf2
	jeq r0, 0, .LBB0_40
// %bb.1:
	movd d0, d16
	sd r22, -48, d16
	movd d2, d16
	call r23, __unorddf2
	jeq r0, 0, .LBB0_2
// %bb.3:
	sd r22, -24, d14
	ld d0, r22, -80
	ld d0, r22, -96
	lw r0, r22, -88
	ld d0, r22, -72
	and r15, r1, 4294967295
	and r14, r0, 2147483647
	move r17, 0
	move r16, 2146435072
	movd d0, d14
	movd d2, d16
	call r23, __eqdf2
	move r18, 0
	sub r19, r0, r18, eq
	ld d20, r22, -104
	and r21, r21, 4294967295
	and r20, r20, 2147483647
	movd d0, d20
	movd d2, d16
	call r23, __eqdf2
	sub r0, r0, r18, eq
	or r0, r19, r0
	sw r22, -16, r0
	jneq r0, 1, .LBB0_13
// %bb.4:
	move r17, 0
	move r16, 2146435072
	movd d0, d20
	movd d2, d16
	call r23, __eqdf2
	sub r19, r0, r18, eq
	movd d0, d14
	movd d2, d16
	call r23, __eqdf2
	sub r2, r0, r18, eq
	move.s d14, 0
	move r1, 0
	move r0, 1072693248
	movd d16, d14
	jneq r2, 0, .LBB0_5
// %bb.6:
	ld d20, r22, -104
	jneq r19, 0, .LBB0_7
.LBB0_8:
	ld d0, r22, -96
	movd d2, d0
	call r23, __unorddf2
	jneq r0, 0, .LBB0_9
.LBB0_10:
	ld d0, r22, -72
	and r19, r1, 0
	and r18, r0, 2147483648
	and r21, r21, 0
	and r20, r20, 2147483648
	ld d0, r22, -80
	movd d2, d0
	call r23, __unorddf2
	jneq r0, 0, .LBB0_11
.LBB0_12:
	or r1, r17, r19
	or r0, r16, r18
	sd r22, -72, d0
	or r1, r15, r21
	or r0, r14, r20
	sd r22, -104, d0
.LBB0_13:
	ld d16, r22, -96
	and r19, r17, 4294967295
	and r18, r16, 2147483647
	ld d0, r22, -80
	and r21, r1, 4294967295
	and r20, r0, 2147483647
	move r3, 0
	move r2, 2146435072
	movd d0, d20
	call r23, __eqdf2
	ld d14, r22, -24
	jeq r0, 0, .LBB0_15
// %bb.14:
	move r3, 0
	move r2, 2146435072
	movd d0, d18
	call r23, __nedf2
	jeq r0, 0, .LBB0_15
// %bb.24:
	movd d20, d16
	lw r0, r22, -16
	and r0, r0, 1
	lw r18, r22, -88
	jz r0, .LBB0_26
// %bb.25:
	ld d0, r22, -104
	sd r22, -104, d0
	ld d16, r22, -80
	jump .LBB0_39
.LBB0_2:
	lw r18, r22, -88
	ld d16, r22, -48
	jump .LBB0_41
.LBB0_15:
	move r1, 0
	move r0, 1072693248
	sd r22, -56, d0
	move r17, 0
	move r16, 2146435072
	movd d0, d20
	movd d2, d16
	call r23, __eqdf2
	move r21, 0
	sub r20, r0, r21, eq
	movd d0, d18
	movd d2, d16
	call r23, __eqdf2
	sub r0, r0, r21, eq
	move.s d14, 0
	movd d2, d14
	jneq r0, 0, .LBB0_16
// %bb.17:
	sd r22, -64, d2
	jneq r20, 0, .LBB0_18
.LBB0_19:
	ld d0, r22, -72
	movd d2, d0
	call r23, __unorddf2
	jneq r0, 0, .LBB0_20
.LBB0_21:
	ld d0, r22, -96
	and r19, r1, 0
	and r18, r0, 2147483648
	ld d0, r22, -80
	and r17, r1, 0
	and r16, r0, 2147483648
	ld d0, r22, -104
	movd d2, d0
	call r23, __unorddf2
	jneq r0, 0, .LBB0_22
.LBB0_23:
	ld d0, r22, -64
	or r21, r1, r19
	or r20, r0, r18
	or r17, r15, r17
	or r16, r14, r16
	lw r0, r22, -88
	ld d0, r22, -104
	sd r22, -104, d0
.LBB0_39:
	sd r22, -96, d20
	movd d0, d20
	ld d18, r22, -72
	movd d2, d18
	call r23, __muldf3
	movd d14, d0
	movd d0, d16
	ld d20, r22, -104
	movd d2, d20
	call r23, __muldf3
	movd d2, d0
	movd d0, d14
	call r23, __subdf3
	move r3, 0
	move r2, 2146435072
	sd r22, -80, d2
	call r23, __muldf3
	movd d14, d0
	movd d0, d16
	movd d2, d18
	call r23, __muldf3
	movd d16, d0
	ld d0, r22, -96
	movd d2, d20
	call r23, __muldf3
	movd d2, d16
	call r23, __adddf3
	ld d2, r22, -80
	call r23, __muldf3
	movd d16, d0
.LBB0_40:
	lw r18, r22, -88
.LBB0_41:
	sd r18, 0, d14
	sd r18, 8, d16
	ld d20, r22, -136
	ld d18, r22, -128
	ld d16, r22, -120
	ld d14, r22, -112
	ld d22, r22, -8
	jump r23
.LBB0_5:
	movd d16, d0
	ld d20, r22, -104
	jeq r19, 0, .LBB0_8
.LBB0_7:
	movd d14, d0
	ld d0, r22, -96
	movd d2, d0
	call r23, __unorddf2
	jeq r0, 0, .LBB0_10
.LBB0_9:
	ld d0, r22, -96
	and r1, r1, 0
	and r0, r0, 2147483648
	sd r22, -96, d0
	jump .LBB0_10
.LBB0_26:
	ld d0, r22, -40
	and r1, r1, 4294967295
	and r0, r0, 2147483647
	move r3, 0
	move r2, 2146435072
	call r23, __eqdf2
	ld d16, r22, -48
	jeq r0, 0, .LBB0_30
// %bb.27:
	ld d0, r22, -32
	and r1, r1, 4294967295
	and r0, r0, 2147483647
	move r3, 0
	move r2, 2146435072
	call r23, __eqdf2
	jeq r0, 0, .LBB0_30
// %bb.28:
	ld d0, r22, -64
	and r1, r1, 4294967295
	and r0, r0, 2147483647
	move r3, 0
	move r2, 2146435072
	call r23, __eqdf2
	jeq r0, 0, .LBB0_30
// %bb.29:
	ld d0, r22, -56
	and r1, r1, 4294967295
	and r0, r0, 2147483647
	move r3, 0
	move r2, 2146435072
	call r23, __nedf2
	jneq r0, 0, .LBB0_41
.LBB0_30:
	ld d0, r22, -72
	movd d2, d0
	call r23, __unorddf2
	ld d14, r22, -104
	jneq r0, 0, .LBB0_31
.LBB0_32:
	movd d16, d20
	movd d0, d14
	movd d2, d14
	call r23, __unorddf2
	jneq r0, 0, .LBB0_33
// %bb.34:
	movd d0, d16
	movd d2, d16
	call r23, __unorddf2
	jneq r0, 0, .LBB0_35
.LBB0_36:
	ld d0, r22, -80
	movd d2, d0
	call r23, __unorddf2
	movd d20, d16
	jneq r0, 0, .LBB0_37
.LBB0_38:
	ld d16, r22, -80
	sd r22, -104, d14
	jump .LBB0_39
.LBB0_16:
	ld d2, r22, -56
	sd r22, -64, d2
	jeq r20, 0, .LBB0_19
.LBB0_18:
	ld d14, r22, -56
	ld d0, r22, -72
	movd d2, d0
	call r23, __unorddf2
	jeq r0, 0, .LBB0_21
.LBB0_20:
	ld d0, r22, -72
	and r1, r1, 0
	and r0, r0, 2147483648
	sd r22, -72, d0
	jump .LBB0_21
.LBB0_11:
	ld d0, r22, -80
	and r1, r1, 0
	and r0, r0, 2147483648
	sd r22, -80, d0
	jump .LBB0_12
.LBB0_22:
	ld d0, r22, -104
	and r1, r1, 0
	and r0, r0, 2147483648
	sd r22, -104, d0
	jump .LBB0_23
.LBB0_31:
	ld d0, r22, -72
	and r1, r1, 0
	and r0, r0, 2147483648
	sd r22, -72, d0
	jump .LBB0_32
.LBB0_33:
	and r15, r15, 0
	and r14, r14, 2147483648
	movd d0, d16
	movd d2, d16
	call r23, __unorddf2
	jeq r0, 0, .LBB0_36
.LBB0_35:
	and r17, r17, 0
	and r16, r16, 2147483648
	jump .LBB0_36
.LBB0_37:
	ld d0, r22, -80
	and r1, r1, 0
	and r0, r0, 2147483648
	sd r22, -80, d0
	jump .LBB0_38
.Lfunc_end0:
	.size	__muldc3, .Lfunc_end0-__muldc3
	.section	.stack_sizes,"o",@progbits,.text.__muldc3
	.long	.Lfunc_begin0
	.ascii	"\210\001"
	.section	.text.__muldc3,"ax",@progbits
                                        // -- End function
	.addrsig
