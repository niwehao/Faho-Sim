	.text
	.file	"atomics.c"
	.section	.text.__dpu_sync_val_compare_and_swap_1,"ax",@progbits
	.globl	__dpu_sync_val_compare_and_swap_1 // -- Begin function __dpu_sync_val_compare_and_swap_1
	.type	__dpu_sync_val_compare_and_swap_1,@function
__dpu_sync_val_compare_and_swap_1:      // @__dpu_sync_val_compare_and_swap_1
.Lfunc_begin0:
// %bb.0:
	// inline asm
.Ltmp0:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp0
	// inline asm
	lbu r3, r0, 0
	and r1, r1, 255
	jneq r3, r1, .LBB0_2
// %bb.1:
	sb r0, 0, r2
.LBB0_2:
	// inline asm
.Ltmp1:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp1+1
	// inline asm
	extsb r0, r3
	jump r23
.Lfunc_end0:
	.size	__dpu_sync_val_compare_and_swap_1, .Lfunc_end0-__dpu_sync_val_compare_and_swap_1
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_val_compare_and_swap_1
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__dpu_sync_val_compare_and_swap_1,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_val_compare_and_swap_2,"ax",@progbits
	.globl	__dpu_sync_val_compare_and_swap_2 // -- Begin function __dpu_sync_val_compare_and_swap_2
	.type	__dpu_sync_val_compare_and_swap_2,@function
__dpu_sync_val_compare_and_swap_2:      // @__dpu_sync_val_compare_and_swap_2
.Lfunc_begin1:
// %bb.0:
	// inline asm
.Ltmp2:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp2
	// inline asm
	lhu r3, r0, 0
	and r1, r1, 65535
	jneq r3, r1, .LBB1_2
// %bb.1:
	sh r0, 0, r2
.LBB1_2:
	// inline asm
.Ltmp3:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp3+1
	// inline asm
	extsh r0, r3
	jump r23
.Lfunc_end1:
	.size	__dpu_sync_val_compare_and_swap_2, .Lfunc_end1-__dpu_sync_val_compare_and_swap_2
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_val_compare_and_swap_2
	.long	.Lfunc_begin1
	.byte	0
	.section	.text.__dpu_sync_val_compare_and_swap_2,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_val_compare_and_swap_4,"ax",@progbits
	.globl	__dpu_sync_val_compare_and_swap_4 // -- Begin function __dpu_sync_val_compare_and_swap_4
	.type	__dpu_sync_val_compare_and_swap_4,@function
__dpu_sync_val_compare_and_swap_4:      // @__dpu_sync_val_compare_and_swap_4
.Lfunc_begin2:
// %bb.0:
	move r3, r0
	// inline asm
.Ltmp4:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp4
	// inline asm
	lw r0, r3, 0
	jneq r0, r1, .LBB2_2
// %bb.1:
	sw r3, 0, r2
.LBB2_2:
	// inline asm
.Ltmp5:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp5+1
	// inline asm
	jump r23
.Lfunc_end2:
	.size	__dpu_sync_val_compare_and_swap_4, .Lfunc_end2-__dpu_sync_val_compare_and_swap_4
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_val_compare_and_swap_4
	.long	.Lfunc_begin2
	.byte	0
	.section	.text.__dpu_sync_val_compare_and_swap_4,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_val_compare_and_swap_8,"ax",@progbits
	.globl	__dpu_sync_val_compare_and_swap_8 // -- Begin function __dpu_sync_val_compare_and_swap_8
	.type	__dpu_sync_val_compare_and_swap_8,@function
__dpu_sync_val_compare_and_swap_8:      // @__dpu_sync_val_compare_and_swap_8
.Lfunc_begin3:
// %bb.0:
	move r6, r0
	// inline asm
.Ltmp6:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp6
	// inline asm
	ld d0, r6, 0
	jneq r1, r3, .LBB3_2
// %bb.3:
	jneq r0, r2, .LBB3_2
// %bb.4:
// %bb.1:
	sd r6, 0, d4
.LBB3_2:
	// inline asm
.Ltmp7:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp7+1
	// inline asm
	jump r23
.Lfunc_end3:
	.size	__dpu_sync_val_compare_and_swap_8, .Lfunc_end3-__dpu_sync_val_compare_and_swap_8
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_val_compare_and_swap_8
	.long	.Lfunc_begin3
	.byte	0
	.section	.text.__dpu_sync_val_compare_and_swap_8,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_lock_test_and_set_1,"ax",@progbits
	.globl	__dpu_sync_lock_test_and_set_1  // -- Begin function __dpu_sync_lock_test_and_set_1
	.type	__dpu_sync_lock_test_and_set_1,@function
__dpu_sync_lock_test_and_set_1:         // @__dpu_sync_lock_test_and_set_1
.Lfunc_begin4:
// %bb.0:
	// inline asm
.Ltmp8:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp8
	// inline asm
	lbs r2, r0, 0
	sb r0, 0, r1
	// inline asm
.Ltmp9:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp9+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end4:
	.size	__dpu_sync_lock_test_and_set_1, .Lfunc_end4-__dpu_sync_lock_test_and_set_1
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_lock_test_and_set_1
	.long	.Lfunc_begin4
	.byte	0
	.section	.text.__dpu_sync_lock_test_and_set_1,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_lock_test_and_set_2,"ax",@progbits
	.globl	__dpu_sync_lock_test_and_set_2  // -- Begin function __dpu_sync_lock_test_and_set_2
	.type	__dpu_sync_lock_test_and_set_2,@function
__dpu_sync_lock_test_and_set_2:         // @__dpu_sync_lock_test_and_set_2
.Lfunc_begin5:
// %bb.0:
	// inline asm
.Ltmp10:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp10
	// inline asm
	lhs r2, r0, 0
	sh r0, 0, r1
	// inline asm
