	.text
	.file	"kernel.c"
.section	.text.boot_me,"ax",@progbits
	.globl	boot_me                // -- Begin function boot_me
	.type	boot_me,@function
boot_me:      ///beginin of kernel code
	nop
	move r1, 0
	ldmai zero,r1, 1 //load the jump syscall into addr 0 (for user) 
	jump r23  //will never return 
	jump main      
	jump syscall    //parse by the mram_creator and write at 0 in MRAM.
	move r0, r23            //error
	call r23, __end_process
.section	.text.stop_me,"ax",@progbits
	.globl	stop_me                // -- Begin function stop_me
	.type	stop_me,@function
stop_me:  //save the flow context in the stack and save the stack offset in r0 and stop. resume function will restart after this function
	sd r22, 0, d14
	sd r22, 8, d16
	sd r22, 16, d18
	sd r22, 24, d20
	sd r22, 32, d22
	sw r0, 0, r22  
	move r4, 0
	stop
	jump r23
.section	.text.swap_context,"ax",@progbits
	.globl	swap_context               // -- Begin function 	.globl	swap_context           
	.type	swap_context,@function
swap_context: //Save the current flow context inside the stack (and store stack offset in r0), load the new stack (store in r1) and restore the flow context contain in it. 
	sd r22, 0, d14
	sd r22, 8, d16
	sd r22, 16, d18
	sd r22, 24, d20
	sd r22, 32, d22
	sw r0, 0, r22   //save the stack inside r0
	//------------------------
	move r22, r1 //saveback the stack save in r1
	ld d14, r22, 0
	ld d16, r22, 8
	ld d18, r22, 16
	ld d20, r22, 24
	ld d22, r22, 32
	jump r23
.section	.text.first_swap_context,"ax",@progbits
	.globl	first_swap_context               // -- Begin function 	.globl	first_swap_context           
	.type	first_swap_context,@function
first_swap_context: //Same that swap_context but there are 3 parameters the last one if the place to jump
	sd r22, 0, d14
	sd r22, 8, d16
	sd r22, 16, d18
	sd r22, 24, d20
	sd r22, 32, d22
	sw r0, 0, r22   //save the stack inside r0
	//------------------------
	move r22, r1 //saveback the stack save in r1
	ld d14, r22, 0
	ld d16, r22, 8
	ld d18, r22, 16
	ld d20, r22, 24
	ld d22, r22, 32
	jump r2
.section	.text.jmp_mram,"ax",@progbits
	.globl	jmp_mram             // -- Begin function 	.globl	jmp_mram         
	.type	jmp_mram,@function
jmp_mram: 
	jump syscall
	.globl	sp_wait                         // -- Begin function sp_wait
	.type	sp_wait,@function
sp_wait:                                // @sp_wait
.Lfunc_begin0:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sw r22, -20, r0
	lw r0, r22, -20
	lw r0, r0, 4
	call r23, mutex_lock
	move r0, id
	sb r22, -16, r0
	lw r0, r22, -20
	lbs r1, r0, 1
	add r1, r1, 1
	sb r0, 1, r1
	lw r1, r22, -20
	lbu r0, r1, 1
	lbu r1, r1, 0
	jneq r0, r1, .LBB0_8
	jump .LBB0_1
.LBB0_1:
	lw r0, r22, -20
	sb r0, 2, 0
	sw r22, -12, 0
	jump .LBB0_2
.LBB0_2:                                // =>This Inner Loop Header: Depth=1
	lw r0, r22, -12
	lw r1, r22, -20
	lbu r1, r1, 0
	jges r0, r1, .LBB0_7
	jump .LBB0_3
.LBB0_3:                                //   in Loop: Header=BB0_2 Depth=1
	lbu r0, r22, -16
	lw r1, r22, -12
	jeq r0, r1, .LBB0_5
	jump .LBB0_4
.LBB0_4:                                //   in Loop: Header=BB0_2 Depth=1
	lw r0, r22, -12
	// inline asm
.Ltmp0:
	resume r0, 0, nz, .Ltmp0+0
	// inline asm
	jump .LBB0_5
.LBB0_5:                                //   in Loop: Header=BB0_2 Depth=1
	jump .LBB0_6
.LBB0_6:                                //   in Loop: Header=BB0_2 Depth=1
	lw r0, r22, -12
	add r0, r0, 1
	sw r22, -12, r0
	jump .LBB0_2
.LBB0_7:
	lw r0, r22, -20
	sb r0, 1, 0
	lw r0, r22, -20
	lw r0, r0, 4
	call r23, mutex_unlock
	sw r22, -24, 0
	jump .LBB0_10
.LBB0_8:
	lw r0, r22, -20
	lw r0, r0, 4
	call r23, mutex_unlock
	// inline asm
	move r0, 5
	// inline asm
	// inline asm
	stop false, 0x0
	// inline asm
	jump .LBB0_9
.LBB0_9:
	lw r0, r22, -20
	lbu r0, r0, 2
	sw r22, -24, r0
	jump .LBB0_10
.LBB0_10:
	lw r0, r22, -24
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	sp_wait, .Lfunc_end0-sp_wait
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin0
	.byte	24
	.text
                                        // -- End function
	.type	mutex_lock,@function            // -- Begin function mutex_lock
mutex_lock:                             // @mutex_lock
.Lfunc_begin1:
// %bb.0:
	sw r22, 0, r0
	lw r0, r22, 0
	// inline asm
.Ltmp1:
	acquire r0, 0, nz, .Ltmp1
	// inline asm
	jump r23
.Lfunc_end1:
	.size	mutex_lock, .Lfunc_end1-mutex_lock
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin1
	.byte	4
	.text
                                        // -- End function
	.type	mutex_unlock,@function          // -- Begin function mutex_unlock
mutex_unlock:                           // @mutex_unlock
.Lfunc_begin2:
// %bb.0:
	sw r22, 0, r0
	lw r0, r22, 0
	// inline asm
.Ltmp2:
	release r0, 0, nz, .Ltmp2+1
	// inline asm
	jump r23
.Lfunc_end2:
	.size	mutex_unlock, .Lfunc_end2-mutex_unlock
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin2
	.byte	4
	.text
                                        // -- End function
	.globl	abnormal_wakeup                 // -- Begin function abnormal_wakeup
	.type	abnormal_wakeup,@function
abnormal_wakeup:                        // @abnormal_wakeup
.Lfunc_begin3:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, r0
	lw r0, r22, -16
	lw r0, r0, 4
	call r23, mutex_lock
	lw r0, r22, -16
	sb r0, 2, 1
	sw r22, -12, 0
	jump .LBB3_1
.LBB3_1:                                // =>This Inner Loop Header: Depth=1
	lw r0, r22, -12
	lw r1, r22, -16
	lbu r1, r1, 0
	jges r0, r1, .LBB3_4
	jump .LBB3_2
.LBB3_2:                                //   in Loop: Header=BB3_1 Depth=1
	lw r0, r22, -12
	// inline asm
.Ltmp3:
	resume r0, 0, nz, .Ltmp3+1
	// inline asm
	jump .LBB3_3
.LBB3_3:                                //   in Loop: Header=BB3_1 Depth=1
	lw r0, r22, -12
	add r0, r0, 1
	sw r22, -12, r0
	jump .LBB3_1
.LBB3_4:
	lw r0, r22, -16
	sb r0, 1, 0
	lw r0, r22, -16
	lw r0, r0, 4
	call r23, mutex_unlock
	ld d22, r22, -8
	jump r23
.Lfunc_end3:
	.size	abnormal_wakeup, .Lfunc_end3-abnormal_wakeup
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin3
	.byte	16
	.text
                                        // -- End function
	.globl	abnormal_wakeup_one             // -- Begin function abnormal_wakeup_one
	.type	abnormal_wakeup_one,@function
abnormal_wakeup_one:                    // @abnormal_wakeup_one
.Lfunc_begin4:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, r0
	lw r0, r22, -16
	lw r0, r0, 4
	call r23, mutex_lock
	lw r0, r22, -16
	lbu r0, r0, 1
	jneq r0, 0, .LBB4_2
	jump .LBB4_1
.LBB4_1:
	jump .LBB4_7
.LBB4_2:
	lw r0, r22, -16
	sb r0, 2, 1
	lw r0, r22, -16
	lbs r1, r0, 1
	add r1, r1, -1
	sb r0, 1, r1
	sw r22, -12, 0
	jump .LBB4_3
.LBB4_3:                                // =>This Inner Loop Header: Depth=1
	lw r0, r22, -12
	lw r1, r22, -16
	lbu r1, r1, 0
	jges r0, r1, .LBB4_6
	jump .LBB4_4
.LBB4_4:                                //   in Loop: Header=BB4_3 Depth=1
	lw r0, r22, -12
	// inline asm
.Ltmp4:
	resume r0, 0, nz, .Ltmp4+2
	// inline asm
	sw r22, -12, 16
	jump .LBB4_5
.LBB4_5:                                //   in Loop: Header=BB4_3 Depth=1
	lw r0, r22, -12
	add r0, r0, 1
	sw r22, -12, r0
	jump .LBB4_3
.LBB4_6:
	jump .LBB4_7
.LBB4_7:
	lw r0, r22, -16
	lw r0, r0, 4
	call r23, mutex_unlock
	ld d22, r22, -8
	jump r23
.Lfunc_end4:
	.size	abnormal_wakeup_one, .Lfunc_end4-abnormal_wakeup_one
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin4
	.byte	16
	.text
                                        // -- End function
	.globl	swap_scheduler                  // -- Begin function swap_scheduler
	.type	swap_scheduler,@function
swap_scheduler:                         // @swap_scheduler
.Lfunc_begin5:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	call r23, me
	lbu r1, r0, cur_jobs
	lsl r0, r1, 2
	lsl_add r1, r0, r1, 4
	move r0, jobs
	add r0, r0, r1
	add r0, r0, 16
	sw r22, -16, r0
	call r23, me
	move r1, r0
	lw r0, r22, -16
	lsl r1, r1, 2
	lw r1, r1, fc_scheduler_job
	call r23, swap_context
	ld d22, r22, -8
	jump r23
.Lfunc_end5:
	.size	swap_scheduler, .Lfunc_end5-swap_scheduler
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin5
	.byte	16
	.text
                                        // -- End function
	.globl	__end_child_jobs                // -- Begin function __end_child_jobs
	.type	__end_child_jobs,@function
__end_child_jobs:                       // @__end_child_jobs
.Lfunc_begin6:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	lw r0, zero, mutex_jobs
	call r23, mutex_lock
	call r23, me
	lbs r0, r0, cur_jobs
	sb r22, -24, r0
	lbu r1, r22, -24
	lsl r0, r1, 2
	lsl_add r0, r0, r1, 4
	move r1, jobs
	sw r22, -16, r1
	move r1, 4
	sb r0, jobs, r1
	lw r0, zero, mutex_jobs
	call r23, mutex_unlock
	lw r0, r22, -16
	move r2, 1
	move r1, r2
	call r23, wakeup
	call r23, me
	move r1, r0
	lw r0, r22, -16
	lbu r2, r1, cur_jobs
	lsl r1, r2, 2
	lsl_add r1, r1, r2, 4
	add r0, r0, r1
	add r0, r0, 16
	sw r22, -20, r0
	call r23, me
	move r1, r0
	lw r0, r22, -20
	lsl r1, r1, 2
	lw r1, r1, fc_scheduler_job
	call r23, swap_context
	ld d22, r22, -8
	jump r23
.Lfunc_end6:
	.size	__end_child_jobs, .Lfunc_end6-__end_child_jobs
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin6
	.byte	24
	.text
                                        // -- End function
	.globl	wakeup                          // -- Begin function wakeup
	.type	wakeup,@function
wakeup:                                 // @wakeup
.Lfunc_begin7:
// %bb.0:
	sd r22, 24, d22
	add r22, r22, 32
                                        // kill: def $r3 killed $r2
                                        // kill: def $r3 killed $r1
	sw r22, -32, r0
	sb r22, -28, r1
	sb r22, -24, r2
	sw r22, -20, 0
	jump .LBB7_1
.LBB7_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB7_8 Depth 2
	lw r0, r22, -20
	jgtu r0, 9, .LBB7_21
	jump .LBB7_2
.LBB7_2:                                //   in Loop: Header=BB7_1 Depth=1
	lw r0, zero, mutex_jobs
	call r23, mutex_lock
	lbu r0, r22, -28
	jneq r0, 0, .LBB7_4
	jump .LBB7_3
.LBB7_3:                                //   in Loop: Header=BB7_1 Depth=1
	lw r1, r22, -20
	lsl r0, r1, 4
	lsl_add r0, r0, r1, 11
	lsl_sub r0, r0, r1, 6
	add r0, r0, 651280
	move r1, jobs
	move r2, 2000
	call r23, mram_read
	jump .LBB7_7
.LBB7_4:                                //   in Loop: Header=BB7_1 Depth=1
	lw r0, r22, -20
	lw r1, zero, cur_process_index
	jeq r0, r1, .LBB7_6
	jump .LBB7_5
.LBB7_5:                                //   in Loop: Header=BB7_1 Depth=1
	jump .LBB7_20
.LBB7_6:                                //   in Loop: Header=BB7_1 Depth=1
	jump .LBB7_7
.LBB7_7:                                //   in Loop: Header=BB7_1 Depth=1
	sw r22, -16, 0
	jump .LBB7_8
.LBB7_8:                                //   Parent Loop BB7_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lw r0, r22, -16
	lw r2, r22, -20
	lsl r1, r2, 4
	lsl_add r2, r1, r2, 6
	move r1, processs
	add r1, r1, r2
	lbu r1, r1, 2
	jgeu r0, r1, .LBB7_17
	jump .LBB7_9
.LBB7_9:                                //   in Loop: Header=BB7_8 Depth=2
	lw r1, r22, -16
	lsl r0, r1, 2
	lsl_add r0, r0, r1, 4
	lbu r0, r0, jobs
	jneq r0, 6, .LBB7_15
	jump .LBB7_10
.LBB7_10:                               //   in Loop: Header=BB7_8 Depth=2
	lw r1, r22, -16
	lsl r0, r1, 2
	lsl_add r1, r0, r1, 4
	move r0, jobs
	add r0, r0, r1
	lw r0, r0, 8
	lw r1, r22, -32
	jneq r0, r1, .LBB7_15
	jump .LBB7_11
.LBB7_11:                               //   in Loop: Header=BB7_8 Depth=2
	lw r1, r22, -16
	lsl r0, r1, 2
	lsl_add r0, r0, r1, 4
	move r1, 3
	sb r0, jobs, r1
	lbu r0, r22, -28
	jneq r0, 0, .LBB7_14
	jump .LBB7_12
.LBB7_12:                               //   in Loop: Header=BB7_8 Depth=2
	lw r1, r22, -20
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lw r0, r0, 8
	jneq r0, 5, .LBB7_14
	jump .LBB7_13
.LBB7_13:                               //   in Loop: Header=BB7_8 Depth=2
	lw r1, r22, -20
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	sw r0, 8, 3
	jump .LBB7_14
.LBB7_14:                               //   in Loop: Header=BB7_8 Depth=2
	jump .LBB7_15
.LBB7_15:                               //   in Loop: Header=BB7_8 Depth=2
	jump .LBB7_16
.LBB7_16:                               //   in Loop: Header=BB7_8 Depth=2
	lw r0, r22, -16
	add r0, r0, 1
	sw r22, -16, r0
	jump .LBB7_8
.LBB7_17:                               //   in Loop: Header=BB7_1 Depth=1
	lw r0, zero, mutex_jobs
	call r23, mutex_unlock
	lbu r0, r22, -28
	jeq r0, 0, .LBB7_19
	jump .LBB7_18
.LBB7_18:
	jump .LBB7_22
.LBB7_19:                               //   in Loop: Header=BB7_1 Depth=1
	lw r1, r22, -20
	lsl r0, r1, 4
	lsl_add r0, r0, r1, 11
	lsl_sub r0, r0, r1, 6
	add r1, r0, 651280
	move r0, jobs
	move r2, 2000
	call r23, mram_write
	jump .LBB7_20
.LBB7_20:                               //   in Loop: Header=BB7_1 Depth=1
	lw r0, r22, -20
	add r0, r0, 1
	sw r22, -20, r0
	jump .LBB7_1
