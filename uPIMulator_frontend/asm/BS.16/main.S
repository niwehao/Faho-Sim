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
	.section	.text.exit_proc,"ax",@progbits
	.globl	exit_proc                       // -- Begin function exit_proc
	.type	exit_proc,@function
exit_proc:                              // @exit_proc
.Lfunc_begin5:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r1, 0
	move r4, 7
	move r2, r1
	move r3, r1
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end5:
	.size	exit_proc, .Lfunc_end5-exit_proc
	.section	.stack_sizes,"o",@progbits,.text.exit_proc
	.long	.Lfunc_begin5
	.byte	8
	.section	.text.exit_proc,"ax",@progbits
                                        // -- End function
	.section	.text.debug,"ax",@progbits
	.globl	debug                           // -- Begin function debug
	.type	debug,@function
debug:                                  // @debug
.Lfunc_begin6:
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
.Lfunc_end6:
	.size	debug, .Lfunc_end6-debug
	.section	.stack_sizes,"o",@progbits,.text.debug
	.long	.Lfunc_begin6
	.byte	8
	.section	.text.debug,"ax",@progbits
                                        // -- End function
	.section	.text.debug_int,"ax",@progbits
	.globl	debug_int                       // -- Begin function debug_int
	.type	debug_int,@function
debug_int:                              // @debug_int
.Lfunc_begin7:
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
.Lfunc_end7:
	.size	debug_int, .Lfunc_end7-debug_int
	.section	.stack_sizes,"o",@progbits,.text.debug_int
	.long	.Lfunc_begin7
	.byte	8
	.section	.text.debug_int,"ax",@progbits
                                        // -- End function
	.section	.text.init_lock,"ax",@progbits
	.globl	init_lock                       // -- Begin function init_lock
	.type	init_lock,@function
init_lock:                              // @init_lock
.Lfunc_begin8:
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
.Lfunc_end8:
	.size	init_lock, .Lfunc_end8-init_lock
	.section	.stack_sizes,"o",@progbits,.text.init_lock
	.long	.Lfunc_begin8
	.byte	8
	.section	.text.init_lock,"ax",@progbits
                                        // -- End function
	.section	.text.lock,"ax",@progbits
	.globl	lock                            // -- Begin function lock
	.type	lock,@function
lock:                                   // @lock
.Lfunc_begin9:
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
.Lfunc_end9:
	.size	lock, .Lfunc_end9-lock
	.section	.stack_sizes,"o",@progbits,.text.lock
	.long	.Lfunc_begin9
	.byte	8
	.section	.text.lock,"ax",@progbits
                                        // -- End function
	.section	.text.try_lock,"ax",@progbits
	.globl	try_lock                        // -- Begin function try_lock
	.type	try_lock,@function
try_lock:                               // @try_lock
.Lfunc_begin10:
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
.Lfunc_end10:
	.size	try_lock, .Lfunc_end10-try_lock
	.section	.stack_sizes,"o",@progbits,.text.try_lock
	.long	.Lfunc_begin10
	.byte	8
	.section	.text.try_lock,"ax",@progbits
                                        // -- End function
	.section	.text.unlock,"ax",@progbits
	.globl	unlock                          // -- Begin function unlock
	.type	unlock,@function
unlock:                                 // @unlock
.Lfunc_begin11:
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
.Lfunc_end11:
	.size	unlock, .Lfunc_end11-unlock
	.section	.stack_sizes,"o",@progbits,.text.unlock
	.long	.Lfunc_begin11
	.byte	8
	.section	.text.unlock,"ax",@progbits
                                        // -- End function
	.section	.text.sleep,"ax",@progbits
	.globl	sleep                           // -- Begin function sleep
	.type	sleep,@function
