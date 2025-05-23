	.text
	.file	"comparedf2.c"
	.section	.text.__ledf2,"ax",@progbits
	.globl	__ledf2                         // -- Begin function __ledf2
	.type	__ledf2,@function
__ledf2:                                // @__ledf2
.Lfunc_begin0:
// %bb.0:
	and r7, r1, 4294967295
	and r6, r0, 2147483647
	move r11, 0
	move r10, 2146435072
	move r4, 1
	sub zero, r7, r11
	subc zero, r6, r10, xgtu, .LBB0_9
// %bb.1:
	and r9, r3, 4294967295
	and r8, r2, 2147483647
	sub zero, r9, r11
	subc zero, r8, r10, xgtu, .LBB0_9
// %bb.2:
	or r7, r9, r7
	or r6, r8, r6
	move.s d4, 0
	jneq r7, r5, .LBB0_11
// %bb.10:
	jeq r6, r4, .LBB0_3
.LBB0_11:
// %bb.4:
	and r7, r3, r1
	and r6, r2, r0
	sub zero, r7, r5
	subc zero, r6, r4, lts, .LBB0_7
// %bb.5:
	move r4, -1
	sub zero, r1, r3
	subc zero, r0, r2, lts, .LBB0_9
// %bb.6:
	sub zero, r1, r3
	subc r0, r0, r2, xnz
	jump r23
.LBB0_3:
	move r4, 0
	move r0, r4
	jump r23
.LBB0_7:
	move r4, -1
	sub zero, r1, r3
	subc zero, r0, r2, xgts, .LBB0_9
// %bb.8:
	sub zero, r1, r3
	subc r4, r0, r2, xnz
.LBB0_9:
	move r0, r4
	jump r23
.Lfunc_end0:
	.size	__ledf2, .Lfunc_end0-__ledf2
	.section	.stack_sizes,"o",@progbits,.text.__ledf2
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__ledf2,"ax",@progbits
                                        // -- End function
	.section	.text.__gedf2,"ax",@progbits
	.globl	__gedf2                         // -- Begin function __gedf2
	.type	__gedf2,@function
__gedf2:                                // @__gedf2
.Lfunc_begin1:
// %bb.0:
	movd d4, d0
	and r7, r5, 4294967295
	and r6, r4, 2147483647
	move r9, 0
	move r8, 2146435072
	move r0, -1
	sub zero, r7, r9
	subc zero, r6, r8, xgtu, .LBB1_9
// %bb.1:
	and r11, r3, 4294967295
	and r10, r2, 2147483647
	sub zero, r11, r9
	subc zero, r10, r8, xgtu, .LBB1_9
// %bb.2:
	or r9, r11, r7
	or r8, r10, r6
	move.s d6, 0
	jneq r9, r7, .LBB1_11
// %bb.10:
	jeq r8, r6, .LBB1_3
.LBB1_11:
// %bb.4:
	and r9, r3, r5
	and r8, r2, r4
	sub zero, r9, r7
	subc zero, r8, r6, lts, .LBB1_7
// %bb.5:
	sub zero, r5, r3
	subc zero, r4, r2, lts, .LBB1_9
// %bb.6:
	sub zero, r5, r3
	subc r0, r4, r2, xnz
	jump r23
.LBB1_3:
	move r0, 0
	jump r23
.LBB1_7:
	sub zero, r5, r3
	subc zero, r4, r2, xgts, .LBB1_9
// %bb.8:
	sub zero, r5, r3
	subc r0, r4, r2, xnz
.LBB1_9:
	jump r23
.Lfunc_end1:
	.size	__gedf2, .Lfunc_end1-__gedf2
	.section	.stack_sizes,"o",@progbits,.text.__gedf2
	.long	.Lfunc_begin1
	.byte	0
	.section	.text.__gedf2,"ax",@progbits
                                        // -- End function
	.section	.text.__unorddf2,"ax",@progbits
	.globl	__unorddf2                      // -- Begin function __unorddf2
	.type	__unorddf2,@function
