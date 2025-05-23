	.text
	.file	"udivdi3.c"
	.section	.text.__udivdi3,"ax",@progbits
	.globl	__udivdi3                       // -- Begin function __udivdi3
	.type	__udivdi3,@function
__udivdi3:                              // @__udivdi3
.Lfunc_begin0:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r4, 0
	call r23, __udiv64
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__udivdi3, .Lfunc_end0-__udivdi3
	.section	.stack_sizes,"o",@progbits,.text.__udivdi3
	.long	.Lfunc_begin0
	.byte	8
	.section	.text.__udivdi3,"ax",@progbits
                                        // -- End function
	.addrsig
