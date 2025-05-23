	.text
	.file	"divmodsi4.c"
	.section	.text.__divmodsi4,"ax",@progbits
	.globl	__divmodsi4                     // -- Begin function __divmodsi4
	.type	__divmodsi4,@function
__divmodsi4:                            // @__divmodsi4
.Lfunc_begin0:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r14, r2
	call r23, __div32
	sw r14, 0, r1
                                        // kill: def $r0 killed $r0 killed $d0
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__divmodsi4, .Lfunc_end0-__divmodsi4
	.section	.stack_sizes,"o",@progbits,.text.__divmodsi4
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.__divmodsi4,"ax",@progbits
                                        // -- End function
	.addrsig
