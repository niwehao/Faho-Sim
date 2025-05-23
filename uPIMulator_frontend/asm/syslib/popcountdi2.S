	.text
	.file	"popcountdi2.c"
	.section	.text.__popcountdi2,"ax",@progbits
	.globl	__popcountdi2                   // -- Begin function __popcountdi2
	.type	__popcountdi2,@function
__popcountdi2:                          // @__popcountdi2
.Lfunc_begin0:
// %bb.0:
	lsrx r2, r0, 1
	lsr_add r3, r2, r1, 1
	lsr r2, r0, 1
	and r3, r3, 1431655765
	and r2, r2, 1431655765
	sub r1, r1, r3
	subc r0, r0, r2
	lsrx r2, r0, 2
	lsr_add r3, r2, r1, 2
	lsr r2, r0, 2
	and r3, r3, 858993459
	and r2, r2, 858993459
	and r1, r1, 858993459
	and r0, r0, 858993459
	add r1, r3, r1
	addc r0, r2, r0
	lsrx r2, r0, 4
	lsr_add r3, r2, r1, 4
	lsr r2, r0, 4
	add r1, r3, r1
	addc r0, r2, r0
	and r1, r1, 252645135
	and r0, r0, 252645135
	move.u d2, r0
	add r1, r3, r1
	addc r0, r2, r0
	lsr_add r0, r1, r1, 16
	lsr_add r0, r0, r0, 8
	and r0, r0, 127
	jump r23
.Lfunc_end0:
	.size	__popcountdi2, .Lfunc_end0-__popcountdi2
	.section	.stack_sizes,"o",@progbits,.text.__popcountdi2
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__popcountdi2,"ax",@progbits
                                        // -- End function
	.addrsig
