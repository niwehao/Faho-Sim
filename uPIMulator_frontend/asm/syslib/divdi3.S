	.text
	.file	"divdi3.c"
	.section	.text.__divdi3,"ax",@progbits
	.globl	__divdi3                        // -- Begin function __divdi3
	.type	__divdi3,@function
__divdi3:                               // @__divdi3
.Lfunc_begin0:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move.s d4, 0
	sub zero, r1, r5
	subc zero, r0, r4, lts, .LBB0_3
// %bb.1:
	sub zero, r3, r5
	subc zero, r2, r4, ges, .LBB0_6
// %bb.2:
	move.s d14, 0
	sub r3, r15, r3
	subc r2, r14, r2
	move r4, 0
	call r23, __udiv64
	sub r1, r15, r1
	subc r0, r14, r0
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.LBB0_3:
	sub r1, r5, r1
	subc r0, r4, r0
	sub zero, r3, r5
	subc zero, r2, r4, lts, .LBB0_5
// %bb.4:
	move r4, 0
	call r23, __udiv64
	move.s d2, 0
	sub r1, r3, r1
	subc r0, r2, r0
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.LBB0_5:
	move.s d4, 0
	sub r3, r5, r3
	subc r2, r4, r2
.LBB0_6:
	move r4, 0
	call r23, __udiv64
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__divdi3, .Lfunc_end0-__divdi3
	.section	.stack_sizes,"o",@progbits,.text.__divdi3
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.__divdi3,"ax",@progbits
                                        // -- End function
	.addrsig
