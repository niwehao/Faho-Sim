	.text
	.file	"paritydi2.c"
	.section	.text.__paritydi2,"ax",@progbits
	.globl	__paritydi2                     // -- Begin function __paritydi2
	.type	__paritydi2,@function
__paritydi2:                            // @__paritydi2
.Lfunc_begin0:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move.u d2, r0
	xor r1, r3, r1
	xor r0, r2, r0
	move r0, r1
	call r23, __paritysi2
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__paritydi2, .Lfunc_end0-__paritydi2
	.section	.stack_sizes,"o",@progbits,.text.__paritydi2
	.long	.Lfunc_begin0
	.byte	8
	.section	.text.__paritydi2,"ax",@progbits
                                        // -- End function
	.addrsig