.Ltmp11:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp11+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end5:
	.size	__dpu_sync_lock_test_and_set_2, .Lfunc_end5-__dpu_sync_lock_test_and_set_2
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_lock_test_and_set_2
	.long	.Lfunc_begin5
	.byte	0
	.section	.text.__dpu_sync_lock_test_and_set_2,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_lock_test_and_set_4,"ax",@progbits
	.globl	__dpu_sync_lock_test_and_set_4  // -- Begin function __dpu_sync_lock_test_and_set_4
	.type	__dpu_sync_lock_test_and_set_4,@function
__dpu_sync_lock_test_and_set_4:         // @__dpu_sync_lock_test_and_set_4
.Lfunc_begin6:
// %bb.0:
	// inline asm
.Ltmp12:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp12
	// inline asm
	lw r2, r0, 0
	sw r0, 0, r1
	// inline asm
.Ltmp13:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp13+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end6:
	.size	__dpu_sync_lock_test_and_set_4, .Lfunc_end6-__dpu_sync_lock_test_and_set_4
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_lock_test_and_set_4
	.long	.Lfunc_begin6
	.byte	0
	.section	.text.__dpu_sync_lock_test_and_set_4,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_lock_test_and_set_8,"ax",@progbits
	.globl	__dpu_sync_lock_test_and_set_8  // -- Begin function __dpu_sync_lock_test_and_set_8
	.type	__dpu_sync_lock_test_and_set_8,@function
__dpu_sync_lock_test_and_set_8:         // @__dpu_sync_lock_test_and_set_8
.Lfunc_begin7:
// %bb.0:
	// inline asm
.Ltmp14:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp14
	// inline asm
	ld d4, r0, 0
	sd r0, 0, d2
	// inline asm
.Ltmp15:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp15+1
	// inline asm
	movd d0, d4
	jump r23
.Lfunc_end7:
	.size	__dpu_sync_lock_test_and_set_8, .Lfunc_end7-__dpu_sync_lock_test_and_set_8
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_lock_test_and_set_8
	.long	.Lfunc_begin7
	.byte	0
	.section	.text.__dpu_sync_lock_test_and_set_8,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_add_1,"ax",@progbits
	.globl	__dpu_sync_fetch_and_add_1      // -- Begin function __dpu_sync_fetch_and_add_1
	.type	__dpu_sync_fetch_and_add_1,@function
__dpu_sync_fetch_and_add_1:             // @__dpu_sync_fetch_and_add_1
.Lfunc_begin8:
// %bb.0:
	// inline asm
.Ltmp16:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp16
	// inline asm
	lbs r2, r0, 0
	add r1, r2, r1
	sb r0, 0, r1
	// inline asm
.Ltmp17:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp17+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end8:
	.size	__dpu_sync_fetch_and_add_1, .Lfunc_end8-__dpu_sync_fetch_and_add_1
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_add_1
	.long	.Lfunc_begin8
	.byte	0
	.section	.text.__dpu_sync_fetch_and_add_1,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_add_2,"ax",@progbits
	.globl	__dpu_sync_fetch_and_add_2      // -- Begin function __dpu_sync_fetch_and_add_2
	.type	__dpu_sync_fetch_and_add_2,@function
__dpu_sync_fetch_and_add_2:             // @__dpu_sync_fetch_and_add_2
.Lfunc_begin9:
// %bb.0:
	// inline asm
.Ltmp18:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp18
	// inline asm
	lhs r2, r0, 0
	add r1, r2, r1
	sh r0, 0, r1
	// inline asm
.Ltmp19:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp19+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end9:
	.size	__dpu_sync_fetch_and_add_2, .Lfunc_end9-__dpu_sync_fetch_and_add_2
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_add_2
	.long	.Lfunc_begin9
	.byte	0
	.section	.text.__dpu_sync_fetch_and_add_2,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_add_4,"ax",@progbits
	.globl	__dpu_sync_fetch_and_add_4      // -- Begin function __dpu_sync_fetch_and_add_4
	.type	__dpu_sync_fetch_and_add_4,@function
__dpu_sync_fetch_and_add_4:             // @__dpu_sync_fetch_and_add_4
.Lfunc_begin10:
// %bb.0:
	// inline asm
.Ltmp20:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp20
	// inline asm
	lw r2, r0, 0
	add r1, r2, r1
	sw r0, 0, r1
	// inline asm
.Ltmp21:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp21+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end10:
	.size	__dpu_sync_fetch_and_add_4, .Lfunc_end10-__dpu_sync_fetch_and_add_4
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_add_4
	.long	.Lfunc_begin10
	.byte	0
	.section	.text.__dpu_sync_fetch_and_add_4,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_add_8,"ax",@progbits
	.globl	__dpu_sync_fetch_and_add_8      // -- Begin function __dpu_sync_fetch_and_add_8
	.type	__dpu_sync_fetch_and_add_8,@function
__dpu_sync_fetch_and_add_8:             // @__dpu_sync_fetch_and_add_8
.Lfunc_begin11:
// %bb.0:
	// inline asm
.Ltmp22:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp22
	// inline asm
	ld d4, r0, 0
	add r3, r5, r3
	addc r2, r4, r2
	sd r0, 0, d2
	// inline asm
.Ltmp23:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp23+1
	// inline asm
	movd d0, d4
	jump r23
.Lfunc_end11:
	.size	__dpu_sync_fetch_and_add_8, .Lfunc_end11-__dpu_sync_fetch_and_add_8
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_add_8
	.long	.Lfunc_begin11
	.byte	0
	.section	.text.__dpu_sync_fetch_and_add_8,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_sub_1,"ax",@progbits
	.globl	__dpu_sync_fetch_and_sub_1      // -- Begin function __dpu_sync_fetch_and_sub_1
	.type	__dpu_sync_fetch_and_sub_1,@function
