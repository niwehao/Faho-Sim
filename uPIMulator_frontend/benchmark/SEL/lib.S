.section	.text.syscall,"ax",@progbits
	.globl	syscall                         // -- Begin function syscall
	.type	syscall,@function
syscall:                                // @syscall
// %bb.0:
	sw r22, 0, r0
	sw r22, 4, r1
	sw r22, 8, r2
	sw r22, 12, r3
	sw r22, 16, r4
	// inline asm
	jump 0x60000
	// inline asm
	move r0, 0
	jump r23
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
