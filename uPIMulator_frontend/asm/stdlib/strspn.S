	.text
	.file	"strspn.c"
	.section	.text.strspn,"ax",@progbits
	.globl	strspn                          // -- Begin function strspn
	.type	strspn,@function
strspn:                                 // @strspn
.Lfunc_begin0:
// %bb.0:
	move r2, r0
	lbu r4, r2, 0
	jeq r4, 0, .LBB0_1
// %bb.2:
	lbs r3, r1, 0
	add r1, r1, 1
	move r0, 0, true, .LBB0_3
.LBB0_4:                                //   in Loop: Header=BB0_3 Depth=1
	add r0, r0, 1
	add r4, r2, r0
	lbu r4, r4, 0
	jeq r4, 0, .LBB0_7
.LBB0_3:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_6 Depth 2
	and r7, r3, 255
	and r8, r4, 255
	move r5, r1
	move r6, r3
	jeq r8, r7, .LBB0_4
.LBB0_6:                                //   Parent Loop BB0_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	and r6, r6, 255
	jeq r6, 0, .LBB0_7
// %bb.5:                               //   in Loop: Header=BB0_6 Depth=2
	lbu r6, r5, 0
	and r7, r4, 255
	add r5, r5, 1
	jneq r7, r6, .LBB0_6
	jump .LBB0_4
.LBB0_7:
	jump r23
.LBB0_1:
	move r0, 0
	jump r23
.Lfunc_end0:
	.size	strspn, .Lfunc_end0-strspn
	.section	.stack_sizes,"o",@progbits,.text.strspn
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.strspn,"ax",@progbits
                                        // -- End function
	.addrsig
