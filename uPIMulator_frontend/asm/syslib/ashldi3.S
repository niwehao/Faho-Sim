	.text
	.file	"ashldi3.c"
	.section	.text.__ashldi3,"ax",@progbits
	.globl	__ashldi3                       // -- Begin function __ashldi3
	.type	__ashldi3,@function
__ashldi3:                              // @__ashldi3
.Lfunc_begin0:
// %bb.0:
	and r3, r2, 32, nz, .LBB0_1
// %bb.2:
	jeq r2, 0, .LBB0_5
// %bb.3:
	lsl r3, r1, r2
	lsl r4, r0, r2
	sub r2, 32, r2
	lsr r0, r1, r2
	or r0, r4, r0, true, .LBB0_4
.LBB0_1:
	add r2, r2, -32
	lsl r0, r1, r2
	move r3, 0
.LBB0_4:
	move.s d0, r0
	move r5, 0
	move r4, r1
	move.u d0, r3
	or r1, r5, r1
	or r0, r4, r0
.LBB0_5:
	jump r23
.Lfunc_end0:
	.size	__ashldi3, .Lfunc_end0-__ashldi3
	.section	.stack_sizes,"o",@progbits,.text.__ashldi3
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__ashldi3,"ax",@progbits
                                        // -- End function
	.addrsig
