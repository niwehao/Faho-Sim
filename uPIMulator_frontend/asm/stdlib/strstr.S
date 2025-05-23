	.text
	.file	"strstr.c"
	.section	.text.strstr,"ax",@progbits
	.globl	strstr                          // -- Begin function strstr
	.type	strstr,@function
strstr:                                 // @strstr
.Lfunc_begin0:
// %bb.0:
	lbu r4, r1, 0
	move r2, r0
	jeq r4, 0, .LBB0_1
// %bb.2:
	move r3, r1
	move r0, r2, true, .LBB0_3
.LBB0_4:                                //   in Loop: Header=BB0_3 Depth=1
	add r2, r2, 1
	add r3, r3, 1
	lbu r4, r3, 0
	jeq r4, 0, .LBB0_9
.LBB0_3:                                // =>This Inner Loop Header: Depth=1
	lbu r5, r2, 0
	and r4, r4, 255
	jeq r5, r4, .LBB0_4
// %bb.5:                               //   in Loop: Header=BB0_3 Depth=1
	jeq r5, 0, .LBB0_6
// %bb.7:                               //   in Loop: Header=BB0_3 Depth=1
	add r0, r0, 1
	move r2, r0
	move r3, r1
	lbu r4, r3, 0
	jneq r4, 0, .LBB0_3
.LBB0_9:
	jump r23
.LBB0_1:
	move r0, r2
	jump r23
.LBB0_6:
	move r0, 0
	jump r23
.Lfunc_end0:
	.size	strstr, .Lfunc_end0-strstr
	.section	.stack_sizes,"o",@progbits,.text.strstr
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.strstr,"ax",@progbits
                                        // -- End function
	.addrsig