sleep:                                  // @sleep
.Lfunc_begin12:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r2, 0
	move r4, 17
	move r3, r2
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end12:
	.size	sleep, .Lfunc_end12-sleep
	.section	.stack_sizes,"o",@progbits,.text.sleep
	.long	.Lfunc_begin12
	.byte	8
	.section	.text.sleep,"ax",@progbits
                                        // -- End function
	.section	.text.wakeup,"ax",@progbits
	.globl	wakeup                          // -- Begin function wakeup
	.type	wakeup,@function
wakeup:                                 // @wakeup
.Lfunc_begin13:
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
.Lfunc_end13:
	.size	wakeup, .Lfunc_end13-wakeup
	.section	.stack_sizes,"o",@progbits,.text.wakeup
	.long	.Lfunc_begin13
	.byte	8
	.section	.text.wakeup,"ax",@progbits
                                        // -- End function
	.section	.text.create_job,"ax",@progbits
	.globl	create_job                      // -- Begin function create_job
	.type	create_job,@function
create_job:                             // @create_job
.Lfunc_begin14:
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
.Lfunc_end14:
	.size	create_job, .Lfunc_end14-create_job
	.section	.stack_sizes,"o",@progbits,.text.create_job
	.long	.Lfunc_begin14
	.byte	8
	.section	.text.create_job,"ax",@progbits
                                        // -- End function
	.section	.text.join_job,"ax",@progbits
	.globl	join_job                        // -- Begin function join_job
	.type	join_job,@function
join_job:                               // @join_job
.Lfunc_begin15:
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
.Lfunc_end15:
	.size	join_job, .Lfunc_end15-join_job
	.section	.stack_sizes,"o",@progbits,.text.join_job
	.long	.Lfunc_begin15
	.byte	8
	.section	.text.join_job,"ax",@progbits
                                        // -- End function
	.section	.text.yield,"ax",@progbits
	.globl	yield                           // -- Begin function yield
	.type	yield,@function
yield:                                  // @yield
.Lfunc_begin16:
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
.Lfunc_end16:
	.size	yield, .Lfunc_end16-yield
	.section	.stack_sizes,"o",@progbits,.text.yield
	.long	.Lfunc_begin16
	.byte	8
	.section	.text.yield,"ax",@progbits
                                        // -- End function
	.section	.text.sbrk,"ax",@progbits
	.globl	sbrk                            // -- Begin function sbrk
	.type	sbrk,@function
sbrk:                                   // @sbrk
.Lfunc_begin17:
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
.Lfunc_end17:
	.size	sbrk, .Lfunc_end17-sbrk
	.section	.stack_sizes,"o",@progbits,.text.sbrk
	.long	.Lfunc_begin17
	.byte	8
	.section	.text.sbrk,"ax",@progbits
                                        // -- End function
	.section	.text.get_pid,"ax",@progbits
	.globl	get_pid                         // -- Begin function get_pid
	.type	get_pid,@function
get_pid:                                // @get_pid
.Lfunc_begin18:
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
.Lfunc_end18:
	.size	get_pid, .Lfunc_end18-get_pid
	.section	.stack_sizes,"o",@progbits,.text.get_pid
	.long	.Lfunc_begin18
	.byte	8
	.section	.text.get_pid,"ax",@progbits
                                        // -- End function
	.section	.text.get_role,"ax",@progbits
	.globl	get_role                        // -- Begin function get_role
	.type	get_role,@function
get_role:                               // @get_role
.Lfunc_begin19:
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
.Lfunc_end19:
	.size	get_role, .Lfunc_end19-get_role
	.section	.stack_sizes,"o",@progbits,.text.get_role
	.long	.Lfunc_begin19
	.byte	8
	.section	.text.get_role,"ax",@progbits
                                        // -- End function
	.section	.text.get_appid,"ax",@progbits
	.globl	get_appid                       // -- Begin function get_appid
	.type	get_appid,@function
