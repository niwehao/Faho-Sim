	.text
	.file	"comparesf2.c"
	.section	.text.__lesf2,"ax",@progbits
	.globl	__lesf2                         // -- Begin function __lesf2
	.type	__lesf2,@function
__lesf2:                                // @__lesf2
.Lfunc_begin0:
// %bb.0:
	and r3, r0, 2147483647
	move r5, 2139095040
	move r2, 1
	jgtu r3, r5, .LBB0_9
// %bb.1:
	and r4, r1, 2147483647
	jgtu r4, r5, .LBB0_9
// %bb.2:
	or r2, r4, r3, z, .LBB0_3
// %bb.4:
	and r2, r1, r0, mi, .LBB0_7
// %bb.5:
	move r2, -1
	jlts r0, r1, .LBB0_9
// %bb.6:
	sub r0, r0, r1, neq
	jump r23
.LBB0_3:
	move r2, 0
	move r0, r2
	jump r23
.LBB0_7:
	move r2, -1
	jgts r0, r1, .LBB0_9
// %bb.8:
	sub r2, r0, r1, neq
.LBB0_9:
	move r0, r2
	jump r23
.Lfunc_end0:
	.size	__lesf2, .Lfunc_end0-__lesf2
	.section	.stack_sizes,"o",@progbits,.text.__lesf2
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__lesf2,"ax",@progbits
                                        // -- End function
	.section	.text.__gesf2,"ax",@progbits
	.globl	__gesf2                         // -- Begin function __gesf2
	.type	__gesf2,@function
__gesf2:                                // @__gesf2
.Lfunc_begin1:
// %bb.0:
	move r2, r0
	and r3, r2, 2147483647
	move r4, 2139095040
	move r0, -1
	jgtu r3, r4, .LBB1_9
// %bb.1:
	and r5, r1, 2147483647
	jgtu r5, r4, .LBB1_9
// %bb.2:
	or r3, r5, r3, z, .LBB1_3
// %bb.4:
	and r3, r1, r2, mi, .LBB1_7
// %bb.5:
	jlts r2, r1, .LBB1_9
// %bb.6:
	sub r0, r2, r1, neq
	jump r23
.LBB1_3:
	move r0, 0
	jump r23
.LBB1_7:
	jgts r2, r1, .LBB1_9
// %bb.8:
	sub r0, r2, r1, neq
.LBB1_9:
	jump r23
.Lfunc_end1:
	.size	__gesf2, .Lfunc_end1-__gesf2
	.section	.stack_sizes,"o",@progbits,.text.__gesf2
	.long	.Lfunc_begin1
	.byte	0
	.section	.text.__gesf2,"ax",@progbits
                                        // -- End function
	.section	.text.__unordsf2,"ax",@progbits
	.globl	__unordsf2                      // -- Begin function __unordsf2
	.type	__unordsf2,@function
__unordsf2:                             // @__unordsf2
.Lfunc_begin2:
// %bb.0:
	and r0, r0, 2147483647
	and r1, r1, 2147483647
	move r2, 2139095040
	sub r0, r0, r2, gtu
	sub r1, r1, r2, gtu
	or r0, r0, r1
	jump r23
.Lfunc_end2:
	.size	__unordsf2, .Lfunc_end2-__unordsf2
	.section	.stack_sizes,"o",@progbits,.text.__unordsf2
	.long	.Lfunc_begin2
	.byte	0
	.section	.text.__unordsf2,"ax",@progbits
                                        // -- End function
	.section	.text.__eqsf2,"ax",@progbits
	.globl	__eqsf2                         // -- Begin function __eqsf2
	.type	__eqsf2,@function
__eqsf2:                                // @__eqsf2
.Lfunc_begin3:
// %bb.0:
	and r3, r0, 2147483647
	move r5, 2139095040
	move r2, 1
	jgtu r3, r5, .LBB3_8
// %bb.1:
	and r4, r1, 2147483647
	jgtu r4, r5, .LBB3_8
// %bb.2:
	or r2, r4, r3, z, .LBB3_3
// %bb.4:
	and r2, r1, r0, mi, .LBB3_6
// %bb.5:
	move r2, -1
	jlts r0, r1, .LBB3_8
.LBB3_7:
	sub r2, r0, r1, neq
.LBB3_8:
	move r0, r2
	jump r23
.LBB3_3:
	move r2, 0
	move r0, r2
	jump r23
.LBB3_6:
	move r2, -1
	jles r0, r1, .LBB3_7
	jump .LBB3_8
