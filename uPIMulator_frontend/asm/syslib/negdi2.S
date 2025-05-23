	.text
	.file	"negdi2.c"
	.section	.text.__negdi2,"ax",@progbits
	.globl	__negdi2                        // -- Begin function __negdi2
	.type	__negdi2,@function
__negdi2:                               // @__negdi2
.Lfunc_begin0:
// %bb.0:
	move.s d2, 0
	sub r1, r3, r1
	subc r0, r2, r0
	jump r23
.Lfunc_end0:
	.size	__negdi2, .Lfunc_end0-__negdi2
	.section	.stack_sizes,"o",@progbits,.text.__negdi2
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__negdi2,"ax",@progbits
                                        // -- End function
	.addrsig
