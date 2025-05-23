	.text
	.file	"stpcpy.c"
	.section	.text.stpcpy,"ax",@progbits
	.globl	stpcpy                          // -- Begin function stpcpy
	.type	stpcpy,@function
stpcpy:                                 // @stpcpy
.Lfunc_begin0:
// %bb.0:
	lbu r2, r1, 0
	jeq r2, 0, .LBB0_3
// %bb.1:
	add r1, r1, 1
.LBB0_2:                                // =>This Inner Loop Header: Depth=1
	sb r0, 0, r2
	lbu r2, r1, 0
	add r0, r0, 1
	add r1, r1, 1
	jneq r2, 0, .LBB0_2
.LBB0_3:
	sb r0, 0, 0
	jump r23
.Lfunc_end0:
	.size	stpcpy, .Lfunc_end0-stpcpy
	.section	.stack_sizes,"o",@progbits,.text.stpcpy
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.stpcpy,"ax",@progbits
                                        // -- End function
	.addrsig
