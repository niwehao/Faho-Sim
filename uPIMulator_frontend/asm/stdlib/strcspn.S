	.text
	.file	"strcspn.c"
	.section	.text.strcspn,"ax",@progbits
	.globl	strcspn                         // -- Begin function strcspn
	.type	strcspn,@function
strcspn:                                // @strcspn
.Lfunc_begin0:
// %bb.0:
	lbu r3, r0, 0
	jeq r3, 0, .LBB0_1
// %bb.2:
	lbu r2, r1, 0
	jeq r2, 0, .LBB0_5
// %bb.3:
	add r4, r1, 1
	move r1, 0
.LBB0_4:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_8 Depth 2
	move r5, r4
	move r6, r2
.LBB0_8:                                //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	and r7, r3, 255
	and r6, r6, 255
	jeq r6, r7, .LBB0_10
// %bb.7:                               //   in Loop: Header=BB0_8 Depth=2
	lbu r6, r5, 0
	add r5, r5, 1
	jneq r6, 0, .LBB0_8
// %bb.9:                               //   in Loop: Header=BB0_4 Depth=1
	add r1, r1, 1
	add r3, r0, r1
	lbu r3, r3, 0
	jneq r3, 0, .LBB0_4
	jump .LBB0_10
.LBB0_1:
	move r1, 0
	move r0, r1
	jump r23
.LBB0_5:
	move r2, 0
.LBB0_6:                                // =>This Inner Loop Header: Depth=1
	add r1, r0, r2
	lbu r3, r1, 1
	add r1, r2, 1
	move r2, r1
	jneq r3, 0, .LBB0_6
.LBB0_10:
	move r0, r1
	jump r23
.Lfunc_end0:
	.size	strcspn, .Lfunc_end0-strcspn
	.section	.stack_sizes,"o",@progbits,.text.strcspn
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.strcspn,"ax",@progbits
                                        // -- End function
	.addrsig
