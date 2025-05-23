	.text
	.file	"coreDump.c"
	.section	.text.__bootstrap,"ax",@progbits
	.globl	__bootstrap                     // -- Begin function __bootstrap
	.type	__bootstrap,@function
__bootstrap:                            // @__bootstrap
.Lfunc_begin0:
// %bb.0:
	// inline asm
	sd id8, 256, d0
	or r0, zero, 0, xnz, no_z_flag
	or r0, r0, 2
no_z_flag:
	addc r0, r0, 0
	sw id4, 2560, r0
.Ltmp0:
	jeq id, 23, .Ltmp0+2
	boot id, 1
	sd id8, 448, d2
	sd id8, 640, d4
	sd id8, 832, d6
	sd id8, 1024, d8
	sd id8, 1216, d10
	sd id8, 1408, d12
	sd id8, 1600, d14
	sd id8, 1792, d16
	sd id8, 1984, d18
	sd id8, 2176, d20
	sd id8, 2368, d22
	jnz id, atomic_done
	move r0, 255
atomic_loop:
	sb r0, 0, 255
	acquire r0, 0, nz, atomic_next
	sb r0, 0, 0
	release r0, 0, nz, atomic_next
atomic_next:
	add r0, r0, -1, pl, atomic_loop
atomic_done:
	lw r0, id4, 2560
	add r1, r0, r0
	add r0, r0, r1
	or r1, id8, 0
	add r1, id4, r1
	add r0, r0, r1
	call zero, r0, ending_routines
ending_routines:
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0

	// inline asm
.Lfunc_end0:
	.size	__bootstrap, .Lfunc_end0-__bootstrap
	.section	.stack_sizes,"o",@progbits,.text.__bootstrap
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__bootstrap,"ax",@progbits
                                        // -- End function
	.addrsig
	.addrsig_sym __bootstrap