__dpu_sync_fetch_and_sub_1:             // @__dpu_sync_fetch_and_sub_1
.Lfunc_begin12:
// %bb.0:
	// inline asm
.Ltmp24:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp24
	// inline asm
	lbs r2, r0, 0
	sub r1, r2, r1
	sb r0, 0, r1
	// inline asm
.Ltmp25:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp25+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end12:
	.size	__dpu_sync_fetch_and_sub_1, .Lfunc_end12-__dpu_sync_fetch_and_sub_1
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_sub_1
	.long	.Lfunc_begin12
	.byte	0
	.section	.text.__dpu_sync_fetch_and_sub_1,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_sub_2,"ax",@progbits
	.globl	__dpu_sync_fetch_and_sub_2      // -- Begin function __dpu_sync_fetch_and_sub_2
	.type	__dpu_sync_fetch_and_sub_2,@function
__dpu_sync_fetch_and_sub_2:             // @__dpu_sync_fetch_and_sub_2
.Lfunc_begin13:
// %bb.0:
	// inline asm
.Ltmp26:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp26
	// inline asm
	lhs r2, r0, 0
	sub r1, r2, r1
	sh r0, 0, r1
	// inline asm
.Ltmp27:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp27+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end13:
	.size	__dpu_sync_fetch_and_sub_2, .Lfunc_end13-__dpu_sync_fetch_and_sub_2
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_sub_2
	.long	.Lfunc_begin13
	.byte	0
	.section	.text.__dpu_sync_fetch_and_sub_2,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_sub_4,"ax",@progbits
	.globl	__dpu_sync_fetch_and_sub_4      // -- Begin function __dpu_sync_fetch_and_sub_4
	.type	__dpu_sync_fetch_and_sub_4,@function
__dpu_sync_fetch_and_sub_4:             // @__dpu_sync_fetch_and_sub_4
.Lfunc_begin14:
// %bb.0:
	// inline asm
.Ltmp28:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp28
	// inline asm
	lw r2, r0, 0
	sub r1, r2, r1
	sw r0, 0, r1
	// inline asm
.Ltmp29:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp29+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end14:
	.size	__dpu_sync_fetch_and_sub_4, .Lfunc_end14-__dpu_sync_fetch_and_sub_4
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_sub_4
	.long	.Lfunc_begin14
	.byte	0
	.section	.text.__dpu_sync_fetch_and_sub_4,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_sub_8,"ax",@progbits
	.globl	__dpu_sync_fetch_and_sub_8      // -- Begin function __dpu_sync_fetch_and_sub_8
	.type	__dpu_sync_fetch_and_sub_8,@function
__dpu_sync_fetch_and_sub_8:             // @__dpu_sync_fetch_and_sub_8
.Lfunc_begin15:
// %bb.0:
	// inline asm
.Ltmp30:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp30
	// inline asm
	ld d4, r0, 0
	sub r3, r5, r3
	subc r2, r4, r2
	sd r0, 0, d2
	// inline asm
.Ltmp31:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp31+1
	// inline asm
	movd d0, d4
	jump r23
.Lfunc_end15:
	.size	__dpu_sync_fetch_and_sub_8, .Lfunc_end15-__dpu_sync_fetch_and_sub_8
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_sub_8
	.long	.Lfunc_begin15
	.byte	0
	.section	.text.__dpu_sync_fetch_and_sub_8,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_and_1,"ax",@progbits
	.globl	__dpu_sync_fetch_and_and_1      // -- Begin function __dpu_sync_fetch_and_and_1
	.type	__dpu_sync_fetch_and_and_1,@function
__dpu_sync_fetch_and_and_1:             // @__dpu_sync_fetch_and_and_1
.Lfunc_begin16:
// %bb.0:
	// inline asm
.Ltmp32:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp32
	// inline asm
	lbs r2, r0, 0
	and r1, r2, r1
	sb r0, 0, r1
	// inline asm
.Ltmp33:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp33+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end16:
	.size	__dpu_sync_fetch_and_and_1, .Lfunc_end16-__dpu_sync_fetch_and_and_1
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_and_1
	.long	.Lfunc_begin16
	.byte	0
	.section	.text.__dpu_sync_fetch_and_and_1,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_and_2,"ax",@progbits
	.globl	__dpu_sync_fetch_and_and_2      // -- Begin function __dpu_sync_fetch_and_and_2
	.type	__dpu_sync_fetch_and_and_2,@function
__dpu_sync_fetch_and_and_2:             // @__dpu_sync_fetch_and_and_2
.Lfunc_begin17:
// %bb.0:
	// inline asm
.Ltmp34:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp34
	// inline asm
	lhs r2, r0, 0
	and r1, r2, r1
	sh r0, 0, r1
	// inline asm
.Ltmp35:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp35+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end17:
	.size	__dpu_sync_fetch_and_and_2, .Lfunc_end17-__dpu_sync_fetch_and_and_2
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_and_2
	.long	.Lfunc_begin17
	.byte	0
	.section	.text.__dpu_sync_fetch_and_and_2,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_and_4,"ax",@progbits
	.globl	__dpu_sync_fetch_and_and_4      // -- Begin function __dpu_sync_fetch_and_and_4
	.type	__dpu_sync_fetch_and_and_4,@function
__dpu_sync_fetch_and_and_4:             // @__dpu_sync_fetch_and_and_4
.Lfunc_begin18:
// %bb.0:
	// inline asm
.Ltmp36:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp36
	// inline asm
	lw r2, r0, 0
	and r1, r2, r1
	sw r0, 0, r1
	// inline asm
.Ltmp37:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp37+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end18:
	.size	__dpu_sync_fetch_and_and_4, .Lfunc_end18-__dpu_sync_fetch_and_and_4
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_and_4
	.long	.Lfunc_begin18
	.byte	0
	.section	.text.__dpu_sync_fetch_and_and_4,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_and_8,"ax",@progbits
	.globl	__dpu_sync_fetch_and_and_8      // -- Begin function __dpu_sync_fetch_and_and_8
	.type	__dpu_sync_fetch_and_and_8,@function
