	.text
	.file	"strchr.c"
	.section	.text.strchr,"ax",@progbits
	.globl	strchr                          // -- Begin function strchr
	.type	strchr,@function
strchr:                                 // @strchr
.Lfunc_begin0:
// %bb.0:
	lbu r3, r0, 0
	jneq r3, r1, .LBB0_2
// %bb.1:
	jump r23
.LBB0_2:                                // =>This Inner Loop Header: Depth=1
	and r2, r3, 255
	jeq r2, 0, .LBB0_3
// %bb.4:                               //   in Loop: Header=BB0_2 Depth=1
	lbu r3, r0, 1
	add r2, r0, 1
	move r0, r2
	jneq r3, r1, .LBB0_2
// %bb.5:
	move r0, r2
	jump r23
.LBB0_3:
	move r2, 0
	move r0, r2
	jump r23
.Lfunc_end0:
	.size	strchr, .Lfunc_end0-strchr
	.section	.stack_sizes,"o",@progbits,.text.strchr
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.strchr,"ax",@progbits
                                        // -- End function
	.addrsig