get_appid:                              // @get_appid
.Lfunc_begin20:
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
.Lfunc_end20:
	.size	get_appid, .Lfunc_end20-get_appid
	.section	.stack_sizes,"o",@progbits,.text.get_appid
	.long	.Lfunc_begin20
	.byte	8
	.section	.text.get_appid,"ax",@progbits
                                        // -- End function
	.section	.text.umram_read,"ax",@progbits
	.globl	umram_read                      // -- Begin function umram_read
	.type	umram_read,@function
umram_read:                             // @umram_read
.Lfunc_begin21:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r3, 0
	move r4, 22
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end21:
	.size	umram_read, .Lfunc_end21-umram_read
	.section	.stack_sizes,"o",@progbits,.text.umram_read
	.long	.Lfunc_begin21
	.byte	8
	.section	.text.umram_read,"ax",@progbits
                                        // -- End function
	.section	.text.umram_write,"ax",@progbits
	.globl	umram_write                     // -- Begin function umram_write
	.type	umram_write,@function
umram_write:                            // @umram_write
.Lfunc_begin22:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r3, 0
	move r4, 23
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end22:
	.size	umram_write, .Lfunc_end22-umram_write
	.section	.stack_sizes,"o",@progbits,.text.umram_write
	.long	.Lfunc_begin22
	.byte	8
	.section	.text.umram_write,"ax",@progbits
                                        // -- End function
	.section	.text.init_barrier,"ax",@progbits
	.globl	init_barrier                    // -- Begin function init_barrier
	.type	init_barrier,@function
init_barrier:                           // @init_barrier
.Lfunc_begin23:
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
.Lfunc_end23:
	.size	init_barrier, .Lfunc_end23-init_barrier
	.section	.stack_sizes,"o",@progbits,.text.init_barrier
	.long	.Lfunc_begin23
	.byte	16
	.section	.text.init_barrier,"ax",@progbits
                                        // -- End function
	.section	.text.wait_barrier,"ax",@progbits
	.globl	wait_barrier                    // -- Begin function wait_barrier
	.type	wait_barrier,@function
wait_barrier:                           // @wait_barrier
.Lfunc_begin24:
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
	jneq r0, r1, .LBB24_2
// %bb.1:
	move r1, 0
	move r4, 18
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r14, 4, 0
	jump .LBB24_3
.LBB24_2:
	move r2, 0
	move r4, 17
	move r0, r14
	move r1, r14
	move r3, r2
	call r23, syscall
.LBB24_3:
	move r1, 0
	move r4, 16
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end24:
	.size	wait_barrier, .Lfunc_end24-wait_barrier
	.section	.stack_sizes,"o",@progbits,.text.wait_barrier
	.long	.Lfunc_begin24
	.byte	16
	.section	.text.wait_barrier,"ax",@progbits
                                        // -- End function
	.section	.text.wait,"ax",@progbits
	.globl	wait                            // -- Begin function wait
	.type	wait,@function
wait:                                   // @wait
.Lfunc_begin25:
// %bb.0:
	jump r23
.Lfunc_end25:
	.size	wait, .Lfunc_end25-wait
	.section	.stack_sizes,"o",@progbits,.text.wait
	.long	.Lfunc_begin25
	.byte	0
	.section	.text.wait,"ax",@progbits
                                        // -- End function
	.section	.text.active_wait_barrier,"ax",@progbits
	.globl	active_wait_barrier             // -- Begin function active_wait_barrier
	.type	active_wait_barrier,@function
active_wait_barrier:                    // @active_wait_barrier
.Lfunc_begin26:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r14, r0
	lw r0, r14, 12
	jeq r0, 0, .LBB26_5
// %bb.1:
	move r0, 100, true, .LBB26_2
.LBB26_4:                               //   in Loop: Header=BB26_2 Depth=1
	lw r1, r14, 12
	jeq r1, 0, .LBB26_5
.LBB26_2:                               // =>This Inner Loop Header: Depth=1
	add r0, r0, -1, nz, .LBB26_4
