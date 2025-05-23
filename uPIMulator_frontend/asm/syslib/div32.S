	.text
	.file	"div32.c"
	.section	.text.__udiv32,"ax",@progbits
	.globl	__udiv32                        // -- Begin function __udiv32
	.type	__udiv32,@function
__udiv32:                               // @__udiv32
.Lfunc_begin0:
// %bb.0:
	// inline asm

	clz r3, r1, max, __udiv32_division_by_zero
	clz r4, r0
	sub r3, r4, r3, gtu, __udiv32_result_0
	move r4, r1
	move.u d0, r0
	jump r3, __udiv32_base
	div_step d0, r4, d0, 31
	div_step d0, r4, d0, 30
	div_step d0, r4, d0, 29
	div_step d0, r4, d0, 28
	div_step d0, r4, d0, 27
	div_step d0, r4, d0, 26
	div_step d0, r4, d0, 25
	div_step d0, r4, d0, 24
	div_step d0, r4, d0, 23
	div_step d0, r4, d0, 22
	div_step d0, r4, d0, 21
	div_step d0, r4, d0, 20
	div_step d0, r4, d0, 19
	div_step d0, r4, d0, 18
	div_step d0, r4, d0, 17
	div_step d0, r4, d0, 16
	div_step d0, r4, d0, 15
	div_step d0, r4, d0, 14
	div_step d0, r4, d0, 13
	div_step d0, r4, d0, 12
	div_step d0, r4, d0, 11
	div_step d0, r4, d0, 10
	div_step d0, r4, d0, 9
	div_step d0, r4, d0, 8
	div_step d0, r4, d0, 7
	div_step d0, r4, d0, 6
	div_step d0, r4, d0, 5
	div_step d0, r4, d0, 4
	div_step d0, r4, d0, 3
	div_step d0, r4, d0, 2
	div_step d0, r4, d0, 1
__udiv32_base:
	div_step d0, r4, d0, 0
__udiv32_exit:
	jump r23
__udiv32_result_0:
	move.u d0, r0, true, __udiv32_exit
__udiv32_division_by_zero:
	fault 2
	// inline asm
.Lfunc_end0:
	.size	__udiv32, .Lfunc_end0-__udiv32
	.section	.stack_sizes,"o",@progbits,.text.__udiv32
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__udiv32,"ax",@progbits
                                        // -- End function
	.section	.text.__div32,"ax",@progbits
	.globl	__div32                         // -- Begin function __div32
	.type	__div32,@function
__div32:                                // @__div32
.Lfunc_begin1:
// %bb.0:
	// inline asm

	sd r22, 0, d22
	add r22, r22, 8
	clo r3, r0, z, __div32_pos_dividend
	clo r3, r1, z, __div32_neg_dividend_pos_divider
__div32_neg_dividend_neg_divider:
	neg r0, r0
	neg r1, r1
	call r23, __udiv32
	neg r1, r1, true, __div32_exit
__div32_neg_dividend_pos_divider:
	neg r0, r0
	call r23, __udiv32
	neg r1, r1
	neg r0, r0, true, __div32_exit
__div32_pos_dividend:
	clo r3, r1, z, __div32_pos_dividend_pos_divider
	neg r1, r1
	call r23, __udiv32
	neg r0, r0, true, __div32_exit
__div32_pos_dividend_pos_divider:
	call r23, __udiv32
__div32_exit:
	ld d22, r22, -8
	jump r23

	// inline asm
.Lfunc_end1:
	.size	__div32, .Lfunc_end1-__div32
	.section	.stack_sizes,"o",@progbits,.text.__div32
	.long	.Lfunc_begin1
	.byte	0
	.section	.text.__div32,"ax",@progbits
                                        // -- End function
	.addrsig
