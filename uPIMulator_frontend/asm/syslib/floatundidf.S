	.text
	.file	"floatundidf.c"
	.section	.text.__floatundidf,"ax",@progbits
	.globl	__floatundidf                   // -- Begin function __floatundidf
	.type	__floatundidf,@function
__floatundidf:                          // @__floatundidf
.Lfunc_begin0:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move.u d2, r0
	or r5, r3, 0
	or r4, r2, 1160773632
	and r1, r1, 4294967295
	and r0, r0, 0
	or r15, r1, 0
	or r14, r0, 1127219200
	move r3, 1048576
	move r2, 3308257280
	movd d0, d4
	call r23, __adddf3
	movd d2, d14
	call r23, __adddf3
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__floatundidf, .Lfunc_end0-__floatundidf
	.section	.stack_sizes,"o",@progbits,.text.__floatundidf
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.__floatundidf,"ax",@progbits
                                        // -- End function
	.addrsig