// %bb.3:                               //   in Loop: Header=BB26_2 Depth=1
	move r0, 0
	move r4, 1
	move r1, r0
	move r2, r0
	move r3, r0
	call r23, syscall
	move r0, 100, true, .LBB26_4
.LBB26_5:                               // =>This Inner Loop Header: Depth=1
	move r1, 0
	move r4, 24
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	jneq r0, 0, .LBB26_5
// %bb.6:
	lw r0, r14, 4
	add r0, r0, 1
	sw r14, 4, r0
	lw r1, r14, 8
	jneq r0, r1, .LBB26_8
// %bb.7:
	sw r14, 4, 0
	jump .LBB26_15
.LBB26_8:
	move r1, 0
	move r4, 16
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, r14, 4
	jeq r0, 0, .LBB26_13
// %bb.9:
	move r1, 100, true, .LBB26_10
.LBB26_12:                              //   in Loop: Header=BB26_10 Depth=1
	jeq r0, 0, .LBB26_13
.LBB26_10:                              // =>This Inner Loop Header: Depth=1
	add r1, r1, -1, nz, .LBB26_12
// %bb.11:                              //   in Loop: Header=BB26_10 Depth=1
	move r0, 0
	move r4, 1
	move r1, r0
	move r2, r0
	move r3, r0
	call r23, syscall
	lw r0, r14, 4
	move r1, 100, true, .LBB26_12
.LBB26_13:                              // =>This Inner Loop Header: Depth=1
	move r1, 0
	move r4, 24
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	jneq r0, 0, .LBB26_13
// %bb.14:
	lw r0, r14, 8
.LBB26_15:
	lw r1, r14, 12
	add r1, r1, 1
	sw r14, 12, r1
	lw r1, r14, 12
	jneq r1, r0, .LBB26_17
// %bb.16:
	sw r14, 12, 0
.LBB26_17:
	move r1, 0
	move r4, 16
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end26:
	.size	active_wait_barrier, .Lfunc_end26-active_wait_barrier
	.section	.stack_sizes,"o",@progbits,.text.active_wait_barrier
	.long	.Lfunc_begin26
	.byte	16
	.section	.text.active_wait_barrier,"ax",@progbits
                                        // -- End function
	.section	.text.init_handshake,"ax",@progbits
	.globl	init_handshake                  // -- Begin function init_handshake
	.type	init_handshake,@function
init_handshake:                         // @init_handshake
.Lfunc_begin27:
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
.Lfunc_end27:
	.size	init_handshake, .Lfunc_end27-init_handshake
	.section	.stack_sizes,"o",@progbits,.text.init_handshake
	.long	.Lfunc_begin27
	.byte	16
	.section	.text.init_handshake,"ax",@progbits
                                        // -- End function
	.section	.text.handshake_wait,"ax",@progbits
	.globl	handshake_wait                  // -- Begin function handshake_wait
	.type	handshake_wait,@function
handshake_wait:                         // @handshake_wait
.Lfunc_begin28:
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
.LBB28_2:                               // =>This Inner Loop Header: Depth=1
	call r23, syscall
	lbu r0, r15, 0
	jneq r0, 0, .LBB28_3
// %bb.1:                               //   in Loop: Header=BB28_2 Depth=1
	move r2, 0
	move r4, 17
	move r0, r15
	move r1, r14
	move r3, r2, true, .LBB28_2
.LBB28_3:
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
.Lfunc_end28:
	.size	handshake_wait, .Lfunc_end28-handshake_wait
	.section	.stack_sizes,"o",@progbits,.text.handshake_wait
	.long	.Lfunc_begin28
	.byte	16
	.section	.text.handshake_wait,"ax",@progbits
                                        // -- End function
	.section	.text.handshake_notify,"ax",@progbits
	.globl	handshake_notify                // -- Begin function handshake_notify
	.type	handshake_notify,@function