.LBB7_21:
	lw r1, zero, cur_process_index
	lsl r0, r1, 4
	lsl_add r0, r0, r1, 11
	lsl_sub r0, r0, r1, 6
	add r0, r0, 651280
	move r1, jobs
	move r2, 2000
	call r23, mram_read
	jump .LBB7_22
.LBB7_22:
	lbu r0, r22, -24
	jeq r0, 0, .LBB7_24
	jump .LBB7_23
.LBB7_23:
	move r0, cp
	call r23, abnormal_wakeup
	jump .LBB7_24
.LBB7_24:
	move r0, 0
	ld d22, r22, -8
	jump r23
.Lfunc_end7:
	.size	wakeup, .Lfunc_end7-wakeup
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin7
	.byte	32
	.text
                                        // -- End function
	.globl	create_job                      // -- Begin function create_job
	.type	create_job,@function
create_job:                             // @create_job
.Lfunc_begin8:
// %bb.0:
	sd r22, 40, d22
	add r22, r22, 48
	sw r22, -44, r0
	call r23, me
	lbs r0, r0, cur_jobs
	sb r22, -40, r0
	lbu r1, r22, -40
	lsl r0, r1, 2
	lsl_add r1, r0, r1, 4
	move r0, jobs
	add r0, r0, r1
	lbu r0, r0, 1
	jeq r0, 0, .LBB8_2
	jump .LBB8_1
.LBB8_1:
	sw r22, -48, -15
	jump .LBB8_23
.LBB8_2:
	lw r0, zero, mutex_jobs
	call r23, mutex_lock
	sw r22, -36, 0
	sw r22, -32, -1
	sw r22, -28, 0
	jump .LBB8_3
.LBB8_3:                                // =>This Inner Loop Header: Depth=1
	lw r0, r22, -28
	jgts r0, 99, .LBB8_8
	jump .LBB8_4
.LBB8_4:                                //   in Loop: Header=BB8_3 Depth=1
	lw r1, r22, -28
	lsl r0, r1, 2
	lsl_add r0, r0, r1, 4
	lbu r0, r0, jobs
	jneq r0, 8, .LBB8_6
	jump .LBB8_5
.LBB8_5:
	lw r0, r22, -28
	sw r22, -32, r0
	lw r1, r22, -28
	lsl r0, r1, 2
	lsl_add r1, r0, r1, 4
	move r0, jobs
	add r0, r0, r1
	lw r0, r0, 4
	sw r22, -36, r0
	jump .LBB8_8
.LBB8_6:                                //   in Loop: Header=BB8_3 Depth=1
	jump .LBB8_7
.LBB8_7:                                //   in Loop: Header=BB8_3 Depth=1
	lw r0, r22, -28
	add r0, r0, 1
	sw r22, -28, r0
	jump .LBB8_3
.LBB8_8:
	lw r0, r22, -36
	jneq r0, 0, .LBB8_12
	jump .LBB8_9
.LBB8_9:
	move r0, 2048
	call r23, sbrk
	sw r22, -36, r0
	jgeu r0, 0, .LBB8_11
	jump .LBB8_10
.LBB8_10:
	lw r0, zero, mutex_jobs
	call r23, mutex_unlock
	lw r0, r22, -36
	sw r22, -48, r0
	jump .LBB8_23
.LBB8_11:
	lw r0, r22, -36
	add r0, r0, -2048
	sw r22, -36, r0
	jump .LBB8_12
.LBB8_12:
	lw r1, zero, cur_process_index
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	sw r22, -24, r0
	lw r0, r22, -24
	lbs r0, r0, 2
	sb r22, -20, r0
	lw r0, r22, -24
	lbs r1, r0, 2
	add r1, r1, 1
	sb r0, 2, r1
	sw r22, -16, 0
	jump .LBB8_13
.LBB8_13:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -16
	move r1, 0
	sw r22, -12, r1
	jgts r0, 99, .LBB8_15
	jump .LBB8_14
.LBB8_14:                               //   in Loop: Header=BB8_13 Depth=1
	lw r0, r22, -32
	move r1, -1
	sub r0, r0, r1, eq
	sw r22, -12, r0
	jump .LBB8_15
.LBB8_15:                               //   in Loop: Header=BB8_13 Depth=1
	lw r0, r22, -12
	and r0, r0, 1
	jeq r0, 0, .LBB8_20
	jump .LBB8_16
.LBB8_16:                               //   in Loop: Header=BB8_13 Depth=1
	lw r1, r22, -16
	lsl r0, r1, 2
	lsl_add r0, r0, r1, 4
	lbu r0, r0, jobs
	jneq r0, 0, .LBB8_18
	jump .LBB8_17
.LBB8_17:                               //   in Loop: Header=BB8_13 Depth=1
	lw r0, r22, -16
	sw r22, -32, r0
	jump .LBB8_18
.LBB8_18:                               //   in Loop: Header=BB8_13 Depth=1
	jump .LBB8_19
.LBB8_19:                               //   in Loop: Header=BB8_13 Depth=1
	lw r0, r22, -16
	add r0, r0, 1
	sw r22, -16, r0
	jump .LBB8_13
.LBB8_20:
	lw r0, r22, -32
	jeq r0, -1, .LBB8_22
	jump .LBB8_21
.LBB8_21:
	lw r1, r22, -32
	lsl r0, r1, 2
	lsl_add r1, r0, r1, 4
	move r0, jobs
	move r2, 1
	sb r1, jobs, r2
	lbs r2, r22, -20
	lw r3, r22, -32
	lsl r1, r3, 2
	lsl_add r1, r1, r3, 4
	add r1, r0, r1
	sb r1, 1, r2
	lw r2, r22, -36
	lw r3, r22, -32
	lsl r1, r3, 2
	lsl_add r1, r1, r3, 4
	add r1, r0, r1
	sw r1, 16, r2
	lw r2, r22, -36
	lw r3, r22, -32
	lsl r1, r3, 2
	lsl_add r1, r1, r3, 4
	add r1, r0, r1
	sw r1, 4, r2
	lw r2, r22, -32
	lsl r1, r2, 2
	lsl_add r1, r1, r2, 4
	add r1, r0, r1
	lw r1, r1, 16
	sw r1, 36, r1
	lw r2, r22, -32
	lsl r1, r2, 2
	lsl_add r1, r1, r2, 4
	add r1, r0, r1
	lw r1, r1, 16
	move r2, __end_child_jobs
	sw r1, 32, r2
	lw r1, r22, -44
	lw r3, r22, -32
	lsl r2, r3, 2
	lsl_add r2, r2, r3, 4
	add r0, r0, r2
	lw r0, r0, 16
	sw r0, 24, r1
	lw r0, zero, mutex_jobs
	call r23, mutex_unlock
	move r0, cp
	call r23, abnormal_wakeup_one
	lbu r0, r22, -20
	sw r22, -48, r0
	jump .LBB8_23
.LBB8_22:
	lw r0, zero, mutex_jobs
	call r23, mutex_unlock
	sw r22, -48, -16
	jump .LBB8_23
.LBB8_23:
	lw r0, r22, -48
	ld d22, r22, -8
	jump r23
.Lfunc_end8:
	.size	create_job, .Lfunc_end8-create_job
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin8
	.byte	48
	.text
                                        // -- End function
	.globl	sbrk                            // -- Begin function sbrk
	.type	sbrk,@function
sbrk:                                   // @sbrk
.Lfunc_begin9:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, r0
	lw r0, zero, mutex_sbrk
	call r23, mutex_lock
	lw r0, r22, -16
	jlts r0, 1, .LBB9_4
	jump .LBB9_1
.LBB9_1:
	sw r22, -12, -2
	lw r1, zero, cur_process_index
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lw r0, r0, 32
	lw r1, r22, -16
	add r0, r0, r1
	lsr r0, r0, 8
	jltu r0, 223, .LBB9_3
	jump .LBB9_2
.LBB9_2:
	jump .LBB9_10
.LBB9_3:
	lw r2, r22, -16
	lw r1, zero, cur_process_index
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lw r1, r0, 32
	add r1, r1, r2
	sw r0, 32, r1
	jump .LBB9_9
.LBB9_4:
	lw r0, r22, -16
	jgts r0, -1, .LBB9_8
	jump .LBB9_5
.LBB9_5:
	sw r22, -12, -3
	lw r1, zero, cur_process_index
	lsl r0, r1, 4
	lsl_add r0, r0, r1, 6
	move r1, processs
	add r0, r1, r0
	lw r0, r0, 32
	lw r2, r22, -16
	add r0, r0, r2
	lw r3, zero, cur_process_index
	lsl r2, r3, 4
	lsl_add r2, r2, r3, 6
	add r1, r1, r2
	lw r1, r1, 44
	jgeu r0, r1, .LBB9_7
	jump .LBB9_6
.LBB9_6:
	jump .LBB9_10
.LBB9_7:
	lw r2, r22, -16
	lw r1, zero, cur_process_index
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lw r1, r0, 32
	add r1, r1, r2
	sw r0, 32, r1
	jump .LBB9_8
.LBB9_8:
	jump .LBB9_9
.LBB9_9:
	lw r1, zero, cur_process_index
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lw r0, r0, 32
	sw r22, -12, r0
	jump .LBB9_10
.LBB9_10:
	lw r0, zero, mutex_sbrk
	call r23, mutex_unlock
	lw r0, r22, -12
	ld d22, r22, -8
	jump r23
.Lfunc_end9:
	.size	sbrk, .Lfunc_end9-sbrk
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin9
	.byte	16
	.text
                                        // -- End function
	.globl	join_job                        // -- Begin function join_job
	.type	join_job,@function
join_job:                               // @join_job
.Lfunc_begin10:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sb r22, -20, 0
	lw r0, zero, mutex_jobs
	call r23, mutex_lock
	jump .LBB10_1
.LBB10_1:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB10_3 Depth 2
	lbu r0, r22, -20
	jneq r0, 0, .LBB10_10
	jump .LBB10_2
.LBB10_2:                               //   in Loop: Header=BB10_1 Depth=1
	sb r22, -20, 1
	sw r22, -16, 0
	jump .LBB10_3
.LBB10_3:                               //   Parent Loop BB10_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lw r0, r22, -16
	jgts r0, 99, .LBB10_9
	jump .LBB10_4
.LBB10_4:                               //   in Loop: Header=BB10_3 Depth=2
	lw r1, r22, -16
	lsl r0, r1, 2
	lsl_add r0, r0, r1, 4
	lbu r0, r0, jobs
	jneq r0, 4, .LBB10_6
	jump .LBB10_5
.LBB10_5:
	lw r1, r22, -16
	lsl r0, r1, 2
	lsl_add r1, r0, r1, 4
	move r0, jobs
	move r2, 8
	sb r1, jobs, r2
	lw r2, r22, -16
	lsl r1, r2, 2
	lsl_add r1, r1, r2, 4
	add r0, r0, r1
	lbs r0, r0, 1
	sb r22, -12, r0
	lw r0, zero, mutex_jobs
	call r23, mutex_unlock
	lbu r0, r22, -12
	sw r22, -24, r0
	jump .LBB10_11
.LBB10_6:                               //   in Loop: Header=BB10_3 Depth=2
	sb r22, -20, 0
	jump .LBB10_7
.LBB10_7:                               //   in Loop: Header=BB10_3 Depth=2
	jump .LBB10_8
.LBB10_8:                               //   in Loop: Header=BB10_3 Depth=2
	lw r0, r22, -16
	add r0, r0, 1
	sw r22, -16, r0
	jump .LBB10_3
.LBB10_9:                               //   in Loop: Header=BB10_1 Depth=1
	lw r2, zero, mutex_jobs
	move r0, jobs
	move r1, 0
	call r23, sleep
	jump .LBB10_1
.LBB10_10:
	lw r0, zero, mutex_jobs
	call r23, mutex_unlock
	sw r22, -24, 0
	jump .LBB10_11
.LBB10_11:
	lw r0, r22, -24
	ld d22, r22, -8
	jump r23
.Lfunc_end10:
	.size	join_job, .Lfunc_end10-join_job
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin10
	.byte	24
	.text
                                        // -- End function
	.globl	sleep                           // -- Begin function sleep
	.type	sleep,@function
sleep:                                  // @sleep
.Lfunc_begin11:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sw r22, -24, r0
	sw r22, -20, r1
	sw r22, -16, r2
	call r23, me
	lbs r0, r0, cur_jobs
	sb r22, -12, r0
	lbu r1, r22, -12
	lsl r0, r1, 2
	lsl_add r1, r0, r1, 4
	move r0, jobs
	move r2, 6
	sb r1, jobs, r2
	lw r1, r22, -24
	lbu r3, r22, -12
	lsl r2, r3, 2
	lsl_add r2, r2, r3, 4
	add r0, r0, r2
	sw r0, 8, r1
	lw r0, r22, -20
	jeq r0, 0, .LBB11_2
	jump .LBB11_1
.LBB11_1:
	lw r0, r22, -20
	call r23, unlock
	jump .LBB11_2
.LBB11_2:
	lw r0, r22, -16
	jeq r0, 0, .LBB11_4
	jump .LBB11_3
.LBB11_3:
	lw r0, r22, -16
	call r23, mutex_unlock
	jump .LBB11_4
.LBB11_4:
	call r23, swap_scheduler
	lw r0, r22, -20
	jeq r0, 0, .LBB11_6
	jump .LBB11_5
.LBB11_5:
	lw r0, r22, -20
	call r23, lock
	jump .LBB11_6
.LBB11_6:
	lw r0, r22, -16
	jeq r0, 0, .LBB11_8
	jump .LBB11_7
.LBB11_7:
	lw r0, r22, -16
	call r23, mutex_lock
	jump .LBB11_8
.LBB11_8:
	move r0, 0
	ld d22, r22, -8
	jump r23
.Lfunc_end11:
	.size	sleep, .Lfunc_end11-sleep
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin11
	.byte	24
	.text
                                        // -- End function
	.globl	swap                            // -- Begin function swap
	.type	swap,@function
swap:                                   // @swap
.Lfunc_begin12:
// %bb.0:
	sd r22, 24, d22
	add r22, r22, 32
                                        // kill: def $r2 killed $r1
	sw r22, -32, r0
	sb r22, -28, r1
	lw r1, r22, -32
	lsl r0, r1, 2
	lsl_add r0, r0, r1, 4
	move r1, jobs
	sw r22, -20, r1
	move r1, 2
	sb r0, jobs, r1
	lw r0, zero, mutex_jobs
	call r23, mutex_unlock
	lw r0, r22, -32
	sw r22, -16, r0
	call r23, me
	lw r2, r22, -16
	move r1, r0
	lw r0, r22, -20
	sb r1, cur_jobs, r2
	sw r22, -24, 0
	// inline asm
	time r1
	// inline asm
	sw r22, -24, r1
	lw r1, r22, -24
	lw r3, r22, -32
	lsl r2, r3, 2
	lsl_add r2, r2, r3, 4
	add r0, r0, r2
	sw r0, 12, r1
	lbu r0, r22, -28
	jeq r0, 0, .LBB12_2
	jump .LBB12_1
.LBB12_1:
	call r23, me
	move r1, r0
	move r0, fc_scheduler_job
	lsl_add r0, r0, r1, 2
	lw r2, r22, -32
	lsl r1, r2, 2
	lsl_add r2, r1, r2, 4
	move r1, jobs
	add r1, r1, r2
	lw r1, r1, 16
	lw r2, r1, 24
	call r23, first_swap_context
	jump .LBB12_3
.LBB12_2:
	call r23, me
	move r1, r0
	move r0, fc_scheduler_job
	lsl_add r0, r0, r1, 2
	lw r2, r22, -32
	lsl r1, r2, 2
	lsl_add r2, r1, r2, 4
	move r1, jobs
	add r1, r1, r2
	lw r1, r1, 16
	call r23, swap_context
	jump .LBB12_3
.LBB12_3:
	lw r0, zero, mutex_jobs
	call r23, mutex_lock
	ld d22, r22, -8
	jump r23
.Lfunc_end12:
	.size	swap, .Lfunc_end12-swap
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin12
	.byte	32
	.text
                                        // -- End function
	.globl	check_time_process              // -- Begin function check_time_process
	.type	check_time_process,@function
