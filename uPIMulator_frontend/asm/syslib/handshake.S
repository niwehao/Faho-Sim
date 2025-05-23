	.text
	.file	"handshake.c"
	.section	.text.handshake_notify,"ax",@progbits
	.globl	handshake_notify                // -- Begin function handshake_notify
	.type	handshake_notify,@function
handshake_notify:                       // @handshake_notify
.Lfunc_begin0:
// %bb.0:
	move r0, __atomic_start_addr
	move r1, __atomic_bit___handshake
	sub r0, r1, r0
	add r0, id, r0
	// inline asm
.Ltmp0:
	acquire r0, 0, nz, .Ltmp0
	// inline asm
	lbu r2, id, __handshake_array
	move r1, id
	jeq r2, 255, .LBB0_1
// %bb.2:
	// inline asm
.Ltmp1:
	resume r2, 0, nz, .Ltmp1+0
	// inline asm
	move r2, 255
	sb r1, __handshake_array, r2
	// inline asm
.Ltmp2:
	release r0, 0, nz, .Ltmp2+1
	// inline asm
	jump r23
.LBB0_1:
	sb r1, __handshake_array, r1
	// inline asm
.Ltmp3:
	release r0, 0, nz, .Ltmp3+1
	// inline asm
	// inline asm
	stop false, 0x0
	// inline asm
	jump r23
.Lfunc_end0:
	.size	handshake_notify, .Lfunc_end0-handshake_notify
	.section	.stack_sizes,"o",@progbits,.text.handshake_notify
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.handshake_notify,"ax",@progbits
                                        // -- End function
	.section	.text.handshake_wait_for,"ax",@progbits
	.globl	handshake_wait_for              // -- Begin function handshake_wait_for
	.type	handshake_wait_for,@function
handshake_wait_for:                     // @handshake_wait_for
.Lfunc_begin1:
// %bb.0:
	and r0, r0, 255
	move r1, __atomic_start_addr
	move r2, __atomic_bit___handshake
	sub r1, r2, r1
	add r1, r0, r1
	// inline asm
.Ltmp4:
	acquire r1, 0, nz, .Ltmp4
	// inline asm
	lbu r3, r0, __handshake_array
	move r2, id
	jeq r3, 255, .LBB1_1
// %bb.2:
	jneq r3, r0, .LBB1_3
// %bb.4:
	// inline asm
.Ltmp5:
	resume r3, 0, nz, .Ltmp5+0
	// inline asm
	move r2, 255
	sb r0, __handshake_array, r2
	// inline asm
.Ltmp6:
	release r1, 0, nz, .Ltmp6+1
	// inline asm
	move r0, 0
	jump r23
.LBB1_1:
	sb r0, __handshake_array, r2
	// inline asm
.Ltmp7:
	release r1, 0, nz, .Ltmp7+1
	// inline asm
	// inline asm
	stop false, 0x0
	// inline asm
	move r0, 0
	jump r23
.LBB1_3:
	lsl r2, r2, 2
	move r0, 7
	sw r2, __errno, r0
	// inline asm
.Ltmp8:
	release r1, 0, nz, .Ltmp8+1
	// inline asm
	jump r23
.Lfunc_end1:
	.size	handshake_wait_for, .Lfunc_end1-handshake_wait_for
	.section	.stack_sizes,"o",@progbits,.text.handshake_wait_for
	.long	.Lfunc_begin1
	.byte	0
	.section	.text.handshake_wait_for,"ax",@progbits
                                        // -- End function
	.type	__handshake_array,@object       // @__handshake_array
	.section	.data.__handshake_array,"aw",@progbits
	.globl	__handshake_array
__handshake_array:
	.zero	24,255
	.size	__handshake_array, 24

	.type	__atomic_bit___handshake,@object // @__atomic_bit___handshake
	.section	.atomic,"aw",@progbits
	.globl	__atomic_bit___handshake
__atomic_bit___handshake:
	.zero	24
	.size	__atomic_bit___handshake, 24

	.addrsig
	.addrsig_sym __atomic_bit___handshake
	.addrsig_sym __atomic_start_addr
