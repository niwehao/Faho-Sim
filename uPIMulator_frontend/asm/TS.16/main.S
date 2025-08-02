	.text
	.file	"main.c"
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
	.section	.text.socket_read,"ax",@progbits
	.globl	socket_read                     // -- Begin function socket_read
	.type	socket_read,@function
socket_read:                            // @socket_read
.Lfunc_begin0:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r3, 0
	move r4, 11
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	socket_read, .Lfunc_end0-socket_read
	.section	.stack_sizes,"o",@progbits,.text.socket_read
	.long	.Lfunc_begin0
	.byte	8
	.section	.text.socket_read,"ax",@progbits
                                        // -- End function
	.section	.text.socket_write,"ax",@progbits
	.globl	socket_write                    // -- Begin function socket_write
	.type	socket_write,@function
socket_write:                           // @socket_write
.Lfunc_begin1:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r3, 0
	move r4, 12
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end1:
	.size	socket_write, .Lfunc_end1-socket_write
	.section	.stack_sizes,"o",@progbits,.text.socket_write
	.long	.Lfunc_begin1
	.byte	8
	.section	.text.socket_write,"ax",@progbits
                                        // -- End function
	.section	.text.socket_open,"ax",@progbits
	.globl	socket_open                     // -- Begin function socket_open
	.type	socket_open,@function
socket_open:                            // @socket_open
.Lfunc_begin2:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r1, 0
	move r4, 10
	move r2, r1
	move r3, r1
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end2:
	.size	socket_open, .Lfunc_end2-socket_open
	.section	.stack_sizes,"o",@progbits,.text.socket_open
	.long	.Lfunc_begin2
	.byte	8
	.section	.text.socket_open,"ax",@progbits
                                        // -- End function
	.section	.text.socket_close,"ax",@progbits
	.globl	socket_close                    // -- Begin function socket_close
	.type	socket_close,@function
socket_close:                           // @socket_close
.Lfunc_begin3:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r1, 0
	move r4, 13
	move r2, r1
	move r3, r1
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end3:
	.size	socket_close, .Lfunc_end3-socket_close
	.section	.stack_sizes,"o",@progbits,.text.socket_close
	.long	.Lfunc_begin3
	.byte	8
	.section	.text.socket_close,"ax",@progbits
                                        // -- End function
	.section	.text.get_jid,"ax",@progbits
	.globl	get_jid                         // -- Begin function get_jid
	.type	get_jid,@function
get_jid:                                // @get_jid
.Lfunc_begin4:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r0, 0
	move r4, 6
	move r1, r0
	move r2, r0
	move r3, r0
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end4:
	.size	get_jid, .Lfunc_end4-get_jid
	.section	.stack_sizes,"o",@progbits,.text.get_jid
	.long	.Lfunc_begin4
	.byte	8
	.section	.text.get_jid,"ax",@progbits
                                        // -- End function
	.section	.text.debug,"ax",@progbits
	.globl	debug                           // -- Begin function debug
	.type	debug,@function
debug:                                  // @debug
.Lfunc_begin5:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r1, 0
	move r4, 8
	move r2, r1
	move r3, r1
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end5:
	.size	debug, .Lfunc_end5-debug
	.section	.stack_sizes,"o",@progbits,.text.debug
	.long	.Lfunc_begin5
	.byte	8
	.section	.text.debug,"ax",@progbits
                                        // -- End function
	.section	.text.debug_int,"ax",@progbits
	.globl	debug_int                       // -- Begin function debug_int
	.type	debug_int,@function
debug_int:                              // @debug_int
.Lfunc_begin6:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r1, 0
	move r4, 9
	move r2, r1
	move r3, r1
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end6:
	.size	debug_int, .Lfunc_end6-debug_int
	.section	.stack_sizes,"o",@progbits,.text.debug_int
	.long	.Lfunc_begin6
	.byte	8
	.section	.text.debug_int,"ax",@progbits
                                        // -- End function
	.section	.text.init_lock,"ax",@progbits
	.globl	init_lock                       // -- Begin function init_lock
	.type	init_lock,@function
init_lock:                              // @init_lock
.Lfunc_begin7:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r1, 0
	move r4, 14
	move r2, r1
	move r3, r1
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end7:
	.size	init_lock, .Lfunc_end7-init_lock
	.section	.stack_sizes,"o",@progbits,.text.init_lock
	.long	.Lfunc_begin7
	.byte	8
	.section	.text.init_lock,"ax",@progbits
                                        // -- End function
	.section	.text.lock,"ax",@progbits
	.globl	lock                            // -- Begin function lock
	.type	lock,@function
