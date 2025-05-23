	.text
	.file	"paritysi2.c"
	.section	.text.__paritysi2,"ax",@progbits
	.globl	__paritysi2                     // -- Begin function __paritysi2
	.type	__paritysi2,@function
__paritysi2:                            // @__paritysi2
.Lfunc_begin0:
// %bb.0:
	lsr r1, r0, 16
	xor r0, r1, r0
	lsr r1, r0, 8
	xor r0, r1, r0
	lsr r1, r0, 4
	xor r0, r1, r0
	and r0, r0, 15
	move r1, 27030
	lsr r0, r1, r0
	and r0, r0, 1
	jump r23
.Lfunc_end0:
	.size	__paritysi2, .Lfunc_end0-__paritysi2
	.section	.stack_sizes,"o",@progbits,.text.__paritysi2
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__paritysi2,"ax",@progbits
                                        // -- End function
	.addrsig
