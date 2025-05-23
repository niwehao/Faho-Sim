	.text
	.file	"seqread128.c"
	.section	.text.seqread128_alloc,"ax",@progbits
	.globl	seqread128_alloc                // -- Begin function seqread128_alloc
	.type	seqread128_alloc,@function
seqread128_alloc:                       // @seqread128_alloc
.Lfunc_begin0:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	// inline asm
.Ltmp0:
	acquire zero, __atomic_bit___heap_pointer, nz, .Ltmp0
	// inline asm
	lw r0, zero, __sys_heap_pointer
	add r1, r0, 127
	and r14, r1, -128
	sub r0, r14, r0
	add r0, r0, 256
	call r23, mem_alloc_nolock
	// inline asm
.Ltmp1:
	release zero, __atomic_bit___heap_pointer, nz, .Ltmp1+1
	// inline asm
	move r0, r14
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	seqread128_alloc, .Lfunc_end0-seqread128_alloc
	.section	.stack_sizes,"o",@progbits,.text.seqread128_alloc
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.seqread128_alloc,"ax",@progbits
                                        // -- End function
	.section	.text.seqread128_init,"ax",@progbits
	.globl	seqread128_init                 // -- Begin function seqread128_init
	.type	seqread128_init,@function
seqread128_init:                        // @seqread128_init
.Lfunc_begin1:
// %bb.0:
	sw r2, 0, r0
	move r3, 67108864
	sw r2, 4, r3
	add r3, r1, -67108864
	jltu r3, 128, .LBB1_2
// %bb.1:
	and r4, r1, -128
	ldma r0, r4, 31
	and r3, r1, 127
	sw r2, 4, r4
.LBB1_2:
	add r0, r3, r0
	jump r23
.Lfunc_end1:
	.size	seqread128_init, .Lfunc_end1-seqread128_init
	.section	.stack_sizes,"o",@progbits,.text.seqread128_init
	.long	.Lfunc_begin1
	.byte	0
	.section	.text.seqread128_init,"ax",@progbits
                                        // -- End function
	.section	.text.seqread128_seek,"ax",@progbits
	.globl	seqread128_seek                 // -- Begin function seqread128_seek
	.type	seqread128_seek,@function
seqread128_seek:                        // @seqread128_seek
.Lfunc_begin2:
// %bb.0:
	lw r3, r1, 4
	lw r2, r1, 0
	sub r3, r0, r3
	jltu r3, 128, .LBB2_2
// %bb.1:
	and r4, r0, -128
	ldma r2, r4, 31
	and r3, r0, 127
	sw r1, 4, r4
.LBB2_2:
	add r0, r3, r2
	jump r23
.Lfunc_end2:
	.size	seqread128_seek, .Lfunc_end2-seqread128_seek
	.section	.stack_sizes,"o",@progbits,.text.seqread128_seek
	.long	.Lfunc_begin2
	.byte	0
	.section	.text.seqread128_seek,"ax",@progbits
                                        // -- End function
	.section	.text.seqread128_get,"ax",@progbits
	.globl	seqread128_get                  // -- Begin function seqread128_get
	.type	seqread128_get,@function
seqread128_get:                         // @seqread128_get
.Lfunc_begin3:
// %bb.0:
	add r0, r0, r1, nc7, .LBB3_2
// %bb.1:
	lw r1, r2, 4
	add r1, r1, 128
	sw r2, 4, r1
	lw r2, r2, 0
	ldma r2, r1, 31
	add r0, r0, 4294967168
.LBB3_2:
	jump r23
.Lfunc_end3:
	.size	seqread128_get, .Lfunc_end3-seqread128_get
	.section	.stack_sizes,"o",@progbits,.text.seqread128_get
	.long	.Lfunc_begin3
	.byte	0
	.section	.text.seqread128_get,"ax",@progbits
                                        // -- End function
	.section	.text.seqread128_tell,"ax",@progbits
	.globl	seqread128_tell                 // -- Begin function seqread128_tell
	.type	seqread128_tell,@function
seqread128_tell:                        // @seqread128_tell
.Lfunc_begin4:
// %bb.0:
	lw r1, r1, 4
	and r0, r0, 127
	add r0, r1, r0
	jump r23
.Lfunc_end4:
	.size	seqread128_tell, .Lfunc_end4-seqread128_tell
	.section	.stack_sizes,"o",@progbits,.text.seqread128_tell
	.long	.Lfunc_begin4
	.byte	0
	.section	.text.seqread128_tell,"ax",@progbits
                                        // -- End function
	.addrsig
	.addrsig_sym __atomic_bit___heap_pointer
	.addrsig_sym __sys_heap_pointer
