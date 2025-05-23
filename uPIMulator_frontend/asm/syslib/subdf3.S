	.text
	.file	"subdf3.c"
	.section	.text.__subdf3,"ax",@progbits
	.globl	__subdf3                        // -- Begin function __subdf3
	.type	__subdf3,@function
__subdf3:                               // @__subdf3
.Lfunc_begin0:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	xor r3, r3, 0
	xor r2, r2, 2147483648
	call r23, __adddf3
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__subdf3, .Lfunc_end0-__subdf3
	.section	.stack_sizes,"o",@progbits,.text.__subdf3
	.long	.Lfunc_begin0
	.byte	8
	.section	.text.__subdf3,"ax",@progbits
                                        // -- End function
	.addrsig