.Lfunc_end3:
	.size	__eqsf2, .Lfunc_end3-__eqsf2
	.section	.stack_sizes,"o",@progbits,.text.__eqsf2
	.long	.Lfunc_begin3
	.byte	0
	.section	.text.__eqsf2,"ax",@progbits
                                        // -- End function
	.section	.text.__ltsf2,"ax",@progbits
	.globl	__ltsf2                         // -- Begin function __ltsf2
	.type	__ltsf2,@function
__ltsf2:                                // @__ltsf2
.Lfunc_begin4:
// %bb.0:
	and r3, r0, 2147483647
	move r5, 2139095040
	move r2, 1
	jgtu r3, r5, .LBB4_8
// %bb.1:
	and r4, r1, 2147483647
	jgtu r4, r5, .LBB4_8
// %bb.2:
	or r2, r4, r3, z, .LBB4_3
// %bb.4:
	and r2, r1, r0, mi, .LBB4_6
// %bb.5:
	move r2, -1
	jlts r0, r1, .LBB4_8
.LBB4_7:
	sub r2, r0, r1, neq
.LBB4_8:
	move r0, r2
	jump r23
.LBB4_3:
	move r2, 0
	move r0, r2
	jump r23
.LBB4_6:
	move r2, -1
	jles r0, r1, .LBB4_7
	jump .LBB4_8
.Lfunc_end4:
	.size	__ltsf2, .Lfunc_end4-__ltsf2
	.section	.stack_sizes,"o",@progbits,.text.__ltsf2
	.long	.Lfunc_begin4
	.byte	0
	.section	.text.__ltsf2,"ax",@progbits
                                        // -- End function
	.section	.text.__nesf2,"ax",@progbits
	.globl	__nesf2                         // -- Begin function __nesf2
	.type	__nesf2,@function
__nesf2:                                // @__nesf2
.Lfunc_begin5:
// %bb.0:
	and r3, r0, 2147483647
	move r5, 2139095040
	move r2, 1
	jgtu r3, r5, .LBB5_8
// %bb.1:
	and r4, r1, 2147483647
	jgtu r4, r5, .LBB5_8
// %bb.2:
	or r2, r4, r3, z, .LBB5_3
// %bb.4:
	and r2, r1, r0, mi, .LBB5_6
// %bb.5:
	move r2, -1
	jlts r0, r1, .LBB5_8
.LBB5_7:
	sub r2, r0, r1, neq
.LBB5_8:
	move r0, r2
	jump r23
.LBB5_3:
	move r2, 0
	move r0, r2
	jump r23
.LBB5_6:
	move r2, -1
	jles r0, r1, .LBB5_7
	jump .LBB5_8
.Lfunc_end5:
	.size	__nesf2, .Lfunc_end5-__nesf2
	.section	.stack_sizes,"o",@progbits,.text.__nesf2
	.long	.Lfunc_begin5
	.byte	0
	.section	.text.__nesf2,"ax",@progbits
                                        // -- End function
	.section	.text.__gtsf2,"ax",@progbits
	.globl	__gtsf2                         // -- Begin function __gtsf2
	.type	__gtsf2,@function
__gtsf2:                                // @__gtsf2
.Lfunc_begin6:
// %bb.0:
	move r2, r0
	and r3, r2, 2147483647
	move r4, 2139095040
	move r0, -1
	jgtu r3, r4, .LBB6_8
// %bb.1:
	and r5, r1, 2147483647
	jgtu r5, r4, .LBB6_8
// %bb.2:
	or r3, r5, r3, z, .LBB6_3
// %bb.4:
	and r3, r1, r2, mi, .LBB6_6
// %bb.5:
	jlts r2, r1, .LBB6_8
.LBB6_7:
	sub r0, r2, r1, neq
.LBB6_8:
	jump r23
.LBB6_3:
	move r0, 0
	jump r23
.LBB6_6:
	jles r2, r1, .LBB6_7
	jump .LBB6_8
.Lfunc_end6:
	.size	__gtsf2, .Lfunc_end6-__gtsf2
	.section	.stack_sizes,"o",@progbits,.text.__gtsf2
	.long	.Lfunc_begin6
	.byte	0
	.section	.text.__gtsf2,"ax",@progbits
                                        // -- End function
	.globl	__cmpsf2
	.type	__cmpsf2,@function
.set __cmpsf2, __lesf2
	.addrsig
	.addrsig_sym __lesf2