__dpu_sync_fetch_and_and_8:             // @__dpu_sync_fetch_and_and_8
.Lfunc_begin19:
// %bb.0:
	// inline asm
.Ltmp38:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp38
	// inline asm
	ld d4, r0, 0
	and r3, r5, r3
	and r2, r4, r2
	sd r0, 0, d2
	// inline asm
.Ltmp39:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp39+1
	// inline asm
	movd d0, d4
	jump r23
.Lfunc_end19:
	.size	__dpu_sync_fetch_and_and_8, .Lfunc_end19-__dpu_sync_fetch_and_and_8
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_and_8
	.long	.Lfunc_begin19
	.byte	0
	.section	.text.__dpu_sync_fetch_and_and_8,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_or_1,"ax",@progbits
	.globl	__dpu_sync_fetch_and_or_1       // -- Begin function __dpu_sync_fetch_and_or_1
	.type	__dpu_sync_fetch_and_or_1,@function
__dpu_sync_fetch_and_or_1:              // @__dpu_sync_fetch_and_or_1
.Lfunc_begin20:
// %bb.0:
	// inline asm
.Ltmp40:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp40
	// inline asm
	lbs r2, r0, 0
	or r1, r2, r1
	sb r0, 0, r1
	// inline asm
.Ltmp41:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp41+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end20:
	.size	__dpu_sync_fetch_and_or_1, .Lfunc_end20-__dpu_sync_fetch_and_or_1
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_or_1
	.long	.Lfunc_begin20
	.byte	0
	.section	.text.__dpu_sync_fetch_and_or_1,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_or_2,"ax",@progbits
	.globl	__dpu_sync_fetch_and_or_2       // -- Begin function __dpu_sync_fetch_and_or_2
	.type	__dpu_sync_fetch_and_or_2,@function
__dpu_sync_fetch_and_or_2:              // @__dpu_sync_fetch_and_or_2
.Lfunc_begin21:
// %bb.0:
	// inline asm
.Ltmp42:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp42
	// inline asm
	lhs r2, r0, 0
	or r1, r2, r1
	sh r0, 0, r1
	// inline asm
.Ltmp43:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp43+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end21:
	.size	__dpu_sync_fetch_and_or_2, .Lfunc_end21-__dpu_sync_fetch_and_or_2
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_or_2
	.long	.Lfunc_begin21
	.byte	0
	.section	.text.__dpu_sync_fetch_and_or_2,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_or_4,"ax",@progbits
	.globl	__dpu_sync_fetch_and_or_4       // -- Begin function __dpu_sync_fetch_and_or_4
	.type	__dpu_sync_fetch_and_or_4,@function
__dpu_sync_fetch_and_or_4:              // @__dpu_sync_fetch_and_or_4
.Lfunc_begin22:
// %bb.0:
	// inline asm
.Ltmp44:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp44
	// inline asm
	lw r2, r0, 0
	or r1, r2, r1
	sw r0, 0, r1
	// inline asm
.Ltmp45:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp45+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end22:
	.size	__dpu_sync_fetch_and_or_4, .Lfunc_end22-__dpu_sync_fetch_and_or_4
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_or_4
	.long	.Lfunc_begin22
	.byte	0
	.section	.text.__dpu_sync_fetch_and_or_4,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_or_8,"ax",@progbits
	.globl	__dpu_sync_fetch_and_or_8       // -- Begin function __dpu_sync_fetch_and_or_8
	.type	__dpu_sync_fetch_and_or_8,@function
__dpu_sync_fetch_and_or_8:              // @__dpu_sync_fetch_and_or_8
.Lfunc_begin23:
// %bb.0:
	// inline asm
.Ltmp46:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp46
	// inline asm
	ld d4, r0, 0
	or r3, r5, r3
	or r2, r4, r2
	sd r0, 0, d2
	// inline asm
.Ltmp47:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp47+1
	// inline asm
	movd d0, d4
	jump r23
.Lfunc_end23:
	.size	__dpu_sync_fetch_and_or_8, .Lfunc_end23-__dpu_sync_fetch_and_or_8
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_or_8
	.long	.Lfunc_begin23
	.byte	0
	.section	.text.__dpu_sync_fetch_and_or_8,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_xor_1,"ax",@progbits
	.globl	__dpu_sync_fetch_and_xor_1      // -- Begin function __dpu_sync_fetch_and_xor_1
	.type	__dpu_sync_fetch_and_xor_1,@function
__dpu_sync_fetch_and_xor_1:             // @__dpu_sync_fetch_and_xor_1
.Lfunc_begin24:
// %bb.0:
	// inline asm
.Ltmp48:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp48
	// inline asm
	lbs r2, r0, 0
	xor r1, r2, r1
	sb r0, 0, r1
	// inline asm
.Ltmp49:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp49+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end24:
	.size	__dpu_sync_fetch_and_xor_1, .Lfunc_end24-__dpu_sync_fetch_and_xor_1
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_xor_1
	.long	.Lfunc_begin24
	.byte	0
	.section	.text.__dpu_sync_fetch_and_xor_1,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_xor_2,"ax",@progbits
	.globl	__dpu_sync_fetch_and_xor_2      // -- Begin function __dpu_sync_fetch_and_xor_2
	.type	__dpu_sync_fetch_and_xor_2,@function
__dpu_sync_fetch_and_xor_2:             // @__dpu_sync_fetch_and_xor_2
.Lfunc_begin25:
// %bb.0:
	// inline asm
.Ltmp50:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp50
	// inline asm
	lhs r2, r0, 0
	xor r1, r2, r1
	sh r0, 0, r1
	// inline asm
