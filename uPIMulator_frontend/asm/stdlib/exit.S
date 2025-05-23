	.text
	.file	"exit.c"
	.section	.text.exit,"ax",@progbits
	.globl	exit                            // -- Begin function exit
	.type	exit,@function
exit:                                   // @exit
.Lfunc_begin0:
// %bb.0:
	// inline asm
	stop true, __sys_end
	// inline asm
.Lfunc_end0:
	.size	exit, .Lfunc_end0-exit
	.section	.stack_sizes,"o",@progbits,.text.exit
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.exit,"ax",@progbits
                                        // -- End function
	.addrsig
