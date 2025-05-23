	.text
	.file	"ctzsi2.c"
	.section	.text.__ctzsi2,"ax",@progbits
	.globl	__ctzsi2                        // -- Begin function __ctzsi2
	.type	__ctzsi2,@function
__ctzsi2:                               // @__ctzsi2
.Lfunc_begin0:
// %bb.0:
	and r1, r0, 65535
	jeq r1, 0, .LBB0_1
// %bb.2:
	move r1, 0
	lsr r0, r0, r1
	and r2, r0, 255
	jeq r2, 0, .LBB0_4
.LBB0_5:
	move r2, 0
	lsr r0, r0, r2
	or r1, r2, r1
	and r2, r0, 15, z, .LBB0_7
.LBB0_8:
	move r2, 0
	lsr r0, r0, r2
	or r1, r1, r2
	and r2, r0, 3, z, .LBB0_10
.LBB0_11:
	move r2, 0, true, .LBB0_12
.LBB0_1:
	move r1, 16
	lsr r0, r0, r1
	and r2, r0, 255
	jneq r2, 0, .LBB0_5
.LBB0_4:
	move r2, 8
	lsr r0, r0, r2
	or r1, r2, r1
	and r2, r0, 15, nz, .LBB0_8
.LBB0_7:
	move r2, 4
	lsr r0, r0, r2
	or r1, r1, r2
	and r2, r0, 3, nz, .LBB0_11
.LBB0_10:
	move r2, 2
.LBB0_12:
	lsr r0, r0, r2
	or r1, r1, r2
	lsr r2, r0, 1
	and r2, r2, 1
	sub r2, 2, r2
	or r0, r0, -2
	add r0, r0, 1
	and r0, r2, r0
	add r0, r1, r0
	jump r23
.Lfunc_end0:
	.size	__ctzsi2, .Lfunc_end0-__ctzsi2
	.section	.stack_sizes,"o",@progbits,.text.__ctzsi2
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__ctzsi2,"ax",@progbits
                                        // -- End function
	.addrsig