__unorddf2:                             // @__unorddf2
.Lfunc_begin2:
// %bb.0:
	and r1, r1, 4294967295
	and r0, r0, 2147483647
	and r3, r3, 4294967295
	and r2, r2, 2147483647
	move r5, 0
	move r4, 2146435072
	sub zero, r1, r5
	subc r0, r0, r4, xgtu
	sub zero, r3, r5
	subc r1, r2, r4, xgtu
	or r0, r0, r1
	jump r23
.Lfunc_end2:
	.size	__unorddf2, .Lfunc_end2-__unorddf2
	.section	.stack_sizes,"o",@progbits,.text.__unorddf2
	.long	.Lfunc_begin2
	.byte	0
	.section	.text.__unorddf2,"ax",@progbits
                                        // -- End function
	.section	.text.__eqdf2,"ax",@progbits
	.globl	__eqdf2                         // -- Begin function __eqdf2
	.type	__eqdf2,@function
__eqdf2:                                // @__eqdf2
.Lfunc_begin3:
// %bb.0:
	and r7, r1, 4294967295
	and r6, r0, 2147483647
	move r11, 0
	move r10, 2146435072
	move r4, 1
	sub zero, r7, r11
	subc zero, r6, r10, xgtu, .LBB3_8
// %bb.1:
	and r9, r3, 4294967295
	and r8, r2, 2147483647
	sub zero, r9, r11
	subc zero, r8, r10, xgtu, .LBB3_8
// %bb.2:
	or r7, r9, r7
	or r6, r8, r6
	move.s d4, 0
	jneq r7, r5, .LBB3_10
// %bb.9:
	jeq r6, r4, .LBB3_3
.LBB3_10:
// %bb.4:
	and r7, r3, r1
	and r6, r2, r0
	sub zero, r7, r5
	subc zero, r6, r4, lts, .LBB3_6
// %bb.5:
	move r4, -1
	sub zero, r1, r3
	subc zero, r0, r2, lts, .LBB3_8
.LBB3_7:
	sub zero, r1, r3
	subc r4, r0, r2, xnz
.LBB3_8:
	move r0, r4
	jump r23
.LBB3_3:
	move r4, 0
	move r0, r4
	jump r23
.LBB3_6:
	move r4, -1
	sub zero, r1, r3
	subc zero, r0, r2, xles, .LBB3_7
	jump .LBB3_8
.Lfunc_end3:
	.size	__eqdf2, .Lfunc_end3-__eqdf2
	.section	.stack_sizes,"o",@progbits,.text.__eqdf2
	.long	.Lfunc_begin3
	.byte	0
	.section	.text.__eqdf2,"ax",@progbits
                                        // -- End function
	.section	.text.__ltdf2,"ax",@progbits
	.globl	__ltdf2                         // -- Begin function __ltdf2
	.type	__ltdf2,@function
__ltdf2:                                // @__ltdf2
.Lfunc_begin4:
// %bb.0:
	and r7, r1, 4294967295
	and r6, r0, 2147483647
	move r11, 0
	move r10, 2146435072
	move r4, 1
	sub zero, r7, r11
	subc zero, r6, r10, xgtu, .LBB4_8
// %bb.1:
	and r9, r3, 4294967295
	and r8, r2, 2147483647
	sub zero, r9, r11
	subc zero, r8, r10, xgtu, .LBB4_8
// %bb.2:
	or r7, r9, r7
	or r6, r8, r6
	move.s d4, 0
	jneq r7, r5, .LBB4_10
// %bb.9:
	jeq r6, r4, .LBB4_3
.LBB4_10:
// %bb.4:
	and r7, r3, r1
	and r6, r2, r0
	sub zero, r7, r5
	subc zero, r6, r4, lts, .LBB4_6
// %bb.5:
	move r4, -1
	sub zero, r1, r3
	subc zero, r0, r2, lts, .LBB4_8
.LBB4_7:
	sub zero, r1, r3
	subc r4, r0, r2, xnz
.LBB4_8:
	move r0, r4
	jump r23
.LBB4_3:
	move r4, 0
	move r0, r4
	jump r23
.LBB4_6:
	move r4, -1
	sub zero, r1, r3
	subc zero, r0, r2, xles, .LBB4_7
	jump .LBB4_8