lock:                                   // @lock
.Lfunc_begin8:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r1, 0
	move r4, 15
	move r2, r1
	move r3, r1
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end8:
	.size	lock, .Lfunc_end8-lock
	.section	.stack_sizes,"o",@progbits,.text.lock
	.long	.Lfunc_begin8
	.byte	8
	.section	.text.lock,"ax",@progbits
                                        // -- End function
	.section	.text.try_lock,"ax",@progbits
	.globl	try_lock                        // -- Begin function try_lock
	.type	try_lock,@function
try_lock:                               // @try_lock
.Lfunc_begin9:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r1, 0
	move r4, 24
	move r2, r1
	move r3, r1
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end9:
	.size	try_lock, .Lfunc_end9-try_lock
	.section	.stack_sizes,"o",@progbits,.text.try_lock
	.long	.Lfunc_begin9
	.byte	8
	.section	.text.try_lock,"ax",@progbits
                                        // -- End function
	.section	.text.unlock,"ax",@progbits
	.globl	unlock                          // -- Begin function unlock
	.type	unlock,@function
unlock:                                 // @unlock
.Lfunc_begin10:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r1, 0
	move r4, 16
	move r2, r1
	move r3, r1
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end10:
	.size	unlock, .Lfunc_end10-unlock
	.section	.stack_sizes,"o",@progbits,.text.unlock
	.long	.Lfunc_begin10
	.byte	8
	.section	.text.unlock,"ax",@progbits
                                        // -- End function
	.section	.text.sleep,"ax",@progbits
	.globl	sleep                           // -- Begin function sleep
	.type	sleep,@function
sleep:                                  // @sleep
.Lfunc_begin11:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r2, 0
	move r4, 17
	move r3, r2
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end11:
	.size	sleep, .Lfunc_end11-sleep
	.section	.stack_sizes,"o",@progbits,.text.sleep
	.long	.Lfunc_begin11
	.byte	8
	.section	.text.sleep,"ax",@progbits
                                        // -- End function
	.section	.text.wakeup,"ax",@progbits
	.globl	wakeup                          // -- Begin function wakeup
	.type	wakeup,@function
wakeup:                                 // @wakeup
.Lfunc_begin12:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r1, 0
	move r4, 18
	move r2, r1
	move r3, r1
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end12:
	.size	wakeup, .Lfunc_end12-wakeup
	.section	.stack_sizes,"o",@progbits,.text.wakeup
	.long	.Lfunc_begin12
	.byte	8
	.section	.text.wakeup,"ax",@progbits
                                        // -- End function
	.section	.text.create_job,"ax",@progbits
	.globl	create_job                      // -- Begin function create_job
	.type	create_job,@function
create_job:                             // @create_job
.Lfunc_begin13:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r1, 0
	move r4, 20
	move r2, r1
	move r3, r1
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end13:
	.size	create_job, .Lfunc_end13-create_job
	.section	.stack_sizes,"o",@progbits,.text.create_job
	.long	.Lfunc_begin13
	.byte	8
	.section	.text.create_job,"ax",@progbits
                                        // -- End function
	.section	.text.join_job,"ax",@progbits
	.globl	join_job                        // -- Begin function join_job
	.type	join_job,@function
join_job:                               // @join_job
.Lfunc_begin14:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r0, 0
	move r4, 21
	move r1, r0
	move r2, r0
	move r3, r0
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end14:
	.size	join_job, .Lfunc_end14-join_job
	.section	.stack_sizes,"o",@progbits,.text.join_job
	.long	.Lfunc_begin14
	.byte	8
	.section	.text.join_job,"ax",@progbits
                                        // -- End function
	.section	.text.yield,"ax",@progbits
	.globl	yield                           // -- Begin function yield
	.type	yield,@function
yield:                                  // @yield
.Lfunc_begin15:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r0, 0
	move r4, 1
	move r1, r0
	move r2, r0
	move r3, r0
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end15:
	.size	yield, .Lfunc_end15-yield
	.section	.stack_sizes,"o",@progbits,.text.yield
	.long	.Lfunc_begin15
	.byte	8
	.section	.text.yield,"ax",@progbits
                                        // -- End function
	.section	.text.sbrk,"ax",@progbits
	.globl	sbrk                            // -- Begin function sbrk
	.type	sbrk,@function
sbrk:                                   // @sbrk
.Lfunc_begin16:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r1, 0
	move r4, 2
	move r2, r1
	move r3, r1
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end16:
	.size	sbrk, .Lfunc_end16-sbrk
	.section	.stack_sizes,"o",@progbits,.text.sbrk
	.long	.Lfunc_begin16
	.byte	8
	.section	.text.sbrk,"ax",@progbits
                                        // -- End function
	.section	.text.get_pid,"ax",@progbits
	.globl	get_pid                         // -- Begin function get_pid
	.type	get_pid,@function
