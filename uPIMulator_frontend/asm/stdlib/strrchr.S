	.text
	.file	"strrchr.c"
	.section	.text.strrchr,"ax",@progbits
	.globl	strrchr                         // -- Begin function strrchr
	.type	strrchr,@function
strrchr:                                // @strrchr
.Lfunc_begin0:
// %bb.0:
	move r3, 0, true, .LBB0_1
.LBB0_3:                                //   in Loop: Header=BB0_1 Depth=1
	add r0, r0, 1
	move r3, r2
	jeq r4, 0, .LBB0_4
.LBB0_1:                                // =>This Inner Loop Header: Depth=1
	lbu r4, r0, 0
	move r2, r0
	jeq r4, r1, .LBB0_3
// %bb.2:                               //   in Loop: Header=BB0_1 Depth=1
	move r2, r3, true, .LBB0_3
.LBB0_4:
	move r0, r2
	jump r23
.Lfunc_end0:
	.size	strrchr, .Lfunc_end0-strrchr
	.section	.stack_sizes,"o",@progbits,.text.strrchr
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.strrchr,"ax",@progbits
                                        // -- End function
	.addrsig
