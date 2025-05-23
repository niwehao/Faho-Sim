	.text
	.file	"strupr.c"
	.section	.text.strupr,"ax",@progbits
	.globl	strupr                          // -- Begin function strupr
	.type	strupr,@function
strupr:                                 // @strupr
.Lfunc_begin0:
// %bb.0:
	lbu r1, r0, 0
	jeq r1, 0, .LBB0_5
// %bb.1:
	add r2, r0, 1, true, .LBB0_2
.LBB0_4:                                //   in Loop: Header=BB0_2 Depth=1
	sb r2, -1, r1
	lbu r1, r2, 0
	add r2, r2, 1
	jeq r1, 0, .LBB0_5
.LBB0_2:                                // =>This Inner Loop Header: Depth=1
	extsb r3, r1
	add r3, r3, -97
	jgtu r3, 25, .LBB0_4
// %bb.3:                               //   in Loop: Header=BB0_2 Depth=1
	add r1, r1, -32, true, .LBB0_4
.LBB0_5:
	jump r23
.Lfunc_end0:
	.size	strupr, .Lfunc_end0-strupr
	.section	.stack_sizes,"o",@progbits,.text.strupr
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.strupr,"ax",@progbits
                                        // -- End function
	.addrsig