get_pid:                                // @get_pid
.Lfunc_begin17:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r0, 0
	move r4, 3
	move r1, r0
	move r2, r0
	move r3, r0
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end17:
	.size	get_pid, .Lfunc_end17-get_pid
	.section	.stack_sizes,"o",@progbits,.text.get_pid
	.long	.Lfunc_begin17
	.byte	8
	.section	.text.get_pid,"ax",@progbits
                                        // -- End function
	.section	.text.get_role,"ax",@progbits
	.globl	get_role                        // -- Begin function get_role
	.type	get_role,@function
get_role:                               // @get_role
.Lfunc_begin18:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r0, 0
	move r4, 4
	move r1, r0
	move r2, r0
	move r3, r0
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end18:
	.size	get_role, .Lfunc_end18-get_role
	.section	.stack_sizes,"o",@progbits,.text.get_role
	.long	.Lfunc_begin18
	.byte	8
	.section	.text.get_role,"ax",@progbits
                                        // -- End function
	.section	.text.get_appid,"ax",@progbits
	.globl	get_appid                       // -- Begin function get_appid
	.type	get_appid,@function
get_appid:                              // @get_appid
.Lfunc_begin19:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r0, 0
	move r4, 5
	move r1, r0
	move r2, r0
	move r3, r0
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end19:
	.size	get_appid, .Lfunc_end19-get_appid
	.section	.stack_sizes,"o",@progbits,.text.get_appid
	.long	.Lfunc_begin19
	.byte	8
	.section	.text.get_appid,"ax",@progbits
                                        // -- End function
	.section	.text.umram_read,"ax",@progbits
	.globl	umram_read                      // -- Begin function umram_read
	.type	umram_read,@function
umram_read:                             // @umram_read
.Lfunc_begin20:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r3, 0
	move r4, 22
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end20:
	.size	umram_read, .Lfunc_end20-umram_read
	.section	.stack_sizes,"o",@progbits,.text.umram_read
	.long	.Lfunc_begin20
	.byte	8
	.section	.text.umram_read,"ax",@progbits
                                        // -- End function
	.section	.text.umram_write,"ax",@progbits
	.globl	umram_write                     // -- Begin function umram_write
	.type	umram_write,@function
umram_write:                            // @umram_write
.Lfunc_begin21:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r3, 0
	move r4, 23
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end21:
	.size	umram_write, .Lfunc_end21-umram_write
	.section	.stack_sizes,"o",@progbits,.text.umram_write
	.long	.Lfunc_begin21
	.byte	8
	.section	.text.umram_write,"ax",@progbits
                                        // -- End function
	.section	.text.init_barrier,"ax",@progbits
	.globl	init_barrier                    // -- Begin function init_barrier
	.type	init_barrier,@function
init_barrier:                           // @init_barrier
.Lfunc_begin22:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r14, r1
	move r15, r0
	move r1, 0
	move r4, 14
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r15, 4, 0
	sw r15, 8, r14
	sw r15, 12, 0
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end22:
	.size	init_barrier, .Lfunc_end22-init_barrier
	.section	.stack_sizes,"o",@progbits,.text.init_barrier
	.long	.Lfunc_begin22
	.byte	16
	.section	.text.init_barrier,"ax",@progbits
                                        // -- End function
	.section	.text.wait_barrier,"ax",@progbits
	.globl	wait_barrier                    // -- Begin function wait_barrier
	.type	wait_barrier,@function
wait_barrier:                           // @wait_barrier
.Lfunc_begin23:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r14, r0
	move r1, 0
	move r4, 15
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, r14, 4
	add r0, r0, 1
	sw r14, 4, r0
	lw r1, r14, 8
	jneq r0, r1, .LBB23_2
// %bb.1:
	move r1, 0
	move r4, 18
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r14, 4, 0
	jump .LBB23_3
.LBB23_2:
	move r2, 0
	move r4, 17
	move r0, r14
	move r1, r14
	move r3, r2
	call r23, syscall
.LBB23_3:
	move r1, 0
	move r4, 16
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end23:
	.size	wait_barrier, .Lfunc_end23-wait_barrier
	.section	.stack_sizes,"o",@progbits,.text.wait_barrier
	.long	.Lfunc_begin23
	.byte	16
	.section	.text.wait_barrier,"ax",@progbits
                                        // -- End function
	.section	.text.wait,"ax",@progbits
	.globl	wait                            // -- Begin function wait
	.type	wait,@function
wait:                                   // @wait
.Lfunc_begin24:
// %bb.0:
	jump r23
.Lfunc_end24:
	.size	wait, .Lfunc_end24-wait
	.section	.stack_sizes,"o",@progbits,.text.wait
	.long	.Lfunc_begin24
	.byte	0
	.section	.text.wait,"ax",@progbits
                                        // -- End function
	.section	.text.active_wait_barrier,"ax",@progbits
	.globl	active_wait_barrier             // -- Begin function active_wait_barrier
	.type	active_wait_barrier,@function