.Ltmp51:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp51+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end25:
	.size	__dpu_sync_fetch_and_xor_2, .Lfunc_end25-__dpu_sync_fetch_and_xor_2
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_xor_2
	.long	.Lfunc_begin25
	.byte	0
	.section	.text.__dpu_sync_fetch_and_xor_2,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_xor_4,"ax",@progbits
	.globl	__dpu_sync_fetch_and_xor_4      // -- Begin function __dpu_sync_fetch_and_xor_4
	.type	__dpu_sync_fetch_and_xor_4,@function
__dpu_sync_fetch_and_xor_4:             // @__dpu_sync_fetch_and_xor_4
.Lfunc_begin26:
// %bb.0:
	// inline asm
.Ltmp52:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp52
	// inline asm
	lw r2, r0, 0
	xor r1, r2, r1
	sw r0, 0, r1
	// inline asm
.Ltmp53:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp53+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end26:
	.size	__dpu_sync_fetch_and_xor_4, .Lfunc_end26-__dpu_sync_fetch_and_xor_4
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_xor_4
	.long	.Lfunc_begin26
	.byte	0
	.section	.text.__dpu_sync_fetch_and_xor_4,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_xor_8,"ax",@progbits
	.globl	__dpu_sync_fetch_and_xor_8      // -- Begin function __dpu_sync_fetch_and_xor_8
	.type	__dpu_sync_fetch_and_xor_8,@function
__dpu_sync_fetch_and_xor_8:             // @__dpu_sync_fetch_and_xor_8
.Lfunc_begin27:
// %bb.0:
	// inline asm
.Ltmp54:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp54
	// inline asm
	ld d4, r0, 0
	xor r3, r5, r3
	xor r2, r4, r2
	sd r0, 0, d2
	// inline asm
.Ltmp55:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp55+1
	// inline asm
	movd d0, d4
	jump r23
.Lfunc_end27:
	.size	__dpu_sync_fetch_and_xor_8, .Lfunc_end27-__dpu_sync_fetch_and_xor_8
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_xor_8
	.long	.Lfunc_begin27
	.byte	0
	.section	.text.__dpu_sync_fetch_and_xor_8,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_nand_1,"ax",@progbits
	.globl	__dpu_sync_fetch_and_nand_1     // -- Begin function __dpu_sync_fetch_and_nand_1
	.type	__dpu_sync_fetch_and_nand_1,@function
__dpu_sync_fetch_and_nand_1:            // @__dpu_sync_fetch_and_nand_1
.Lfunc_begin28:
// %bb.0:
	// inline asm
.Ltmp56:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp56
	// inline asm
	lbs r2, r0, 0
	nand r1, r2, r1
	sb r0, 0, r1
	// inline asm
.Ltmp57:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp57+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end28:
	.size	__dpu_sync_fetch_and_nand_1, .Lfunc_end28-__dpu_sync_fetch_and_nand_1
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_nand_1
	.long	.Lfunc_begin28
	.byte	0
	.section	.text.__dpu_sync_fetch_and_nand_1,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_nand_2,"ax",@progbits
	.globl	__dpu_sync_fetch_and_nand_2     // -- Begin function __dpu_sync_fetch_and_nand_2
	.type	__dpu_sync_fetch_and_nand_2,@function
__dpu_sync_fetch_and_nand_2:            // @__dpu_sync_fetch_and_nand_2
.Lfunc_begin29:
// %bb.0:
	// inline asm
.Ltmp58:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp58
	// inline asm
	lhs r2, r0, 0
	nand r1, r2, r1
	sh r0, 0, r1
	// inline asm
.Ltmp59:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp59+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end29:
	.size	__dpu_sync_fetch_and_nand_2, .Lfunc_end29-__dpu_sync_fetch_and_nand_2
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_nand_2
	.long	.Lfunc_begin29
	.byte	0
	.section	.text.__dpu_sync_fetch_and_nand_2,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_nand_4,"ax",@progbits
	.globl	__dpu_sync_fetch_and_nand_4     // -- Begin function __dpu_sync_fetch_and_nand_4
	.type	__dpu_sync_fetch_and_nand_4,@function
__dpu_sync_fetch_and_nand_4:            // @__dpu_sync_fetch_and_nand_4
.Lfunc_begin30:
// %bb.0:
	// inline asm
.Ltmp60:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp60
	// inline asm
	lw r2, r0, 0
	nand r1, r2, r1
	sw r0, 0, r1
	// inline asm
.Ltmp61:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp61+1
	// inline asm
	move r0, r2
	jump r23
.Lfunc_end30:
	.size	__dpu_sync_fetch_and_nand_4, .Lfunc_end30-__dpu_sync_fetch_and_nand_4
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_nand_4
	.long	.Lfunc_begin30
	.byte	0
	.section	.text.__dpu_sync_fetch_and_nand_4,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_nand_8,"ax",@progbits
	.globl	__dpu_sync_fetch_and_nand_8     // -- Begin function __dpu_sync_fetch_and_nand_8
	.type	__dpu_sync_fetch_and_nand_8,@function
__dpu_sync_fetch_and_nand_8:            // @__dpu_sync_fetch_and_nand_8
.Lfunc_begin31:
// %bb.0:
	// inline asm
.Ltmp62:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp62
	// inline asm
	ld d4, r0, 0
	and r3, r5, r3
	and r2, r4, r2
	xor r3, r3, 4294967295
	xor r2, r2, 4294967295
	sd r0, 0, d2
	// inline asm
.Ltmp63:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp63+1
	// inline asm
	movd d0, d4
	jump r23
.Lfunc_end31:
	.size	__dpu_sync_fetch_and_nand_8, .Lfunc_end31-__dpu_sync_fetch_and_nand_8
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_nand_8
	.long	.Lfunc_begin31
	.byte	0
	.section	.text.__dpu_sync_fetch_and_nand_8,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_max_1,"ax",@progbits
	.globl	__dpu_sync_fetch_and_max_1      // -- Begin function __dpu_sync_fetch_and_max_1
	.type	__dpu_sync_fetch_and_max_1,@function
