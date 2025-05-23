	.text
	.file	"truncsfhf2.c"
	.section	.text.__truncsfhf2,"ax",@progbits
	.globl	__truncsfhf2                    // -- Begin function __truncsfhf2
	.type	__truncsfhf2,@function
__truncsfhf2:                           // @__truncsfhf2
.Lfunc_begin0:
// %bb.0:
	and r2, r0, 2147483647
	add r1, r2, -947912704
	add r3, r2, -1199570944
	jgeu r1, r3, .LBB0_5
// %bb.1:
	lsr r2, r0, 13
	and r3, r0, 8191
	move r4, 4097
	and r1, r2, 65535
	jltu r3, r4, .LBB0_3
// %bb.2:
	add r1, r1, -114687
	jump .LBB0_14
.LBB0_5:
	move r1, 2139095041
	jltu r2, r1, .LBB0_7
// %bb.6:
	lsr r1, r0, 13
	and r1, r1, 511
	or r1, r1, 32256
	jump .LBB0_14
.LBB0_3:
	move r4, 4096
	add r1, r1, -114688
	jneq r3, r4, .LBB0_14
// %bb.4:
	and r1, r1, 65535
	and r2, r2, 1
.LBB0_13:
	add r1, r1, r2, true, .LBB0_14
.LBB0_7:
	move r1, 31744
	lsr r3, r2, 23
	jgtu r3, 142, .LBB0_14
// %bb.8:
	move r1, 0
	lsr r2, r2, 24
	jltu r2, 45, .LBB0_14
// %bb.9:
	and r1, r0, 8388607
	or r1, r1, 8388608
	sub r2, 113, r3
	add r3, r3, -81
	lsl r3, r1, r3
	move r4, 0
	sub r3, r3, r4, neq
	lsr r1, r1, r2
	and r2, r1, 8191
	or r2, r2, r3
	move r3, 4097
	lsr r1, r1, 13
	jltu r2, r3, .LBB0_11
// %bb.10:
	add r1, r1, 1, true, .LBB0_14
.LBB0_11:
	move r3, 4096
	jneq r2, r3, .LBB0_14
// %bb.12:
	and r2, r1, 1, true, .LBB0_13
.LBB0_14:
	lsr r0, r0, 16
	and r0, r0, 32768
	or r0, r1, r0
	and r0, r0, 65535
	jump r23
.Lfunc_end0:
	.size	__truncsfhf2, .Lfunc_end0-__truncsfhf2
	.section	.stack_sizes,"o",@progbits,.text.__truncsfhf2
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__truncsfhf2,"ax",@progbits
                                        // -- End function
	.section	.text.__gnu_f2h_ieee,"ax",@progbits
	.globl	__gnu_f2h_ieee                  // -- Begin function __gnu_f2h_ieee
	.type	__gnu_f2h_ieee,@function
__gnu_f2h_ieee:                         // @__gnu_f2h_ieee
.Lfunc_begin1:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	call r23, __truncsfhf2
	ld d22, r22, -8
	jump r23
.Lfunc_end1:
	.size	__gnu_f2h_ieee, .Lfunc_end1-__gnu_f2h_ieee
	.section	.stack_sizes,"o",@progbits,.text.__gnu_f2h_ieee
	.long	.Lfunc_begin1
	.byte	8
	.section	.text.__gnu_f2h_ieee,"ax",@progbits
                                        // -- End function
	.addrsig
