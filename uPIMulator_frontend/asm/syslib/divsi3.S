	.text
	.file	"divsi3.c"
	.section	.text.__divsi3,"ax",@progbits
	.globl	__divsi3                        // -- Begin function __divsi3
	.type	__divsi3,@function
__divsi3:                               // @__divsi3
.Lfunc_begin0:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	asr r2, r0, 31
	asr r3, r1, 31
	xor r0, r2, r0
	sub r0, r0, r2
	xor r1, r3, r1
	sub r1, r1, r3
	xor r14, r3, r2
	call r23, __udiv32
	xor r0, r0, r14
	sub r0, r0, r14
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__divsi3, .Lfunc_end0-__divsi3
	.section	.stack_sizes,"o",@progbits,.text.__divsi3
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.__divsi3,"ax",@progbits
                                        // -- End function
	.addrsig
