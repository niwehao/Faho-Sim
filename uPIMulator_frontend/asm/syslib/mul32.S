	.text
	.file	"mul32.c"
	.section	.text.__mulsi3,"ax",@progbits
	.globl	__mulsi3                        // -- Begin function __mulsi3
	.type	__mulsi3,@function
__mulsi3:                               // @__mulsi3
.Lfunc_begin0:
// %bb.0:
	// inline asm
	jgtu r1, r0, __mulsi3_swap
	move r2, r0
	move r0, r1, true, __mulsi3_start
__mulsi3_swap:
	move r2, r1
	move r0, r0
__mulsi3_start:
	move r1, zero
	mul_step d0, r2, d0, 0, z, __mulsi3_exit
	mul_step d0, r2, d0, 1, z, __mulsi3_exit
	mul_step d0, r2, d0, 2, z, __mulsi3_exit
	mul_step d0, r2, d0, 3, z, __mulsi3_exit
	mul_step d0, r2, d0, 4, z, __mulsi3_exit
	mul_step d0, r2, d0, 5, z, __mulsi3_exit
	mul_step d0, r2, d0, 6, z, __mulsi3_exit
	mul_step d0, r2, d0, 7, z, __mulsi3_exit
	mul_step d0, r2, d0, 8, z, __mulsi3_exit
	mul_step d0, r2, d0, 9, z, __mulsi3_exit
	mul_step d0, r2, d0, 10, z, __mulsi3_exit
	mul_step d0, r2, d0, 11, z, __mulsi3_exit
	mul_step d0, r2, d0, 12, z, __mulsi3_exit
	mul_step d0, r2, d0, 13, z, __mulsi3_exit
	mul_step d0, r2, d0, 14, z, __mulsi3_exit
	mul_step d0, r2, d0, 15, z, __mulsi3_exit
	mul_step d0, r2, d0, 16, z, __mulsi3_exit
	mul_step d0, r2, d0, 17, z, __mulsi3_exit
	mul_step d0, r2, d0, 18, z, __mulsi3_exit
	mul_step d0, r2, d0, 19, z, __mulsi3_exit
	mul_step d0, r2, d0, 20, z, __mulsi3_exit
	mul_step d0, r2, d0, 21, z, __mulsi3_exit
	mul_step d0, r2, d0, 22, z, __mulsi3_exit
	mul_step d0, r2, d0, 23, z, __mulsi3_exit
	mul_step d0, r2, d0, 24, z, __mulsi3_exit
	mul_step d0, r2, d0, 25, z, __mulsi3_exit
	mul_step d0, r2, d0, 26, z, __mulsi3_exit
	mul_step d0, r2, d0, 27, z, __mulsi3_exit
	mul_step d0, r2, d0, 28, z, __mulsi3_exit
	mul_step d0, r2, d0, 29, z, __mulsi3_exit
	mul_step d0, r2, d0, 30, z, __mulsi3_exit
	mul_step d0, r2, d0, 31, z, __mulsi3_exit
__mulsi3_exit:
	move r0, r1

	// inline asm
	jump r23
.Lfunc_end0:
	.size	__mulsi3, .Lfunc_end0-__mulsi3
	.section	.stack_sizes,"o",@progbits,.text.__mulsi3
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__mulsi3,"ax",@progbits
                                        // -- End function
	.addrsig