__dpu_sync_fetch_and_max_1:             // @__dpu_sync_fetch_and_max_1
.Lfunc_begin32:
// %bb.0:
	move r2, r0
	// inline asm
.Ltmp64:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp64
	// inline asm
	lbs r0, r2, 0
	move r3, r0
	jgts r0, r1, .LBB32_2
// %bb.1:
	move r3, r1
.LBB32_2:
	sb r2, 0, r3
	// inline asm
.Ltmp65:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp65+1
	// inline asm
	jump r23
.Lfunc_end32:
	.size	__dpu_sync_fetch_and_max_1, .Lfunc_end32-__dpu_sync_fetch_and_max_1
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_max_1
	.long	.Lfunc_begin32
	.byte	0
	.section	.text.__dpu_sync_fetch_and_max_1,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_max_2,"ax",@progbits
	.globl	__dpu_sync_fetch_and_max_2      // -- Begin function __dpu_sync_fetch_and_max_2
	.type	__dpu_sync_fetch_and_max_2,@function
__dpu_sync_fetch_and_max_2:             // @__dpu_sync_fetch_and_max_2
.Lfunc_begin33:
// %bb.0:
	move r2, r0
	// inline asm
.Ltmp66:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp66
	// inline asm
	lhs r0, r2, 0
	move r3, r0
	jgts r0, r1, .LBB33_2
// %bb.1:
	move r3, r1
.LBB33_2:
	sh r2, 0, r3
	// inline asm
.Ltmp67:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp67+1
	// inline asm
	jump r23
.Lfunc_end33:
	.size	__dpu_sync_fetch_and_max_2, .Lfunc_end33-__dpu_sync_fetch_and_max_2
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_max_2
	.long	.Lfunc_begin33
	.byte	0
	.section	.text.__dpu_sync_fetch_and_max_2,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_max_4,"ax",@progbits
	.globl	__dpu_sync_fetch_and_max_4      // -- Begin function __dpu_sync_fetch_and_max_4
	.type	__dpu_sync_fetch_and_max_4,@function
__dpu_sync_fetch_and_max_4:             // @__dpu_sync_fetch_and_max_4
.Lfunc_begin34:
// %bb.0:
	move r2, r0
	// inline asm
.Ltmp68:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp68
	// inline asm
	lw r0, r2, 0
	move r3, r0
	jgts r0, r1, .LBB34_2
// %bb.1:
	move r3, r1
.LBB34_2:
	sw r2, 0, r3
	// inline asm
.Ltmp69:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp69+1
	// inline asm
	jump r23
.Lfunc_end34:
	.size	__dpu_sync_fetch_and_max_4, .Lfunc_end34-__dpu_sync_fetch_and_max_4
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_max_4
	.long	.Lfunc_begin34
	.byte	0
	.section	.text.__dpu_sync_fetch_and_max_4,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_max_8,"ax",@progbits
	.globl	__dpu_sync_fetch_and_max_8      // -- Begin function __dpu_sync_fetch_and_max_8
	.type	__dpu_sync_fetch_and_max_8,@function
__dpu_sync_fetch_and_max_8:             // @__dpu_sync_fetch_and_max_8
.Lfunc_begin35:
// %bb.0:
	move r4, r0
	// inline asm
.Ltmp70:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp70
	// inline asm
	ld d0, r4, 0
	movd d6, d0
	sub zero, r1, r3
	subc zero, r0, r2, xgts, .LBB35_2
// %bb.1:
	movd d6, d2
.LBB35_2:
	sd r4, 0, d6
	// inline asm
.Ltmp71:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp71+1
	// inline asm
	jump r23
.Lfunc_end35:
	.size	__dpu_sync_fetch_and_max_8, .Lfunc_end35-__dpu_sync_fetch_and_max_8
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_max_8
	.long	.Lfunc_begin35
	.byte	0
	.section	.text.__dpu_sync_fetch_and_max_8,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_umax_1,"ax",@progbits
	.globl	__dpu_sync_fetch_and_umax_1     // -- Begin function __dpu_sync_fetch_and_umax_1
	.type	__dpu_sync_fetch_and_umax_1,@function
__dpu_sync_fetch_and_umax_1:            // @__dpu_sync_fetch_and_umax_1
.Lfunc_begin36:
// %bb.0:
	// inline asm
.Ltmp72:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp72
	// inline asm
	lbu r2, r0, 0
	and r4, r1, 255
	move r3, r2
	jgtu r2, r4, .LBB36_2
// %bb.1:
	move r3, r1
.LBB36_2:
	sb r0, 0, r3
	// inline asm
.Ltmp73:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp73+1
	// inline asm
	extsb r0, r2
	jump r23
.Lfunc_end36:
	.size	__dpu_sync_fetch_and_umax_1, .Lfunc_end36-__dpu_sync_fetch_and_umax_1
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_umax_1
	.long	.Lfunc_begin36
	.byte	0
	.section	.text.__dpu_sync_fetch_and_umax_1,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_umax_2,"ax",@progbits
	.globl	__dpu_sync_fetch_and_umax_2     // -- Begin function __dpu_sync_fetch_and_umax_2
	.type	__dpu_sync_fetch_and_umax_2,@function
__dpu_sync_fetch_and_umax_2:            // @__dpu_sync_fetch_and_umax_2
.Lfunc_begin37:
// %bb.0:
	// inline asm
.Ltmp74:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp74
	// inline asm
	lhu r2, r0, 0
	and r4, r1, 65535
	move r3, r2
	jgtu r2, r4, .LBB37_2
// %bb.1:
	move r3, r1
.LBB37_2:
	sh r0, 0, r3
	// inline asm
