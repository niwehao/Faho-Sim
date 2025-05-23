	.text
	.file	"barrier.c"
	.section	.text.barrier_wait,"ax",@progbits
	.globl	barrier_wait                    // -- Begin function barrier_wait
	.type	barrier_wait,@function
barrier_wait:                           // @barrier_wait
.Lfunc_begin0:
// %bb.0:
	lbs r1, r0, 3
	// inline asm
.Ltmp0:
	acquire r1, 0, nz, .Ltmp0+0
	// inline asm
	lbu r3, r0, 1
	lbu r2, r0, 0
	jeq r3, 1, .LBB0_1
// %bb.6:
	move r4, id
	jeq r2, 255, .LBB0_7
// %bb.8:
	lbs r5, r2, __sys_wq_table
	sb r4, __sys_wq_table, r5
	sb r2, __sys_wq_table, r4
.LBB0_9:
	sb r0, 0, r4
	add r2, r3, -1
	sb r0, 1, r2
	// inline asm
.Ltmp1:
	release r1, 0, nz, .Ltmp1+1
	// inline asm
	// inline asm
	stop false, 0x0
	// inline asm
	jump r23
.LBB0_1:
	jeq r2, 255, .LBB0_5
// %bb.2:
	lbu r3, r2, __sys_wq_table
	jeq r3, r2, .LBB0_4
.LBB0_3:                                // =>This Inner Loop Header: Depth=1
	// inline asm
.Ltmp2:
	resume r3, 0, nz, .Ltmp2+0
	// inline asm
	and r3, r3, 255
	lbu r3, r3, __sys_wq_table
	jneq r3, r2, .LBB0_3
.LBB0_4:
	// inline asm
.Ltmp3:
	resume r2, 0, nz, .Ltmp3+0
	// inline asm
	sb r0, 0, 255
	lbs r2, r0, 2
	sb r0, 1, r2
.LBB0_5:
	// inline asm
.Ltmp4:
	release r1, 0, nz, .Ltmp4+1
	// inline asm
	jump r23
.LBB0_7:
	sb r4, __sys_wq_table, r4
	jump .LBB0_9
.Lfunc_end0:
	.size	barrier_wait, .Lfunc_end0-barrier_wait
	.section	.stack_sizes,"o",@progbits,.text.barrier_wait
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.barrier_wait,"ax",@progbits
                                        // -- End function
	.addrsig
