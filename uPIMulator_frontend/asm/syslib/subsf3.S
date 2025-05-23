	.text
	.file	"subsf3.c"
	.section	.text.__subsf3,"ax",@progbits
	.globl	__subsf3                        // -- Begin function __subsf3
	.type	__subsf3,@function
__subsf3:                               // @__subsf3
.Lfunc_begin0:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	xor r1, r1, -2147483648
	call r23, __addsf3
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__subsf3, .Lfunc_end0-__subsf3
	.section	.stack_sizes,"o",@progbits,.text.__subsf3
	.long	.Lfunc_begin0
	.byte	8
	.section	.text.__subsf3,"ax",@progbits
                                        // -- End function
	.addrsig