active_wait_barrier:                    // @active_wait_barrier
.Lfunc_begin25:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r14, r0
	lw r0, r14, 12
	jeq r0, 0, .LBB25_5
// %bb.1:
	move r0, 100, true, .LBB25_2
.LBB25_4:                               //   in Loop: Header=BB25_2 Depth=1
	lw r1, r14, 12
	jeq r1, 0, .LBB25_5
.LBB25_2:                               // =>This Inner Loop Header: Depth=1
	add r0, r0, -1, nz, .LBB25_4
// %bb.3:                               //   in Loop: Header=BB25_2 Depth=1
	move r0, 0
	move r4, 1
	move r1, r0
	move r2, r0
	move r3, r0
	call r23, syscall
	move r0, 100, true, .LBB25_4
.LBB25_5:                               // =>This Inner Loop Header: Depth=1
	move r1, 0
	move r4, 24
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	jneq r0, 0, .LBB25_5
// %bb.6:
	lw r0, r14, 4
	add r0, r0, 1
	sw r14, 4, r0
	lw r1, r14, 8
	jneq r0, r1, .LBB25_8
// %bb.7:
	sw r14, 4, 0
	jump .LBB25_15
.LBB25_8:
	move r1, 0
	move r4, 16
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, r14, 4
	jeq r0, 0, .LBB25_13
// %bb.9:
	move r1, 100, true, .LBB25_10
.LBB25_12:                              //   in Loop: Header=BB25_10 Depth=1
	jeq r0, 0, .LBB25_13
.LBB25_10:                              // =>This Inner Loop Header: Depth=1
	add r1, r1, -1, nz, .LBB25_12
// %bb.11:                              //   in Loop: Header=BB25_10 Depth=1
	move r0, 0
	move r4, 1
	move r1, r0
	move r2, r0
	move r3, r0
	call r23, syscall
	lw r0, r14, 4
	move r1, 100, true, .LBB25_12
.LBB25_13:                              // =>This Inner Loop Header: Depth=1
	move r1, 0
	move r4, 24
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	jneq r0, 0, .LBB25_13
// %bb.14:
	lw r0, r14, 8
.LBB25_15:
	lw r1, r14, 12
	add r1, r1, 1
	sw r14, 12, r1
	lw r1, r14, 12
	jneq r1, r0, .LBB25_17
// %bb.16:
	sw r14, 12, 0
.LBB25_17:
	move r1, 0
	move r4, 16
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end25:
	.size	active_wait_barrier, .Lfunc_end25-active_wait_barrier
	.section	.stack_sizes,"o",@progbits,.text.active_wait_barrier
	.long	.Lfunc_begin25
	.byte	16
	.section	.text.active_wait_barrier,"ax",@progbits
                                        // -- End function
	.section	.text.init_handshake,"ax",@progbits
	.globl	init_handshake                  // -- Begin function init_handshake
	.type	init_handshake,@function
init_handshake:                         // @init_handshake
.Lfunc_begin26:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r14, r0
	add r0, r14, 4
	move r15, 0
	move r4, 14
	move r1, r15
	move r2, r15
	move r3, r15
	call r23, syscall
	sb r14, 0, 0
	move r0, r15
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end26:
	.size	init_handshake, .Lfunc_end26-init_handshake
	.section	.stack_sizes,"o",@progbits,.text.init_handshake
	.long	.Lfunc_begin26
	.byte	16
	.section	.text.init_handshake,"ax",@progbits
                                        // -- End function
	.section	.text.handshake_wait,"ax",@progbits
	.globl	handshake_wait                  // -- Begin function handshake_wait
	.type	handshake_wait,@function
handshake_wait:                         // @handshake_wait
.Lfunc_begin27:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r15, r0
	add r14, r15, 4
	move r1, 0
	move r4, 15
	move r0, r14
	move r2, r1
	move r3, r1
.LBB27_2:                               // =>This Inner Loop Header: Depth=1
	call r23, syscall
	lbu r0, r15, 0
	jneq r0, 0, .LBB27_3
// %bb.1:                               //   in Loop: Header=BB27_2 Depth=1
	move r2, 0
	move r4, 17
	move r0, r15
	move r1, r14
	move r3, r2, true, .LBB27_2
.LBB27_3:
	sb r15, 0, 0
	move r15, 0
	move r4, 16
	move r0, r14
	move r1, r15
	move r2, r15
	move r3, r15
	call r23, syscall
	move r0, r15
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end27:
	.size	handshake_wait, .Lfunc_end27-handshake_wait
	.section	.stack_sizes,"o",@progbits,.text.handshake_wait
	.long	.Lfunc_begin27
	.byte	16
	.section	.text.handshake_wait,"ax",@progbits
                                        // -- End function
	.section	.text.handshake_notify,"ax",@progbits
	.globl	handshake_notify                // -- Begin function handshake_notify
	.type	handshake_notify,@function
