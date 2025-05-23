	.text
	.file	"mcount.c"
	.section	.text.mcount,"ax",@progbits
	.globl	mcount                          // -- Begin function mcount
	.type	mcount,@function
mcount:                                 // @mcount
.Lfunc_begin0:
// %bb.0:
	// inline asm
	jump ret_mcount
	// inline asm
.Lfunc_end0:
	.size	mcount, .Lfunc_end0-mcount
	.section	.stack_sizes,"o",@progbits,.text.mcount
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.mcount,"ax",@progbits
                                        // -- End function
	.section	.text.ret_mcount,"ax",@progbits
	.globl	ret_mcount                      // -- Begin function ret_mcount
	.type	ret_mcount,@function
ret_mcount:                             // @ret_mcount
.Lfunc_begin1:
// %bb.0:
	// inline asm
	sh id4, thread_profiling, r23
	jump r23
	// inline asm
.Lfunc_end1:
	.size	ret_mcount, .Lfunc_end1-ret_mcount
	.section	.stack_sizes,"o",@progbits,.text.ret_mcount
	.long	.Lfunc_begin1
	.byte	0
	.section	.text.ret_mcount,"ax",@progbits
                                        // -- End function
	.addrsig
