	.text
	.file	"negsf2.c"
	.section	.text.__negsf2,"ax",@progbits
	.globl	__negsf2                        // -- Begin function __negsf2
	.type	__negsf2,@function
__negsf2:                               // @__negsf2
.Lfunc_begin0:
// %bb.0:
	xor r0, r0, -2147483648
	jump r23
.Lfunc_end0:
	.size	__negsf2, .Lfunc_end0-__negsf2
	.section	.stack_sizes,"o",@progbits,.text.__negsf2
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__negsf2,"ax",@progbits
                                        // -- End function
	.addrsig
