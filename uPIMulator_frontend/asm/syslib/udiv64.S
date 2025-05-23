	.text
	.file	"udiv64.c"
	.section	.text.__udiv64,"ax",@progbits
	.globl	__udiv64                        // -- Begin function __udiv64
	.type	__udiv64,@function
__udiv64:                               // @__udiv64
.Lfunc_begin0:
// %bb.0:
	move.s d6, 0
	jneq r3, r7, .LBB0_23
// %bb.22:
	jeq r2, r6, .LBB0_21
.LBB0_23:
// %bb.1:
	sub zero, r3, r1
	subc zero, r2, r0, xleu, .LBB0_5
// %bb.2:
	jeq r4, 0, .LBB0_3
// %bb.4:
	jump r23
.LBB0_5:
	clz.u d6, r2, nmax, .LBB0_7
	jump .LBB0_6
.LBB0_7:
	clz.u d8, r0, nmax, .LBB0_9
	jump .LBB0_8
.LBB0_9:
	sub r8, r7, r9, mi, .LBB0_10
.LBB0_11:
	move.s d6, 0
	jump .LBB0_12
.LBB0_17:                               //   in Loop: Header=BB0_12 Depth=1
	sub zero, r1, r9
	subc r8, r0, r8, geu
	lslx r9, r7, 1
	lsl_add r12, r9, r6, 1
	lsl r13, r7, 1
	move.u d6, r8
	or r7, r13, r7
	or r6, r12, r6
	sub r1, r1, r11
	subc r0, r0, r10
	add r8, r5, -1
	jles r5, 0, .LBB0_18
.LBB0_12:                               // =>This Inner Loop Header: Depth=1
	move r5, r8
	lslx r8, r3, r5, sh32, .LBB0_14
// %bb.13:                              //   in Loop: Header=BB0_12 Depth=1
	lsl r9, r2, r5
	or r8, r9, r8
	lsl r9, r3, r5
	move.s d10, 0
	sub zero, r1, r9
	subc zero, r0, r8, ltu, .LBB0_17
	jump .LBB0_16
.LBB0_14:                               //   in Loop: Header=BB0_12 Depth=1
	lsl r8, r3, r5
	move r9, 0
	move.s d10, 0
	sub zero, r1, r9
	subc zero, r0, r8, ltu, .LBB0_17
.LBB0_16:                               //   in Loop: Header=BB0_12 Depth=1
	movd d10, d8
	jump .LBB0_17
.LBB0_6:
	clz r5, r3
	add r7, r5, 32
	clz.u d8, r0, nmax, .LBB0_9
.LBB0_8:
	clz r5, r1
	add r9, r5, 32
	sub r8, r7, r9, pl, .LBB0_11
.LBB0_10:
	move.s d6, 0
.LBB0_18:
	jeq r4, 1, .LBB0_20
// %bb.19:
	movd d0, d6
.LBB0_20:
	jump r23
.LBB0_3:
	move.s d0, 0
	jump r23
.LBB0_21:
	// inline asm
	fault 2
	// inline asm
.Lfunc_end0:
	.size	__udiv64, .Lfunc_end0-__udiv64
	.section	.stack_sizes,"o",@progbits,.text.__udiv64
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__udiv64,"ax",@progbits
                                        // -- End function
	.addrsig