handshake_notify:                       // @handshake_notify
.Lfunc_begin29:
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
.Lfunc_end29:
	.size	handshake_notify, .Lfunc_end29-handshake_notify
	.section	.stack_sizes,"o",@progbits,.text.handshake_notify
	.long	.Lfunc_begin29
	.byte	24
	.section	.text.handshake_notify,"ax",@progbits
                                        // -- End function
	.section	.text.main1,"ax",@progbits
	.globl	main1                           // -- Begin function main1
	.type	main1,@function
main1:                                  // @main1
.Lfunc_begin30:
// %bb.0:
	sd r22, 104, d22
	add r22, r22, 112
	sd r22, -88, d14
	sd r22, -96, d16
	sd r22, -104, d18
	sd r22, -112, d20
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
	jneq r0, r1, .LBB30_2
// %bb.1:
	move r1, 0
	move r4, 18
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r14, 4, 0
	jump .LBB30_3
.LBB30_2:
	move r0, b
	move r2, 0
	move r4, 17
	move r1, r0
	move r3, r2
	call r23, syscall
.LBB30_3:
	move r14, b
	move r15, 0
	move r4, 16
	move r0, r14
	move r1, r15
	move r2, r15
	move r3, r15
	call r23, syscall
	move r4, 6
	move r0, r15
	move r1, r15
	move r2, r15
	move r3, r15
	call r23, syscall
	jneq r0, 0, .LBB30_6
// %bb.4:
	lw r0, zero, sd_host
	add r15, r22, -80
	move r16, 1
	move r17, 0
	move r4, 12
	move r1, r15
	move r2, r16
	move r3, r17
	call r23, syscall
	lw r0, zero, sd_host
	move r4, 11
	move r1, r15
	move r2, r16
	move r3, r17
	call r23, syscall
	move r0, DPU_INPUT_ARGUMENTS
	move r1, 24
	move r4, 22
	move r2, r17
	move r3, r17
	call r23, syscall
	jgts r0, -1, .LBB30_6
// %bb.5:
	move r0, 3
	move r1, 0
	move r4, 7
	move r2, r1
	move r3, r1
	call r23, syscall
.LBB30_6:
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
	jneq r0, r1, .LBB30_8
// %bb.7:
	move r14, b
	move r1, 0
	move r4, 18
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r14, 4, 0
	jump .LBB30_9
.LBB30_8:
	move r0, b
	move r2, 0
	move r4, 17
	move r1, r0
	move r3, r2
	call r23, syscall
.LBB30_9:
	move r0, b
	move r15, 0
	move r4, 16
	sw r22, -24, r0
	move r1, r15
	move r2, r15
	move r3, r15
	call r23, syscall
	ld d0, zero, DPU_INPUT_ARGUMENTS
	move r21, DPU_INPUT_ARGUMENTS
	lslx r2, r1, 3
	lsl_add r2, r2, r0, 3
	lsl r3, r1, 3
	sd r22, -16, d2
	add r1, r3, 24
	addc r0, r2, 0
	sd r22, -48, d0
	move r19, 6
	move r0, r15
	move r1, r15
	move r2, r15
	move r3, r15
	move r4, r19
	call r23, syscall
	move r14, r0
	ld d0, r21, 8
	sd r22, -56, d0
	move r18, 1024
	move r20, 2
	move r0, r18
	move r1, r15
	move r2, r15
	move r3, r15
	move r4, r20
	call r23, syscall
	move r16, r0
	move r0, r18
	move r1, r15
	move r2, r15
	move r3, r15
	move r4, r20
	call r23, syscall
	move r17, r0
	move r0, r18
	move r1, r15
	move r2, r15
	move r3, r15
	move r4, r20
	call r23, syscall
	move r18, r0
	move r0, r15
	move r1, r15
	move r2, r15
	move r3, r15
	move r4, r19
	call r23, syscall
	ld d2, r21, 8
	move.s d4, 5
	sw r22, -28, r0
	sub zero, r3, r5
	subc zero, r2, r4, geu, .LBB30_10