check_time_process:                     // @check_time_process
.Lfunc_begin13:
// %bb.0:
	sw r22, 4, 0
	// inline asm
	time r0
	// inline asm
	sw r22, 4, r0
	lw r0, r22, 4
	lw r2, zero, cur_process_index
	lsl r1, r2, 4
	lsl_add r2, r1, r2, 6
	move r1, processs
	add r1, r1, r2
	lw r1, r1, 20
	sub r0, r0, r1
	move r1, 50001
	jltu r0, r1, .LBB13_2
	jump .LBB13_1
.LBB13_1:
	sb r22, 0, 1
	jump .LBB13_3
.LBB13_2:
	sb r22, 0, 0
	jump .LBB13_3
.LBB13_3:
	lbu r0, r22, 0
	jump r23
.Lfunc_end13:
	.size	check_time_process, .Lfunc_end13-check_time_process
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin13
	.byte	8
	.text
                                        // -- End function
	.globl	scheduler_jobs                  // -- Begin function scheduler_jobs
	.type	scheduler_jobs,@function
scheduler_jobs:                         // @scheduler_jobs
.Lfunc_begin14:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sw r22, -24, 0
	sb r22, -20, 0
	move r0, cp
	call r23, sp_wait
	jump .LBB14_1
.LBB14_1:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB14_2 Depth 2
	lw r0, zero, mutex_jobs
	call r23, mutex_lock
	jump .LBB14_2
.LBB14_2:                               //   Parent Loop BB14_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lw r0, r22, -24
	lw r2, zero, cur_process_index
	lsl r1, r2, 4
	lsl_add r2, r1, r2, 6
	move r1, processs
	add r1, r1, r2
	lbu r1, r1, 2
	move r2, 0
	sw r22, -12, r2
	jgeu r0, r1, .LBB14_4
	jump .LBB14_3
.LBB14_3:                               //   in Loop: Header=BB14_2 Depth=2
	lbu r0, r22, -20
	move r1, 0
	sub r0, r0, r1, eq
	sw r22, -12, r0
	jump .LBB14_4
.LBB14_4:                               //   in Loop: Header=BB14_2 Depth=2
	lw r0, r22, -12
	and r0, r0, 1
	jeq r0, 0, .LBB14_13
	jump .LBB14_5
.LBB14_5:                               //   in Loop: Header=BB14_2 Depth=2
	lw r1, r22, -24
	lsl r0, r1, 2
	lsl_add r0, r0, r1, 4
	lbu r0, r0, jobs
	jneq r0, 3, .LBB14_7
	jump .LBB14_6
.LBB14_6:                               //   in Loop: Header=BB14_2 Depth=2
	sb r22, -16, 0
	jump .LBB14_11
.LBB14_7:                               //   in Loop: Header=BB14_2 Depth=2
	lw r1, r22, -24
	lsl r0, r1, 2
	lsl_add r0, r0, r1, 4
	lbu r0, r0, jobs
	jneq r0, 1, .LBB14_9
	jump .LBB14_8
.LBB14_8:                               //   in Loop: Header=BB14_2 Depth=2
	sb r22, -16, 1
	jump .LBB14_10
.LBB14_9:                               //   in Loop: Header=BB14_2 Depth=2
	jump .LBB14_12
.LBB14_10:                              //   in Loop: Header=BB14_2 Depth=2
	jump .LBB14_11
.LBB14_11:                              //   in Loop: Header=BB14_2 Depth=2
	lw r0, r22, -24
	lbu r1, r22, -16
	call r23, swap
	move r0, all_end_or_waiting
	sb r0, 0, 0
	call r23, check_time_process
	sb r22, -20, r0
	jump .LBB14_12
.LBB14_12:                              //   in Loop: Header=BB14_2 Depth=2
	lw r0, r22, -24
	add r0, r0, 1
	sw r22, -24, r0
	jump .LBB14_2
.LBB14_13:                              //   in Loop: Header=BB14_1 Depth=1
	call r23, check_time_process
	sb r22, -20, r0
	sw r22, -24, 0
	lw r0, zero, mutex_jobs
	call r23, mutex_unlock
	lbu r0, zero, all_end_or_waiting
	jneq r0, 0, .LBB14_15
	jump .LBB14_14
.LBB14_14:                              //   in Loop: Header=BB14_1 Depth=1
	lbu r0, r22, -20
	jeq r0, 0, .LBB14_20
	jump .LBB14_15
.LBB14_15:                              //   in Loop: Header=BB14_1 Depth=1
	move r0, cp
	call r23, sp_wait
	jeq r0, 0, .LBB14_17
	jump .LBB14_16
.LBB14_16:                              //   in Loop: Header=BB14_1 Depth=1
	jump .LBB14_1
.LBB14_17:                              //   in Loop: Header=BB14_1 Depth=1
	call r23, me
	jneq r0, 0, .LBB14_19
	jump .LBB14_18
.LBB14_18:
	lbu r0, zero, all_end_or_waiting
	ld d22, r22, -8
	jump r23
.LBB14_19:                              //   in Loop: Header=BB14_1 Depth=1
	move r0, cp
	call r23, sp_wait
	sb r22, -20, 0
	jump .LBB14_20
.LBB14_20:                              //   in Loop: Header=BB14_1 Depth=1
	move r0, all_end_or_waiting
	sb r0, 0, 1
	jump .LBB14_1
.Lfunc_end14:
	.size	scheduler_jobs, .Lfunc_end14-scheduler_jobs
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin14
	.byte	24
	.text
                                        // -- End function
	.globl	try_lock                        // -- Begin function try_lock
	.type	try_lock,@function
try_lock:                               // @try_lock
.Lfunc_begin15:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sw r22, -20, r0
	call r23, me
	lbs r0, r0, cur_jobs
	sb r22, -16, r0
	lw r0, zero, mutex_l
	call r23, mutex_lock
	lw r0, zero, mutex_jobs
	call r23, mutex_lock
	lw r0, r22, -20
	lw r0, r0, 0
	jeq r0, -1, .LBB15_2
	jump .LBB15_1
.LBB15_1:
	lw r0, zero, mutex_jobs
	call r23, mutex_unlock
	lw r0, zero, mutex_l
	call r23, mutex_unlock
	sw r22, -24, 1
	jump .LBB15_3
.LBB15_2:
	lbu r1, r22, -16
	lw r0, r22, -20
	sw r0, 0, r1
	lw r0, zero, mutex_jobs
	call r23, mutex_unlock
	lw r0, zero, mutex_l
	call r23, mutex_unlock
	sw r22, -24, 0
	jump .LBB15_3
.LBB15_3:
	lw r0, r22, -24
	ld d22, r22, -8
	jump r23
.Lfunc_end15:
	.size	try_lock, .Lfunc_end15-try_lock
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin15
	.byte	24
	.text
                                        // -- End function
	.globl	lock                            // -- Begin function lock
	.type	lock,@function
lock:                                   // @lock
.Lfunc_begin16:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sw r22, -20, r0
	call r23, me
	lbs r0, r0, cur_jobs
	sb r22, -16, r0
	lw r0, zero, mutex_l
	call r23, mutex_lock
	lw r0, zero, mutex_jobs
	call r23, mutex_lock
	lw r0, r22, -20
	lw r0, r0, 0
	jeq r0, -1, .LBB16_2
	jump .LBB16_1
.LBB16_1:
	lbu r1, r22, -16
	lsl r0, r1, 2
	lsl_add r1, r0, r1, 4
	move r0, jobs
	move r2, 5
	sb r1, jobs, r2
	lw r1, r22, -20
	lbu r3, r22, -16
	lsl r2, r3, 2
	lsl_add r2, r2, r3, 4
	add r0, r0, r2
	sw r0, 8, r1
	lw r0, zero, mutex_jobs
	call r23, mutex_unlock
	lw r0, zero, mutex_l
	call r23, mutex_unlock
	call r23, swap_scheduler
	sw r22, -24, 0
	jump .LBB16_3
.LBB16_2:
	lbu r1, r22, -16
	lw r0, r22, -20
	sw r0, 0, r1
	lw r0, zero, mutex_jobs
	call r23, mutex_unlock
	lw r0, zero, mutex_l
	call r23, mutex_unlock
	sw r22, -24, 0
	jump .LBB16_3
.LBB16_3:
	lw r0, r22, -24
	ld d22, r22, -8
	jump r23
.Lfunc_end16:
	.size	lock, .Lfunc_end16-lock
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin16
	.byte	24
	.text
                                        // -- End function
	.globl	unlock                          // -- Begin function unlock
	.type	unlock,@function
unlock:                                 // @unlock
.Lfunc_begin17:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sw r22, -20, r0
	lw r0, zero, mutex_l
	call r23, mutex_lock
	lw r0, zero, mutex_jobs
	call r23, mutex_lock
	lw r0, r22, -20
	sw r0, 0, -1
	sw r22, -16, 0
	jump .LBB17_1
.LBB17_1:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -16
	lw r2, zero, cur_process_index
	lsl r1, r2, 4
	lsl_add r2, r1, r2, 6
	move r1, processs
	add r1, r1, r2
	lbu r1, r1, 2
	jgeu r0, r1, .LBB17_7
	jump .LBB17_2
.LBB17_2:                               //   in Loop: Header=BB17_1 Depth=1
	lw r1, r22, -16
	lsl r0, r1, 2
	lsl_add r0, r0, r1, 4
	lbu r0, r0, jobs
	jneq r0, 5, .LBB17_5
	jump .LBB17_3
.LBB17_3:                               //   in Loop: Header=BB17_1 Depth=1
	lw r1, r22, -16
	lsl r0, r1, 2
	lsl_add r1, r0, r1, 4
	move r0, jobs
	add r0, r0, r1
	lw r0, r0, 8
	lw r1, r22, -20
	jneq r0, r1, .LBB17_5
	jump .LBB17_4
.LBB17_4:
	lw r1, r22, -16
	lw r0, r22, -20
	sw r0, 0, r1
	lw r1, r22, -16
	lsl r0, r1, 2
	lsl_add r0, r0, r1, 4
	move r1, 3
	sb r0, jobs, r1
	lw r0, zero, mutex_l
	call r23, mutex_unlock
	lw r0, zero, mutex_jobs
	call r23, mutex_unlock
	move r0, cp
	call r23, abnormal_wakeup_one
	sw r22, -24, 0
	jump .LBB17_8
.LBB17_5:                               //   in Loop: Header=BB17_1 Depth=1
	jump .LBB17_6
.LBB17_6:                               //   in Loop: Header=BB17_1 Depth=1
	lw r0, r22, -16
	add r0, r0, 1
	sw r22, -16, r0
	jump .LBB17_1
.LBB17_7:
	lw r0, zero, mutex_jobs
	call r23, mutex_unlock
	lw r0, zero, mutex_l
	call r23, mutex_unlock
	sw r22, -24, 0
	jump .LBB17_8
.LBB17_8:
	lw r0, r22, -24
	ld d22, r22, -8
	jump r23
.Lfunc_end17:
	.size	unlock, .Lfunc_end17-unlock
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin17
	.byte	24
	.text
                                        // -- End function
	.type	mram_read,@function             // -- Begin function mram_read
mram_read:                              // @mram_read
.Lfunc_begin18:
// %bb.0:
	sw r22, 0, r0
	sw r22, 4, r1
	sw r22, 8, r2
	lw r0, r22, 4
	lw r1, r22, 0
	lw r3, r22, 8
	move r2, -1
	lsr_add r2, r2, r3, 3
	lsl_add r0, r0, r2, 24
	ldma r0, r1, 0
	jump r23
.Lfunc_end18:
	.size	mram_read, .Lfunc_end18-mram_read
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin18
	.byte	12
	.text
                                        // -- End function
	.type	mram_write,@function            // -- Begin function mram_write
mram_write:                             // @mram_write
.Lfunc_begin19:
// %bb.0:
	sw r22, 0, r0
	sw r22, 4, r1
	sw r22, 8, r2
	lw r0, r22, 0
	lw r1, r22, 4
	lw r3, r22, 8
	move r2, -1
	lsr_add r2, r2, r3, 3
	lsl_add r0, r0, r2, 24
	sdma r0, r1, 0
	jump r23
.Lfunc_end19:
	.size	mram_write, .Lfunc_end19-mram_write
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin19
	.byte	12
	.text
                                        // -- End function
	.globl	inode_operation                 // -- Begin function inode_operation
	.type	inode_operation,@function
inode_operation:                        // @inode_operation
.Lfunc_begin20:
// %bb.0:
	sd r22, 24, d22
	add r22, r22, 32
	sw r22, -32, r0
	sw r22, -28, r1
	sw r22, -24, r2
	sw r22, -20, r3
	sw r22, -16, r4
	lw r1, r22, -32
	lw r0, r22, -20
	lsl_add r0, r0, r1, 16
	add r0, r0, 651264
	sw r22, -12, r0
	lw r0, r22, -16
	jneq r0, 0, .LBB20_2
	jump .LBB20_1
.LBB20_1:
	lw r0, r22, -12
	lw r1, r22, -28
	lw r2, r22, -24
	call r23, load_big_blocks
	jump .LBB20_3
.LBB20_2:
	lw r0, r22, -28
	lw r1, r22, -12
	lw r2, r22, -24
	call r23, store_big_blocks
	jump .LBB20_3
.LBB20_3:
	move r0, 0
	ld d22, r22, -8
	jump r23
.Lfunc_end20:
	.size	inode_operation, .Lfunc_end20-inode_operation
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin20
	.byte	32
	.text
                                        // -- End function
	.globl	load_big_blocks                 // -- Begin function load_big_blocks
	.type	load_big_blocks,@function
load_big_blocks:                        // @load_big_blocks
.Lfunc_begin21:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sw r22, -24, r0
	sw r22, -20, r1
	sw r22, -16, r2
	sw r22, -12, 0
	jump .LBB21_1
.LBB21_1:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -12
	lw r1, r22, -16
	lsr r1, r1, 11
	jgeu r0, r1, .LBB21_4
	jump .LBB21_2
.LBB21_2:                               //   in Loop: Header=BB21_1 Depth=1
	lw r0, r22, -24
	lw r2, r22, -12
	lsl_add r0, r0, r2, 11
	lw r1, r22, -20
	lsl_add r1, r1, r2, 11
	move r2, 2048
	call r23, mram_read
	jump .LBB21_3
.LBB21_3:                               //   in Loop: Header=BB21_1 Depth=1
	lw r0, r22, -12
	add r0, r0, 1
	sw r22, -12, r0
	jump .LBB21_1
.LBB21_4:
	lhu r0, r22, -16
	and r0, r0, 2047
	jeq r0, 0, .LBB21_6
	jump .LBB21_5
.LBB21_5:
	lw r0, r22, -24
	lw r2, r22, -12
	lsl_add r0, r0, r2, 11
	lw r1, r22, -20
	lsl_add r1, r1, r2, 11
	lw r2, r22, -16
	and r2, r2, 2047
	call r23, mram_read
	jump .LBB21_6
.LBB21_6:
	ld d22, r22, -8
	jump r23
.Lfunc_end21:
	.size	load_big_blocks, .Lfunc_end21-load_big_blocks
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin21
	.byte	24
	.text
                                        // -- End function
	.globl	store_big_blocks                // -- Begin function store_big_blocks
	.type	store_big_blocks,@function
store_big_blocks:                       // @store_big_blocks
.Lfunc_begin22:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sw r22, -24, r0
	sw r22, -20, r1
	sw r22, -16, r2
	sw r22, -12, 0
	jump .LBB22_1
.LBB22_1:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -12
	lw r1, r22, -16
	lsr r1, r1, 11
	jgeu r0, r1, .LBB22_4
	jump .LBB22_2
.LBB22_2:                               //   in Loop: Header=BB22_1 Depth=1
	lw r0, r22, -24
	lw r2, r22, -12
	lsl_add r0, r0, r2, 11
	lw r1, r22, -20
	lsl_add r1, r1, r2, 11
	move r2, 2048
	call r23, mram_write
	jump .LBB22_3
.LBB22_3:                               //   in Loop: Header=BB22_1 Depth=1
	lw r0, r22, -12
	add r0, r0, 1
	sw r22, -12, r0
	jump .LBB22_1
