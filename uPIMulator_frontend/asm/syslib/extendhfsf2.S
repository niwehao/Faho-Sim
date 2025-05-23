	.text
	.file	"extendhfsf2.c"
	.section	.text.__extendhfsf2,"ax",@progbits
	.globl	__extendhfsf2                   // -- Begin function __extendhfsf2
	.type	__extendhfsf2,@function
__extendhfsf2:                          // @__extendhfsf2
.Lfunc_begin0:
// %bb.0:
	and r1, r0, 32767
	add r2, r1, -1024
	and r2, r2, 63488
	lsr r2, r2, 11
	jgtu r2, 14, .LBB0_2
// %bb.1:
	move r2, 939524096
	lsl_add r1, r2, r1, 13
	and r0, r0, 32768
	lsl r0, r0, 16
	or r0, r1, r0
	jump r23
.LBB0_2:
	lsr r2, r1, 10
	jltu r2, 31, .LBB0_4
// %bb.3:
	lsl r1, r1, 13
	or r1, r1, 2139095040
	and r0, r0, 32768
	lsl r0, r0, 16
	or r0, r1, r0
	jump r23
.LBB0_4:
	jeq r1, 0, .LBB0_5
// %bb.6:
	clz r2, r1
	add r3, r2, -8
	lsl r1, r1, r3
	xor r1, r1, 8388608
	move r3, 1124073472
	lsl_sub r2, r3, r2, 23
	or r1, r1, r2
	and r0, r0, 32768
	lsl r0, r0, 16
	or r0, r1, r0
	jump r23
.LBB0_5:
	move r1, 0
	and r0, r0, 32768
	lsl r0, r0, 16
	or r0, r1, r0
	jump r23
.Lfunc_end0:
	.size	__extendhfsf2, .Lfunc_end0-__extendhfsf2
	.section	.stack_sizes,"o",@progbits,.text.__extendhfsf2
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__extendhfsf2,"ax",@progbits
                                        // -- End function
	.section	.text.__gnu_h2f_ieee,"ax",@progbits
	.globl	__gnu_h2f_ieee                  // -- Begin function __gnu_h2f_ieee
	.type	__gnu_h2f_ieee,@function
__gnu_h2f_ieee:                         // @__gnu_h2f_ieee
.Lfunc_begin1:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	call r23, __extendhfsf2
	ld d22, r22, -8
	jump r23
.Lfunc_end1:
	.size	__gnu_h2f_ieee, .Lfunc_end1-__gnu_h2f_ieee
	.section	.stack_sizes,"o",@progbits,.text.__gnu_h2f_ieee
	.long	.Lfunc_begin1
	.byte	8
	.section	.text.__gnu_h2f_ieee,"ax",@progbits
                                        // -- End function
	.addrsig
