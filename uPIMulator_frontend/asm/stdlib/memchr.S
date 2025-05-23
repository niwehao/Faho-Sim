	.text
	.file	"memchr.c"
	.section	.text.memchr,"ax",@progbits
	.globl	memchr                          // -- Begin function memchr
	.type	memchr,@function
memchr:                                 // @memchr
.Lfunc_begin0:
// %bb.0:
	move r3, r0
	move r0, 0
	jeq r2, 0, .LBB0_4
.LBB0_2:                                // =>This Inner Loop Header: Depth=1
	lbs r4, r3, 0
	jeq r4, r1, .LBB0_3
// %bb.1:                               //   in Loop: Header=BB0_2 Depth=1
	add r3, r3, 1
	add r2, r2, -1, nz, .LBB0_2
.LBB0_4:
	jump r23
.LBB0_3:
	move r0, r3
	jump r23
.Lfunc_end0:
	.size	memchr, .Lfunc_end0-memchr
	.section	.stack_sizes,"o",@progbits,.text.memchr
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.memchr,"ax",@progbits
                                        // -- End function
	.addrsig
