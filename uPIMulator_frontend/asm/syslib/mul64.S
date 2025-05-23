	.text
	.file	"mul64.c"
	.section	.text.__muldi3,"ax",@progbits
	.globl	__muldi3                        // -- Begin function __muldi3
	.type	__muldi3,@function
__muldi3:                               // @__muldi3
.Lfunc_begin0:
// %bb.0:
	sd r22, 8, d14
	sd r22, 0, d16
	// inline asm
	mul_ul_ul r4, r1, r3
	// inline asm
	and r4, r4, 65535
	// inline asm
	mul_ul_uh r5, r1, r3
	// inline asm
	and r5, r5, 65535
	// inline asm
	mul_ul_uh r6, r3, r1
	// inline asm
	and r6, r6, 65535
	add r5, r6, r5
	lsl_add r4, r4, r5, 8
	move.u d6, r4
	lsr r4, r3, 16
	// inline asm
	mul_ul_ul r5, r1, r4
	// inline asm
	and r8, r5, 65535
	lsr r5, r1, 16
	// inline asm
	mul_ul_ul r9, r3, r5
	// inline asm
	and r9, r9, 65535
	add r8, r9, r8
	// inline asm
	mul_uh_uh r9, r1, r3
	// inline asm
	and r9, r9, 65535
	add r8, r8, r9
	move.u d8, r8
	lslx r10, r9, 16
	lsl_add r10, r10, r8, 16
	lsl r11, r9, 16
	add r7, r11, r7
	addc r6, r10, r6
	// inline asm
	mul_ul_uh r8, r1, r4
	// inline asm
	and r8, r8, 65535
	// inline asm
	mul_ul_uh r9, r3, r5
	// inline asm
	and r9, r9, 65535
	add r8, r9, r8
	// inline asm
	mul_uh_ul r9, r1, r4
	// inline asm
	and r9, r9, 65535
	add r8, r8, r9
	// inline asm
	mul_uh_ul r9, r3, r5
	// inline asm
	and r9, r9, 65535
	add r8, r8, r9
	move.u d10, r8
	lslx r8, r11, 24
	lsl_add r8, r8, r10, 24
	lsl r9, r11, 24
	// inline asm
	mul_ul_ul r10, r1, r2
	// inline asm
	and r10, r10, 65535
	// inline asm
	mul_ul_ul r11, r3, r0
	// inline asm
	and r11, r11, 65535
	add r10, r11, r10
	// inline asm
	mul_uh_uh r11, r1, r4
	// inline asm
	and r11, r11, 65535
	add r10, r10, r11
	// inline asm
	mul_uh_uh r11, r3, r5
	// inline asm
	and r11, r11, 65535
	add r10, r10, r11
	// inline asm
	mul_ul_ul r11, r5, r4
	// inline asm
	and r11, r11, 65535
	add r10, r10, r11
	// inline asm
	mul_ul_uh r11, r1, r2
	// inline asm
	and r11, r11, 65535
	// inline asm
	mul_ul_uh r12, r3, r0
	// inline asm
	and r12, r12, 65535
	add r11, r12, r11
	// inline asm
	mul_ul_uh r12, r2, r1
	// inline asm
	and r12, r12, 65535
	add r11, r11, r12
	// inline asm
	mul_ul_uh r12, r0, r3
	// inline asm
	and r12, r12, 65535
	add r11, r11, r12
	// inline asm
	mul_ul_uh r12, r5, r4
	// inline asm
	and r12, r12, 65535
	add r11, r11, r12
	// inline asm
	mul_ul_uh r12, r4, r5
	// inline asm
	and r12, r12, 65535
	add r11, r11, r12
	lsl_add r10, r10, r11, 8
	lsr.u d12, r2, 16
	// inline asm
	mul_ul_ul r11, r1, r13
	// inline asm
	and r11, r11, 65535
	lsr.u d14, r0, 16
	// inline asm
	mul_ul_ul r16, r3, r15
	// inline asm
	and r16, r16, 65535
	add r11, r16, r11
	// inline asm
	mul_uh_uh r16, r1, r2
	// inline asm
	and r16, r16, 65535
	add r11, r11, r16
	// inline asm
	mul_uh_uh r16, r3, r0
	// inline asm
	add r11, r11, r16
	// inline asm
	mul_ul_ul r16, r2, r5
	// inline asm
	add r11, r11, r16
	// inline asm
	mul_ul_ul r16, r0, r4
	// inline asm
	add r11, r11, r16
	// inline asm
	mul_uh_uh r16, r5, r4
	// inline asm
	add r11, r11, r16
	lsl_add r10, r10, r11, 16
	// inline asm
	mul_ul_uh r11, r1, r13
	// inline asm
	and r11, r11, 65535
	// inline asm
	mul_ul_uh r16, r3, r15
	// inline asm
	and r16, r16, 65535
	add r11, r16, r11
	// inline asm
	mul_uh_ul r12, r1, r13
	// inline asm
	and r12, r12, 65535
	add r11, r11, r12
	// inline asm
	mul_uh_ul r12, r3, r15
	// inline asm
	and r12, r12, 65535
	add r11, r11, r12
	// inline asm
	mul_uh_ul r12, r2, r5
	// inline asm
	add r11, r11, r12
	// inline asm
	mul_uh_ul r12, r0, r4
	// inline asm
	add r11, r11, r12
	// inline asm
	mul_ul_uh r2, r2, r5
	// inline asm
	add r2, r11, r2
	// inline asm
	mul_ul_uh r0, r0, r4
	// inline asm
	add r0, r2, r0
	lsl_add r0, r10, r0, 24
	move.s d0, r0
	move r3, 0
	add r5, r7, r9
	addc r4, r6, r8
	move r2, r1
	add r1, r5, r3
	addc r0, r4, r2
	ld d16, r22, 0
	ld d14, r22, 8
	jump r23
.Lfunc_end0:
	.size	__muldi3, .Lfunc_end0-__muldi3
	.section	.stack_sizes,"o",@progbits,.text.__muldi3
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.__muldi3,"ax",@progbits
                                        // -- End function
	.addrsig
