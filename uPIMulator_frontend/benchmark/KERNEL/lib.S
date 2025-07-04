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
	ld d22, r22, 32 //恢复到之前的位置
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
	ld d22, r22, 32
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
.section	.text.alloc_mram,"ax",@progbits
	.globl alloc_mram
	.type	alloc_mram,@function
alloc_mram:   //restore the flow context store in r1 and continue the execution after the stop. This function will never returns
	alloc r0
	jump r23
