	.text
	.file	"mulsf3.c"
	.section	.text.__mulsf3,"ax",@progbits
	.globl	__mulsf3                        // -- Begin function __mulsf3
	.type	__mulsf3,@function
__mulsf3:                               // @__mulsf3
.Lfunc_begin0:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sd r22, -16, d14
	sd r22, -24, d16
	lsr r2, r0, 23
	and r15, r2, 255
	lsr r2, r1, 23
	and r16, r2, 255
	xor r2, r1, r0
	and r14, r2, -2147483648
	and r2, r0, 8388607
	and r3, r1, 8388607
	add r4, r15, -1
	jgtu r4, 253, .LBB0_7
// %bb.1:
	move r17, 0
	add r4, r16, -1
	jgeu r4, 254, .LBB0_7
.LBB0_2:
	or r0, r2, 8388608
	lsl r1, r3, 8
	or r1, r1, -2147483648
	move.u d2, r0
	move.u d0, r1
	call r23, __muldi3
	add r2, r15, r16
	add r2, r2, r17
	add r2, r2, -127
	and r3, r0, 8388608
	jneq r3, 0, .LBB0_9
// %bb.3:
	lsr r3, r1, 31
	lsl_add r0, r3, r0, 1
	lsl r1, r1, 1
	jges r2, 255, .LBB0_15
	jump .LBB0_4
.LBB0_7:
	and r4, r0, 2147483647
	move r5, 2139095041
	jltu r4, r5, .LBB0_11
// %bb.8:
	or r14, r0, 4194304
	jump .LBB0_30
.LBB0_9:
	add r2, r2, 1
	jges r2, 255, .LBB0_15
.LBB0_4:
	jles r2, 0, .LBB0_16
// %bb.5:
	and r3, r0, 8388607
	lsl_add r2, r3, r2, 23
	move r3, -2147483647
	or r14, r2, r14
	jltu r1, r3, .LBB0_18
.LBB0_6:
	add r14, r14, 1, true, .LBB0_30
.LBB0_11:
	and r0, r1, 2147483647
	jltu r0, r5, .LBB0_13
// %bb.12:
	or r14, r1, 4194304
	jump .LBB0_30
.LBB0_13:
	move r1, 2139095040
	jneq r4, r1, .LBB0_20
// %bb.14:
	jeq r0, 0, .LBB0_29
.LBB0_15:
	or r14, r14, 2139095040
.LBB0_30:
	move r0, r14
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.LBB0_16:
	sub r3, 1, r2
	jgeu r3, 32, .LBB0_30
// %bb.17:
	add r2, r2, 31
	lsl r4, r1, r2
	move r5, 0
	sub r4, r4, r5, neq
	lsl r2, r0, r2
	lsr r5, r1, r3
	or r2, r2, r5
	or r1, r2, r4
	lsr r2, r0, r3
	move r3, -2147483647
	or r14, r2, r14
	jgeu r1, r3, .LBB0_6
.LBB0_18:
	move r3, -2147483648
	jneq r1, r3, .LBB0_30
// %bb.19:
	and r0, r2, 1
	add r14, r14, r0, true, .LBB0_30
.LBB0_20:
	jneq r0, r1, .LBB0_23
// %bb.21:
	jneq r4, 0, .LBB0_15
.LBB0_29:
	move r14, 2143289344
	jump .LBB0_30
.LBB0_23:
	jeq r4, 0, .LBB0_30
// %bb.24:
	jeq r0, 0, .LBB0_30
// %bb.25:
	clz r5, r2
	add r1, r5, -8
	lsr r4, r4, 23, nz, .LBB0_31
// %bb.26:
	sub r17, 9, r5
	jneq r4, 0, .LBB0_32
.LBB0_27:
	lsl r2, r2, r1
	lsr r0, r0, 23
	jneq r0, 0, .LBB0_2
	jump .LBB0_33
.LBB0_31:
	move r1, 0
	sub r17, 9, r5
	jeq r4, 0, .LBB0_27
.LBB0_32:
	move r17, 0
	lsl r2, r2, r1
	lsr r0, r0, 23, nz, .LBB0_2
.LBB0_33:
	clz r0, r3
	add r1, r0, -8
	lsl r3, r3, r1
	sub r0, r17, r0
	add r17, r0, 9, true, .LBB0_2
.Lfunc_end0:
	.size	__mulsf3, .Lfunc_end0-__mulsf3
	.section	.stack_sizes,"o",@progbits,.text.__mulsf3
	.long	.Lfunc_begin0
	.byte	24
	.section	.text.__mulsf3,"ax",@progbits
                                        // -- End function
	.addrsig
