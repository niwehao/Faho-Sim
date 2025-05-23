	.text
	.file	"moddi3.c"
	.section	.text.__moddi3,"ax",@progbits
	.globl	__moddi3                        // -- Begin function __moddi3
	.type	__moddi3,@function
__moddi3:                               // @__moddi3
.Lfunc_begin0:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move.s d4, 0
	sub zero, r1, r5
	subc zero, r0, r4, lts, .LBB0_4
// %bb.1:
	sub zero, r3, r5
	subc zero, r2, r4, ges, .LBB0_2
// %bb.3:
	move.s d4, 0
	sub r3, r5, r3
	subc r2, r4, r2
.LBB0_2:
	move r4, 1
	call r23, __udiv64
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.LBB0_4:
	sub r1, r5, r1
	subc r0, r4, r0
	sub zero, r3, r5
	subc zero, r2, r4, lts, .LBB0_6
// %bb.5:
	move r4, 1
	call r23, __udiv64
	move.s d2, 0
	sub r1, r3, r1
	subc r0, r2, r0
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.LBB0_6:
	move.s d14, 0
	sub r3, r15, r3
	subc r2, r14, r2
	move r4, 1
	call r23, __udiv64
	sub r1, r15, r1
	subc r0, r14, r0
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__moddi3, .Lfunc_end0-__moddi3
	.section	.stack_sizes,"o",@progbits,.text.__moddi3
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.__moddi3,"ax",@progbits
                                        // -- End function
	.addrsig