.LBB30_24:
	move r1, 0
	move r4, 15
	lw r14, r22, -24
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, r14, 4
	add r0, r0, 1
	sw r14, 4, r0
	lw r1, r14, 8
	jneq r0, r1, .LBB30_26
// %bb.25:
	move r14, b
	move r1, 0
	move r4, 18
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r14, 4, 0
	jump .LBB30_27
.LBB30_10:
	add r16, r16, -1024
	add r0, r17, -1024
	sw r22, -40, r0
	add r0, r18, -1024
	sw r22, -36, r0
	lsl r0, r14, 3
	move.s d20, r0
	move.s d2, 5
	ld d0, r22, -56
	call r23, __udivdi3
	movd d2, d0
	movd d0, d20
	call r23, __muldi3
	ld d2, r22, -48
	add r15, r1, r3
	addc r14, r0, r2
	add r0, r3, -8192
	sw r22, -32, r0
	add r0, r3, 24
	lsr r0, r0, 1
	and r17, r0, 2147483640
	move.s d18, 0
	jump .LBB30_11
.LBB30_43:                              //   in Loop: Header=BB30_11 Depth=1
	add r0, r20, -24
	lsr_add r0, r21, r0, 3
.LBB30_22:                              //   in Loop: Header=BB30_11 Depth=1
	move.u d0, r0
	lw r2, r22, -28
	lsl r2, r2, 3
	sd r2, DPU_RESULTS, d0
.LBB30_23:                              //   in Loop: Header=BB30_11 Depth=1
	move r0, DPU_INPUT_ARGUMENTS
	ld d0, r0, 8
	ld d14, r22, -56
	add r15, r15, 8
	add r19, r19, 1
	addc r18, r18, 0
	move.s d2, 5
	call r23, __udivdi3
	sub zero, r19, r1
	subc zero, r18, r0, geu, .LBB30_24
.LBB30_11:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB30_13 Depth 2
                                        //       Child Loop BB30_40 Depth 3
                                        //     Child Loop BB30_19 Depth 2
                                        //     Child Loop BB30_35 Depth 2
	add r0, r22, -72
	move r1, 8
	move r20, 0
	move r21, 22
	sd r22, -56, d14
	move r2, r15
	move r3, r20
	move r4, r21
	call r23, syscall
	move r15, 1024
	move r14, 24
	lw r0, r22, -40
	move r1, r15
	move r2, r14
	move r3, r20
	move r4, r21
	call r23, syscall
	lw r0, r22, -36
	move r1, r15
	lw r2, r22, -32
	move r3, r20
	move r4, r21
	call r23, syscall
	move r21, 1048
	ld d0, r22, -48
	move r15, r1
	lsr r0, r17, 3
	jgeu r0, 131, .LBB30_12
.LBB30_16:                              //   in Loop: Header=BB30_11 Depth=1
	move r1, 1024
	move r20, 0
	move r4, 22
	move r0, r16
	move r2, r14
	move r3, r20
	call r23, syscall
	ld d0, r22, -72
	ld d2, r16, 0
	sub zero, r3, r1
	subc zero, r2, r0, xles, .LBB30_17
.LBB30_31:                              //   in Loop: Header=BB30_11 Depth=1
	sub r15, r15, r21
	move r3, 0
	move r4, 22
	move r0, r16
	move r1, r15
	move r2, r21
	call r23, syscall
	lsr r2, r15, 3, z, .LBB30_23
// %bb.32:                              //   in Loop: Header=BB30_11 Depth=1
	ld d0, r22, -72
	ld d6, r16, 0
	sub zero, r7, r1
	subc zero, r6, r0, xgts, .LBB30_23
// %bb.33:                              //   in Loop: Header=BB30_11 Depth=1
	move r4, 0
	jneq r7, r1, .LBB30_47
