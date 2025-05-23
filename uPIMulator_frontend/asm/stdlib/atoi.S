	.text
	.file	"atoi.c"
	.section	.text.atoi,"ax",@progbits
	.globl	atoi                            // -- Begin function atoi
	.type	atoi,@function
atoi:                                   // @atoi
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
	move r2, 0, true, .LBB0_8
.LBB0_1:
	move r1, 0
	move r0, r1
	jump r23
.LBB0_6:
	add r0, r0, -1
.LBB0_7:
	move r2, 1
.LBB0_8:
	move r3, 0
.LBB0_9:                                // =>This Inner Loop Header: Depth=1
	move r1, r3
	lbs r3, r0, 0
	lsl r4, r1, 1
	lsl_add r4, r4, r1, 3
	add r0, r0, 1
	add r5, r3, -48
	add r3, r5, r4
	jltu r5, 10, .LBB0_9
// %bb.10:
	jnz r2, .LBB0_12
// %bb.11:
	neg r1, r1
.LBB0_12:
	move r0, r1
	jump r23
.Lfunc_end0:
	.size	atoi, .Lfunc_end0-atoi
	.section	.stack_sizes,"o",@progbits,.text.atoi
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.atoi,"ax",@progbits
                                        // -- End function
	.addrsig
