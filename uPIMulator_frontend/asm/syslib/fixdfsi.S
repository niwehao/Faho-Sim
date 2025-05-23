	.text
	.file	"fixdfsi.c"
	.section	.text.__fixdfsi,"ax",@progbits
	.globl	__fixdfsi                       // -- Begin function __fixdfsi
	.type	__fixdfsi,@function
__fixdfsi:                              // @__fixdfsi
.Lfunc_begin0:
// %bb.0:
	lsr.u d4, r0, 20
	move r3, 0
	and r4, r5, 2047
	jltu r4, 1023, .LBB0_9
// %bb.1:
	add r2, r4, -1023
	jltu r2, 32, .LBB0_4
// %bb.2:
	move.s d4, -1
	move r3, 2147483647
	sub zero, r1, r5
	subc zero, r0, r4, xles, .LBB0_3
.LBB0_9:
	move r0, r3
	jump r23
.LBB0_4:
	and r3, r1, 4294967295
	and r2, r0, 1048575
	or r7, r3, 0
	or r6, r2, 1048576
	sub r4, 1075, r4
	lsrx r2, r6, r4, sh32, .LBB0_6
// %bb.5:
	lsr r3, r7, r4
	or r3, r2, r3
	lsr r2, r6, r4
	move.s d4, -1
	sub zero, r1, r5
	subc zero, r0, r4, xgts, .LBB0_9
	jump .LBB0_8
.LBB0_6:
	lsr.u d2, r6, r4
	move.s d4, -1
	sub zero, r1, r5
	subc zero, r0, r4, xgts, .LBB0_9
.LBB0_8:
	neg r3, r3
	move r0, r3
	jump r23
.LBB0_3:
	move r3, -2147483648
	move r0, r3
	jump r23
.Lfunc_end0:
	.size	__fixdfsi, .Lfunc_end0-__fixdfsi
	.section	.stack_sizes,"o",@progbits,.text.__fixdfsi
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__fixdfsi,"ax",@progbits
                                        // -- End function
	.addrsig