handshake_notify:                       // @handshake_notify
.Lfunc_begin28:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sd r22, -16, d14
	sd r22, -24, d16
	move r14, r0
	add r15, r14, 4
	move r16, 0
	move r4, 15
	move r0, r15
	move r1, r16
	move r2, r16
	move r3, r16
	call r23, syscall
	sb r14, 0, 1
	move r4, 18
	move r0, r14
	move r1, r16
	move r2, r16
	move r3, r16
	call r23, syscall
	move r4, 16
	move r0, r15
	move r1, r16
	move r2, r16
	move r3, r16
	call r23, syscall
	move r0, r16
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end28:
	.size	handshake_notify, .Lfunc_end28-handshake_notify
	.section	.stack_sizes,"o",@progbits,.text.handshake_notify
	.long	.Lfunc_begin28
	.byte	24
	.section	.text.handshake_notify,"ax",@progbits
                                        // -- End function
	.section	.text.main1,"ax",@progbits
	.globl	main1                           // -- Begin function main1
	.type	main1,@function
main1:                                  // @main1
.Lfunc_begin29:
// %bb.0:
	sd r22, 160, d22
	add r22, r22, 168
	sd r22, -144, d14
	sd r22, -152, d16
	sd r22, -160, d18
	sd r22, -168, d20
	move r0, 0
	move r4, 6
	move r1, r0
	move r2, r0
	move r3, r0
	call r23, syscall
	move r17, r0, nz, .LBB29_3
// %bb.1:
	lw r0, zero, sd_host
	add r14, r22, -136
	move r15, 1
	move r16, 0
	move r4, 12
	move r1, r14
	move r2, r15
	move r3, r16
	call r23, syscall
	lw r0, zero, sd_host
	move r4, 11
	move r1, r14
	move r2, r15
	move r3, r16
	call r23, syscall
	move r0, DPU_INPUT_ARGUMENTS
	move r1, 32
	move r4, 22
	move r2, r16
	move r3, r16
	call r23, syscall
	jgts r0, -1, .LBB29_3
// %bb.2:
	call r23, fault_notif
.LBB29_3:
	move r14, b
	move r1, 0
	move r4, 15
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, r14, 4
	add r0, r0, 1
	sw r14, 4, r0
	lw r1, r14, 8
	jneq r0, r1, .LBB29_5
// %bb.4:
	move r1, 0
	move r4, 18
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r14, 4, 0
	jump .LBB29_6
.LBB29_5:
	move r0, b
	move r2, 0
	move r4, 17
	move r1, r0
	move r3, r2
	call r23, syscall
.LBB29_6:
	move r0, b
	move r15, 0
	move r4, 16
	move r1, r15
	move r2, r15
	move r3, r15
	call r23, syscall
	move r1, 3
	move r0, r17
	call r23, print_debug
	move r0, DPU_INPUT_ARGUMENTS
	lw r16, r0, 4
	lw r14, r0, 16
	lw r1, r0, 8
	sw r22, -124, r1
	lw r0, r0, 12
	sw r22, -36, r0
	lsr r0, r14, 4
	move r1, r17
	call r23, __mulsi3
	move r19, r0
	sw r22, -24, r17
	jneq r17, 15, .LBB29_8
// %bb.7:
	not r1, r16
	add r17, r14, r1, true, .LBB29_9
.LBB29_8:
	lsr_add r17, r19, r14, 4
.LBB29_9:
	move r0, 32
	lsl_add r0, r0, r16, 2
	sw r22, -20, r0
	sw r22, -40, r16
	add r0, r14, r16
	sw r22, -16, r0
	move r20, 512
	move r21, 2
	move r0, r20
	move r1, r15
	move r2, r15
	move r3, r15
	move r4, r21
	call r23, syscall
	sw r22, -128, r0
	move r0, r20
	move r1, r15
	move r2, r15
	move r3, r15
	move r4, r21
	call r23, syscall
	sw r22, -120, r0
	move r0, r20
	move r1, r15
	move r2, r15
	move r3, r15
	move r4, r21
	call r23, syscall
	move r18, r0
	move r0, r20
	move r1, r15
	move r2, r15
	move r3, r15
	move r4, r21
	call r23, syscall
	move r16, r0
	move r0, r20
	move r1, r15
	move r2, r15
	move r3, r15
	move r4, r21
	call r23, syscall
	move r14, r0
	move r0, r20
	move r1, r15
	move r2, r15
	move r3, r15
	move r4, r21
	call r23, syscall
	move r1, 2147483647
	jleu r17, r19, .LBB29_35
