	.text
	.file	"fixsfsi.c"
	.section	.text.__fixsfsi,"ax",@progbits
	.globl	__fixsfsi                       // -- Begin function __fixsfsi
	.type	__fixsfsi,@function
__fixsfsi:                              // @__fixsfsi
.Lfunc_begin0:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r1, 1
	jles r0, -1, .LBB0_1
// %bb.2:
	lsr r3, r0, 23
	move r2, 0
	and r3, r3, 255
	jgeu r3, 127, .LBB0_3
.LBB0_10:
	move r0, r2
	ld d22, r22, -8
	jump r23
.LBB0_1:
	move r1, -1
	lsr r3, r0, 23
	move r2, 0
	and r3, r3, 255
	jltu r3, 127, .LBB0_10
.LBB0_3:
	add r2, r3, -127
	jltu r2, 32, .LBB0_6
// %bb.4:
	move r2, 2147483647
	jgts r0, -1, .LBB0_10
// %bb.5:
	move r2, -2147483648
	move r0, r2
	ld d22, r22, -8
	jump r23
.LBB0_6:
	and r0, r0, 8388607
	or r0, r0, 8388608
	jgtu r3, 149, .LBB0_8
// %bb.7:
	sub r2, 150, r3
	lsr r0, r0, r2, true, .LBB0_9
.LBB0_8:
	add r2, r3, -150
	lsl r0, r0, r2
.LBB0_9:
	call r23, __mulsi3
	move r2, r0
	move r0, r2
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__fixsfsi, .Lfunc_end0-__fixsfsi
	.section	.stack_sizes,"o",@progbits,.text.__fixsfsi
	.long	.Lfunc_begin0
	.byte	8
	.section	.text.__fixsfsi,"ax",@progbits
                                        // -- End function
	.addrsig
