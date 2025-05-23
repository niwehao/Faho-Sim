	.text
	.file	"strcpy.c"
	.section	.text.strcpy,"ax",@progbits
	.globl	strcpy                          // -- Begin function strcpy
	.type	strcpy,@function
strcpy:                                 // @strcpy
.Lfunc_begin0:
// %bb.0:
	lbu r2, r1, 0
	move r3, r0
	jeq r2, 0, .LBB0_3
// %bb.1:
	add r1, r1, 1
	move r3, r0
.LBB0_2:                                // =>This Inner Loop Header: Depth=1
	sb r3, 0, r2
	lbu r2, r1, 0
	add r3, r3, 1
	add r1, r1, 1
	jneq r2, 0, .LBB0_2
.LBB0_3:
	sb r3, 0, 0
	jump r23
.Lfunc_end0:
	.size	strcpy, .Lfunc_end0-strcpy
	.section	.stack_sizes,"o",@progbits,.text.strcpy
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.strcpy,"ax",@progbits
                                        // -- End function
	.addrsig
