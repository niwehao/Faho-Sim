	.text
	.file	"umodsi3.c"
	.section	.text.__umodsi3,"ax",@progbits
	.globl	__umodsi3                       // -- Begin function __umodsi3
	.type	__umodsi3,@function
__umodsi3:                              // @__umodsi3
.Lfunc_begin0:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	call r23, __udiv32
	move r0, r1
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__umodsi3, .Lfunc_end0-__umodsi3
	.section	.stack_sizes,"o",@progbits,.text.__umodsi3
	.long	.Lfunc_begin0
	.byte	8
	.section	.text.__umodsi3,"ax",@progbits
                                        // -- End function
	.addrsig
