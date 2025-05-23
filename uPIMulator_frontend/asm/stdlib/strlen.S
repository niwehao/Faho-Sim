	.text
	.file	"strlen.c"
	.section	.text.strlen,"ax",@progbits
	.globl	strlen                          // -- Begin function strlen
	.type	strlen,@function
strlen:                                 // @strlen
.Lfunc_begin0:
// %bb.0:
	move r1, r0
	move r0, -1
.LBB0_1:                                // =>This Inner Loop Header: Depth=1
	add r2, r1, r0
	lbu r2, r2, 1
	add r0, r0, 1
	jneq r2, 0, .LBB0_1
// %bb.2:
	jump r23
.Lfunc_end0:
	.size	strlen, .Lfunc_end0-strlen
	.section	.stack_sizes,"o",@progbits,.text.strlen
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.strlen,"ax",@progbits
                                        // -- End function
	.addrsig
