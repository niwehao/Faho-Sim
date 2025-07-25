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
	sd r22, 32, d24
	sd r22, 40, d22
	sw r0, 0, r22   //save the stack inside r0
	//------------------------
	move r22, r1 //saveback the stack save in r1
	ld d14, r22, 0
	ld d16, r22, 8
	ld d18, r22, 16
	ld d20, r22, 24
	ld d24, r22, 32 //恢复之前的标记值
	ld d22, r22, 40
	jump r23
.section	.text.first_swap_context,"ax",@progbits
	.globl	first_swap_context               // -- Begin function 	.globl	first_swap_context           
	.type	first_swap_context,@function
first_swap_context: //Same that swap_context but there are 3 parameters the last one if the place to jump
	sd r22, 0, d14
	sd r22, 8, d16
	sd r22, 16, d18
	sd r22, 24, d20
	sd r22, 32, d24
	sd r22, 40, d22
	sw r0, 0, r22   //save the stack inside r0
	//------------------------
	move r22, r1 //saveback the stack save in r1
	ld d14, r22, 0
	ld d16, r22, 8
	ld d18, r22, 16
	ld d20, r22, 24
	ld d24, r22, 32 //恢复之前的标记值
	ld d22, r22, 40
	jump r2
.section	.text.jmp_mram,"ax",@progbits
	.globl	jmp_mram             // -- Begin function 	.globl	jmp_mram         
	.type	jmp_mram,@function
jmp_mram: 
	jump syscall
.section	.text.resume_me,"ax",@progbits
	.globl resume_me
	.type	resume_me,@function
resume_me:   //restore the flow context store in r1 and continue the execution after the stop. This function will never returns
	move r22, r0 
	move r0, r23
	ld d14, r22, 0
	ld d16, r22, 8
	ld d18, r22, 16
	ld d20, r22, 24
	ld d24, r22, 32
	ld d22, r22, 40
	jump r0
.section	.text.me_new,"ax",@progbits
	.globl me_new
	.type	me_new,@function
me_new:                                 // @me_new
// %bb.0:
	move r0, 0
	// inline asm
	move r0, id
	// inline asm
	jump r23
.section	.text.wake_up_one,"ax",@progbits
	.globl wake_up_one
	.type	wake_up_one,@function
wake_up_one:
	move r1, 0
wake_up_one_start:
	jeq r0, r1, wake_up_one_end
	resume r1, 0, nz, wake_up_one_start+3 
	jump wake_up_one_end
	add r1, r1, 1
	jump wake_up_one_start
wake_up_one_end:
	jump r23
	.section	.text.print_debug,"ax",@progbits
.section	.text.fault_notif,"ax",@progbits
	.globl	fault_notif                         // -- Begin function syscall
	.type	fault_notif,@function
fault_notif:                                // @syscall
// %bb.0:
	fault 1
.section	.text.print_debug,"ax",@progbits
	.globl	print_debug                         // -- Begin function syscall
	.type	print_debug,@function
print_debug:                                // @syscall
// %bb.0:
	add r1, r1, 8
	time_cfg r0,r1
	jump r23
.section	.text.preemption,"ax",@progbits
	.globl preemption
	.type	preemption,@function
preemption:
	add r22, r22, 80    //we assume that the user do not have more than 0x50 bytes of local stack
	sd r22, 0, d0
	sd r22, 8, d2
	sd r22, 16, d4
	sd r22, 24, d6
	sd r22, 32, d8
	sd r22, 40, d10
	sd r22, 48, d12
	sd r22, 56, d22
	add r22, r22, 64      //store the previous r23 and r22
	lbu r0, id, cur_jobs
	lsl r1, r0, 0x2
	lsl_add r0, r1, r0, 0x4
	lw r1, id4, fc_scheduler_job
	move r2, jobs
	add r0, r2, r0
	add r0, r0, 0x10
	call r23, swap_context
	ld d22, r22, -8       //restore the r23 and r22
	ld d0, r22, 0
	ld d2, r22, 8
	ld d4, r22, 16
	ld d6, r22, 24
	ld d8, r22, 32
	ld d10, r22, 40
	ld d12, r22, 48
	add r22, r22, -80
	jump r25            //where the value
.section	.text.r26_cfg,"ax",@progbits
	.globl r26_cfg
	.type	r26_cfg,@function
r26_cfg:
	time r2
	add r1, r1, r2
	lsr r1, r1, 3
	lsl r1, r1, 3
	add r26, r1, r0
	jump r23
	.section	.text.r26_read,"ax",@progbits
	.globl r26_read
	.type	r26_read,@function
r26_read:
	move r0, r26
	jump r23
	.section	.text.read_preemption,"ax",@progbits
	.globl read_preemption
	.type	read_preemption,@function
read_preemption:
	move r24, preemption
	jump r23
