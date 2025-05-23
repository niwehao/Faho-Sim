	.text
	.file	"strncmp.c"
	.section	.text.strncmp,"ax",@progbits
	.globl	strncmp                         // -- Begin function strncmp
	.type	strncmp,@function
strncmp:                                // @strncmp
.Lfunc_begin0:
// %bb.0:
	move r4, 0
	jeq r2, 0, .LBB0_5
.LBB0_1:                                // =>This Inner Loop Header: Depth=1
	lbu r5, r0, 0
	lbu r3, r1, 0
	sub r3, r5, r3, sz, .LBB0_6
// %bb.2:                               //   in Loop: Header=BB0_1 Depth=1
	jneq r3, 0, .LBB0_6
// %bb.3:                               //   in Loop: Header=BB0_1 Depth=1
	add r1, r1, 1
	add r0, r0, 1
	add r2, r2, -1, nz, .LBB0_1
.LBB0_5:
	move r3, r4
.LBB0_6:
	move r0, r3
	jump r23
.Lfunc_end0:
	.size	strncmp, .Lfunc_end0-strncmp
	.section	.stack_sizes,"o",@progbits,.text.strncmp
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.strncmp,"ax",@progbits
                                        // -- End function
	.addrsig
