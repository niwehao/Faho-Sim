	.text
	.file	"defs.c"
	.section	.text.check_stack,"ax",@progbits
	.globl	check_stack                     // -- Begin function check_stack
	.type	check_stack,@function
check_stack:                            // @check_stack
.Lfunc_begin0:
// %bb.0:
	move r0, __sys_thread_stack_table_ptr
	add r0, id8, r0
	lw r0, r0, 4
	lw r1, id8, __sys_thread_stack_table_ptr
	add r0, r1, r0
	// inline asm
	sub r0, r0, r22
	// inline asm
	jump r23
.Lfunc_end0:
	.size	check_stack, .Lfunc_end0-check_stack
	.section	.stack_sizes,"o",@progbits,.text.check_stack
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.check_stack,"ax",@progbits
                                        // -- End function
	.addrsig
