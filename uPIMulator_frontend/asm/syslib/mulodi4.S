	.text
	.file	"mulodi4.c"
	.section	.text.__mulodi4,"ax",@progbits
	.globl	__mulodi4                       // -- Begin function __mulodi4
	.type	__mulodi4,@function
__mulodi4:                              // @__mulodi4
.Lfunc_begin0:
// %bb.0:
	sd r22, 32, d22
	add r22, r22, 40
	sd r22, -16, d14
	sd r22, -24, d16
	sd r22, -32, d18
	sd r22, -40, d20
	move r18, r4
	movd d16, d2
	movd d14, d0
	move r1, 0
	move r0, 2147483648
	sw r18, 0, 0
	jneq r15, r1, .LBB0_2
// %bb.11:
	jneq r14, r0, .LBB0_2
// %bb.12:
// %bb.1:
	move.s d0, 2
	sub zero, r17, r1
	subc zero, r16, r0, geu, .LBB0_9
	jump .LBB0_10
.LBB0_2:
	jneq r17, r1, .LBB0_4
// %bb.13:
	jneq r16, r0, .LBB0_4
// %bb.14:
// %bb.3:
	move.s d0, 2
	sub zero, r15, r1
	subc zero, r14, r0, geu, .LBB0_9
	jump .LBB0_10
.LBB0_4:
	asr.s d0, r14, 31
	xor r3, r1, r15
	xor r2, r0, r14
	sub r21, r3, r1
	subc r20, r2, r0
	move.s d6, 2
	asr.s d4, r16, 31
	sub zero, r21, r7
	subc zero, r20, r6, lts, .LBB0_10
// %bb.5:
	xor r3, r5, r17
	xor r2, r4, r16
	sub r3, r3, r5
	subc r2, r2, r4
	sub zero, r3, r7
	subc zero, r2, r6, lts, .LBB0_10
// %bb.6:
	jneq r1, r5, .LBB0_8
// %bb.15:
	jneq r0, r4, .LBB0_8
// %bb.16:
// %bb.7:
	move r1, 4294967295
	move r0, 2147483647
	call r23, __udivdi3
	sub zero, r21, r1
	subc zero, r20, r0, xgts, .LBB0_9
	jump .LBB0_10
.LBB0_8:
	move.s d0, 0
	sub r3, r1, r3
	subc r2, r0, r2
	move r1, 0
	move r0, 2147483648
	call r23, __divdi3
	sub zero, r21, r1
	subc zero, r20, r0, xles, .LBB0_10
.LBB0_9:
	sw r18, 0, 1
.LBB0_10:
	movd d0, d16
	movd d2, d14
	call r23, __muldi3
	ld d20, r22, -40
	ld d18, r22, -32
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__mulodi4, .Lfunc_end0-__mulodi4
	.section	.stack_sizes,"o",@progbits,.text.__mulodi4
	.long	.Lfunc_begin0
	.byte	40
	.section	.text.__mulodi4,"ax",@progbits
                                        // -- End function
	.addrsig
