	.text
	.file	"fixunsdfdi.c"
	.section	.text.__fixunsdfdi,"ax",@progbits
	.globl	__fixunsdfdi                    // -- Begin function __fixunsdfdi
	.type	__fixunsdfdi,@function
__fixunsdfdi:                           // @__fixunsdfdi
.Lfunc_begin0:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sd r22, -16, d14
	sd r22, -24, d16
	movd d14, d0
	move.s d16, 0
	movd d2, d16
	call r23, __ledf2
	jlts r0, 1, .LBB0_2
// %bb.1:
	move r3, 0
	move r2, 1039138816
	movd d0, d14
	call r23, __muldf3
	call r23, __fixunsdfsi
	move r16, r0
	call r23, __floatunsidf
	move r3, 0
	move r2, 3253731328
	call r23, __muldf3
	movd d2, d0
	movd d0, d14
	call r23, __adddf3
	call r23, __fixunsdfsi
	move.s d2, r16
	move r5, 0
	move r4, r3
	move.u d0, r0
	or r17, r5, r1
	or r16, r4, r0
.LBB0_2:
	movd d0, d16
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__fixunsdfdi, .Lfunc_end0-__fixunsdfdi
	.section	.stack_sizes,"o",@progbits,.text.__fixunsdfdi
	.long	.Lfunc_begin0
	.byte	24
	.section	.text.__fixunsdfdi,"ax",@progbits
                                        // -- End function
	.addrsig