// %bb.10:
	lw r1, r22, -20
	lsl_add r3, r1, r19, 2
	lw r2, r22, -16
	lsl r1, r2, 2
	sw r22, -28, r3
	lsl_add r21, r3, r2, 2
	lw r2, r22, -128
	add r2, r2, -512
	sw r22, -100, r2
	lw r2, r22, -120
	add r15, r2, -512
	add r2, r18, -512
	sw r22, -128, r2
	add r2, r16, -512
	sw r22, -76, r2
	add r2, r14, -512
	sw r22, -72, r2
	add r18, r0, -512
	add r0, r21, r1
	sw r22, -60, r0
	lw r1, r22, -40
	add r0, r1, -1
	lsr r16, r0, 7
	and r0, r1, 127
	sw r22, -92, r0
	lw r0, r22, -124
	call r23, __mulsi3
	sw r22, -68, r0
	sub r0, r17, r19
	sw r22, -96, r15
	add r1, r15, -512
	sw r22, -64, r1
	move r4, 2147483647
	move r3, 0
	sw r22, -84, r19
	sw r22, -56, r19
	sw r22, -32, r17
	sw r22, -116, r16
	jump .LBB29_11
.LBB29_34:                              //   in Loop: Header=BB29_11 Depth=1
	lw r1, r22, -44
	lw r15, r22, -88
.LBB29_48:                              //   in Loop: Header=BB29_11 Depth=1
	add r21, r21, 512
	lw r0, r22, -60
	add r0, r0, 512
	sw r22, -60, r0
	lw r2, r22, -84
	add r2, r2, 128
	lw r0, r22, -48
	add r0, r0, -128
	move r3, r15
	move r4, r1
	lw r17, r22, -32
	lw r16, r22, -116
	sw r22, -84, r2
	lw r19, r22, -56
	jleu r17, r2, .LBB29_35
.LBB29_11:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB29_18 Depth 2
                                        //       Child Loop BB29_22 Depth 3
                                        //         Child Loop BB29_24 Depth 4
                                        //     Child Loop BB29_45 Depth 2
	sw r22, -80, r0
	jltu r0, 128, .LBB29_13
// %bb.12:                              //   in Loop: Header=BB29_11 Depth=1
	move r1, 128
	sw r22, -80, r1
.LBB29_13:                              //   in Loop: Header=BB29_11 Depth=1
	sw r22, -44, r4
	sw r22, -88, r3
	move r15, r0
	sw r22, -48, r0
	jltu r0, 128, .LBB29_15
// %bb.14:                              //   in Loop: Header=BB29_11 Depth=1
	move r15, 128
.LBB29_15:                              //   in Loop: Header=BB29_11 Depth=1
	sw r22, -52, r21
	lw r0, r22, -84
	sub r17, r17, r0
	move r14, 0
	move r2, 512
	move r0, r18
	move r1, r14
	call r23, __memset_wram_4align
	sw r22, -120, r17
	jltu r17, 128, .LBB29_17
// %bb.16:                              //   in Loop: Header=BB29_11 Depth=1
	move r0, 128
	sw r22, -120, r0
.LBB29_17:                              //   in Loop: Header=BB29_11 Depth=1
	lw r0, r22, -84
	sub r0, r0, r19
	lw r1, r22, -28
	lsl_add r19, r1, r0, 2
	move r21, 32, true, .LBB29_18
.LBB29_28:                              //   in Loop: Header=BB29_18 Depth=2
	lw r21, r22, -108
	add r21, r21, 512
	lw r0, r22, -104
	add r14, r0, 1
	lw r16, r22, -116
	lw r19, r22, -112
	jeq r0, r16, .LBB29_29
.LBB29_18:                              //   Parent Loop BB29_11 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB29_22 Depth 3
                                        //         Child Loop BB29_24 Depth 4
	move r16, r14
	move r14, 512
	move r17, 0
	move r20, 22
	lw r0, r22, -100
	move r1, r14
	move r2, r19
	move r3, r17
	move r4, r20
	call r23, syscall
	add r19, r19, 512
	lw r0, r22, -96
	move r1, r14
	sw r22, -112, r19
	move r2, r19
	move r3, r17
	move r4, r20
	call r23, syscall
	lw r0, r22, -128
	move r1, r14
	sw r22, -108, r21
	move r2, r21
	move r3, r17
	move r4, r20
	call r23, syscall
	lw r0, r22, -92
	lw r1, r22, -116
	sw r22, -104, r16
	jeq r16, r1, .LBB29_20
// %bb.19:                              //   in Loop: Header=BB29_18 Depth=2
	move r0, 128
.LBB29_20:                              //   in Loop: Header=BB29_18 Depth=2
	jeq r0, 0, .LBB29_28
// %bb.21:                              //   in Loop: Header=BB29_18 Depth=2
	move r17, 0
	lw r14, r22, -100
	lw r21, r22, -64
	sw r22, -124, r0
	jump .LBB29_22
