	.text
	.file	"negdf2.c"
	.section	.text.__negdf2,"ax",@progbits
	.globl	__negdf2                        // -- Begin function __negdf2
	.type	__negdf2,@function
__negdf2:                               // @__negdf2
.Lfunc_begin0:
// %bb.0:
	xor r1, r1, 0
	xor r0, r0, 2147483648
	jump r23
.Lfunc_end0:
	.size	__negdf2, .Lfunc_end0-__negdf2
	.section	.stack_sizes,"o",@progbits,.text.__negdf2
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__negdf2,"ax",@progbits
                                        // -- End function
	.addrsig