.LBB22_4:
	lhu r0, r22, -16
	and r0, r0, 2047
	jeq r0, 0, .LBB22_6
	jump .LBB22_5
.LBB22_5:
	lw r0, r22, -24
	lw r2, r22, -12
	lsl_add r0, r0, r2, 11
	lw r1, r22, -20
	lsl_add r1, r1, r2, 11
	lw r2, r22, -16
	and r2, r2, 2047
	call r23, mram_write
	jump .LBB22_6
.LBB22_6:
	ld d22, r22, -8
	jump r23
.Lfunc_end22:
	.size	store_big_blocks, .Lfunc_end22-store_big_blocks
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin22
	.byte	24
	.text
                                        // -- End function
	.globl	alloc_inode                     // -- Begin function alloc_inode
	.type	alloc_inode,@function
alloc_inode:                            // @alloc_inode
.Lfunc_begin23:
// %bb.0:
	sd r22, 24, d22
	add r22, r22, 32
	lw r0, zero, mutex_mram
	call r23, mutex_lock
	sw r22, -28, 0
	jump .LBB23_1
.LBB23_1:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB23_3 Depth 2
                                        //       Child Loop BB23_6 Depth 3
	lw r0, r22, -28
	jgts r0, 9, .LBB23_19
	jump .LBB23_2
.LBB23_2:                               //   in Loop: Header=BB23_1 Depth=1
	lw r1, r22, -28
	lsl r0, r1, 4
	lsl_add r0, r0, r1, 7
	lsl_add r0, r0, r1, 8
	add r0, r0, 61536
	sw r22, -24, r0
	lw r0, r22, -24
	add r0, r0, 651264
	move r1, alloc_inode.bit_map
	move r2, 400
	call r23, mram_read
	sw r22, -20, 0
	jump .LBB23_3
.LBB23_3:                               //   Parent Loop BB23_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB23_6 Depth 3
	lw r0, r22, -20
	jgts r0, 399, .LBB23_17
	jump .LBB23_4
.LBB23_4:                               //   in Loop: Header=BB23_3 Depth=2
	lw r0, r22, -20
	lbu r0, r0, alloc_inode.bit_map
	jeq r0, 255, .LBB23_15
	jump .LBB23_5
.LBB23_5:                               //   in Loop: Header=BB23_3 Depth=2
	sw r22, -16, 0
	jump .LBB23_6
.LBB23_6:                               //   Parent Loop BB23_1 Depth=1
                                        //     Parent Loop BB23_3 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	lw r0, r22, -16
	jgts r0, 7, .LBB23_14
	jump .LBB23_7
.LBB23_7:                               //   in Loop: Header=BB23_6 Depth=3
	lw r0, r22, -20
	lbu r0, r0, alloc_inode.bit_map
	lw r1, r22, -16
	lsr r0, r0, r1
	and r0, r0, 1
	jneq r0, 0, .LBB23_12
	jump .LBB23_8
.LBB23_8:                               //   in Loop: Header=BB23_6 Depth=3
	lw r1, r22, -28
	lsl r0, r1, 4
	lsl_add r0, r0, r1, 7
	lsl_add r0, r0, r1, 8
	lw r1, r22, -20
	add r1, r0, r1
	lw r0, r22, -16
	lsl_add r0, r0, r1, 3
	sw r22, -12, r0
	lw r0, r22, -12
	jeq r0, 0, .LBB23_10
	jump .LBB23_9
.LBB23_9:                               //   in Loop: Header=BB23_6 Depth=3
	lw r0, r22, -12
	jneq r0, 1, .LBB23_11
	jump .LBB23_10
.LBB23_10:                              //   in Loop: Header=BB23_6 Depth=3
	jump .LBB23_13
.LBB23_11:
	lw r0, r22, -16
	move r1, 1
	lsl r3, one, r0
	lw r1, r22, -20
	move r0, alloc_inode.bit_map
	lbs r2, r1, alloc_inode.bit_map
	or r2, r2, r3
	sb r1, alloc_inode.bit_map, r2
	lw r2, r22, -28
	lsl r1, r2, 4
	lsl_add r1, r1, r2, 7
	lsl_add r1, r1, r2, 8
	add r1, r1, 712800
	move r2, 400
	call r23, mram_write
	lw r0, zero, mutex_mram
	call r23, mutex_unlock
	lw r0, r22, -12
	sw r22, -32, r0
	jump .LBB23_20
.LBB23_12:                              //   in Loop: Header=BB23_6 Depth=3
	jump .LBB23_13
.LBB23_13:                              //   in Loop: Header=BB23_6 Depth=3
	lw r0, r22, -16
	add r0, r0, 1
	sw r22, -16, r0
	jump .LBB23_6
.LBB23_14:                              //   in Loop: Header=BB23_3 Depth=2
	jump .LBB23_15
.LBB23_15:                              //   in Loop: Header=BB23_3 Depth=2
	jump .LBB23_16
.LBB23_16:                              //   in Loop: Header=BB23_3 Depth=2
	lw r0, r22, -20
	add r0, r0, 1
	sw r22, -20, r0
	jump .LBB23_3
.LBB23_17:                              //   in Loop: Header=BB23_1 Depth=1
	jump .LBB23_18
.LBB23_18:                              //   in Loop: Header=BB23_1 Depth=1
	lw r0, r22, -28
	add r0, r0, 1
	sw r22, -28, r0
	jump .LBB23_1
.LBB23_19:
	lw r0, zero, mutex_mram
	call r23, mutex_unlock
	sw r22, -32, -11
	jump .LBB23_20
.LBB23_20:
	lw r0, r22, -32
	ld d22, r22, -8
	jump r23
.Lfunc_end23:
	.size	alloc_inode, .Lfunc_end23-alloc_inode
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin23
	.byte	32
	.text
                                        // -- End function
	.globl	find_inode                      // -- Begin function find_inode
	.type	find_inode,@function
find_inode:                             // @find_inode
.Lfunc_begin24:
// %bb.0:
	sd r22, 24, d22
	add r22, r22, 32
	sw r22, -28, r0
	sw r22, -24, r1
	lhu r0, r22, -22
	sw r22, -20, r0
	lw r0, zero, mutex_inode
	call r23, mutex_lock
	sw r22, -16, 0
	jump .LBB24_1
.LBB24_1:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -16
	jgts r0, 3, .LBB24_20
	jump .LBB24_2
.LBB24_2:                               //   in Loop: Header=BB24_1 Depth=1
	lw r1, r22, -28
	move r0, inode_table
	lsl_add r0, r0, r1, 4
	lw r1, r22, -16
	lsl_add r0, r0, r1, 2
	lhu r0, r0, 0
	jeq r0, 0, .LBB24_7
	jump .LBB24_3
.LBB24_3:                               //   in Loop: Header=BB24_1 Depth=1
	lw r0, r22, -20
	lw r2, r22, -28
	move r1, inode_table
	lsl_add r1, r1, r2, 4
	lw r2, r22, -16
	lsl_add r1, r1, r2, 2
	lhu r1, r1, 2
	jges r0, r1, .LBB24_5
	jump .LBB24_4
.LBB24_4:
	lw r0, zero, mutex_inode
	call r23, mutex_unlock
	lw r1, r22, -28
	move r0, inode_table
	lsl_add r0, r0, r1, 4
	lw r1, r22, -16
	lsl_add r0, r0, r1, 2
	lhu r0, r0, 0
	lw r1, r22, -20
	add r0, r0, r1
	sw r22, -32, r0
	jump .LBB24_21
.LBB24_5:                               //   in Loop: Header=BB24_1 Depth=1
	lw r1, r22, -28
	move r0, inode_table
	lsl_add r0, r0, r1, 4
	lw r1, r22, -16
	lsl_add r0, r0, r1, 2
	lhu r1, r0, 2
	lw r0, r22, -20
	sub r0, r0, r1
	sw r22, -20, r0
	jump .LBB24_6
.LBB24_6:                               //   in Loop: Header=BB24_1 Depth=1
	jump .LBB24_18
.LBB24_7:
	lw r0, r22, -16
	add r0, r0, -1
	sw r22, -16, r0
	jump .LBB24_8
.LBB24_8:                               // =>This Inner Loop Header: Depth=1
	call r23, alloc_inode
	sw r22, -12, r0
	lw r0, r22, -12
	jgts r0, -1, .LBB24_10
	jump .LBB24_9
.LBB24_9:
	lw r0, zero, mutex_inode
	call r23, mutex_unlock
	lw r0, r22, -12
	sw r22, -32, r0
	jump .LBB24_21
.LBB24_10:                              //   in Loop: Header=BB24_8 Depth=1
	lw r0, r22, -12
	lw r2, r22, -28
	move r1, inode_table
	lsl_add r1, r1, r2, 4
	lw r2, r22, -16
	lsl_add r2, r1, r2, 2
	lhu r1, r2, 0
	lhu r2, r2, 2
	add r1, r1, r2
	jneq r0, r1, .LBB24_12
	jump .LBB24_11
.LBB24_11:                              //   in Loop: Header=BB24_8 Depth=1
	lw r1, r22, -28
	move r0, inode_table
	lsl_add r0, r0, r1, 4
	lw r1, r22, -16
	lsl_add r0, r0, r1, 2
	lhs r1, r0, 2
	add r1, r1, 1
	sh r0, 2, r1
	jump .LBB24_15
.LBB24_12:                              //   in Loop: Header=BB24_8 Depth=1
	lw r0, r22, -16
	add r0, r0, 1
	sw r22, -16, r0
	lw r0, r22, -16
	jlts r0, 4, .LBB24_14
	jump .LBB24_13
.LBB24_13:
	move r0, 4444
	call r23, printk_int
	lw r0, zero, mutex_inode
	call r23, mutex_unlock
	call r23, halt
.LBB24_14:                              //   in Loop: Header=BB24_8 Depth=1
	lw r2, r22, -12
	lw r1, r22, -28
	move r0, inode_table
	lsl_add r1, r0, r1, 4
	lw r3, r22, -16
	lsl_add r1, r1, r3, 2
	sh r1, 0, r2
	lw r1, r22, -28
	lsl_add r0, r0, r1, 4
	lw r1, r22, -16
	lsl_add r0, r0, r1, 2
	sh r0, 2, 1
	jump .LBB24_15
.LBB24_15:                              //   in Loop: Header=BB24_8 Depth=1
	jump .LBB24_16
.LBB24_16:                              //   in Loop: Header=BB24_8 Depth=1
	lw r0, r22, -20
	add r1, r0, -1
	sw r22, -20, r1
	jneq r0, 0, .LBB24_8
	jump .LBB24_17
.LBB24_17:
	lw r0, zero, mutex_inode
	call r23, mutex_unlock
	lw r0, r22, -12
	sw r22, -32, r0
	jump .LBB24_21
.LBB24_18:                              //   in Loop: Header=BB24_1 Depth=1
	jump .LBB24_19
.LBB24_19:                              //   in Loop: Header=BB24_1 Depth=1
	lw r0, r22, -16
	add r0, r0, 1
	sw r22, -16, r0
	jump .LBB24_1
.LBB24_20:
	lw r0, zero, mutex_inode
	call r23, mutex_unlock
	sw r22, -32, -54
	jump .LBB24_21
.LBB24_21:
	lw r0, r22, -32
	ld d22, r22, -8
	jump r23
.Lfunc_end24:
	.size	find_inode, .Lfunc_end24-find_inode
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin24
	.byte	32
	.text
                                        // -- End function
	.globl	printk_int                      // -- Begin function printk_int
	.type	printk_int,@function
printk_int:                             // @printk_int
.Lfunc_begin25:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sw r22, -24, r0
	lw r0, zero, log_w
	add r0, r0, 8
	move r1, 65537
	jltu r0, r1, .LBB25_2
	jump .LBB25_1
.LBB25_1:
	jump .LBB25_3
.LBB25_2:
	lw r0, zero, mutex_printk
	call r23, mutex_lock
	sw r22, -16, 1
	lw r0, r22, -24
	sw r22, -12, r0
	lw r3, zero, log_w
	add r1, r22, -16
	move r2, 8
	move r4, 1
	move r0, r4
	call r23, inode_operation
	lw r0, zero, log_w
	add r0, r0, 8
	sw zero, log_w, r0
	move r0, 64
	call r23, set_flag
	lw r0, zero, mutex_printk
	call r23, mutex_unlock
	jump .LBB25_3
.LBB25_3:
	ld d22, r22, -8
	jump r23
.Lfunc_end25:
	.size	printk_int, .Lfunc_end25-printk_int
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin25
	.byte	24
	.text
                                        // -- End function
	.globl	chained_inode_operation         // -- Begin function chained_inode_operation
	.type	chained_inode_operation,@function
chained_inode_operation:                // @chained_inode_operation
.Lfunc_begin26:
// %bb.0:
	sd r22, 48, d22
	add r22, r22, 56
	sw r22, -52, r0
	sw r22, -48, r1
	sw r22, -44, r2
	sw r22, -40, r3
	lw r0, r22, -48
	move r1, 65537
	jltu r0, r1, .LBB26_2
	jump .LBB26_1
.LBB26_1:
	sw r22, -56, -20
	jump .LBB26_23
.LBB26_2:
	lhu r0, r22, -44
	sw r22, -32, r0
	lw r0, r22, -32
	sub r0, 65536, r0
	sw r22, -28, r0
	lw r0, r22, -28
	lw r1, r22, -48
	jleu r0, r1, .LBB26_4
	jump .LBB26_3
.LBB26_3:
	lw r0, r22, -48
	sw r22, -16, r0
	jump .LBB26_5
.LBB26_4:
	lw r0, r22, -28
	sw r22, -16, r0
	jump .LBB26_5
.LBB26_5:
	lw r0, r22, -16
	sw r22, -24, r0
	lhu r0, r22, -42
	sw r22, -20, r0
	lw r0, r22, -20
	lw r2, zero, cur_process_index
	move r1, inode_table
	lsl_add r1, r1, r2, 4
	lhu r1, r1, 2
	jges r0, r1, .LBB26_7
	jump .LBB26_6
.LBB26_6:
	lw r0, zero, cur_process_index
	lsl r0, r0, 4
	lhu r0, r0, inode_table
	lw r1, r22, -20
	add r0, r0, r1
	sw r22, -36, r0
	jump .LBB26_8
.LBB26_7:
	lw r0, zero, cur_process_index
	lw r1, r22, -44
	call r23, find_inode
	sw r22, -36, r0
	jump .LBB26_8
.LBB26_8:
	lw r0, r22, -36
	jgts r0, 1023, .LBB26_10
	jump .LBB26_9
.LBB26_9:
	lw r0, r22, -36
	jgts r0, -1, .LBB26_11
	jump .LBB26_10
.LBB26_10:
	sw r22, -56, -11
	jump .LBB26_23
.LBB26_11:
	lw r0, r22, -36
	lw r1, r22, -52
	lw r2, r22, -24
	lw r3, r22, -32
	lw r4, r22, -40
	call r23, inode_operation
	sw r22, -36, r0
	jgts r0, -1, .LBB26_13
	jump .LBB26_12
.LBB26_12:
	lw r0, r22, -36
	sw r22, -56, r0
	jump .LBB26_23
.LBB26_13:
	lw r1, r22, -24
	lw r0, r22, -48
	sub r0, r0, r1
	sw r22, -48, r0
	lw r0, r22, -48
	jneq r0, 0, .LBB26_15
	jump .LBB26_14
.LBB26_14:
	sw r22, -56, 0
	jump .LBB26_23
.LBB26_15:
	lw r1, r22, -24
	lw r0, r22, -44
	add r0, r0, r1
	sw r22, -44, r0
	lw r1, r22, -24
	lw r0, r22, -52
	add r0, r0, r1
	sw r22, -52, r0
	lw r0, zero, cur_process_index
	lw r1, r22, -44
	call r23, find_inode
	sw r22, -36, r0
	jgts r0, -1, .LBB26_17
	jump .LBB26_16
.LBB26_16:
	lw r0, r22, -36
	sw r22, -56, r0
	jump .LBB26_23
.LBB26_17:
	lw r0, r22, -36
	jgts r0, 1023, .LBB26_19
	jump .LBB26_18
.LBB26_18:
	lw r0, r22, -36
	jgts r0, -1, .LBB26_20
	jump .LBB26_19