.LBB29_27:                              //   in Loop: Header=BB29_22 Depth=3
	add r17, r17, 1
	add r21, r21, 4
	add r14, r14, 4
	lw r0, r22, -124
	jeq r17, r0, .LBB29_28
.LBB29_22:                              //   Parent Loop BB29_11 Depth=1
                                        //     Parent Loop BB29_18 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB29_24 Depth 4
	lw r0, r22, -120
	jeq r0, 0, .LBB29_27
// %bb.23:                              //   in Loop: Header=BB29_22 Depth=3
	move r19, 0
	move r20, r14
	move r16, r21, true, .LBB29_24
.LBB29_26:                              //   in Loop: Header=BB29_24 Depth=4
	lw r1, r0, 0
	lw r0, r22, -128
	lsl_add r0, r0, r17, 2
	lw r0, r0, 0
	call r23, __mulsi3
	lsl_add r1, r18, r19, 2
	lw r2, r1, 0
	add r0, r2, r0
	sw r1, 0, r0
	add r19, r19, 1
	add r16, r16, 4
	add r20, r20, 4
	jeq r15, r19, .LBB29_27
.LBB29_24:                              //   Parent Loop BB29_11 Depth=1
                                        //     Parent Loop BB29_18 Depth=2
                                        //       Parent Loop BB29_22 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	move r0, r16
	add r1, r17, r19
	jgtu r1, 127, .LBB29_26
// %bb.25:                              //   in Loop: Header=BB29_24 Depth=4
	move r0, r20, true, .LBB29_26
.LBB29_29:                              //   in Loop: Header=BB29_11 Depth=1
	move r1, 512
	move r3, 0
	move r4, 22
	lw r0, r22, -76
	lw r21, r22, -52
	move r2, r21
	call r23, syscall
	jges r0, 0, .LBB29_31
// %bb.30:                              //   in Loop: Header=BB29_11 Depth=1
	call r23, fault_notif
.LBB29_31:                              //   in Loop: Header=BB29_11 Depth=1
	move r1, 512
	move r3, 0
	move r4, 22
	lw r0, r22, -72
	lw r2, r22, -60
	call r23, syscall
	lw r17, r22, -40
	lw r19, r22, -36
	lw r14, r22, -56
	jles r0, -1, .LBB29_32
// %bb.33:                              //   in Loop: Header=BB29_11 Depth=1
	lw r0, r22, -120
	jneq r0, 0, .LBB29_44
	jump .LBB29_34
.LBB29_32:                              //   in Loop: Header=BB29_11 Depth=1
	call r23, fault_notif
	lw r0, r22, -120
	jeq r0, 0, .LBB29_34
.LBB29_44:                              //   in Loop: Header=BB29_11 Depth=1
	move r16, 0
	lw r20, r22, -44
	jump .LBB29_45
.LBB29_47:                              //   in Loop: Header=BB29_45 Depth=2
	add r16, r16, 1
	sw r22, -88, r15
	move r20, r1
	lw r0, r22, -80
	jeq r0, r16, .LBB29_48
.LBB29_45:                              //   Parent Loop BB29_11 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lsl_add r0, r18, r16, 2
	lw r1, r22, -76
	lsl_add r1, r1, r16, 2
	lw r1, r1, 0
	lw r14, r0, 0
	lw r0, r22, -68
	call r23, __mulsi3
	lw r1, r22, -72
	lsl_add r1, r1, r16, 2
	lw r1, r1, 0
	sub r14, r14, r0
	move r0, r1
	move r1, r19
	call r23, __mulsi3
	move r1, r0
	move r0, r14
	call r23, __div32
	sub r0, r17, r0
	lsl r1, r0, 1
	lw r0, r22, -84
	add r15, r0, r16
	jlts r1, r20, .LBB29_47
// %bb.46:                              //   in Loop: Header=BB29_45 Depth=2
	move r1, r20
	lw r15, r22, -88
	jump .LBB29_47
.LBB29_35:
	move r0, DPU_RESULTS
	lw r18, r22, -24
	lsl_add r0, r0, r18, 4
	lsl r2, r18, 4
	sw r2, DPU_RESULTS, r1
	sw r0, 4, r15
	move r1, 1
	move r0, r18
	call r23, print_debug
	move r14, b
	move r1, 0
	move r4, 15
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, r14, 4
	add r0, r0, 1
	sw r14, 4, r0
	lw r1, r14, 8
	jneq r0, r1, .LBB29_37
// %bb.36:
	move r1, 0
	move r4, 18
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r14, 4, 0
	jump .LBB29_38
.LBB29_37:
	move r0, b
	move r2, 0
	move r4, 17
	move r1, r0
	move r3, r2
	call r23, syscall