.Ltmp75:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp75+1
	// inline asm
	extsh r0, r2
	jump r23
.Lfunc_end37:
	.size	__dpu_sync_fetch_and_umax_2, .Lfunc_end37-__dpu_sync_fetch_and_umax_2
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_umax_2
	.long	.Lfunc_begin37
	.byte	0
	.section	.text.__dpu_sync_fetch_and_umax_2,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_umax_4,"ax",@progbits
	.globl	__dpu_sync_fetch_and_umax_4     // -- Begin function __dpu_sync_fetch_and_umax_4
	.type	__dpu_sync_fetch_and_umax_4,@function
__dpu_sync_fetch_and_umax_4:            // @__dpu_sync_fetch_and_umax_4
.Lfunc_begin38:
// %bb.0:
	move r2, r0
	// inline asm
.Ltmp76:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp76
	// inline asm
	lw r0, r2, 0
	move r3, r0
	jgtu r0, r1, .LBB38_2
// %bb.1:
	move r3, r1
.LBB38_2:
	sw r2, 0, r3
	// inline asm
.Ltmp77:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp77+1
	// inline asm
	jump r23
.Lfunc_end38:
	.size	__dpu_sync_fetch_and_umax_4, .Lfunc_end38-__dpu_sync_fetch_and_umax_4
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_umax_4
	.long	.Lfunc_begin38
	.byte	0
	.section	.text.__dpu_sync_fetch_and_umax_4,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_umax_8,"ax",@progbits
	.globl	__dpu_sync_fetch_and_umax_8     // -- Begin function __dpu_sync_fetch_and_umax_8
	.type	__dpu_sync_fetch_and_umax_8,@function
__dpu_sync_fetch_and_umax_8:            // @__dpu_sync_fetch_and_umax_8
.Lfunc_begin39:
// %bb.0:
	move r4, r0
	// inline asm
.Ltmp78:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp78
	// inline asm
	ld d0, r4, 0
	movd d6, d0
	sub zero, r1, r3
	subc zero, r0, r2, xgtu, .LBB39_2
// %bb.1:
	movd d6, d2
.LBB39_2:
	sd r4, 0, d6
	// inline asm
.Ltmp79:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp79+1
	// inline asm
	jump r23
.Lfunc_end39:
	.size	__dpu_sync_fetch_and_umax_8, .Lfunc_end39-__dpu_sync_fetch_and_umax_8
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_umax_8
	.long	.Lfunc_begin39
	.byte	0
	.section	.text.__dpu_sync_fetch_and_umax_8,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_min_1,"ax",@progbits
	.globl	__dpu_sync_fetch_and_min_1      // -- Begin function __dpu_sync_fetch_and_min_1
	.type	__dpu_sync_fetch_and_min_1,@function
__dpu_sync_fetch_and_min_1:             // @__dpu_sync_fetch_and_min_1
.Lfunc_begin40:
// %bb.0:
	move r2, r0
	// inline asm
.Ltmp80:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp80
	// inline asm
	lbs r0, r2, 0
	move r3, r0
	jgts r0, r1, .LBB40_2
// %bb.1:
	move r3, r1
.LBB40_2:
	sb r2, 0, r3
	// inline asm
.Ltmp81:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp81+1
	// inline asm
	jump r23
.Lfunc_end40:
	.size	__dpu_sync_fetch_and_min_1, .Lfunc_end40-__dpu_sync_fetch_and_min_1
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_min_1
	.long	.Lfunc_begin40
	.byte	0
	.section	.text.__dpu_sync_fetch_and_min_1,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_min_2,"ax",@progbits
	.globl	__dpu_sync_fetch_and_min_2      // -- Begin function __dpu_sync_fetch_and_min_2
	.type	__dpu_sync_fetch_and_min_2,@function
__dpu_sync_fetch_and_min_2:             // @__dpu_sync_fetch_and_min_2
.Lfunc_begin41:
// %bb.0:
	move r2, r0
	// inline asm
.Ltmp82:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp82
	// inline asm
	lhs r0, r2, 0
	move r3, r0
	jgts r0, r1, .LBB41_2
// %bb.1:
	move r3, r1
.LBB41_2:
	sh r2, 0, r3
	// inline asm
.Ltmp83:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp83+1
	// inline asm
	jump r23
.Lfunc_end41:
	.size	__dpu_sync_fetch_and_min_2, .Lfunc_end41-__dpu_sync_fetch_and_min_2
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_min_2
	.long	.Lfunc_begin41
	.byte	0
	.section	.text.__dpu_sync_fetch_and_min_2,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_min_4,"ax",@progbits
	.globl	__dpu_sync_fetch_and_min_4      // -- Begin function __dpu_sync_fetch_and_min_4
	.type	__dpu_sync_fetch_and_min_4,@function
__dpu_sync_fetch_and_min_4:             // @__dpu_sync_fetch_and_min_4
.Lfunc_begin42:
// %bb.0:
	move r2, r0
	// inline asm
.Ltmp84:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp84
	// inline asm
	lw r0, r2, 0
	move r3, r0
	jgts r0, r1, .LBB42_2
// %bb.1:
	move r3, r1
.LBB42_2:
	sw r2, 0, r3
	// inline asm
.Ltmp85:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp85+1
	// inline asm
	jump r23
.Lfunc_end42:
	.size	__dpu_sync_fetch_and_min_4, .Lfunc_end42-__dpu_sync_fetch_and_min_4
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_min_4
	.long	.Lfunc_begin42
	.byte	0
	.section	.text.__dpu_sync_fetch_and_min_4,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_min_8,"ax",@progbits
	.globl	__dpu_sync_fetch_and_min_8      // -- Begin function __dpu_sync_fetch_and_min_8
	.type	__dpu_sync_fetch_and_min_8,@function
