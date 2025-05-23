	.text
	.file	"abort.c"
	.section	.text.abort,"ax",@progbits
	.globl	abort                           // -- Begin function abort
	.type	abort,@function
abort:                                  // @abort
.Lfunc_begin0:
// %bb.0:
	fault 4
.Lfunc_end0:
	.size	abort, .Lfunc_end0-abort
	.section	.stack_sizes,"o",@progbits,.text.abort
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.abort,"ax",@progbits
                                        // -- End function
	.addrsig
