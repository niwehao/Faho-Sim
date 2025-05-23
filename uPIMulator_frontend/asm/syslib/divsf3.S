	.text
	.file	"divsf3.c"
	.section	.text.__divsf3,"ax",@progbits
	.globl	__divsf3                        // -- Begin function __divsf3
	.type	__divsf3,@function
__divsf3:                               // @__divsf3
.Lfunc_begin0:
// %bb.0:
	sd r22, 32, d22
	add r22, r22, 40
	sd r22, -16, d14
	sd r22, -24, d16
	sd r22, -32, d18
	sd r22, -40, d20
	lsr r2, r0, 23
	and r2, r2, 255
	lsr r3, r1, 23
	and r3, r3, 255
	xor r4, r1, r0
	and r14, r4, -2147483648
	and r20, r0, 8388607
	and r4, r1, 8388607
	add r5, r2, -1
	jgtu r5, 253, .LBB0_6
// %bb.1:
	move r6, 0
	add r5, r3, -1
	jgeu r5, 254, .LBB0_6
.LBB0_2:
	or r15, r4, 8388608
	sub r0, r2, r3
	add r21, r6, r0
	lsl r0, r15, 8
	move r1, 1963258675
	lsl_sub r1, r1, r15, 8
	move.u d18, r1
	move.u d16, r0
	movd d0, d18
	movd d2, d16
	call r23, __muldi3
	neg r0, r0
	move.u d0, r0
	movd d2, d18
	call r23, __muldi3
	lsrx r2, r0, 31
	lsr_add r3, r2, r1, 31
	lsr r2, r0, 31
	and r19, r3, 4294967295
	and r18, r2, 0
	movd d0, d18
	movd d2, d16
	call r23, __muldi3
	neg r0, r0
	move.u d2, r0
	movd d0, d18
	call r23, __muldi3
	lsrx r2, r0, 31
	lsr_add r3, r2, r1, 31
	lsr r2, r0, 31
	and r19, r3, 4294967295
	and r18, r2, 0
	movd d0, d18
	movd d2, d16
	call r23, __muldi3
	neg r0, r0
	move.u d2, r0
	movd d0, d18
	call r23, __muldi3
	lsrx r2, r0, 31
	lsr_add r3, r2, r1, 31
	lsr r2, r0, 31
	add r0, r3, -2
	move.u d0, r0
	lsl r2, r20, 1
	or r2, r2, 16777216
	move.u d2, r2
	call r23, __muldi3
	movd d16, d0
	lsr.u d0, r16, 24
	jneq r1, 0, .LBB0_8
// %bb.3:
	lsl r18, r20, 24
	move r0, r15
	move r1, r16
	call r23, __mulsi3
	sub r0, r18, r0
	add r21, r21, -1
	jges r21, 128, .LBB0_16
	jump .LBB0_4
.LBB0_6:
	and r6, r0, 2147483647
	move r7, 2139095041
	jltu r6, r7, .LBB0_10
// %bb.7:
	or r0, r0, 4194304
	jump .LBB0_13
.LBB0_8:
	lsr.u d16, r16, 1
	lsl r18, r20, 23
	move r0, r15
	move r1, r17
	call r23, __mulsi3
	sub r0, r18, r0
	move r16, r17
	jlts r21, 128, .LBB0_4
.LBB0_16:
	or r0, r14, 2139095040
	jump .LBB0_13
.LBB0_4:
	jgts r21, -127, .LBB0_12
.LBB0_18:
	move r0, r14, true, .LBB0_13
.LBB0_10:
	and r5, r1, 2147483647
	jltu r5, r7, .LBB0_14
// %bb.11:
	or r0, r1, 4194304
	jump .LBB0_13
.LBB0_12:
	lsl r0, r0, 1
	sub r0, r0, r15, gtu
	and r1, r16, 8388607
	lsl_add r1, r1, r21, 23
	add r0, r1, r0
	add r0, r0, 1065353216
	or r0, r0, r14
.LBB0_13:
	ld d20, r22, -40
	ld d18, r22, -32
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.LBB0_14:
	move r1, 2139095040
	jneq r6, r1, .LBB0_17
// %bb.15:
	move r0, 2143289344
	jeq r5, r1, .LBB0_13
	jump .LBB0_16
.LBB0_17:
	jeq r5, r1, .LBB0_18
// %bb.19:
	jeq r6, 0, .LBB0_24
// %bb.20:
	jeq r5, 0, .LBB0_16
// %bb.21:
	clz r1, r20
	add r0, r1, -8
	lsr r7, r6, 23, nz, .LBB0_28
// %bb.22:
	sub r6, 9, r1
	jneq r7, 0, .LBB0_29
.LBB0_23:
	lsl r20, r20, r0
	lsr r0, r5, 23
	jneq r0, 0, .LBB0_2
	jump .LBB0_30
.LBB0_24:
	jneq r5, 0, .LBB0_18
// %bb.25:
	move r14, 2143289344
	jump .LBB0_18
.LBB0_28:
	move r0, 0
	sub r6, 9, r1
	jeq r7, 0, .LBB0_23
.LBB0_29:
	move r6, 0
	lsl r20, r20, r0
	lsr r0, r5, 23, nz, .LBB0_2
.LBB0_30:
	clz r0, r4
	add r1, r0, -8
	lsl r4, r4, r1
	add r0, r0, r6
	add r6, r0, -9, true, .LBB0_2
.Lfunc_end0:
	.size	__divsf3, .Lfunc_end0-__divsf3
	.section	.stack_sizes,"o",@progbits,.text.__divsf3
	.long	.Lfunc_begin0
	.byte	40
	.section	.text.__divsf3,"ax",@progbits
                                        // -- End function
	.addrsig