__dpu_sync_fetch_and_min_8:             // @__dpu_sync_fetch_and_min_8
.Lfunc_begin43:
// %bb.0:
	move r4, r0
	// inline asm
.Ltmp86:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp86
	// inline asm
	ld d0, r4, 0
	movd d6, d0
	sub zero, r1, r3
	subc zero, r0, r2, xgts, .LBB43_2
// %bb.1:
	movd d6, d2
.LBB43_2:
	sd r4, 0, d6
	// inline asm
.Ltmp87:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp87+1
	// inline asm
	jump r23
.Lfunc_end43:
	.size	__dpu_sync_fetch_and_min_8, .Lfunc_end43-__dpu_sync_fetch_and_min_8
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_min_8
	.long	.Lfunc_begin43
	.byte	0
	.section	.text.__dpu_sync_fetch_and_min_8,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_umin_1,"ax",@progbits
	.globl	__dpu_sync_fetch_and_umin_1     // -- Begin function __dpu_sync_fetch_and_umin_1
	.type	__dpu_sync_fetch_and_umin_1,@function
__dpu_sync_fetch_and_umin_1:            // @__dpu_sync_fetch_and_umin_1
.Lfunc_begin44:
// %bb.0:
	// inline asm
.Ltmp88:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp88
	// inline asm
	lbu r2, r0, 0
	and r4, r1, 255
	move r3, r2
	jgtu r2, r4, .LBB44_2
// %bb.1:
	move r3, r1
.LBB44_2:
	sb r0, 0, r3
	// inline asm
.Ltmp89:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp89+1
	// inline asm
	extsb r0, r2
	jump r23
.Lfunc_end44:
	.size	__dpu_sync_fetch_and_umin_1, .Lfunc_end44-__dpu_sync_fetch_and_umin_1
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_umin_1
	.long	.Lfunc_begin44
	.byte	0
	.section	.text.__dpu_sync_fetch_and_umin_1,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_umin_2,"ax",@progbits
	.globl	__dpu_sync_fetch_and_umin_2     // -- Begin function __dpu_sync_fetch_and_umin_2
	.type	__dpu_sync_fetch_and_umin_2,@function
__dpu_sync_fetch_and_umin_2:            // @__dpu_sync_fetch_and_umin_2
.Lfunc_begin45:
// %bb.0:
	// inline asm
.Ltmp90:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp90
	// inline asm
	lhu r2, r0, 0
	and r4, r1, 65535
	move r3, r2
	jgtu r2, r4, .LBB45_2
// %bb.1:
	move r3, r1
.LBB45_2:
	sh r0, 0, r3
	// inline asm
.Ltmp91:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp91+1
	// inline asm
	extsh r0, r2
	jump r23
.Lfunc_end45:
	.size	__dpu_sync_fetch_and_umin_2, .Lfunc_end45-__dpu_sync_fetch_and_umin_2
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_umin_2
	.long	.Lfunc_begin45
	.byte	0
	.section	.text.__dpu_sync_fetch_and_umin_2,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_umin_4,"ax",@progbits
	.globl	__dpu_sync_fetch_and_umin_4     // -- Begin function __dpu_sync_fetch_and_umin_4
	.type	__dpu_sync_fetch_and_umin_4,@function
__dpu_sync_fetch_and_umin_4:            // @__dpu_sync_fetch_and_umin_4
.Lfunc_begin46:
// %bb.0:
	move r2, r0
	// inline asm
.Ltmp92:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp92
	// inline asm
	lw r0, r2, 0
	move r3, r0
	jgtu r0, r1, .LBB46_2
// %bb.1:
	move r3, r1
.LBB46_2:
	sw r2, 0, r3
	// inline asm
.Ltmp93:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp93+1
	// inline asm
	jump r23
.Lfunc_end46:
	.size	__dpu_sync_fetch_and_umin_4, .Lfunc_end46-__dpu_sync_fetch_and_umin_4
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_umin_4
	.long	.Lfunc_begin46
	.byte	0
	.section	.text.__dpu_sync_fetch_and_umin_4,"ax",@progbits
                                        // -- End function
	.section	.text.__dpu_sync_fetch_and_umin_8,"ax",@progbits
	.globl	__dpu_sync_fetch_and_umin_8     // -- Begin function __dpu_sync_fetch_and_umin_8
	.type	__dpu_sync_fetch_and_umin_8,@function
__dpu_sync_fetch_and_umin_8:            // @__dpu_sync_fetch_and_umin_8
.Lfunc_begin47:
// %bb.0:
	move r4, r0
	// inline asm
.Ltmp94:
	acquire zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp94
	// inline asm
	ld d0, r4, 0
	movd d6, d0
	sub zero, r1, r3
	subc zero, r0, r2, xgtu, .LBB47_2
// %bb.1:
	movd d6, d2
.LBB47_2:
	sd r4, 0, d6
	// inline asm
.Ltmp95:
	release zero, __atomic_bit_llvm_atomic_functions, nz, .Ltmp95+1
	// inline asm
	jump r23
.Lfunc_end47:
	.size	__dpu_sync_fetch_and_umin_8, .Lfunc_end47-__dpu_sync_fetch_and_umin_8
	.section	.stack_sizes,"o",@progbits,.text.__dpu_sync_fetch_and_umin_8
	.long	.Lfunc_begin47
	.byte	0
	.section	.text.__dpu_sync_fetch_and_umin_8,"ax",@progbits
                                        // -- End function
	.type	__atomic_bit_llvm_atomic_functions,@object // @__atomic_bit_llvm_atomic_functions
	.section	.atomic,"aw",@progbits
	.globl	__atomic_bit_llvm_atomic_functions
__atomic_bit_llvm_atomic_functions:
	.byte	0                               // 0x0
	.size	__atomic_bit_llvm_atomic_functions, 1

	.addrsig
	.addrsig_sym __atomic_bit_llvm_atomic_functions
