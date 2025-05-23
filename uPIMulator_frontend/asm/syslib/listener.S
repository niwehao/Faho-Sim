	.text
	.file	"listener.c"
	.section	.text.__sys_internal_listener_loop,"ax",@progbits
	.globl	__sys_internal_listener_loop    // -- Begin function __sys_internal_listener_loop
	.type	__sys_internal_listener_loop,@function
__sys_internal_listener_loop:           // @__sys_internal_listener_loop
.Lfunc_begin0:
// %bb.0:
	sd r22, 24, d22
	add r22, r22, 32
	sd r22, -16, d14
	sd r22, -24, d16
	sd r22, -32, d18
	lhu r2, id4, __sys_fifo_table_ptr
	lw r14, r2, 0
	lw r15, zero, __sys_fifo_sys_table
	move r2, __sys_fifo_sys_table
	lw r16, r2, 4
	move r17, r1
	move r18, r0
	move r19, id
.LBB0_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_2 Depth 2
	move r0, r14
	move r1, r18
	move r2, r17
	call r23, fetch_request
	jeq r0, 0, .LBB0_4
.LBB0_2:                                //   Parent Loop BB0_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	move r0, r16
	move r1, r17
	call r23, fifo_is_full
	jnz r0, .LBB0_2
// %bb.3:                               //   in Loop: Header=BB0_1 Depth=1
	move r0, r16
	move r1, r18
	move r2, r17
	call r23, fifo_produce
.LBB0_4:                                //   in Loop: Header=BB0_1 Depth=1
	move r0, r15
	move r1, r18
	move r2, r17
	call r23, fetch_request
	jeq r0, 0, .LBB0_1
// %bb.5:                               //   in Loop: Header=BB0_1 Depth=1
	lw r1, r18, 0
	lsr r0, r1, 24
	jeq r0, r19, .LBB0_7
// %bb.6:                               //   in Loop: Header=BB0_1 Depth=1
	and r1, r1, 16777215
	sw r18, 0, r1
	move r1, r18
	move r2, r17
	call r23, internal_actor_send
	jump .LBB0_1
.LBB0_7:
	ld d18, r22, -32
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__sys_internal_listener_loop, .Lfunc_end0-__sys_internal_listener_loop
	.section	.stack_sizes,"o",@progbits,.text.__sys_internal_listener_loop
	.long	.Lfunc_begin0
	.byte	32
	.section	.text.__sys_internal_listener_loop,"ax",@progbits
                                        // -- End function
	.addrsig
