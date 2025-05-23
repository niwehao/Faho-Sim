	.text
	.file	"strnlen.c"
	.section	.text.strnlen,"ax",@progbits
	.globl	strnlen                         // -- Begin function strnlen
	.type	strnlen,@function
strnlen:                                // @strnlen
.Lfunc_begin0:
// %bb.0:
	move r3, 0
.LBB0_1:                                // =>This Inner Loop Header: Depth=1
	add r2, r3, 1
	jgeu r3, r1, .LBB0_3
// %bb.2:                               //   in Loop: Header=BB0_1 Depth=1
	add r3, r0, r3
	lbs r4, r3, 0
	move r3, r2
	and r4, r4, 255
	jneq r4, 0, .LBB0_1
.LBB0_3:
	add r0, r2, -1
	jump r23
.Lfunc_end0:
	.size	strnlen, .Lfunc_end0-strnlen
	.section	.stack_sizes,"o",@progbits,.text.strnlen
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.strnlen,"ax",@progbits
                                        // -- End function
	.addrsig