.LBB26_19:
	sw r22, -56, -11
	jump .LBB26_23
.LBB26_20:
	lw r0, r22, -36
	lw r1, r22, -52
	lw r2, r22, -48
	lw r4, r22, -40
	move r3, 0
	call r23, inode_operation
	sw r22, -36, r0
	jgts r0, -1, .LBB26_22
	jump .LBB26_21
.LBB26_21:
	lw r0, r22, -36
	sw r22, -56, r0
	jump .LBB26_23
.LBB26_22:
	sw r22, -56, 0
	jump .LBB26_23
.LBB26_23:
	lw r0, r22, -56
	ld d22, r22, -8
	jump r23
.Lfunc_end26:
	.size	chained_inode_operation, .Lfunc_end26-chained_inode_operation
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin26
	.byte	56
	.text
                                        // -- End function
	.globl	free_inode                      // -- Begin function free_inode
	.type	free_inode,@function
free_inode:                             // @free_inode
.Lfunc_begin27:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, r0
	move r0, 75698
	call r23, printk_int
	call r23, halt
.Lfunc_end27:
	.size	free_inode, .Lfunc_end27-free_inode
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin27
	.byte	16
	.text
                                        // -- End function
	.globl	wakeup_sleepy_socket            // -- Begin function wakeup_sleepy_socket
	.type	wakeup_sleepy_socket,@function
wakeup_sleepy_socket:                   // @wakeup_sleepy_socket
.Lfunc_begin28:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, 0
	jump .LBB28_1
.LBB28_1:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB28_3 Depth 2
	lw r0, r22, -16
	jgtu r0, 9, .LBB28_10
	jump .LBB28_2
.LBB28_2:                               //   in Loop: Header=BB28_1 Depth=1
	sw r22, -12, 0
	jump .LBB28_3
.LBB28_3:                               //   Parent Loop BB28_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lw r0, r22, -12
	jgtu r0, 2, .LBB28_8
	jump .LBB28_4
.LBB28_4:                               //   in Loop: Header=BB28_3 Depth=2
	lw r1, r22, -16
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lw r1, r22, -12
	lsl_add r0, r0, r1, 3
	lbu r0, r0, 60
	and r0, r0, 32
	jeq r0, 0, .LBB28_6
	jump .LBB28_5
.LBB28_5:                               //   in Loop: Header=BB28_3 Depth=2
	lw r1, r22, -16
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r1, r0, r1
	lw r2, r22, -12
	lsl_add r1, r1, r2, 3
	lw r2, r1, 60
	and r2, r2, -33
	sw r1, 60, r2
	lw r2, r22, -16
	lsl r1, r2, 4
	lsl_add r1, r1, r2, 6
	add r0, r0, r1
	lw r1, r22, -12
	lsl_add r0, r0, r1, 3
	add r0, r0, 56
	move r2, 0
	move r1, r2
	call r23, wakeup
	jump .LBB28_6
.LBB28_6:                               //   in Loop: Header=BB28_3 Depth=2
	jump .LBB28_7
.LBB28_7:                               //   in Loop: Header=BB28_3 Depth=2
	lw r0, r22, -12
	add r0, r0, 1
	sw r22, -12, r0
	jump .LBB28_3
.LBB28_8:                               //   in Loop: Header=BB28_1 Depth=1
	jump .LBB28_9
.LBB28_9:                               //   in Loop: Header=BB28_1 Depth=1
	lw r0, r22, -16
	add r0, r0, 1
	sw r22, -16, r0
	jump .LBB28_1
.LBB28_10:
	move r0, 0
	ld d22, r22, -8
	jump r23
.Lfunc_end28:
	.size	wakeup_sleepy_socket, .Lfunc_end28-wakeup_sleepy_socket
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin28
	.byte	16
	.text
                                        // -- End function
	.globl	socket_open                     // -- Begin function socket_open
	.type	socket_open,@function
socket_open:                            // @socket_open
.Lfunc_begin29:
// %bb.0:
	sd r22, 56, d22
	add r22, r22, 64
	sw r22, -60, r0
	lw r0, zero, mutex_sockets
	call r23, mutex_lock
	lw r1, zero, cur_process_index
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	sw r22, -56, r0
	sw r22, -52, 0
	jump .LBB29_1
.LBB29_1:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -52
	jgtu r0, 2, .LBB29_12
	jump .LBB29_2
.LBB29_2:                               //   in Loop: Header=BB29_1 Depth=1
	lw r0, r22, -56
	lw r1, r22, -52
	lsl_add r0, r0, r1, 3
	lw r0, r0, 56
	jneq r0, 0, .LBB29_10
	jump .LBB29_3
.LBB29_3:
	call r23, alloc_inode
	sw r22, -48, r0
	lw r0, r22, -48
	jgtu r0, 1, .LBB29_5
	jump .LBB29_4
.LBB29_4:
	lw r0, zero, mutex_sockets
	call r23, mutex_unlock
	sw r22, -64, -11
	jump .LBB29_13
.LBB29_5:
	lw r1, r22, -48
	lw r0, r22, -56
	lw r2, r22, -52
	lsl_add r0, r0, r2, 3
	sw r0, 56, r1
	lw r0, r22, -56
	lw r1, r22, -52
	lsl_add r0, r0, r1, 3
	sw r0, 60, 5
	move r0, 16
	sw r22, -16, r0
	call r23, set_flag
	lw r2, r22, -16
	sd r22, -32, 0
	sd r22, -40, 0
	lw r0, r22, -60
	sw r22, -24, r0
	sw r22, -20, 0
	lw r0, r22, -48
	add r1, r22, -40
	move r3, 0
	move r4, 1
	call r23, inode_operation
	jeq r0, 0, .LBB29_7
	jump .LBB29_6
.LBB29_6:
	call r23, halt
.LBB29_7:
	lw r0, r22, -48
	add r1, r22, -24
	move r2, 8
	move r3, 16
	move r4, 1
	call r23, inode_operation
	jeq r0, 0, .LBB29_9
	jump .LBB29_8
.LBB29_8:
	call r23, halt
.LBB29_9:
	lw r0, zero, mutex_sockets
	call r23, mutex_unlock
	lw r0, r22, -52
	sw r22, -64, r0
	jump .LBB29_13
.LBB29_10:                              //   in Loop: Header=BB29_1 Depth=1
	jump .LBB29_11
.LBB29_11:                              //   in Loop: Header=BB29_1 Depth=1
	lw r0, r22, -52
	add r0, r0, 1
	sw r22, -52, r0
	jump .LBB29_1
.LBB29_12:
	lw r0, zero, mutex_sockets
	call r23, mutex_unlock
	sw r22, -64, -7
	jump .LBB29_13
.LBB29_13:
	lw r0, r22, -64
	ld d22, r22, -8
	jump r23
.Lfunc_end29:
	.size	socket_open, .Lfunc_end29-socket_open
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin29
	.byte	64
	.text
                                        // -- End function
	.globl	set_flag                        // -- Begin function set_flag
	.type	set_flag,@function
set_flag:                               // @set_flag
.Lfunc_begin30:
// %bb.0:
	sd r22, 40, d22
	add r22, r22, 48
	sw r22, -48, r0
	lw r0, zero, mutex_flag
	call r23, mutex_lock
	move r0, 651264
	sw r22, -20, r0
	add r1, r22, -40
	sw r22, -16, r1
	move r2, 16
	sw r22, -24, r2
	call r23, mram_read
	lw r0, r22, -16
	lw r1, r22, -20
	lw r2, r22, -24
	lw r3, r22, -32
	lw r4, r22, -48
	or r3, r3, r4
	sw r22, -32, r3
	call r23, mram_write
	lw r0, zero, mutex_flag
	call r23, mutex_unlock
	ld d22, r22, -8
	jump r23
.Lfunc_end30:
	.size	set_flag, .Lfunc_end30-set_flag
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin30
	.byte	48
	.text
                                        // -- End function
	.globl	check_sd                        // -- Begin function check_sd
	.type	check_sd,@function
check_sd:                               // @check_sd
.Lfunc_begin31:
// %bb.0:
	sw r22, 4, r0
	lw r0, r22, 4
	jgtu r0, 3, .LBB31_2
	jump .LBB31_1
.LBB31_1:
	lw r1, zero, cur_process_index
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lw r1, r22, 4
	lsl_add r0, r0, r1, 3
	lw r0, r0, 56
	jneq r0, 0, .LBB31_3
	jump .LBB31_2
.LBB31_2:
	sw r22, 0, -8
	jump .LBB31_4
.LBB31_3:
	sw r22, 0, 0
	jump .LBB31_4
.LBB31_4:
	lw r0, r22, 0
	jump r23
.Lfunc_end31:
	.size	check_sd, .Lfunc_end31-check_sd
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin31
	.byte	8
	.text
                                        // -- End function
	.globl	socket_close                    // -- Begin function socket_close
	.type	socket_close,@function
socket_close:                           // @socket_close
.Lfunc_begin32:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sw r22, -24, r0
	lw r0, zero, mutex_sockets
	call r23, mutex_lock
	lw r0, r22, -24
	call r23, check_sd
	sw r22, -20, r0
	lw r0, r22, -20
	jeq r0, 0, .LBB32_2
	jump .LBB32_1
.LBB32_1:
	jump .LBB32_3
.LBB32_2:
	lw r1, zero, cur_process_index
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	sw r22, -16, r0
	add r0, r0, r1
	lw r1, r22, -24
	lsl_add r0, r0, r1, 3
	lw r0, r0, 56
	call r23, free_inode
	lw r0, r22, -16
	lw r2, zero, cur_process_index
	lsl r1, r2, 4
	lsl_add r1, r1, r2, 6
	add r0, r0, r1
	lw r1, r22, -24
	lsl_add r0, r0, r1, 3
	sw r0, 56, 0
	jump .LBB32_3
.LBB32_3:
	lw r0, zero, mutex_sockets
	call r23, mutex_unlock
	lw r0, r22, -20
	ld d22, r22, -8
	jump r23
.Lfunc_end32:
	.size	socket_close, .Lfunc_end32-socket_close
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin32
	.byte	24
	.text
                                        // -- End function
	.globl	socket_read                     // -- Begin function socket_read
	.type	socket_read,@function
socket_read:                            // @socket_read
.Lfunc_begin33:
// %bb.0:
	sd r22, 88, d22
	add r22, r22, 96
	sw r22, -96, r0
	sw r22, -92, r1
	sw r22, -88, r2
	lw r0, r22, -92
	sw r22, -84, r0
	lw r0, zero, mutex_sockets
	call r23, mutex_lock
	lw r0, r22, -96
	call r23, check_sd
	sw r22, -80, r0
	lw r0, r22, -80
	jeq r0, 0, .LBB33_2
	jump .LBB33_1
.LBB33_1:
	jump .LBB33_22
.LBB33_2:
	lw r1, zero, cur_process_index
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lw r1, r22, -96
	lsl_add r0, r0, r1, 3
	lw r0, r0, 56
	sw r22, -76, r0
	lw r0, r22, -76
	add r1, r22, -72
	move r2, 16
	move r4, 0
	move r3, r4
	call r23, inode_operation
	jeq r0, 0, .LBB33_4
	jump .LBB33_3
.LBB33_3:
	call r23, halt
.LBB33_4:
	jump .LBB33_5
.LBB33_5:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -64
	lw r1, r22, -68
	jltu r0, r1, .LBB33_7
	jump .LBB33_6
.LBB33_6:                               //   in Loop: Header=BB33_5 Depth=1
	lw r0, r22, -64
	lw r1, r22, -68
	sub r0, r0, r1
	lw r1, r22, -88
	move r2, 1
	sw r22, -32, r2
	jltu r0, r1, .LBB33_10
	jump .LBB33_7
.LBB33_7:                               //   in Loop: Header=BB33_5 Depth=1
	lw r0, r22, -64
	lw r1, r22, -68
	move r2, 0
	sw r22, -28, r2
	jgeu r0, r1, .LBB33_9
	jump .LBB33_8
.LBB33_8:                               //   in Loop: Header=BB33_5 Depth=1
	lw r1, r22, -68
	lw r0, r22, -64
	sub r0, r0, r1
	add r0, r0, 16384
	lw r1, r22, -88
	sub r0, r0, r1, ltu
	sw r22, -28, r0
	jump .LBB33_9
.LBB33_9:                               //   in Loop: Header=BB33_5 Depth=1
	lw r0, r22, -28
	sw r22, -32, r0
	jump .LBB33_10
.LBB33_10:                              //   in Loop: Header=BB33_5 Depth=1
	lw r0, r22, -32
	and r0, r0, 1
	jeq r0, 0, .LBB33_14
	jump .LBB33_11
.LBB33_11:                              //   in Loop: Header=BB33_5 Depth=1
	lw r1, zero, cur_process_index
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lw r1, r22, -96
	lsl_add r0, r0, r1, 3
	add r0, r0, 56
	lw r2, zero, mutex_sockets
	move r1, 0
	sw r22, -24, r1
	call r23, sleep
	lw r4, r22, -24
	lw r0, r22, -76
	add r1, r22, -72
	move r2, 16
	move r3, r4
	call r23, inode_operation
	jeq r0, 0, .LBB33_13
	jump .LBB33_12
.LBB33_12:
	call r23, halt
.LBB33_13:                              //   in Loop: Header=BB33_5 Depth=1
	jump .LBB33_5
.LBB33_14:
	lw r0, r22, -68
	lw r1, r22, -88
	add r0, r0, r1
	and r0, r0, -8
	add r0, r0, 8
	sw r22, -56, r0
	lw r0, r22, -68
	and r0, r0, -8
	add r0, r0, 16
	sw r22, -52, r0
	lw r0, r22, -52
	lw r1, r22, -56
	add r0, r0, r1
	move r1, 16384
	jgtu r0, r1, .LBB33_16
	jump .LBB33_15
.LBB33_15:
	lw r0, r22, -76
	lw r2, r22, -56
	lw r3, r22, -52
	move r1, buf_socket
	move r4, 0
	call r23, inode_operation
	jump .LBB33_17
.LBB33_16:
	lw r0, r22, -52
	sub r0, 16384, r0
	sw r22, -48, r0
	lw r0, r22, -56
	lw r1, r22, -48
	sub r0, r0, r1
	sw r22, -44, r0
	lw r0, r22, -76
	lw r2, r22, -48
	lw r3, r22, -52
	move r1, buf_socket
	sw r22, -16, r1
	move r4, 0
	sw r22, -20, r4
	call r23, inode_operation
	lw r1, r22, -16
	lw r4, r22, -20
	lw r0, r22, -76
	lw r2, r22, -48
	add r1, r1, r2
	lw r2, r22, -44
	move r3, 16
	call r23, inode_operation
	jump .LBB33_17
.LBB33_17:
	lw r0, r22, -68
	and r0, r0, 7
	sb r22, -40, r0
	sw r22, -36, 0
	jump .LBB33_18
.LBB33_18:                              // =>This Inner Loop Header: Depth=1
	lw r0, r22, -36
	lw r1, r22, -88
	jgeu r0, r1, .LBB33_21
	jump .LBB33_19
.LBB33_19:                              //   in Loop: Header=BB33_18 Depth=1
	lw r2, r22, -36
	lbu r0, r22, -40
	add r0, r2, r0
	lbs r1, r0, buf_socket
	lw r0, r22, -84
	add r0, r0, r2
	sb r0, 0, r1
	jump .LBB33_20
.LBB33_20:                              //   in Loop: Header=BB33_18 Depth=1
	lw r0, r22, -36
	add r0, r0, 1
	sw r22, -36, r0
	jump .LBB33_18
.LBB33_21:
	lw r0, r22, -68
	lw r1, r22, -88
	add r0, r0, r1
	and r0, r0, 16383
	sw r22, -68, r0
	lw r0, r22, -76
	add r1, r22, -72
	move r2, 16
	move r3, 0
	move r4, 1
	call r23, inode_operation
	jump .LBB33_22
.LBB33_22:
	lw r0, zero, mutex_sockets
	call r23, mutex_unlock
	lw r0, r22, -80
	ld d22, r22, -8
	jump r23
