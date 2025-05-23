	.text
	.file	"floatdidf.c"
	.section	.text.__floatdidf,"ax",@progbits
	.globl	__floatdidf                     // -- Begin function __floatdidf
	.type	__floatdidf,@function
__floatdidf:                            // @__floatdidf
.Lfunc_begin0:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	movd d14, d0
	call r23, __floatsidf
	move r3, 0
	move r2, 1106247680
	call r23, __muldf3
	and r3, r15, 4294967295
	and r2, r14, 0
	or r15, r3, 0
	or r14, r2, 1127219200
	move r3, 0
	move r2, 3274702848
	call r23, __adddf3
	movd d2, d14
	call r23, __adddf3
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__floatdidf, .Lfunc_end0-__floatdidf
	.section	.stack_sizes,"o",@progbits,.text.__floatdidf
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.__floatdidf,"ax",@progbits
                                        // -- End function
	.addrsig
