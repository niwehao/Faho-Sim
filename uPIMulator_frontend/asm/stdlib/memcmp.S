	.text
	.file	"memcmp.c"
	.section	.text.memcmp,"ax",@progbits
	.globl	memcmp                          // -- Begin function memcmp
	.type	memcmp,@function
memcmp:                                 // @memcmp
.Lfunc_begin0:
// %bb.0:
	move r4, 0
	jeq r2, 0, .LBB0_4
.LBB0_1:                                // =>This Inner Loop Header: Depth=1
	lbu r3, r0, 0
	lbu r5, r1, 0
	sub r3, r3, r5, nz, .LBB0_5
// %bb.2:                               //   in Loop: Header=BB0_1 Depth=1
	add r1, r1, 1
	add r0, r0, 1
	add r2, r2, -1, nz, .LBB0_1
.LBB0_4:
	move r3, r4
.LBB0_5:
	move r0, r3
	jump r23
.Lfunc_end0:
	.size	memcmp, .Lfunc_end0-memcmp
	.section	.stack_sizes,"o",@progbits,.text.memcmp
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.memcmp,"ax",@progbits
                                        // -- End function
	.addrsig
