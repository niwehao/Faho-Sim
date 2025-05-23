	.text
	.file	"fixunssfdi.c"
	.section	.text.__fixunssfdi,"ax",@progbits
	.globl	__fixunssfdi                    // -- Begin function __fixunssfdi
	.type	__fixunssfdi,@function
__fixunssfdi:                           // @__fixunssfdi
.Lfunc_begin0:
// %bb.0:
	sd r22, 24, d22
	add r22, r22, 32
	sd r22, -16, d14
	sd r22, -24, d16
	sd r22, -32, d18
	move r16, r0
	move r15, 0
	move r1, r15
	call r23, __lesf2
	move r2, r0
	move.s d0, 0
	jlts r2, 1, .LBB0_2
// %bb.1:
	move r0, r16
	call r23, __extendsfdf2
	movd d16, d0
	move r3, 0
	move r2, 1039138816
	call r23, __muldf3
	call r23, __fixunsdfsi
	move r18, r0
	call r23, __floatunsidf
	move r3, 0
	move r2, 3253731328
	call r23, __muldf3
	movd d2, d0
	movd d0, d16
	call r23, __adddf3
	call r23, __fixunsdfsi
	move.s d2, r18
	move r14, r3
	move.u d0, r0
	or r1, r15, r1
	or r0, r14, r0
.LBB0_2:
	ld d18, r22, -32
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__fixunssfdi, .Lfunc_end0-__fixunssfdi
	.section	.stack_sizes,"o",@progbits,.text.__fixunssfdi
	.long	.Lfunc_begin0
	.byte	32
	.section	.text.__fixunssfdi,"ax",@progbits
                                        // -- End function
	.addrsig
