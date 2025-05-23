	.text
	.file	"fixunssfsi.c"
	.section	.text.__fixunssfsi,"ax",@progbits
	.globl	__fixunssfsi                    // -- Begin function __fixunssfsi
	.type	__fixunssfsi,@function
__fixunssfsi:                           // @__fixunssfsi
.Lfunc_begin0:
// %bb.0:
	move r1, r0
	move r0, 0
	jlts r1, 0, .LBB0_6
// %bb.1:
	lsr r2, r1, 23
	and r2, r2, 255
	jltu r2, 127, .LBB0_6
// %bb.2:
	move r0, -1
	add r3, r2, -127
	jgtu r3, 31, .LBB0_6
// %bb.3:
	and r0, r1, 8388607
	or r0, r0, 8388608
	jgtu r2, 149, .LBB0_5
// %bb.4:
	sub r1, 150, r2
	lsr r0, r0, r1
	jump r23
.LBB0_5:
	add r1, r2, -150
	lsl r0, r0, r1
.LBB0_6:
	jump r23
.Lfunc_end0:
	.size	__fixunssfsi, .Lfunc_end0-__fixunssfsi
	.section	.stack_sizes,"o",@progbits,.text.__fixunssfsi
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__fixunssfsi,"ax",@progbits
                                        // -- End function
	.addrsig
