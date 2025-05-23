	.text
	.file	"popcountsi2.c"
	.section	.text.__popcountsi2,"ax",@progbits
	.globl	__popcountsi2                   // -- Begin function __popcountsi2
	.type	__popcountsi2,@function
__popcountsi2:                          // @__popcountsi2
.Lfunc_begin0:
// %bb.0:
	lsr r1, r0, 1
	and r1, r1, 1431655765
	sub r0, r0, r1
	lsr r1, r0, 2
	and r1, r1, 858993459
	and r0, r0, 858993459
	add r0, r1, r0
	lsr_add r0, r0, r0, 4
	and r0, r0, 252645135
	lsr_add r0, r0, r0, 16
	lsr_add r0, r0, r0, 8
	and r0, r0, 63
	jump r23
.Lfunc_end0:
	.size	__popcountsi2, .Lfunc_end0-__popcountsi2
	.section	.stack_sizes,"o",@progbits,.text.__popcountsi2
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__popcountsi2,"ax",@progbits
                                        // -- End function
	.addrsig
