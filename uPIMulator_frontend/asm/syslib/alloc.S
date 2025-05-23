	.text
	.file	"alloc.c"
	.section	.text.mem_alloc_nolock,"ax",@progbits
	.globl	mem_alloc_nolock                // -- Begin function mem_alloc_nolock
	.type	mem_alloc_nolock,@function
mem_alloc_nolock:                       // @mem_alloc_nolock
.Lfunc_begin0:
// %bb.0:
	lw r1, zero, __sys_heap_pointer
	jeq r0, 0, .LBB0_2
// %bb.1:
	add r1, r1, 7
	and r1, r1, -8
	// inline asm
.Ltmp0:
	add r0, r1, r0, nc, .Ltmp0+2
	fault 1
	lbu r2, r0, -1

	// inline asm
	sw zero, __sys_heap_pointer, r0
.LBB0_2:
	move r0, r1
	jump r23
.Lfunc_end0:
	.size	mem_alloc_nolock, .Lfunc_end0-mem_alloc_nolock
	.section	.stack_sizes,"o",@progbits,.text.mem_alloc_nolock
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.mem_alloc_nolock,"ax",@progbits
                                        // -- End function
	.section	.text.mem_alloc,"ax",@progbits
	.globl	mem_alloc                       // -- Begin function mem_alloc
	.type	mem_alloc,@function
mem_alloc:                              // @mem_alloc
.Lfunc_begin1:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	// inline asm
.Ltmp1:
	acquire zero, __atomic_bit___heap_pointer, nz, .Ltmp1
	// inline asm
	call r23, mem_alloc_nolock
	// inline asm
.Ltmp2:
	release zero, __atomic_bit___heap_pointer, nz, .Ltmp2+1
	// inline asm
	ld d22, r22, -8
	jump r23
.Lfunc_end1:
	.size	mem_alloc, .Lfunc_end1-mem_alloc
	.section	.stack_sizes,"o",@progbits,.text.mem_alloc
	.long	.Lfunc_begin1
	.byte	8
	.section	.text.mem_alloc,"ax",@progbits
                                        // -- End function
	.section	.text.mem_reset,"ax",@progbits
	.globl	mem_reset                       // -- Begin function mem_reset
	.type	mem_reset,@function
mem_reset:                              // @mem_reset
.Lfunc_begin2:
// %bb.0:
	// inline asm
.Ltmp3:
	acquire zero, __atomic_bit___heap_pointer, nz, .Ltmp3
	// inline asm
	move r0, __sys_heap_pointer_reset
	sw zero, __sys_heap_pointer, r0
	// inline asm
.Ltmp4:
	release zero, __atomic_bit___heap_pointer, nz, .Ltmp4+1
	// inline asm
	jump r23
.Lfunc_end2:
	.size	mem_reset, .Lfunc_end2-mem_reset
	.section	.stack_sizes,"o",@progbits,.text.mem_reset
	.long	.Lfunc_begin2
	.byte	0
	.section	.text.mem_reset,"ax",@progbits
                                        // -- End function
	.type	__sys_heap_pointer,@object      // @__sys_heap_pointer
	.section	.data.__sys_heap_pointer,"aw",@progbits
	.globl	__sys_heap_pointer
	.p2align	2
__sys_heap_pointer:
	.long	__sys_heap_pointer_reset
	.size	__sys_heap_pointer, 4

	.type	__atomic_bit___heap_pointer,@object // @__atomic_bit___heap_pointer
	.section	.atomic,"aw",@progbits
	.globl	__atomic_bit___heap_pointer
__atomic_bit___heap_pointer:
	.byte	0                               // 0x0
	.size	__atomic_bit___heap_pointer, 1

	.addrsig
	.addrsig_sym __sys_heap_pointer_reset
	.addrsig_sym __sys_heap_pointer
	.addrsig_sym __atomic_bit___heap_pointer
