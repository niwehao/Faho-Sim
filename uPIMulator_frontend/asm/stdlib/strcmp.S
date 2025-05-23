	.text
	.file	"strcmp.c"
	.section	.text.strcmp,"ax",@progbits
	.globl	strcmp                          // -- Begin function strcmp
	.type	strcmp,@function
strcmp:                                 // @strcmp
.Lfunc_begin0:
// %bb.0:
	lbu r4, r0, 0
	lbs r2, r1, 0
	jeq r4, 0, .LBB0_4
// %bb.1:
	add r1, r1, 1
	add r3, r0, 1
.LBB0_2:                                // =>This Inner Loop Header: Depth=1
	and r0, r4, 255
	and r2, r2, 255
	sub r0, r0, r2, nz, .LBB0_5
// %bb.3:                               //   in Loop: Header=BB0_2 Depth=1
	lbu r4, r3, 0
	lbs r2, r1, 0
	add r1, r1, 1
	add r3, r3, 1
	jneq r4, 0, .LBB0_2
.LBB0_4:
	and r0, r2, 255
	neg r0, r0
.LBB0_5:
	jump r23
.Lfunc_end0:
	.size	strcmp, .Lfunc_end0-strcmp
	.section	.stack_sizes,"o",@progbits,.text.strcmp
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.strcmp,"ax",@progbits
                                        // -- End function
	.addrsig
