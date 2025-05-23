	.text
	.file	"umoddi3.c"
	.section	.text.__umoddi3,"ax",@progbits
	.globl	__umoddi3                       // -- Begin function __umoddi3
	.type	__umoddi3,@function
__umoddi3:                              // @__umoddi3
.Lfunc_begin0:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r4, 1
	call r23, __udiv64
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__umoddi3, .Lfunc_end0-__umoddi3
	.section	.stack_sizes,"o",@progbits,.text.__umoddi3
	.long	.Lfunc_begin0
	.byte	8
	.section	.text.__umoddi3,"ax",@progbits
                                        // -- End function
	.addrsig
