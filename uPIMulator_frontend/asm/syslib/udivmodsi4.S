	.text
	.file	"udivmodsi4.c"
	.section	.text.__udivmodsi4,"ax",@progbits
	.globl	__udivmodsi4                    // -- Begin function __udivmodsi4
	.type	__udivmodsi4,@function
__udivmodsi4:                           // @__udivmodsi4
.Lfunc_begin0:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r14, r2
	call r23, __udiv32
	sw r14, 0, r1
                                        // kill: def $r0 killed $r0 killed $d0
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__udivmodsi4, .Lfunc_end0-__udivmodsi4
	.section	.stack_sizes,"o",@progbits,.text.__udivmodsi4
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.__udivmodsi4,"ax",@progbits
                                        // -- End function
	.addrsig
