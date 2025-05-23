	.text
	.file	"clzsi2.c"
	.section	.text.__clzsi2,"ax",@progbits
	.globl	__clzsi2                        // -- Begin function __clzsi2
	.type	__clzsi2,@function
__clzsi2:                               // @__clzsi2
.Lfunc_begin0:
// %bb.0:
	move r1, 16
	lsr r2, r0, 16, z, .LBB0_2
// %bb.1:
	move r1, 0
.LBB0_2:
	sub r2, 16, r1
	lsr r0, r0, r2
	and r2, r0, 65280
	jeq r2, 0, .LBB0_3
// %bb.4:
	move r2, 0, true, .LBB0_5
.LBB0_3:
	move r2, 8
.LBB0_5:
	sub r3, 8, r2
	lsr r0, r0, r3
	or r1, r2, r1
	and r2, r0, 240
	jeq r2, 0, .LBB0_6
// %bb.7:
	move r2, 0, true, .LBB0_8
.LBB0_6:
	move r2, 4
.LBB0_8:
	sub r3, 4, r2
	lsr r0, r0, r3
	or r1, r1, r2
	and r2, r0, 12, z, .LBB0_9
// %bb.10:
	move r2, 0, true, .LBB0_11
.LBB0_9:
	move r2, 2
.LBB0_11:
	sub r3, 2, r2
	lsr r0, r0, r3
	or r1, r1, r2
	sub r2, 2, r0
	lsr r0, r0, 1
	or r0, r0, -2
	add r0, r0, 1
	and r0, r0, r2
	add r0, r1, r0
	jump r23
.Lfunc_end0:
	.size	__clzsi2, .Lfunc_end0-__clzsi2
	.section	.stack_sizes,"o",@progbits,.text.__clzsi2
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__clzsi2,"ax",@progbits
                                        // -- End function
	.addrsig