.Lfunc_end33:
	.size	socket_read, .Lfunc_end33-socket_read
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin33
	.byte	96
	.text
                                        // -- End function
	.globl	socket_write                    // -- Begin function socket_write
	.type	socket_write,@function
socket_write:                           // @socket_write
.Lfunc_begin34:
// %bb.0:
	sd r22, 72, d22
	add r22, r22, 80
	sw r22, -76, r0
	sw r22, -72, r1
	sw r22, -68, r2
	lw r0, r22, -72
	sw r22, -64, r0
	lw r0, r22, -68
	jltu r0, 265, .LBB34_2
	jump .LBB34_1
.LBB34_1:
	sw r22, -80, -20
	jump .LBB34_19
.LBB34_2:
	lw r0, zero, mutex_sockets
	call r23, mutex_lock
	lw r0, r22, -76
	call r23, check_sd
	sw r22, -60, r0
	lw r0, r22, -60
	jeq r0, 0, .LBB34_4
	jump .LBB34_3
.LBB34_3:
	jump .LBB34_18
.LBB34_4:
	lw r1, zero, cur_process_index
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lw r1, r22, -76
	lsl_add r0, r0, r1, 3
	lw r0, r0, 56
	sw r22, -56, r0
	lw r0, r22, -56
	add r1, r22, -48
	move r2, 16
	move r4, 0
	move r3, r4
	call r23, inode_operation
	jeq r0, 0, .LBB34_6
	jump .LBB34_5
.LBB34_5:
	call r23, halt
.LBB34_6:
	jump .LBB34_7
.LBB34_7:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -48
	lw r1, r22, -68
	add r0, r0, r1
	lsr r0, r0, 14
	jeq r0, 0, .LBB34_11
	jump .LBB34_8
.LBB34_8:                               //   in Loop: Header=BB34_7 Depth=1
	lw r1, zero, cur_process_index
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lw r1, r22, -76
	lsl_add r0, r0, r1, 3
	add r0, r0, 56
	lw r2, zero, mutex_sockets
	move r1, 0
	sw r22, -20, r1
	call r23, sleep
	lw r4, r22, -20
	lw r0, r22, -56
	add r1, r22, -48
	move r2, 16
	move r3, r4
	call r23, inode_operation
	jeq r0, 0, .LBB34_10
	jump .LBB34_9
.LBB34_9:
	call r23, halt
.LBB34_10:                              //   in Loop: Header=BB34_7 Depth=1
	jump .LBB34_7
.LBB34_11:
	lbu r0, r22, -48
	and r0, r0, 7
	jeq r0, 0, .LBB34_13
	jump .LBB34_12
.LBB34_12:
	lw r0, r22, -56
	lw r1, r22, -48
	and r1, r1, -8
	add r3, r1, 16400
	move r1, buf_socket
	move r2, 8
	move r4, 0
	call r23, inode_operation
	jump .LBB34_13
.LBB34_13:
	lw r0, r22, -48
	and r0, r0, 7
	sb r22, -32, r0
	sw r22, -28, 0
	jump .LBB34_14
.LBB34_14:                              // =>This Inner Loop Header: Depth=1
	lw r0, r22, -28
	lw r1, r22, -68
	jgeu r0, r1, .LBB34_17
	jump .LBB34_15
.LBB34_15:                              //   in Loop: Header=BB34_14 Depth=1
	lw r1, r22, -64
	lw r0, r22, -28
	add r1, r1, r0
	lbs r1, r1, 0
	lbu r2, r22, -32
	add r0, r0, r2
	sb r0, buf_socket, r1
	jump .LBB34_16
.LBB34_16:                              //   in Loop: Header=BB34_14 Depth=1
	lw r0, r22, -28
	add r0, r0, 1
	sw r22, -28, r0
	jump .LBB34_14
.LBB34_17:
	lw r0, r22, -48
	lw r1, r22, -68
	add r0, r0, r1
	and r0, r0, -8
	add r0, r0, 8
	sw r22, -24, r0
	lw r0, r22, -56
	lw r2, r22, -24
	lw r1, r22, -48
	and r1, r1, -8
	add r3, r1, 16400
	move r1, buf_socket
	move r4, 1
	sw r22, -16, r4
	call r23, inode_operation
	lw r4, r22, -16
	lw r1, r22, -68
	lw r0, r22, -48
	add r0, r0, r1
	sw r22, -48, r0
	lw r0, r22, -56
	add r1, r22, -48
	move r2, 16
	move r3, 0
	call r23, inode_operation
	lw r1, zero, cur_process_index
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lw r1, r22, -76
	lsl_add r0, r0, r1, 3
	lw r1, r0, 60
	or r1, r1, 64
	sw r0, 60, r1
	move r0, 8
	call r23, set_flag
	jump .LBB34_18
.LBB34_18:
	lw r0, zero, mutex_sockets
	call r23, mutex_unlock
	lw r0, r22, -60
	sw r22, -80, r0
	jump .LBB34_19
.LBB34_19:
	lw r0, r22, -80
	ld d22, r22, -8
	jump r23
.Lfunc_end34:
	.size	socket_write, .Lfunc_end34-socket_write
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin34
	.byte	80
	.text
                                        // -- End function
	.globl	syscall                         // -- Begin function syscall
	.type	syscall,@function
syscall:                                // @syscall
.Lfunc_begin35:
// %bb.0:
	sd r22, 40, d22
	add r22, r22, 48
	sw r22, -44, r0
	sw r22, -40, r1
	sw r22, -36, r2
	sw r22, -32, r3
	sw r22, -28, r4
	lw r0, r22, -28
	jneq r0, 0, .LBB35_2
	jump .LBB35_1
.LBB35_1:
	sw r22, -48, 0
	jump .LBB35_56
.LBB35_2:
	sw r22, -24, 0
	call r23, me
	lbs r0, r0, cur_jobs
	sb r22, -20, r0
	// inline asm
	time r0
	// inline asm
	sw r22, -24, r0
	lw r0, r22, -24
	lbu r2, r22, -20
	lsl r1, r2, 2
	lsl_add r2, r1, r2, 4
	move r1, jobs
	add r1, r1, r2
	lw r1, r1, 12
	sub r0, r0, r1
	move r1, 2501
	jltu r0, r1, .LBB35_4
	jump .LBB35_3
.LBB35_3:
	lbu r1, r22, -20
	lsl r0, r1, 2
	lsl_add r0, r0, r1, 4
	move r1, 3
	sb r0, jobs, r1
	call r23, swap_scheduler
	jump .LBB35_4
.LBB35_4:
	lw r0, r22, -28
	jneq r0, 24, .LBB35_6
	jump .LBB35_5
.LBB35_5:
	lw r0, r22, -44
	call r23, try_lock
	sw r22, -48, r0
	jump .LBB35_56
.LBB35_6:
	lw r0, r22, -28
	jeq r0, 22, .LBB35_8
	jump .LBB35_7
.LBB35_7:
	lw r0, r22, -28
	jneq r0, 23, .LBB35_15
	jump .LBB35_8
.LBB35_8:
	lw r0, r22, -44
	jneq r0, 0, .LBB35_10
	jump .LBB35_9
.LBB35_9:
	sw r22, -48, 0
	jump .LBB35_56
.LBB35_10:
	lbu r0, r22, -40
	and r0, r0, 7
	jeq r0, 0, .LBB35_12
	jump .LBB35_11
.LBB35_11:
	sw r22, -48, -19
	jump .LBB35_56
.LBB35_12:
	lbu r0, r22, -36
	and r0, r0, 7
	jeq r0, 0, .LBB35_14
	jump .LBB35_13
.LBB35_13:
	sw r22, -48, -21
	jump .LBB35_56
.LBB35_14:
	lw r0, r22, -44
	lw r1, r22, -40
	lw r2, r22, -36
	lw r3, r22, -28
	move r4, 22
	sub r3, r3, r4, neq
	call r23, chained_inode_operation
	sw r22, -48, r0
	jump .LBB35_56
.LBB35_15:
	lw r0, r22, -28
	jneq r0, 15, .LBB35_17
	jump .LBB35_16
.LBB35_16:
	lw r0, r22, -44
	call r23, lock
	sw r22, -48, r0
	jump .LBB35_56
.LBB35_17:
	lw r0, r22, -28
	jneq r0, 16, .LBB35_19
	jump .LBB35_18
.LBB35_18:
	lw r0, r22, -44
	call r23, unlock
	sw r22, -48, r0
	jump .LBB35_56
.LBB35_19:
	lw r0, r22, -28
	jneq r0, 17, .LBB35_21
	jump .LBB35_20
.LBB35_20:
	lw r0, r22, -44
	lw r1, r22, -40
	move r2, 0
	call r23, sleep
	sw r22, -48, r0
	jump .LBB35_56
.LBB35_21:
	lw r0, r22, -28
	jneq r0, 18, .LBB35_23
	jump .LBB35_22
.LBB35_22:
	lw r0, r22, -44
	move r2, 1
	move r1, r2
	call r23, wakeup
	sw r22, -48, r0
	jump .LBB35_56
.LBB35_23:
	lw r0, r22, -28
	jneq r0, 14, .LBB35_25
	jump .LBB35_24
.LBB35_24:
	lw r0, r22, -44
	sw r22, -16, r0
	lw r0, r22, -16
	sw r0, 0, -1
	sw r22, -48, 0
	jump .LBB35_56
.LBB35_25:
	lw r0, r22, -28
	jneq r0, 1, .LBB35_27
	jump .LBB35_26
.LBB35_26:
	sw r22, -48, 0
	jump .LBB35_56
.LBB35_27:
	lw r0, r22, -28
	jneq r0, 2, .LBB35_29
	jump .LBB35_28
.LBB35_28:
	lw r0, r22, -44
	call r23, sbrk
	sw r22, -48, r0
	jump .LBB35_56
.LBB35_29:
	lw r0, r22, -28
	jneq r0, 3, .LBB35_31
	jump .LBB35_30
.LBB35_30:
	lw r1, zero, cur_process_index
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lw r0, r0, 4
	sw r22, -48, r0
	jump .LBB35_56
.LBB35_31:
	lw r0, r22, -28
	jneq r0, 4, .LBB35_33
	jump .LBB35_32
.LBB35_32:
	lw r1, zero, cur_process_index
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lbu r0, r0, 1
	sw r22, -48, r0
	jump .LBB35_56
.LBB35_33:
	lw r0, r22, -28
	jneq r0, 5, .LBB35_35
	jump .LBB35_34
.LBB35_34:
	lw r1, zero, cur_process_index
	lsl r0, r1, 4
	lsl_add r0, r0, r1, 6
	lbu r0, r0, processs
	sw r22, -48, r0
	jump .LBB35_56
.LBB35_35:
	lw r0, r22, -28
	jneq r0, 6, .LBB35_37
	jump .LBB35_36
.LBB35_36:
	lbu r1, r22, -20
	lsl r0, r1, 2
	lsl_add r1, r0, r1, 4
	move r0, jobs
	add r0, r0, r1
	lbu r0, r0, 1
	sw r22, -48, r0
	jump .LBB35_56
.LBB35_37:
	lw r0, r22, -28
	jneq r0, 7, .LBB35_39
	jump .LBB35_38
.LBB35_38:
	lw r0, r22, -44
	call r23, __end_process
	jump .LBB35_39
.LBB35_39:
	lw r0, r22, -28
	jneq r0, 8, .LBB35_41
	jump .LBB35_40
.LBB35_40:
	move r0, beg
	call r23, printk
	lw r0, r22, -44
	call r23, printk
	move r0, end
	call r23, printk
	sw r22, -48, 0
	jump .LBB35_56
.LBB35_41:
	lw r0, r22, -28
	jneq r0, 9, .LBB35_43
	jump .LBB35_42
.LBB35_42:
	move r0, beg
	call r23, printk
	lw r0, r22, -44
	call r23, printk_int
	move r0, end
	call r23, printk
	sw r22, -48, 0
	jump .LBB35_56
.LBB35_43:
	lw r0, r22, -28
	jneq r0, 10, .LBB35_45
	jump .LBB35_44
.LBB35_44:
	lw r0, r22, -44
	call r23, socket_open
	sw r22, -48, r0
	jump .LBB35_56
.LBB35_45:
	lw r0, r22, -28
	jneq r0, 11, .LBB35_47
	jump .LBB35_46
.LBB35_46:
	lw r0, r22, -44
	lw r1, r22, -40
	lw r2, r22, -36
	call r23, socket_read
	sw r22, -48, r0
	jump .LBB35_56
.LBB35_47:
	lw r0, r22, -28
	jneq r0, 12, .LBB35_49
	jump .LBB35_48
.LBB35_48:
	lw r0, r22, -44
	lw r1, r22, -40
	lw r2, r22, -36
	call r23, socket_write
	sw r22, -48, r0
	jump .LBB35_56
.LBB35_49:
	lw r0, r22, -28
	jneq r0, 13, .LBB35_51
	jump .LBB35_50
.LBB35_50:
	lw r0, r22, -44
	call r23, socket_close
	sw r22, -48, r0
	jump .LBB35_56
.LBB35_51:
	lw r0, r22, -28
	jneq r0, 20, .LBB35_53
	jump .LBB35_52
.LBB35_52:
	lw r0, r22, -44
	call r23, create_job
	sw r22, -48, r0
	jump .LBB35_56
.LBB35_53:
	lw r0, r22, -28
	jneq r0, 21, .LBB35_55
	jump .LBB35_54
.LBB35_54:
	call r23, join_job
	sw r22, -48, r0
	jump .LBB35_56
.LBB35_55:
	sw r22, -48, -1
	jump .LBB35_56
.LBB35_56:
	lw r0, r22, -48
	ld d22, r22, -8
	jump r23
.Lfunc_end35:
	.size	syscall, .Lfunc_end35-syscall
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin35
	.byte	48
	.text
                                        // -- End function
	.globl	__end_process                   // -- Begin function __end_process
	.type	__end_process,@function
__end_process:                          // @__end_process
.Lfunc_begin36:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, r0
	lw r0, zero, mutex_jobs
	call r23, mutex_lock
	lw r1, zero, cur_process_index
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r1, r0, r1
	sw r1, 8, 4
	lw r1, r22, -16
	lw r3, zero, cur_process_index
	lsl r2, r3, 4
	lsl_add r2, r2, r3, 6
	add r0, r0, r2
	sw r0, 12, r1
	move r0, 2
	call r23, set_flag
	sw r22, -12, 0
	jump .LBB36_1
.LBB36_1:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -12
	lw r2, zero, cur_process_index
	lsl r1, r2, 4
	lsl_add r2, r1, r2, 6
	move r1, processs
	add r1, r1, r2
	lbu r1, r1, 2
	jges r0, r1, .LBB36_4
	jump .LBB36_2
.LBB36_2:                               //   in Loop: Header=BB36_1 Depth=1
	lw r1, r22, -12
	lsl r0, r1, 2
	lsl_add r0, r0, r1, 4
	move r1, 4
	sb r0, jobs, r1
	jump .LBB36_3
.LBB36_3:                               //   in Loop: Header=BB36_1 Depth=1
	lw r0, r22, -12
	add r0, r0, 1
	sw r22, -12, r0
	jump .LBB36_1
.LBB36_4:
	lw r0, zero, mutex_jobs
	call r23, mutex_unlock
	call r23, me
	lsl r0, r0, 2
	lw r1, r0, fc_scheduler_job
	move r0, jobs
	add r0, r0, 16
	call r23, swap_context
	call r23, halt
.Lfunc_end36:
	.size	__end_process, .Lfunc_end36-__end_process
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin36
	.byte	16
	.text
                                        // -- End function
	.globl	printk                          // -- Begin function printk
	.type	printk,@function
printk:                                 // @printk
.Lfunc_begin37:
// %bb.0:
	sd r22, 24, d22
	add r22, r22, 32
	sw r22, -32, r0
	sw r22, -28, 0
	lw r0, r22, -32
	sw r22, -24, r0
	jump .LBB37_1
.LBB37_1:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -24
	lbs r0, r0, 0
	jeq r0, 0, .LBB37_3
	jump .LBB37_2
.LBB37_2:                               //   in Loop: Header=BB37_1 Depth=1
	lw r0, r22, -24
	add r0, r0, 1
	sw r22, -24, r0
	lw r0, r22, -28
	add r0, r0, 1
	sw r22, -28, r0
	jump .LBB37_1
