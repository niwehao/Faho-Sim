	.text
	.file	"ashrdi3.c"
	.section	.text.__ashrdi3,"ax",@progbits
	.globl	__ashrdi3                       // -- Begin function __ashrdi3
	.type	__ashrdi3,@function
__ashrdi3:                              // @__ashrdi3
.Lfunc_begin0:
// %bb.0:
	and r3, r2, 32, nz, .LBB0_1
// %bb.2:
	jeq r2, 0, .LBB0_5
// %bb.3:
	asr r3, r0, r2
	sub r4, 32, r2
	lsl r4, r0, r4
	lsr r0, r1, r2
	or r0, r4, r0, true, .LBB0_4
.LBB0_1:
	asr r3, r0, 31
	add r2, r2, -32
	asr r0, r0, r2
.LBB0_4:
	move.s d2, r3
	move r5, 0
	move r4, r3
	move.u d0, r0
	or r1, r5, r1
	or r0, r4, r0
.LBB0_5:
	jump r23
.Lfunc_end0:
	.size	__ashrdi3, .Lfunc_end0-__ashrdi3
	.section	.stack_sizes,"o",@progbits,.text.__ashrdi3
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__ashrdi3,"ax",@progbits
                                        // -- End function
	.addrsig
