	.text
	.file	"sem.c"
	.section	.text.sem_take,"ax",@progbits
	.globl	sem_take                        // -- Begin function sem_take
	.type	sem_take,@function
sem_take:                               // @sem_take
.Lfunc_begin0:
// %bb.0:
	lbs r1, r0, 3
	// inline asm
.Ltmp0:
	acquire r1, 0, nz, .Ltmp0+0
	// inline asm
	lbs r2, r0, 1
	add r2, r2, -1
	extsb r2, r2
	jles r2, -1, .LBB0_1
// %bb.5:
	sb r0, 1, r2
	// inline asm
.Ltmp1:
	release r1, 0, nz, .Ltmp1+1
	// inline asm
	jump r23
.LBB0_1:
	lbu r4, r0, 0
	move r3, id
	jeq r4, 255, .LBB0_3
// %bb.2:
	lbs r5, r4, __sys_wq_table
	sb r3, __sys_wq_table, r5
	sb r4, __sys_wq_table, r3
	jump .LBB0_4
.LBB0_3:
	sb r3, __sys_wq_table, r3
.LBB0_4:
	sb r0, 0, r3
	sb r0, 1, r2
	// inline asm
.Ltmp2:
	release r1, 0, nz, .Ltmp2+1
	// inline asm
	// inline asm
	stop false, 0x0
	// inline asm
	jump r23
.Lfunc_end0:
	.size	sem_take, .Lfunc_end0-sem_take
	.section	.stack_sizes,"o",@progbits,.text.sem_take
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.sem_take,"ax",@progbits
                                        // -- End function
	.section	.text.sem_give,"ax",@progbits
	.globl	sem_give                        // -- Begin function sem_give
	.type	sem_give,@function
sem_give:                               // @sem_give
.Lfunc_begin1:
// %bb.0:
	lbs r1, r0, 3
	// inline asm
.Ltmp3:
	acquire r1, 0, nz, .Ltmp3+0
	// inline asm
	lbu r4, r0, 0
	lbs r2, r0, 1
	jeq r4, 255, .LBB1_5
// %bb.1:
	lbu r3, r4, __sys_wq_table
	jneq r3, r4, .LBB1_3
// %bb.2:
	sb r0, 0, 255
	jump .LBB1_4
.LBB1_3:
	lbs r5, r3, __sys_wq_table
	sb r4, __sys_wq_table, r5
.LBB1_4:
	// inline asm
.Ltmp4:
	resume r3, 0, nz, .Ltmp4+0
	// inline asm
.LBB1_5:
	add r2, r2, 1
	sb r0, 1, r2
	// inline asm
.Ltmp5:
	release r1, 0, nz, .Ltmp5+1
	// inline asm
	jump r23
.Lfunc_end1:
	.size	sem_give, .Lfunc_end1-sem_give
	.section	.stack_sizes,"o",@progbits,.text.sem_give
	.long	.Lfunc_begin1
	.byte	0
	.section	.text.sem_give,"ax",@progbits
                                        // -- End function
	.addrsig