.LBB37_3:
	lw r0, zero, log_w
	lw r1, r22, -28
	add r0, r0, r1
	move r1, 65537
	jltu r0, r1, .LBB37_5
	jump .LBB37_4
.LBB37_4:
	jump .LBB37_15
.LBB37_5:
	sb r22, -20, 0
	lw r0, zero, mutex_printk
	call r23, mutex_lock
	sw r22, -16, 0
	jump .LBB37_6
.LBB37_6:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -16
	lw r1, r22, -28
	jges r0, r1, .LBB37_11
	jump .LBB37_7
.LBB37_7:                               //   in Loop: Header=BB37_6 Depth=1
	lw r0, r22, -32
	lw r1, r22, -16
	add r0, r0, r1
	lbs r1, r0, 0
	lbu r0, r22, -20
	sb r0, buf_aligned, r1
	lbs r0, r22, -20
	add r0, r0, 1
	sb r22, -20, r0
	lbu r0, r22, -20
	jneq r0, 128, .LBB37_9
	jump .LBB37_8
.LBB37_8:                               //   in Loop: Header=BB37_6 Depth=1
	lw r3, zero, log_w
	move r1, buf_aligned
	move r2, 128
	move r4, 1
	move r0, r4
	call r23, inode_operation
	lw r0, zero, log_w
	add r0, r0, 128
	sw zero, log_w, r0
	sb r22, -20, 0
	jump .LBB37_9
.LBB37_9:                               //   in Loop: Header=BB37_6 Depth=1
	jump .LBB37_10
.LBB37_10:                              //   in Loop: Header=BB37_6 Depth=1
	lw r0, r22, -16
	add r0, r0, 1
	sw r22, -16, r0
	jump .LBB37_6
.LBB37_11:
	jump .LBB37_12
.LBB37_12:                              // =>This Inner Loop Header: Depth=1
	lbu r0, r22, -20
	and r0, r0, 7
	jeq r0, 0, .LBB37_14
	jump .LBB37_13
.LBB37_13:                              //   in Loop: Header=BB37_12 Depth=1
	lbu r0, r22, -20
	move r1, 0
	sb r0, buf_aligned, r1
	lbs r0, r22, -20
	add r0, r0, 1
	sb r22, -20, r0
	jump .LBB37_12
.LBB37_14:
	lbu r2, r22, -20
	lw r3, zero, log_w
	move r1, buf_aligned
	move r4, 1
	move r0, r4
	call r23, inode_operation
	lbu r1, r22, -20
	lw r0, zero, log_w
	add r0, r0, r1
	sw zero, log_w, r0
	move r0, 64
	call r23, set_flag
	lw r0, zero, mutex_printk
	call r23, mutex_unlock
	jump .LBB37_15
.LBB37_15:
	ld d22, r22, -8
	jump r23
.Lfunc_end37:
	.size	printk, .Lfunc_end37-printk
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin37
	.byte	32
	.text
                                        // -- End function
	.globl	read_flags                      // -- Begin function read_flags
	.type	read_flags,@function
read_flags:                             // @read_flags
.Lfunc_begin38:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	lw r0, zero, mutex_flag
	call r23, mutex_lock
	move r0, 651264
	add r1, r22, -24
	move r2, 16
	call r23, mram_read
	lw r0, zero, mutex_flag
	call r23, mutex_unlock
	lw r0, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end38:
	.size	read_flags, .Lfunc_end38-read_flags
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin38
	.byte	24
	.text
                                        // -- End function
	.globl	write_flags                     // -- Begin function write_flags
	.type	write_flags,@function
write_flags:                            // @write_flags
.Lfunc_begin39:
// %bb.0:
	sd r22, 24, d22
	add r22, r22, 32
	sw r22, -32, r0
	lw r0, zero, mutex_flag
	call r23, mutex_lock
	lw r0, r22, -32
	sw r22, -16, r0
	add r0, r22, -24
	move r1, 651264
	move r2, 16
	call r23, mram_write
	lw r0, zero, mutex_flag
	call r23, mutex_unlock
	ld d22, r22, -8
	jump r23
.Lfunc_end39:
	.size	write_flags, .Lfunc_end39-write_flags
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin39
	.byte	32
	.text
                                        // -- End function
	.globl	load_prg_memory                 // -- Begin function load_prg_memory
	.type	load_prg_memory,@function
load_prg_memory:                        // @load_prg_memory
.Lfunc_begin40:
// %bb.0:
	sd r22, 24, d22
	add r22, r22, 32
	sw r22, -32, r0
	lw r1, r22, -32
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	add r0, r0, 28
	sw r22, -28, r0
	lw r1, r22, -28
	lw r2, r1, 0
	move r0, 651264
	lsl_add r0, r0, r2, 16
	lw r2, r1, 4
	move r1, 512
	call r23, load_big_blocks
	lw r0, r22, -28
	lw r0, r0, 12
	sw r22, -24, r0
	sw r22, -20, 16
	jump .LBB40_1
.LBB40_1:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -24
	lsr r0, r0, 11
	jeq r0, 0, .LBB40_3
	jump .LBB40_2
.LBB40_2:                               //   in Loop: Header=BB40_1 Depth=1
	lw r0, r22, -24
	add r0, r0, -2048
	sw r22, -24, r0
	lw r0, r22, -20
	or r0, r0, -16777216
	sw r22, -16, r0
	lw r0, r22, -16
	lw r1, r22, -28
	lw r2, r1, 8
	lw r1, r22, -20
	lsl_add r1, r1, r2, 16
	// inline asm
	ldmai r0, r1, 0

	// inline asm
	lw r0, r22, -20
	add r0, r0, 2048
	sw r22, -20, r0
	jump .LBB40_1
.LBB40_3:
	lw r0, r22, -20
	lw r1, r22, -24
	lsl r1, r1, 21
	and r1, r1, -16777216
	or r0, r0, r1
	sw r22, -12, r0
	lw r0, r22, -12
	lw r1, r22, -28
	lw r2, r1, 8
	lw r1, r22, -20
	lsl_add r1, r1, r2, 16
	// inline asm
	ldmai r0, r1, 0

	// inline asm
	ld d22, r22, -8
	jump r23
.Lfunc_end40:
	.size	load_prg_memory, .Lfunc_end40-load_prg_memory
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin40
	.byte	32
	.text
                                        // -- End function
	.globl	save_wram_process               // -- Begin function save_wram_process
	.type	save_wram_process,@function
save_wram_process:                      // @save_wram_process
.Lfunc_begin41:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, r0
	lw r1, r22, -16
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	add r0, r0, 28
	sw r22, -12, r0
	lw r0, r22, -12
	lw r2, r0, 0
	move r1, 651264
	lsl_add r1, r1, r2, 16
	lw r2, r0, 4
	move r0, 512
	call r23, store_big_blocks
	ld d22, r22, -8
	jump r23
.Lfunc_end41:
	.size	save_wram_process, .Lfunc_end41-save_wram_process
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin41
	.byte	16
	.text
                                        // -- End function
	.globl	launch_proc                     // -- Begin function launch_proc
	.type	launch_proc,@function
launch_proc:                            // @launch_proc
.Lfunc_begin42:
// %bb.0:
	sd r22, 24, d22
	add r22, r22, 32
                                        // kill: def $r2 killed $r1
	sw r22, -32, r0
	sb r22, -28, r1
	lw r1, r22, -32
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	sw r0, 8, 2
	lw r0, r22, -32
	sw zero, cur_process_index, r0
	lbu r0, r22, -28
	jeq r0, 0, .LBB42_6
	jump .LBB42_1
.LBB42_1:
	sw r22, -24, 0
	jump .LBB42_2
.LBB42_2:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -24
	jgts r0, 99, .LBB42_5
	jump .LBB42_3
.LBB42_3:                               //   in Loop: Header=BB42_2 Depth=1
	lw r1, r22, -24
	lsl r0, r1, 2
	lsl_add r0, r0, r1, 4
	move r1, 0
	sb r0, jobs, r1
	jump .LBB42_4
.LBB42_4:                               //   in Loop: Header=BB42_2 Depth=1
	lw r0, r22, -24
	add r0, r0, 1
	sw r22, -24, r0
	jump .LBB42_2
.LBB42_5:
	lw r1, r22, -32
	lsl r0, r1, 4
	lsl_add r0, r0, r1, 6
	move r1, processs
	add r0, r1, r0
	sb r0, 2, 1
	lw r2, r22, -32
	lsl r0, r2, 4
	lsl_add r0, r0, r2, 6
	add r0, r1, r0
	lw r2, r0, 24
	move r0, jobs
	sw r0, 16, r2
	lw r2, r0, 16
	sw r2, 36, r2
	lw r2, r0, 16
	move r3, __end_process
	sw r2, 32, r3
	lw r3, r22, -32
	lsl r2, r3, 4
	lsl_add r2, r2, r3, 6
	add r1, r1, r2
	lw r2, r1, 12
	lw r1, r0, 16
	sw r1, 24, r2
	sb r0, 0, 1
	sb r0, 1, 0
	jump .LBB42_6
.LBB42_6:
	sw r22, -20, 0
	// inline asm
	time r0
	// inline asm
	sw r22, -20, r0
	lw r1, r22, -20
	lw r2, r22, -32
	lsl r0, r2, 4
	lsl_add r2, r0, r2, 6
	move r0, processs
	add r0, r0, r2
	sw r0, 20, r1
	call r23, scheduler_jobs
	sw r22, -16, r0
	lw r0, r22, -16
	jeq r0, 0, .LBB42_9
	jump .LBB42_7
.LBB42_7:
	lw r1, r22, -32
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lw r0, r0, 8
	jeq r0, 4, .LBB42_9
	jump .LBB42_8
.LBB42_8:
	lw r1, r22, -32
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	sw r0, 8, 5
	jump .LBB42_9
.LBB42_9:
	lw r1, r22, -32
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lw r0, r0, 8
	jneq r0, 2, .LBB42_11
	jump .LBB42_10
.LBB42_10:
	lw r1, r22, -32
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	sw r0, 8, 3
	jump .LBB42_11
.LBB42_11:
	ld d22, r22, -8
	jump r23
.Lfunc_end42:
	.size	launch_proc, .Lfunc_end42-launch_proc
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin42
	.byte	32
	.text
                                        // -- End function
	.globl	stop_dpu                        // -- Begin function stop_dpu
	.type	stop_dpu,@function
stop_dpu:                               // @stop_dpu
.Lfunc_begin43:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	move r0, saved_fc_stop
	call r23, stop_me
	sw r22, -16, 15
	move r0, 3
	// inline asm
	time_cfg r0, r0
	// inline asm
	sw r22, -16, r0
	call r23, read_flags
	sw r22, -12, r0
	move r0, 0
	call r23, write_flags
	lbu r0, r22, -12
	and r0, r0, 32
	jeq r0, 0, .LBB43_2
	jump .LBB43_1
.LBB43_1:
	call r23, wakeup_sleepy_socket
	jump .LBB43_2
.LBB43_2:
	ld d22, r22, -8
	jump r23
.Lfunc_end43:
	.size	stop_dpu, .Lfunc_end43-stop_dpu
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin43
	.byte	16
	.text
                                        // -- End function
	.globl	check_timer_stop                // -- Begin function check_timer_stop
	.type	check_timer_stop,@function
check_timer_stop:                       // @check_timer_stop
.Lfunc_begin44:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, 0
	// inline asm
	time r0
	// inline asm
	sw r22, -16, r0
	lw r0, r22, -16
	move r1, 5000001
	jltu r0, r1, .LBB44_2
	jump .LBB44_1
.LBB44_1:
	call r23, stop_dpu
	jump .LBB44_2
.LBB44_2:
	ld d22, r22, -8
	jump r23
.Lfunc_end44:
	.size	check_timer_stop, .Lfunc_end44-check_timer_stop
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin44
	.byte	16
	.text
                                        // -- End function
	.globl	scheduler                       // -- Begin function scheduler
	.type	scheduler,@function
scheduler:                              // @scheduler
.Lfunc_begin45:
// %bb.0:
	sd r22, 32, d22
	add r22, r22, 40
	sb r22, -40, 0
	sw r22, -36, 0
	sw r22, -32, 0
	sw r22, -28, 0
	jump .LBB45_1
.LBB45_1:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB45_2 Depth 2
	jump .LBB45_2
.LBB45_2:                               //   Parent Loop BB45_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lw r0, r22, -36
	jgtu r0, 9, .LBB45_17
	jump .LBB45_3
.LBB45_3:                               //   in Loop: Header=BB45_2 Depth=2
	call r23, check_timer_stop
	lw r1, r22, -36
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lw r0, r0, 8
	jneq r0, 1, .LBB45_5
	jump .LBB45_4
.LBB45_4:                               //   in Loop: Header=BB45_2 Depth=2
	sb r22, -20, 1
	jump .LBB45_9
.LBB45_5:                               //   in Loop: Header=BB45_2 Depth=2
	lw r1, r22, -36
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lw r0, r0, 8
	jneq r0, 3, .LBB45_7
	jump .LBB45_6
.LBB45_6:                               //   in Loop: Header=BB45_2 Depth=2
	sb r22, -20, 0
	jump .LBB45_8
.LBB45_7:                               //   in Loop: Header=BB45_2 Depth=2
	jump .LBB45_16
.LBB45_8:                               //   in Loop: Header=BB45_2 Depth=2
	jump .LBB45_9
.LBB45_9:                               //   in Loop: Header=BB45_2 Depth=2
	sb r22, -40, 0
	call r23, me
	jeq r0, 0, .LBB45_11
	jump .LBB45_10
.LBB45_10:
	call r23, halt
.LBB45_11:                              //   in Loop: Header=BB45_2 Depth=2
	lw r1, r22, -36
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lw r0, r0, 4
	sw r22, -24, r0
	lw r0, r22, -28
	lw r1, r22, -24
	jeq r0, r1, .LBB45_15
	jump .LBB45_12
.LBB45_12:                              //   in Loop: Header=BB45_2 Depth=2
	lw r1, r22, -32
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lw r0, r0, 4
	lw r1, r22, -28
	jneq r0, r1, .LBB45_14
	jump .LBB45_13
.LBB45_13:                              //   in Loop: Header=BB45_2 Depth=2
	lw r0, r22, -32
	call r23, save_wram_process
	jump .LBB45_14
.LBB45_14:                              //   in Loop: Header=BB45_2 Depth=2
	lw r0, r22, -36
	call r23, load_prg_memory
	lw r0, r22, -36
	sw r22, -32, r0
	lw r0, r22, -24
	sw r22, -28, r0
	jump .LBB45_15
.LBB45_15:                              //   in Loop: Header=BB45_2 Depth=2
	lw r1, r22, -36
	lsl r0, r1, 4
	lsl_add r0, r0, r1, 11
	lsl_sub r0, r0, r1, 6
	add r0, r0, 651280
	move r1, jobs
	sw r22, -12, r1
	move r2, 2000
	sw r22, -16, r2
	call r23, mram_read
	lw r0, r22, -36
	lbu r1, r22, -20
	call r23, launch_proc
	lw r0, r22, -12
	lw r2, r22, -16
	lw r3, r22, -36
	lsl r1, r3, 4
	lsl_add r1, r1, r3, 11
	lsl_sub r1, r1, r3, 6
	add r1, r1, 651280
	call r23, mram_write
	jump .LBB45_16
.LBB45_16:                              //   in Loop: Header=BB45_2 Depth=2
	lw r0, r22, -36
	add r0, r0, 1
	sw r22, -36, r0
	jump .LBB45_2
.LBB45_17:                              //   in Loop: Header=BB45_1 Depth=1
	sw r22, -36, 0
	lbu r0, r22, -40
	jeq r0, 0, .LBB45_19
	jump .LBB45_18
.LBB45_18:                              //   in Loop: Header=BB45_1 Depth=1
	call r23, stop_dpu
	jump .LBB45_19
.LBB45_19:                              //   in Loop: Header=BB45_1 Depth=1
	sb r22, -40, 1
	jump .LBB45_1
.Lfunc_end45:
	.size	scheduler, .Lfunc_end45-scheduler
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin45
	.byte	40
	.text
                                        // -- End function
	.globl	main                            // -- Begin function main
	.type	main,@function