// %bb.46:                              //   in Loop: Header=BB30_11 Depth=1
	jeq r6, r0, .LBB30_37
.LBB30_47:                              //   in Loop: Header=BB30_11 Depth=1
// %bb.34:                              //   in Loop: Header=BB30_11 Depth=1
	add r2, r2, -1
	move r3, 0
.LBB30_35:                              //   Parent Loop BB30_11 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	jeq r2, r3, .LBB30_23
// %bb.36:                              //   in Loop: Header=BB30_35 Depth=2
	lsl_add r4, r16, r3, 3
	ld d6, r4, 8
	add r4, r3, 1
	move r3, r4
	jneq r7, r1, .LBB30_35
// %bb.48:                              //   in Loop: Header=BB30_35 Depth=2
	jneq r6, r0, .LBB30_35
// %bb.49:                              //   in Loop: Header=BB30_35 Depth=2
.LBB30_37:                              //   in Loop: Header=BB30_11 Depth=1
	add r0, r14, 1000
	lsr_add r0, r4, r0, 3, true, .LBB30_22
.LBB30_12:                              //   in Loop: Header=BB30_11 Depth=1
	move r14, 24
	move r20, r17
	ld d0, r22, -48
	move r15, r1
.LBB30_13:                              //   Parent Loop BB30_11 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB30_40 Depth 3
	move r1, 1024
	move r21, 0
	move r4, 22
	move r0, r16
	move r2, r20
	move r3, r21
	call r23, syscall
	ld d0, r22, -72
	ld d2, r16, 0
	sub zero, r3, r1
	subc zero, r2, r0, xles, .LBB30_38
// %bb.14:                              //   in Loop: Header=BB30_13 Depth=2
	move r15, r20, true, .LBB30_15
.LBB30_38:                              //   in Loop: Header=BB30_13 Depth=2
	jneq r3, r1, .LBB30_51
// %bb.50:                              //   in Loop: Header=BB30_13 Depth=2
	jeq r2, r0, .LBB30_43
.LBB30_51:                              //   in Loop: Header=BB30_13 Depth=2
// %bb.39:                              //   in Loop: Header=BB30_13 Depth=2
	move r2, 0
.LBB30_40:                              //   Parent Loop BB30_11 Depth=1
                                        //     Parent Loop BB30_13 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	jeq r2, 127, .LBB30_41
// %bb.42:                              //   in Loop: Header=BB30_40 Depth=3
	lsl_add r3, r16, r2, 3
	ld d4, r3, 8
	add r21, r2, 1
	move r2, r21
	jneq r5, r1, .LBB30_40
// %bb.52:                              //   in Loop: Header=BB30_40 Depth=3
	jneq r4, r0, .LBB30_40
// %bb.53:                              //   in Loop: Header=BB30_40 Depth=3
	jump .LBB30_43
.LBB30_41:                              //   in Loop: Header=BB30_13 Depth=2
	move r14, r20
.LBB30_15:                              //   in Loop: Header=BB30_13 Depth=2
	add r0, r14, r15
	lsr r0, r0, 1
	and r20, r0, 2147483640
	add r21, r14, 1024
	jgeu r20, r21, .LBB30_13
	jump .LBB30_16
.LBB30_17:                              //   in Loop: Header=BB30_11 Depth=1
	jneq r3, r1, .LBB30_55
// %bb.54:                              //   in Loop: Header=BB30_11 Depth=1
	jeq r2, r0, .LBB30_21
.LBB30_55:                              //   in Loop: Header=BB30_11 Depth=1
// %bb.18:                              //   in Loop: Header=BB30_11 Depth=1
	move r2, 0
.LBB30_19:                              //   Parent Loop BB30_11 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	jeq r2, 127, .LBB30_31
// %bb.20:                              //   in Loop: Header=BB30_19 Depth=2
	lsl_add r3, r16, r2, 3
	ld d4, r3, 8
	add r20, r2, 1
	move r2, r20
	jneq r5, r1, .LBB30_19