.Lfunc_end4:
	.size	__ltdf2, .Lfunc_end4-__ltdf2
	.section	.stack_sizes,"o",@progbits,.text.__ltdf2
	.long	.Lfunc_begin4
	.byte	0
	.section	.text.__ltdf2,"ax",@progbits
                                        // -- End function
	.section	.text.__nedf2,"ax",@progbits
	.globl	__nedf2                         // -- Begin function __nedf2
	.type	__nedf2,@function
__nedf2:                                // @__nedf2
.Lfunc_begin5:
// %bb.0:
	and r7, r1, 4294967295
	and r6, r0, 2147483647
	move r11, 0
	move r10, 2146435072
	move r4, 1
	sub zero, r7, r11
	subc zero, r6, r10, xgtu, .LBB5_8
// %bb.1:
	and r9, r3, 4294967295
	and r8, r2, 2147483647
	sub zero, r9, r11
	subc zero, r8, r10, xgtu, .LBB5_8
// %bb.2:
	or r7, r9, r7
	or r6, r8, r6
	move.s d4, 0
	jneq r7, r5, .LBB5_10
// %bb.9:
	jeq r6, r4, .LBB5_3
.LBB5_10:
// %bb.4:
	and r7, r3, r1
	and r6, r2, r0
	sub zero, r7, r5
	subc zero, r6, r4, lts, .LBB5_6
// %bb.5:
	move r4, -1
	sub zero, r1, r3
	subc zero, r0, r2, lts, .LBB5_8
.LBB5_7:
	sub zero, r1, r3
	subc r4, r0, r2, xnz
.LBB5_8:
	move r0, r4
	jump r23
.LBB5_3:
	move r4, 0
	move r0, r4
	jump r23
.LBB5_6:
	move r4, -1
	sub zero, r1, r3
	subc zero, r0, r2, xles, .LBB5_7
	jump .LBB5_8
.Lfunc_end5:
	.size	__nedf2, .Lfunc_end5-__nedf2
	.section	.stack_sizes,"o",@progbits,.text.__nedf2
	.long	.Lfunc_begin5
	.byte	0
	.section	.text.__nedf2,"ax",@progbits
                                        // -- End function
	.section	.text.__gtdf2,"ax",@progbits
	.globl	__gtdf2                         // -- Begin function __gtdf2
	.type	__gtdf2,@function
__gtdf2:                                // @__gtdf2
.Lfunc_begin6:
// %bb.0:
	movd d4, d0
	and r7, r5, 4294967295
	and r6, r4, 2147483647
	move r9, 0
	move r8, 2146435072
	move r0, -1
	sub zero, r7, r9
	subc zero, r6, r8, xgtu, .LBB6_8
// %bb.1:
	and r11, r3, 4294967295
	and r10, r2, 2147483647
	sub zero, r11, r9
	subc zero, r10, r8, xgtu, .LBB6_8
// %bb.2:
	or r9, r11, r7
	or r8, r10, r6
	move.s d6, 0
	jneq r9, r7, .LBB6_10
// %bb.9:
	jeq r8, r6, .LBB6_3
.LBB6_10:
// %bb.4:
	and r9, r3, r5
	and r8, r2, r4
	sub zero, r9, r7
	subc zero, r8, r6, lts, .LBB6_6
// %bb.5:
	sub zero, r5, r3
	subc zero, r4, r2, lts, .LBB6_8
.LBB6_7:
	sub zero, r5, r3
	subc r0, r4, r2, xnz
.LBB6_8:
	jump r23
.LBB6_3:
	move r0, 0
	jump r23
.LBB6_6:
	sub zero, r5, r3
	subc zero, r4, r2, xles, .LBB6_7
	jump .LBB6_8
.Lfunc_end6:
	.size	__gtdf2, .Lfunc_end6-__gtdf2
	.section	.stack_sizes,"o",@progbits,.text.__gtdf2
	.long	.Lfunc_begin6
	.byte	0
	.section	.text.__gtdf2,"ax",@progbits
                                        // -- End function
	.globl	__cmpdf2
	.type	__cmpdf2,@function
.set __cmpdf2, __ledf2
	.addrsig
	.addrsig_sym __ledf2
