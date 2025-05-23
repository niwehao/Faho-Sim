	.text
	.file	"fixunsdfsi.c"
	.section	.text.__fixunsdfsi,"ax",@progbits
	.globl	__fixunsdfsi                    // -- Begin function __fixunsdfsi
	.type	__fixunsdfsi,@function
__fixunsdfsi:                           // @__fixunsdfsi
.Lfunc_begin0:
// %bb.0:
	lsr.u d4, r0, 20
	move.s d6, 0
	move r3, 0
	sub zero, r1, r7
	subc zero, r0, r6, lts, .LBB0_6
// %bb.1:
	and r4, r5, 2047
	jltu r4, 1023, .LBB0_6
// %bb.2:
	move r3, -1
	add r5, r4, -1023
	jgtu r5, 31, .LBB0_6
// %bb.3:
	and r1, r1, 4294967295
	and r0, r0, 1048575
	or r1, r1, 0
	or r0, r0, 1048576
	sub r4, 1075, r4
	lsrx r2, r0, r4, sh32, .LBB0_5
// %bb.4:
	lsr r3, r1, r4
	or r3, r2, r3
	lsr r2, r0, r4
	move r0, r3
	jump r23
.LBB0_5:
	lsr.u d2, r0, r4
.LBB0_6:
	move r0, r3
	jump r23
.Lfunc_end0:
	.size	__fixunsdfsi, .Lfunc_end0-__fixunsdfsi
	.section	.stack_sizes,"o",@progbits,.text.__fixunsdfsi
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__fixunsdfsi,"ax",@progbits
                                        // -- End function
	.addrsig