main:                                   // @main
.Lfunc_begin46:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sw r22, -24, 0
	call r23, me
	jneq r0, 0, .LBB46_2
	jump .LBB46_1
.LBB46_1:
	move r1, __atomic_bit_mutex_sp
	move r0, cp
	sw r0, 4, r1
	sb r0, 0, 16
	sb r0, 1, 0
	sb r0, 2, 0
	move r0, __atomic_bit_mutex_mutex_flag
	sw zero, mutex_flag, r0
	move r0, __atomic_bit_mutex_mutex_l
	sw zero, mutex_l, r0
	move r0, __atomic_bit_mutex_mutex_printk
	sw zero, mutex_printk, r0
	move r0, __atomic_bit_mutex_mutex_jobs
	sw zero, mutex_jobs, r0
	move r0, __atomic_bit_mutex_mutex_sockets
	sw zero, mutex_sockets, r0
	move r0, __atomic_bit_mutex_mutex_mram
	sw zero, mutex_mram, r0
	jump .LBB46_6
.LBB46_2:
	jump .LBB46_3
.LBB46_3:                               // =>This Inner Loop Header: Depth=1
	lbu r0, zero, cp
	jneq r0, 0, .LBB46_5
	jump .LBB46_4
.LBB46_4:                               //   in Loop: Header=BB46_3 Depth=1
	jump .LBB46_3
.LBB46_5:
	call r23, scheduler_jobs
	jump .LBB46_6
.LBB46_6:
	call r23, boot_me
	move r0, __user_space_wram
	move r1, 255
	sb r0, 57343, r1
	move r0, 0
	sw r22, -16, r0
	call r23, write_flags
	sw r22, -20, 15
	move r0, 3
	// inline asm
	time_cfg r0, r0
	// inline asm
	sw r22, -20, r0
	call r23, scheduler
                                        // kill: def $r1 killed $r0
	lw r0, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end46:
	.size	main, .Lfunc_end46-main
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin46
	.byte	24
	.text
                                        // -- End function
	.globl	index_from_roleid               // -- Begin function index_from_roleid
	.type	index_from_roleid,@function
index_from_roleid:                      // @index_from_roleid
.Lfunc_begin47:
// %bb.0:
                                        // kill: def $r1 killed $r0
	sb r22, 4, r0
	lw r1, zero, cur_process_index
	lsl r0, r1, 4
	lsl_add r0, r0, r1, 6
	lbs r0, r0, processs
	sb r22, 8, r0
	sw r22, 12, 0
	jump .LBB47_1
.LBB47_1:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, 12
	jgtu r0, 9, .LBB47_8
	jump .LBB47_2
.LBB47_2:                               //   in Loop: Header=BB47_1 Depth=1
	lw r1, r22, 12
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lw r0, r0, 4
	jeq r0, 0, .LBB47_6
	jump .LBB47_3
.LBB47_3:                               //   in Loop: Header=BB47_1 Depth=1
	lw r1, r22, 12
	lsl r0, r1, 4
	lsl_add r0, r0, r1, 6
	lbu r0, r0, processs
	lbu r1, r22, 8
	jneq r0, r1, .LBB47_6
	jump .LBB47_4
.LBB47_4:                               //   in Loop: Header=BB47_1 Depth=1
	lw r1, r22, 12
	lsl r0, r1, 4
	lsl_add r1, r0, r1, 6
	move r0, processs
	add r0, r0, r1
	lbu r0, r0, 1
	lbu r1, r22, 4
	jneq r0, r1, .LBB47_6
	jump .LBB47_5
.LBB47_5:
	lw r0, r22, 12
	sw r22, 0, r0
	jump .LBB47_9
.LBB47_6:                               //   in Loop: Header=BB47_1 Depth=1
	jump .LBB47_7
.LBB47_7:                               //   in Loop: Header=BB47_1 Depth=1
	lw r0, r22, 12
	add r0, r0, 1
	sw r22, 12, r0
	jump .LBB47_1
.LBB47_8:
	sw r22, 0, -1
	jump .LBB47_9
.LBB47_9:
	lw r0, r22, 0
	jump r23
.Lfunc_end47:
	.size	index_from_roleid, .Lfunc_end47-index_from_roleid
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin47
	.byte	16
	.text
                                        // -- End function
	.type	me,@function                    // -- Begin function me
me:                                     // @me
.Lfunc_begin48:
// %bb.0:
	move r0, id
	jump r23
.Lfunc_end48:
	.size	me, .Lfunc_end48-me
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin48
	.byte	0
	.text
                                        // -- End function
	.type	halt,@function                  // -- Begin function halt
halt:                                   // @halt
.Lfunc_begin49:
// %bb.0:
	fault 4
.Lfunc_end49:
	.size	halt, .Lfunc_end49-halt
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin49
	.byte	0
	.text
                                        // -- End function
	.type	fc_scheduler_job,@object        // @fc_scheduler_job
	.section	.data,"aw",@progbits
	.globl	fc_scheduler_job
	.p2align	2
fc_scheduler_job:
	.zero	64
	.size	fc_scheduler_job, 64

	.type	jobs,@object                    // @jobs
	.globl	jobs
	.p2align	3
jobs:
	.zero	2000
	.size	jobs, 2000

	.type	cur_jobs,@object                // @cur_jobs
	.globl	cur_jobs
cur_jobs:
	.zero	16
	.size	cur_jobs, 16

	.type	mutex_jobs,@object              // @mutex_jobs
	.globl	mutex_jobs
	.p2align	2
mutex_jobs:
	.long	0
	.size	mutex_jobs, 4

	.type	processs,@object                // @processs
	.section	.dpu_host,"aw",@progbits
	.globl	processs
	.p2align	3
processs:
	.zero	800
	.size	processs, 800

	.type	cur_process_index,@object       // @cur_process_index
	.section	.data,"aw",@progbits
	.globl	cur_process_index
	.p2align	2
cur_process_index:
	.long	0                               // 0x0
	.size	cur_process_index, 4

	.type	cp,@object                      // @cp
	.globl	cp
	.p2align	2
cp:
	.zero	8
	.size	cp, 8

	.type	all_end_or_waiting,@object      // @all_end_or_waiting
	.globl	all_end_or_waiting
all_end_or_waiting:
	.byte	0                               // 0x0
	.size	all_end_or_waiting, 1

	.type	mutex_l,@object                 // @mutex_l
	.globl	mutex_l
	.p2align	2
mutex_l:
	.long	0
	.size	mutex_l, 4

	.type	newline2,@object                // @newline2
	.globl	newline2
	.p2align	3
newline2:
	.asciz	"      \n"
	.size	newline2, 8

	.type	inode_table,@object             // @inode_table
	.section	.dpu_host,"aw",@progbits
	.globl	inode_table
	.p2align	3
inode_table:
	.zero	160
	.size	inode_table, 160

	.type	mutex_mram,@object              // @mutex_mram
	.section	.data,"aw",@progbits
	.globl	mutex_mram
	.p2align	2
mutex_mram:
	.long	0
	.size	mutex_mram, 4

	.type	alloc_inode.bit_map,@object     // @alloc_inode.bit_map
	.p2align	3
alloc_inode.bit_map:
	.zero	400
	.size	alloc_inode.bit_map, 400

	.type	mutex_inode,@object             // @mutex_inode
	.globl	mutex_inode
	.p2align	2
mutex_inode:
	.long	0
	.size	mutex_inode, 4

	.type	sync_extern_socket,@object      // @sync_extern_socket
	.globl	sync_extern_socket
sync_extern_socket:
	.byte	0                               // 0x0
	.size	sync_extern_socket, 1

	.type	buf_socket,@object              // @buf_socket
	.globl	buf_socket
	.p2align	3
buf_socket:
	.zero	264
	.size	buf_socket, 264

	.type	mutex_sockets,@object           // @mutex_sockets
	.globl	mutex_sockets
	.p2align	2
mutex_sockets:
	.long	0
	.size	mutex_sockets, 4

	.type	beg,@object                     // @beg
	.globl	beg
beg:
	.asciz	"{{{"
	.size	beg, 4

	.type	end,@object                     // @end
	.globl	end
end:
	.asciz	"}}}"
	.size	end, 4

	.type	global,@object                  // @global
	.globl	global
	.p2align	2
global:
	.long	0                               // 0x0
	.size	global, 4

	.type	__user_space_wram,@object       // @__user_space_wram
	.globl	__user_space_wram
__user_space_wram:
	.zero	57344
	.size	__user_space_wram, 57344

	.type	mutex_printk,@object            // @mutex_printk
	.globl	mutex_printk
	.p2align	2
mutex_printk:
	.long	0
	.size	mutex_printk, 4

	.type	mutex_flag,@object              // @mutex_flag
	.globl	mutex_flag
	.p2align	2
mutex_flag:
	.long	0
	.size	mutex_flag, 4

	.type	mutex_sbrk,@object              // @mutex_sbrk
	.globl	mutex_sbrk
	.p2align	2
mutex_sbrk:
	.long	0
	.size	mutex_sbrk, 4

	.type	saved_fc_stop,@object           // @saved_fc_stop
	.globl	saved_fc_stop
	.p2align	2
saved_fc_stop:
	.long	0
	.size	saved_fc_stop, 4

	.type	dpu_id,@object                  // @dpu_id
	.section	.dpu_host,"aw",@progbits
	.globl	dpu_id
	.p2align	3
dpu_id:
	.long	0                               // 0x0
	.size	dpu_id, 4

	.type	log_w,@object                   // @log_w
	.globl	log_w
	.p2align	3
log_w:
	.long	0                               // 0x0
	.size	log_w, 4

	.type	buf_aligned,@object             // @buf_aligned
	.section	.data,"aw",@progbits
	.globl	buf_aligned
	.p2align	3
buf_aligned:
	.zero	128
	.size	buf_aligned, 128

	.type	__atomic_bit_mutex_sp,@object   // @__atomic_bit_mutex_sp
	.section	.atomic,"aw",@progbits
	.globl	__atomic_bit_mutex_sp
__atomic_bit_mutex_sp:
	.byte	0                               // 0x0
	.size	__atomic_bit_mutex_sp, 1

	.type	__atomic_bit_mutex_mutex_flag,@object // @__atomic_bit_mutex_mutex_flag
	.globl	__atomic_bit_mutex_mutex_flag
__atomic_bit_mutex_mutex_flag:
	.byte	0                               // 0x0
	.size	__atomic_bit_mutex_mutex_flag, 1

	.type	__atomic_bit_mutex_mutex_l,@object // @__atomic_bit_mutex_mutex_l
	.globl	__atomic_bit_mutex_mutex_l
__atomic_bit_mutex_mutex_l:
	.byte	0                               // 0x0
	.size	__atomic_bit_mutex_mutex_l, 1

	.type	__atomic_bit_mutex_mutex_printk,@object // @__atomic_bit_mutex_mutex_printk
	.globl	__atomic_bit_mutex_mutex_printk
__atomic_bit_mutex_mutex_printk:
	.byte	0                               // 0x0
	.size	__atomic_bit_mutex_mutex_printk, 1

	.type	__atomic_bit_mutex_mutex_jobs,@object // @__atomic_bit_mutex_mutex_jobs
	.globl	__atomic_bit_mutex_mutex_jobs
__atomic_bit_mutex_mutex_jobs:
	.byte	0                               // 0x0
	.size	__atomic_bit_mutex_mutex_jobs, 1

	.type	__atomic_bit_mutex_mutex_sockets,@object // @__atomic_bit_mutex_mutex_sockets
	.globl	__atomic_bit_mutex_mutex_sockets
__atomic_bit_mutex_mutex_sockets:
	.byte	0                               // 0x0
	.size	__atomic_bit_mutex_mutex_sockets, 1

	.type	__atomic_bit_mutex_mutex_mram,@object // @__atomic_bit_mutex_mutex_mram
	.globl	__atomic_bit_mutex_mutex_mram
__atomic_bit_mutex_mutex_mram:
	.byte	0                               // 0x0
	.size	__atomic_bit_mutex_mutex_mram, 1

	.type	begin_mram,@object              // @begin_mram
	.section	.bss.begin_mram,"aw",@nobits
	.globl	begin_mram
	.p2align	2
begin_mram:
	.zero	16
	.size	begin_mram, 16

	.type	__atomic_bit_mutex_mutex_sbrk,@object // @__atomic_bit_mutex_mutex_sbrk
	.section	.atomic,"aw",@progbits
	.globl	__atomic_bit_mutex_mutex_sbrk
__atomic_bit_mutex_mutex_sbrk:
	.byte	0                               // 0x0
	.size	__atomic_bit_mutex_mutex_sbrk, 1

	.type	__atomic_bit_mutex_mutex_inode,@object // @__atomic_bit_mutex_mutex_inode
	.globl	__atomic_bit_mutex_mutex_inode
__atomic_bit_mutex_mutex_inode:
	.byte	0                               // 0x0
	.size	__atomic_bit_mutex_mutex_inode, 1

	.addrsig
	.addrsig_sym sp_wait
	.addrsig_sym mutex_lock
	.addrsig_sym mutex_unlock
	.addrsig_sym abnormal_wakeup
	.addrsig_sym abnormal_wakeup_one
	.addrsig_sym swap_scheduler
	.addrsig_sym swap_context
	.addrsig_sym __end_child_jobs
	.addrsig_sym wakeup
	.addrsig_sym create_job
	.addrsig_sym sbrk
	.addrsig_sym join_job
	.addrsig_sym sleep
	.addrsig_sym swap
	.addrsig_sym first_swap_context
	.addrsig_sym check_time_process
	.addrsig_sym scheduler_jobs
	.addrsig_sym try_lock
	.addrsig_sym lock
	.addrsig_sym unlock
	.addrsig_sym mram_read
	.addrsig_sym mram_write
	.addrsig_sym inode_operation
	.addrsig_sym load_big_blocks
	.addrsig_sym store_big_blocks
	.addrsig_sym alloc_inode
	.addrsig_sym find_inode
	.addrsig_sym printk_int
	.addrsig_sym chained_inode_operation
	.addrsig_sym free_inode
	.addrsig_sym wakeup_sleepy_socket
	.addrsig_sym socket_open
	.addrsig_sym set_flag
	.addrsig_sym check_sd
	.addrsig_sym socket_close
	.addrsig_sym socket_read
	.addrsig_sym socket_write
	.addrsig_sym __end_process
	.addrsig_sym printk
	.addrsig_sym read_flags
	.addrsig_sym write_flags
	.addrsig_sym load_prg_memory
	.addrsig_sym save_wram_process
	.addrsig_sym launch_proc
	.addrsig_sym stop_dpu
	.addrsig_sym stop_me
	.addrsig_sym check_timer_stop
	.addrsig_sym scheduler
	.addrsig_sym boot_me
	.addrsig_sym me
	.addrsig_sym halt
	.addrsig_sym fc_scheduler_job
	.addrsig_sym jobs
	.addrsig_sym cur_jobs
	.addrsig_sym mutex_jobs
	.addrsig_sym processs
	.addrsig_sym cur_process_index
	.addrsig_sym cp
	.addrsig_sym all_end_or_waiting
	.addrsig_sym mutex_l
	.addrsig_sym inode_table
	.addrsig_sym mutex_mram
	.addrsig_sym alloc_inode.bit_map
	.addrsig_sym mutex_inode
	.addrsig_sym buf_socket
	.addrsig_sym mutex_sockets
	.addrsig_sym beg
	.addrsig_sym end
	.addrsig_sym __user_space_wram
	.addrsig_sym mutex_printk
	.addrsig_sym mutex_flag
	.addrsig_sym mutex_sbrk
	.addrsig_sym saved_fc_stop
	.addrsig_sym dpu_id
	.addrsig_sym log_w
	.addrsig_sym buf_aligned
	.addrsig_sym __atomic_bit_mutex_sp
	.addrsig_sym __atomic_bit_mutex_mutex_flag
	.addrsig_sym __atomic_bit_mutex_mutex_l
	.addrsig_sym __atomic_bit_mutex_mutex_printk
	.addrsig_sym __atomic_bit_mutex_mutex_jobs
	.addrsig_sym __atomic_bit_mutex_mutex_sockets
	.addrsig_sym __atomic_bit_mutex_mutex_mram