.LBB29_38:
	move r14, b
	move r1, 0
	move r4, 16
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	move r1, 2
	move r0, r18
	call r23, print_debug
	jneq r18, 0, .LBB29_42
// %bb.39:
	lw r1, r22, -16
	lsl r0, r1, 2
	lsl_add r0, r0, r1, 3
	lw r1, r22, -20
	add r2, r1, r0
	move r0, DPU_RESULTS
	move r1, 256
	move r3, 0
	move r4, 23
	call r23, syscall
	jgts r0, -1, .LBB29_41
// %bb.40:
	call r23, fault_notif
.LBB29_41:
	move r15, 0
	move r1, 4
	move r0, r15
	call r23, print_debug
	lw r0, zero, sd_host
	add r16, r22, -132
	move r17, 1
	move r4, 12
	move r1, r16
	move r2, r17
	move r3, r15
	call r23, syscall
	lw r0, zero, sd_host
	move r4, 11
	move r1, r16
	move r2, r17
	move r3, r15
	call r23, syscall
.LBB29_42:
	move r1, 4
	move r0, r18
	call r23, print_debug
	move r1, 0
	move r4, 15
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, r14, 4
	add r0, r0, 1
	sw r14, 4, r0
	lw r1, r14, 8
	jneq r0, r1, .LBB29_49
// %bb.43:
	move r14, b
	move r1, 0
	move r4, 18
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r14, 4, 0
	jump .LBB29_50
.LBB29_49:
	move r0, b
	move r2, 0
	move r4, 17
	move r1, r0
	move r3, r2
	call r23, syscall
.LBB29_50:
	move r0, b
	move r1, 0
	move r4, 16
	move r2, r1
	move r3, r1
	call r23, syscall
	ld d20, r22, -168
	ld d18, r22, -160
	ld d16, r22, -152
	ld d14, r22, -144
	ld d22, r22, -8
	jump r23
.Lfunc_end29:
	.size	main1, .Lfunc_end29-main1
	.section	.stack_sizes,"o",@progbits,.text.main1
	.long	.Lfunc_begin29
	.ascii	"\250\001"
	.section	.text.main1,"ax",@progbits
                                        // -- End function
	.section	.text.main,"ax",@progbits
	.globl	main                            // -- Begin function main
	.type	main,@function
main:                                   // @main
.Lfunc_begin30:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sd r22, -16, d14
	sd r22, -24, d16
	move r0, 7
	move r14, 0
	move r1, r14
	call r23, print_debug
	move r4, 10
	move r0, r14
	move r1, r14
	move r2, r14
	move r3, r14
	call r23, syscall
	sw zero, sd_host, r0
	move r15, b
	move r4, 14
	move r0, r15
	move r1, r14
	move r2, r14
	move r3, r14
	call r23, syscall
	sw r15, 4, 0
	sw r15, 8, 16
	sw r15, 12, 0
	move r16, main1
	move r15, 20
	move r0, r16
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r16
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r16
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r16
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r16
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r16
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r16
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r16
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r16
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r16
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r16
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r16
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r16
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r16
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r16
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	call r23, main1
	move r15, 21
	move r0, r14
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r14
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r14
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r14
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r14
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r14
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r14
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r14
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r14
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r14
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r14
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r14
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r14
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r14
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r14
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	move r0, r14
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end30:
	.size	main, .Lfunc_end30-main
	.section	.stack_sizes,"o",@progbits,.text.main
	.long	.Lfunc_begin30
	.byte	24
	.section	.text.main,"ax",@progbits
                                        // -- End function
	.type	sd_host,@object                 // @sd_host
	.section	.bss.sd_host,"aw",@nobits
	.globl	sd_host
	.p2align	2
sd_host:
	.long	0                               // 0x0
	.size	sd_host, 4

	.type	DPU_INPUT_ARGUMENTS,@object     // @DPU_INPUT_ARGUMENTS
	.section	.bss.DPU_INPUT_ARGUMENTS,"aw",@nobits
	.globl	DPU_INPUT_ARGUMENTS
	.p2align	3
DPU_INPUT_ARGUMENTS:
	.zero	32
	.size	DPU_INPUT_ARGUMENTS, 32

	.type	b,@object                       // @b
	.section	.bss.b,"aw",@nobits
	.globl	b
	.p2align	2
b:
	.zero	16
	.size	b, 16

	.type	DPU_RESULTS,@object             // @DPU_RESULTS
	.section	.bss.DPU_RESULTS,"aw",@nobits
	.globl	DPU_RESULTS
	.p2align	3
DPU_RESULTS:
	.zero	256
	.size	DPU_RESULTS, 256

	.addrsig
	.addrsig_sym main1
	.addrsig_sym DPU_INPUT_ARGUMENTS
	.addrsig_sym b
	.addrsig_sym DPU_RESULTS
