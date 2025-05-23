	.text
	.file	"atol.c"
	.section	.text.atol,"ax",@progbits
	.globl	atol                            // -- Begin function atol
	.type	atol,@function
atol:                                   // @atol
.Lfunc_begin0:
// %bb.0:
	jeq r0, 0, .LBB0_1
.LBB0_2:                                // =>This Inner Loop Header: Depth=1
	lbs r2, r0, 0
	add r0, r0, 1
	and r1, r2, 255
	jeq r1, 32, .LBB0_2
// %bb.3:                               //   in Loop: Header=BB0_2 Depth=1
	add r2, r2, -9
	jltu r2, 5, .LBB0_2
// %bb.4:
	jeq r1, 43, .LBB0_7
// %bb.5:
	jneq r1, 45, .LBB0_6
// %bb.13:
	move r1, 0, true, .LBB0_8
.LBB0_1:
	move.s d2, 0
	movd d0, d2
	jump r23
.LBB0_6:
	add r0, r0, -1
.LBB0_7:
	move r1, 1
.LBB0_8:
	move.s d4, 0
.LBB0_9:                                // =>This Inner Loop Header: Depth=1
	movd d2, d4
	lbs r4, r0, 0
	lslx r5, r3, 3
	lsl_add r6, r5, r2, 3
	lsl r7, r3, 3
	lslx r5, r3, 1
	lsl_add r8, r5, r2, 1
	lsl r9, r3, 1
	add r7, r9, r7
	addc r6, r8, r6
	add r0, r0, 1
	add r8, r4, -48
	move.u d4, r8
	add r5, r7, r5
	addc r4, r6, r4
	jltu r8, 10, .LBB0_9
// %bb.10:
	jnz r1, .LBB0_12
// %bb.11:
	move.s d0, 0
	sub r3, r1, r3
	subc r2, r0, r2
.LBB0_12:
	movd d0, d2
	jump r23
.Lfunc_end0:
	.size	atol, .Lfunc_end0-atol
	.section	.stack_sizes,"o",@progbits,.text.atol
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.atol,"ax",@progbits
                                        // -- End function
	.addrsig