// %bb.56:                              //   in Loop: Header=BB30_19 Depth=2
	jneq r4, r0, .LBB30_19
// %bb.57:                              //   in Loop: Header=BB30_19 Depth=2
.LBB30_21:                              //   in Loop: Header=BB30_11 Depth=1
	add r0, r14, -24
	lsr_add r0, r20, r0, 3, true, .LBB30_22
.LBB30_26:
	move r0, b
	move r2, 0
	move r4, 17
	move r1, r0
	move r3, r2
	call r23, syscall
.LBB30_27:
	move r14, b
	move r15, 0
	move r4, 16
	move r0, r14
	move r1, r15
	move r2, r15
	move r3, r15
	call r23, syscall
	move r4, 6
	move r0, r15
	move r1, r15
	move r2, r15
	move r3, r15
	call r23, syscall
	jneq r0, 0, .LBB30_29
// %bb.28:
	ld d0, r22, -16
	ld d2, r22, -48
	add r3, r3, r1
	addc r2, r2, r0
	move r0, DPU_RESULTS
	move r1, 40
	move r15, 0
	move r4, 23
	move r2, r3
	move r3, r15
	call r23, syscall
	lw r0, zero, sd_host
	add r16, r22, -64
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
.LBB30_29:
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
	jneq r0, r1, .LBB30_44
// %bb.30:
	move r14, b
	move r1, 0
	move r4, 18
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r14, 4, 0
	jump .LBB30_45
.LBB30_44:
	move r0, b
	move r2, 0
	move r4, 17
	move r1, r0
	move r3, r2
	call r23, syscall
.LBB30_45:
	move r0, b
	move r1, 0
	move r4, 16
	move r2, r1
	move r3, r1
	call r23, syscall
	ld d20, r22, -112
	ld d18, r22, -104
	ld d16, r22, -96
	ld d14, r22, -88
	ld d22, r22, -8
	jump r23
.Lfunc_end30:
	.size	main1, .Lfunc_end30-main1
	.section	.stack_sizes,"o",@progbits,.text.main1
	.long	.Lfunc_begin30
	.byte	112
	.section	.text.main1,"ax",@progbits
                                        // -- End function
	.section	.text.main,"ax",@progbits
	.globl	main                            // -- Begin function main
	.type	main,@function
main:                                   // @main
.Lfunc_begin31:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sd r22, -16, d14
	sd r22, -24, d16
	move r14, 0
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
	sw r15, 8, 5
	sw r15, 12, 0
	move r15, main1
	move r16, 20
	move r0, r15
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r16
	call r23, syscall
	move r0, r15
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r16
	call r23, syscall
	move r0, r15
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r16
	call r23, syscall
	move r0, r15
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r16
	call r23, syscall
	call r23, main1
	move r0, r14
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end31:
	.size	main, .Lfunc_end31-main
	.section	.stack_sizes,"o",@progbits,.text.main
	.long	.Lfunc_begin31
	.byte	24
	.section	.text.main,"ax",@progbits
                                        // -- End function
	.type	b,@object                       // @b
	.section	.bss.b,"aw",@nobits
	.globl	b
	.p2align	2
b:
	.zero	16
	.size	b, 16

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
	.zero	24
	.size	DPU_INPUT_ARGUMENTS, 24

	.type	DPU_RESULTS,@object             // @DPU_RESULTS
	.section	.bss.DPU_RESULTS,"aw",@nobits
	.globl	DPU_RESULTS
	.p2align	3
DPU_RESULTS:
	.zero	40
	.size	DPU_RESULTS, 40

	.addrsig
	.addrsig_sym main1
	.addrsig_sym b
	.addrsig_sym DPU_INPUT_ARGUMENTS
	.addrsig_sym DPU_RESULTS
