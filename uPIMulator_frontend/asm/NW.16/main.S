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
	.section	.text.maximum,"ax",@progbits
	.globl	maximum                         // -- Begin function maximum
	.type	maximum,@function
maximum:                                // @maximum
.Lfunc_begin30:
// %bb.0:
	jles r0, r1, .LBB30_1
// %bb.2:
	jles r0, r2, .LBB30_3
.LBB30_4:
	jump r23
.LBB30_1:
	move r0, r1
	jgts r0, r2, .LBB30_4
.LBB30_3:
	move r0, r2
	jump r23
.Lfunc_end30:
	.size	maximum, .Lfunc_end30-maximum
	.section	.stack_sizes,"o",@progbits,.text.maximum
	.long	.Lfunc_begin30
	.byte	0
	.section	.text.maximum,"ax",@progbits
                                        // -- End function
	.section	.text.main,"ax",@progbits
	.globl	main                            // -- Begin function main
	.type	main,@function
main:                                   // @main
.Lfunc_begin31:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r0, nr_tasklets
	sw r0, 0, 4
	move r14, my_barrier
	move r15, 0
	move r4, 14
	move r0, r14
	move r1, r15
	move r2, r15
	move r3, r15
	call r23, syscall
	sw r14, 4, 0
	sw r14, 8, 4
	sw r14, 12, 0
	move r4, 10
	move r0, r15
	move r1, r15
	move r2, r15
	move r3, r15
	call r23, syscall
	lw r1, zero, nr_tasklets
	sw zero, sd_host, r0
	jlts r1, 2, .LBB31_3
// %bb.1:
	move r14, 1
.LBB31_2:                               // =>This Inner Loop Header: Depth=1
	move r0, main1
	move r1, 0
	move r4, 20
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, zero, nr_tasklets
	add r14, r14, 1
	jlts r14, r0, .LBB31_2
.LBB31_3:
	call r23, main1
.Lfunc_end31:
	.size	main, .Lfunc_end31-main
	.section	.stack_sizes,"o",@progbits,.text.main
	.long	.Lfunc_begin31
	.byte	16
	.section	.text.main,"ax",@progbits
                                        // -- End function
	.section	.text.main1,"ax",@progbits
	.globl	main1                           // -- Begin function main1
	.type	main1,@function
main1:                                  // @main1
.Lfunc_begin32:
// %bb.0:
	sd r22, 160, d22
	add r22, r22, 168
	sd r22, -144, d14
	sd r22, -152, d16
	sd r22, -160, d18
	sd r22, -168, d20
	move r14, 0
	move r4, 6
	move r0, r14
	move r1, r14
	move r2, r14
	move r3, r14
	call r23, syscall
	move r18, r0
	move r0, 120
	move r16, 2
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r16
	call r23, syscall
	move r17, r0
	add r0, r17, -120
	sw r22, -100, r0
	move r0, 64
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r16
	call r23, syscall
	add r3, r0, -64
	add r2, r17, -96
	add r1, r17, -72
	sw r22, -108, r1
	add r1, r17, -48
	sw r22, -112, r1
	add r1, r17, -24
	sw r22, -104, r1
	move r17, r18
	add r1, r0, -48
	sw r22, -128, r1
	add r1, r0, -32
	sw r22, -124, r1
	add r0, r0, -16
	sw r22, -120, r0
	sw r22, -40, r17
	move r16, r2
	sw r22, -116, r2
	sw r22, -96, r3
.LBB32_1:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB32_11 Depth 2
                                        //       Child Loop BB32_12 Depth 3
                                        //         Child Loop BB32_18 Depth 4
                                        //       Child Loop BB32_88 Depth 3
                                        //         Child Loop BB32_94 Depth 4
	move r18, my_barrier
	move r1, 0
	move r4, 15
	move r0, r18
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, r18, 4
	add r0, r0, 1
	sw r18, 4, r0
	lw r1, r18, 8
	jneq r0, r1, .LBB32_3
// %bb.2:                               //   in Loop: Header=BB32_1 Depth=1
	move r1, 0
	move r4, 18
	move r0, r18
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r18, 4, 0
	jump .LBB32_4
.LBB32_3:                               //   in Loop: Header=BB32_1 Depth=1
	move r0, my_barrier
	move r2, 0
	move r4, 17
	move r1, r0
	move r3, r2
	call r23, syscall
.LBB32_4:                               //   in Loop: Header=BB32_1 Depth=1
	move r18, my_barrier
	move r1, 0
	move r4, 16
	move r0, r18
	move r2, r1
	move r3, r1
	call r23, syscall
	jneq r17, 0, .LBB32_6
// %bb.5:                               //   in Loop: Header=BB32_1 Depth=1
	sb r22, -136, 1
	lw r0, zero, sd_host
	add r1, r22, -136
	move r2, 1
	move r19, 0
	move r4, 12
	move r3, r19
	call r23, syscall
	lw r0, zero, sd_host
	move r1, DPU_INPUT_ARGUMENTS
	move r2, 16
	move r4, 11
	move r3, r19
	call r23, syscall
.LBB32_6:                               //   in Loop: Header=BB32_1 Depth=1
	move r1, 0
	move r4, 15
	move r0, r18
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, r18, 4
	add r0, r0, 1
	sw r18, 4, r0
	lw r1, r18, 8
	jneq r0, r1, .LBB32_8
// %bb.7:                               //   in Loop: Header=BB32_1 Depth=1
	move r18, my_barrier
	move r1, 0
	move r4, 18
	move r0, r18
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r18, 4, 0
	jump .LBB32_9
.LBB32_8:                               //   in Loop: Header=BB32_1 Depth=1
	move r0, my_barrier
	move r2, 0
	move r4, 17
	move r1, r0
	move r3, r2
	call r23, syscall
.LBB32_9:                               //   in Loop: Header=BB32_1 Depth=1
	move r0, my_barrier
	move r1, 0
	move r4, 16
	move r2, r1
	sw r22, -32, r1
	move r3, r1
	call r23, syscall
	lw r0, zero, DPU_INPUT_ARGUMENTS
	sw r22, -12, r0
	jeq r0, 0, .LBB32_1
// %bb.10:                              //   in Loop: Header=BB32_1 Depth=1
	move r0, DPU_INPUT_ARGUMENTS
	lw r1, r0, 4
	lw r0, r0, 8
	sw r22, -92, r0
	lsl r0, r1, 3
	lsl_add r0, r0, r1, 9
	lsl_add r0, r0, r1, 10
	lsl_add r0, r0, r1, 16
	add r1, r0, 1520
	add r0, r0, 4080
	sw r22, -28, r0
	move r2, 2064
	lw r3, r22, -32
	jump .LBB32_11
.LBB32_163:                             //   in Loop: Header=BB32_11 Depth=2
	lw r0, r22, -32
	add r0, r0, 67080
	sw r22, -32, r0
	lw r3, r22, -16
	add r3, r3, 1
	lw r1, r22, -24
	add r1, r1, 65536
	lw r2, r22, -20
	add r2, r2, 67080
	lw r0, r22, -28
	add r0, r0, 65536
	sw r22, -28, r0
	lw r0, r22, -12
	jeq r3, r0, .LBB32_1
.LBB32_11:                              //   Parent Loop BB32_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB32_12 Depth 3
                                        //         Child Loop BB32_18 Depth 4
                                        //       Child Loop BB32_88 Depth 3
                                        //         Child Loop BB32_94 Depth 4
	sw r22, -16, r3
	move r14, 0
	sw r22, -20, r2
	sw r22, -48, r2
	sw r22, -24, r1
	sw r22, -44, r1
	jump .LBB32_12
.LBB32_85:                              //   in Loop: Header=BB32_12 Depth=3
	move r0, my_barrier
	move r2, 0
	move r4, 17
	move r1, r0
	move r3, r2
	call r23, syscall
.LBB32_86:                              //   in Loop: Header=BB32_12 Depth=3
	lw r17, r22, -40
	lw r19, r22, -112
	lw r14, r22, -36
	move r0, my_barrier
	move r1, 0
	move r4, 16
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, r22, -44
	add r0, r0, 16
	sw r22, -44, r0
	lw r0, r22, -48
	add r0, r0, 16
	sw r22, -48, r0
	add r14, r14, 1
	jeq r14, 33, .LBB32_87
.LBB32_12:                              //   Parent Loop BB32_1 Depth=1
                                        //     Parent Loop BB32_11 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB32_18 Depth 4
	lw r1, zero, nr_tasklets
	add r2, r22, -132
	move r0, r14
	call r23, __udivmodsi4
	lw r18, r22, -132
	sub r1, r17, r18, ltu
	add r19, r0, r1
	sw r22, -60, r19
	sw r22, -36, r14
	jeq r18, 0, .LBB32_15
// %bb.13:                              //   in Loop: Header=BB32_12 Depth=3
	jgeu r17, r18, .LBB32_14
.LBB32_15:                              //   in Loop: Header=BB32_12 Depth=3
	move r0, r19
	move r1, r17
	call r23, __mulsi3
	jump .LBB32_16
.LBB32_14:                              //   in Loop: Header=BB32_12 Depth=3
	add r0, r19, 1
	move r1, r18
	call r23, __mulsi3
	move r19, r0
	sub r1, r17, r18
	lw r0, r22, -60
	call r23, __mulsi3
	add r0, r19, r0
	lw r19, r22, -60
.LBB32_16:                              //   in Loop: Header=BB32_12 Depth=3
	lw r20, r22, -108
	lw r18, r22, -112
	lw r15, r22, -104
	lw r21, r22, -100
	jeq r19, 0, .LBB32_83
// %bb.17:                              //   in Loop: Header=BB32_12 Depth=3
	lsl r1, r0, 11
	lsl_sub r1, r1, r0, 4
	sw r22, -56, r1
	lsl r1, r0, 4
	lsl_add r0, r1, r0, 11
	sw r22, -52, r0
	move r1, 0
	lw r2, r22, -48
	lw r3, r22, -44
	jump .LBB32_18
.LBB32_82:                              //   in Loop: Header=BB32_18 Depth=4
	sw r21, 112, r3
	move r14, 24
	move r17, 0
	move r19, 23
	move r1, r14
	lw r2, r22, -72
	move r3, r17
	move r4, r19
	move r16, r0
	call r23, syscall
	lw r20, r22, -108
	move r0, r20
	move r1, r14
	lw r2, r22, -68
	move r3, r17
	move r4, r19
	call r23, syscall
	lw r18, r22, -112
	move r0, r18
	move r1, r14
	lw r2, r22, -64
	move r3, r17
	move r4, r19
	call r23, syscall
	lw r15, r22, -104
	move r0, r15
	move r1, r14
	lw r2, r22, -76
	move r3, r17
	move r4, r19
	call r23, syscall
	lw r1, r22, -88
	add r1, r1, 1
	lw r3, r22, -80
	add r3, r3, 2032
	lw r2, r22, -84
	add r2, r2, 2064
	lw r0, r22, -60
	jeq r1, r0, .LBB32_83
.LBB32_18:                              //   Parent Loop BB32_1 Depth=1
                                        //     Parent Loop BB32_11 Depth=2
                                        //       Parent Loop BB32_12 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	sw r22, -88, r1
	lw r0, r22, -52
	sw r22, -84, r2
	add r16, r0, r2
	add r2, r16, -2080
	move r1, 24
	move r14, 0
	move r17, 22
	move r0, r21
	move r21, r3
	move r3, r14
	move r4, r17
	call r23, syscall
	add r2, r16, -1560
	move r19, 8
	lw r0, r22, -116
	move r1, r19
	sw r22, -72, r2
	move r3, r14
	move r4, r17
	call r23, syscall
	add r2, r16, -1040
	move r0, r20
	move r1, r19
	sw r22, -68, r2
	move r3, r14
	move r4, r17
	call r23, syscall
	add r2, r16, -520
	move r0, r18
	move r1, r19
	sw r22, -64, r2
	move r3, r14
	move r4, r17
	call r23, syscall
	move r0, r15
	move r1, r19
	sw r22, -76, r16
	move r2, r16
	move r3, r14
	move r4, r17
	call r23, syscall
	lw r0, r22, -56
	sw r22, -80, r21
	add r19, r0, r21
	add r2, r19, -1536
	move r20, 16
	lw r15, r22, -96
	move r0, r15
	move r1, r20
	move r3, r14
	move r4, r17
	call r23, syscall
	add r2, r19, -1024
	lw r0, r22, -128
	move r1, r20
	move r3, r14
	move r4, r17
	call r23, syscall
	add r2, r19, -512
	lw r0, r22, -124
	move r1, r20
	move r3, r14
	move r4, r17
	call r23, syscall
	lw r0, r22, -120
	move r1, r20
	move r2, r19
	move r3, r14
	move r4, r17
	call r23, syscall
	lw r21, r22, -100
	lw r0, r21, 0
	lw r1, r15, 0
	lw r3, r21, 24
	add r9, r1, r0
	lw r11, r22, -92
	sub r1, r3, r11
	jgts r9, r1, .LBB32_20
// %bb.19:                              //   in Loop: Header=BB32_18 Depth=4
	move r9, r1
.LBB32_20:                              //   in Loop: Header=BB32_18 Depth=4
	lw r1, r21, 4
	sub r2, r1, r11
	jgts r9, r2, .LBB32_22
// %bb.21:                              //   in Loop: Header=BB32_18 Depth=4
	move r9, r2
.LBB32_22:                              //   in Loop: Header=BB32_18 Depth=4
	sw r21, 28, r9
	lw r4, r15, 4
	lw r2, r21, 8
	add r1, r4, r1
	sub r5, r9, r11
	lw r0, r22, -116
	jgts r1, r5, .LBB32_24
// %bb.23:                              //   in Loop: Header=BB32_18 Depth=4
	move r1, r5
.LBB32_24:                              //   in Loop: Header=BB32_18 Depth=4
	sub r4, r2, r11
	jgts r1, r4, .LBB32_26
// %bb.25:                              //   in Loop: Header=BB32_18 Depth=4
	move r1, r4
.LBB32_26:                              //   in Loop: Header=BB32_18 Depth=4
	sw r21, 32, r1
	lw r6, r15, 8
	lw r4, r21, 12
	add r2, r6, r2
	sub r7, r1, r11
	jgts r2, r7, .LBB32_28
// %bb.27:                              //   in Loop: Header=BB32_18 Depth=4
	move r2, r7
.LBB32_28:                              //   in Loop: Header=BB32_18 Depth=4
	sub r6, r4, r11
	jgts r2, r6, .LBB32_30
// %bb.29:                              //   in Loop: Header=BB32_18 Depth=4
	move r2, r6
.LBB32_30:                              //   in Loop: Header=BB32_18 Depth=4
	sw r21, 36, r2
	lw r8, r15, 12
	lw r6, r21, 16
	add r4, r8, r4
	sub r10, r2, r11
	jgts r4, r10, .LBB32_32
// %bb.31:                              //   in Loop: Header=BB32_18 Depth=4
	move r4, r10
.LBB32_32:                              //   in Loop: Header=BB32_18 Depth=4
	sub r6, r6, r11
	jgts r4, r6, .LBB32_34
// %bb.33:                              //   in Loop: Header=BB32_18 Depth=4
	move r4, r6
.LBB32_34:                              //   in Loop: Header=BB32_18 Depth=4
	sw r21, 40, r4
	lw r6, r22, -128
	lw r8, r6, 0
	lw r6, r21, 48
	add r3, r8, r3
	sub r8, r6, r11
	jgts r3, r8, .LBB32_36
// %bb.35:                              //   in Loop: Header=BB32_18 Depth=4
	move r3, r8
.LBB32_36:                              //   in Loop: Header=BB32_18 Depth=4
	jgts r3, r5, .LBB32_38
// %bb.37:                              //   in Loop: Header=BB32_18 Depth=4
	move r3, r5
.LBB32_38:                              //   in Loop: Header=BB32_18 Depth=4
	sw r21, 52, r3
	lw r5, r15, 20
	add r12, r5, r9
	sub r8, r3, r11
	jgts r12, r8, .LBB32_40
// %bb.39:                              //   in Loop: Header=BB32_18 Depth=4
	move r12, r8
.LBB32_40:                              //   in Loop: Header=BB32_18 Depth=4
	jgts r12, r7, .LBB32_42
// %bb.41:                              //   in Loop: Header=BB32_18 Depth=4
	move r12, r7
.LBB32_42:                              //   in Loop: Header=BB32_18 Depth=4
	sw r21, 56, r12
	lw r5, r15, 24
	add r1, r5, r1
	sub r9, r12, r11
	jgts r1, r9, .LBB32_44
// %bb.43:                              //   in Loop: Header=BB32_18 Depth=4
	move r1, r9
.LBB32_44:                              //   in Loop: Header=BB32_18 Depth=4
	jgts r1, r10, .LBB32_46
// %bb.45:                              //   in Loop: Header=BB32_18 Depth=4
	move r1, r10
.LBB32_46:                              //   in Loop: Header=BB32_18 Depth=4
	sw r21, 60, r1
	lw r5, r15, 28
	add r5, r5, r2
	sub r10, r1, r11
	jgts r5, r10, .LBB32_48
// %bb.47:                              //   in Loop: Header=BB32_18 Depth=4
	move r5, r10
.LBB32_48:                              //   in Loop: Header=BB32_18 Depth=4
	sub r2, r4, r11
	jgts r5, r2, .LBB32_50
// %bb.49:                              //   in Loop: Header=BB32_18 Depth=4
	move r5, r2
.LBB32_50:                              //   in Loop: Header=BB32_18 Depth=4
	sw r21, 64, r5
	lw r2, r22, -124
	lw r2, r2, 0
	lw r7, r21, 72
	add r4, r2, r6
	sub r2, r7, r11
	jgts r4, r2, .LBB32_52
// %bb.51:                              //   in Loop: Header=BB32_18 Depth=4
	move r4, r2
.LBB32_52:                              //   in Loop: Header=BB32_18 Depth=4
	jgts r4, r8, .LBB32_54
// %bb.53:                              //   in Loop: Header=BB32_18 Depth=4
	move r4, r8
.LBB32_54:                              //   in Loop: Header=BB32_18 Depth=4
	sw r21, 76, r4
	lw r2, r15, 36
	add r2, r2, r3
	sub r3, r4, r11
	jgts r2, r3, .LBB32_56
// %bb.55:                              //   in Loop: Header=BB32_18 Depth=4
	move r2, r3
.LBB32_56:                              //   in Loop: Header=BB32_18 Depth=4
	jgts r2, r9, .LBB32_58
// %bb.57:                              //   in Loop: Header=BB32_18 Depth=4
	move r2, r9
.LBB32_58:                              //   in Loop: Header=BB32_18 Depth=4
	sw r21, 80, r2
	lw r6, r15, 40
	add r12, r6, r12
	sub r6, r2, r11
	jgts r12, r6, .LBB32_60
// %bb.59:                              //   in Loop: Header=BB32_18 Depth=4
	move r12, r6
.LBB32_60:                              //   in Loop: Header=BB32_18 Depth=4
	jgts r12, r10, .LBB32_62
// %bb.61:                              //   in Loop: Header=BB32_18 Depth=4
	move r12, r10
.LBB32_62:                              //   in Loop: Header=BB32_18 Depth=4
	sw r21, 84, r12
	lw r8, r15, 44
	add r1, r8, r1
	sub r8, r12, r11
	jgts r1, r8, .LBB32_64
// %bb.63:                              //   in Loop: Header=BB32_18 Depth=4
	move r1, r8
.LBB32_64:                              //   in Loop: Header=BB32_18 Depth=4
	sub r5, r5, r11
	jgts r1, r5, .LBB32_66
// %bb.65:                              //   in Loop: Header=BB32_18 Depth=4
	move r1, r5
.LBB32_66:                              //   in Loop: Header=BB32_18 Depth=4
	sw r21, 88, r1
	lw r5, r22, -120
	lw r5, r5, 0
	lw r9, r21, 96
	add r5, r5, r7
	sub r7, r9, r11
	jgts r5, r7, .LBB32_68
// %bb.67:                              //   in Loop: Header=BB32_18 Depth=4
	move r5, r7
.LBB32_68:                              //   in Loop: Header=BB32_18 Depth=4
	jgts r5, r3, .LBB32_70
// %bb.69:                              //   in Loop: Header=BB32_18 Depth=4
	move r5, r3
.LBB32_70:                              //   in Loop: Header=BB32_18 Depth=4
	sw r21, 100, r5
	lw r3, r15, 52
	add r3, r3, r4
	sub r4, r5, r11
	jgts r3, r4, .LBB32_72
// %bb.71:                              //   in Loop: Header=BB32_18 Depth=4
	move r3, r4
.LBB32_72:                              //   in Loop: Header=BB32_18 Depth=4
	jgts r3, r6, .LBB32_74
// %bb.73:                              //   in Loop: Header=BB32_18 Depth=4
	move r3, r6
.LBB32_74:                              //   in Loop: Header=BB32_18 Depth=4
	sw r21, 104, r3
	lw r4, r15, 56
	add r2, r4, r2
	sub r3, r3, r11
	jgts r2, r3, .LBB32_76
// %bb.75:                              //   in Loop: Header=BB32_18 Depth=4
	move r2, r3
.LBB32_76:                              //   in Loop: Header=BB32_18 Depth=4
	jgts r2, r8, .LBB32_78
// %bb.77:                              //   in Loop: Header=BB32_18 Depth=4
	move r2, r8
.LBB32_78:                              //   in Loop: Header=BB32_18 Depth=4
	sw r21, 108, r2
	lw r3, r15, 60
	add r3, r3, r12
	sub r2, r2, r11
	jgts r3, r2, .LBB32_80
// %bb.79:                              //   in Loop: Header=BB32_18 Depth=4
	move r3, r2
.LBB32_80:                              //   in Loop: Header=BB32_18 Depth=4
	sub r1, r1, r11
	jgts r3, r1, .LBB32_82
// %bb.81:                              //   in Loop: Header=BB32_18 Depth=4
	move r3, r1, true, .LBB32_82
.LBB32_83:                              //   in Loop: Header=BB32_12 Depth=3
	move r18, my_barrier
	move r1, 0
	move r4, 15
	move r0, r18
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, r18, 4
	add r0, r0, 1
	sw r18, 4, r0
	lw r1, r18, 8
	jneq r0, r1, .LBB32_85
// %bb.84:                              //   in Loop: Header=BB32_12 Depth=3
	move r1, 0
	move r4, 18
	move r0, r18
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r18, 4, 0
	jump .LBB32_86
.LBB32_87:                              //   in Loop: Header=BB32_11 Depth=2
	move r14, 2
	lw r0, r22, -32
	sw r22, -56, r0
	lw r0, r22, -28
	sw r22, -48, r0
	jump .LBB32_88
.LBB32_161:                             //   in Loop: Header=BB32_88 Depth=3
	move r0, my_barrier
	move r2, 0
	move r4, 17
	move r1, r0
	move r3, r2
	call r23, syscall
.LBB32_162:                             //   in Loop: Header=BB32_88 Depth=3
	lw r17, r22, -40
	lw r16, r22, -116
	lw r0, r22, -96
	lw r14, r22, -44
	move r0, my_barrier
	move r1, 0
	move r4, 16
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, r22, -48
	add r0, r0, 2048
	sw r22, -48, r0
	lw r0, r22, -56
	add r0, r0, 2080
	sw r22, -56, r0
	add r14, r14, 1
	jeq r14, 33, .LBB32_163
.LBB32_88:                              //   Parent Loop BB32_1 Depth=1
                                        //     Parent Loop BB32_11 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB32_94 Depth 4
	sub r0, 33, r14
	and r18, r0, 3
	sub r1, r17, r18, ltu
	lsr_add r0, r1, r0, 2
	sw r22, -60, r0
	sw r22, -44, r14
	jeq r18, 0, .LBB32_91
// %bb.89:                              //   in Loop: Header=BB32_88 Depth=3
	jgeu r17, r18, .LBB32_90
.LBB32_91:                              //   in Loop: Header=BB32_88 Depth=3
	move r1, r17
	call r23, __mulsi3
	lw r1, r22, -60
	jump .LBB32_92
.LBB32_90:                              //   in Loop: Header=BB32_88 Depth=3
	add r0, r0, 1
	move r1, r18
	call r23, __mulsi3
	move r14, r0
	sub r1, r17, r18
	lw r0, r22, -60
	call r23, __mulsi3
	lw r1, r22, -60
	add r0, r14, r0
.LBB32_92:                              //   in Loop: Header=BB32_88 Depth=3
	lw r20, r22, -116
	lw r16, r22, -108
	lw r15, r22, -104
	lw r21, r22, -100
	jeq r1, 0, .LBB32_159
// %bb.93:                              //   in Loop: Header=BB32_88 Depth=3
	lsl r1, r0, 11
	lsl_sub r1, r1, r0, 4
	sw r22, -52, r1
	lsl r1, r0, 4
	lsl_add r1, r1, r0, 11
	move r2, 0
	lw r3, r22, -48
	jump .LBB32_94
.LBB32_158:                             //   in Loop: Header=BB32_94 Depth=4
	sw r21, 112, r0
	move r14, 24
	move r17, 0
	move r18, 23
	lw r20, r22, -116
	move r0, r20
	move r1, r14
	lw r2, r22, -76
	move r3, r17
	move r4, r18
	call r23, syscall
	lw r16, r22, -108
	move r0, r16
	move r1, r14
	lw r2, r22, -72
	move r3, r17
	move r4, r18
	call r23, syscall
	move r0, r19
	move r1, r14
	lw r2, r22, -68
	move r3, r17
	move r4, r18
	call r23, syscall
	lw r15, r22, -104
	move r0, r15
	move r1, r14
	lw r2, r22, -64
	move r3, r17
	move r4, r18
	call r23, syscall
	lw r2, r22, -84
	add r2, r2, 1
	lw r3, r22, -80
	add r3, r3, 2032
	lw r1, r22, -88
	add r1, r1, 2064
	lw r0, r22, -60
	jgeu r2, r0, .LBB32_159
.LBB32_94:                              //   Parent Loop BB32_1 Depth=1
                                        //     Parent Loop BB32_11 Depth=2
                                        //       Parent Loop BB32_88 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	sw r22, -84, r2
	lw r0, r22, -56
	sw r22, -88, r1
	add r19, r0, r1
	add r2, r19, 2576
	move r1, 24
	move r14, 0
	move r17, 22
	move r0, r21
	move r21, r3
	move r3, r14
	move r4, r17
	call r23, syscall
	add r2, r19, 3096
	move r18, 8
	move r0, r20
	move r1, r18
	sw r22, -76, r2
	move r3, r14
	move r4, r17
	call r23, syscall
	add r2, r19, 3616
	move r0, r16
	move r1, r18
	sw r22, -72, r2
	move r3, r14
	move r4, r17
	call r23, syscall
	add r2, r19, 4136
	lw r0, r22, -112
	move r1, r18
	sw r22, -68, r2
	move r3, r14
	move r4, r17
	call r23, syscall
	add r2, r19, 4656
	move r0, r15
	move r1, r18
	sw r22, -64, r2
	move r3, r14
	move r4, r17
	call r23, syscall
	lw r0, r22, -52
	sw r22, -80, r21
	add r18, r0, r21
	add r2, r18, -1536
	move r19, 16
	lw r16, r22, -96
	move r0, r16
	move r1, r19
	move r3, r14
	move r4, r17
	call r23, syscall
	add r2, r18, -1024
	lw r0, r22, -128
	move r1, r19
	move r3, r14
	move r4, r17
	call r23, syscall
	add r2, r18, -512
	lw r0, r22, -124
	move r1, r19
	move r3, r14
	move r4, r17
	call r23, syscall
	lw r0, r22, -120
	move r1, r19
	move r2, r18
	move r3, r14
	move r4, r17
	call r23, syscall
	lw r21, r22, -100
	lw r0, r21, 0
	lw r1, r16, 0
	lw r3, r21, 24
	add r0, r1, r0
	lw r11, r22, -92
	sub r1, r3, r11
	jgts r0, r1, .LBB32_96
// %bb.95:                              //   in Loop: Header=BB32_94 Depth=4
	move r0, r1
.LBB32_96:                              //   in Loop: Header=BB32_94 Depth=4
	lw r1, r21, 4
	sub r2, r1, r11
	jgts r0, r2, .LBB32_98
// %bb.97:                              //   in Loop: Header=BB32_94 Depth=4
	move r0, r2
.LBB32_98:                              //   in Loop: Header=BB32_94 Depth=4
	sw r21, 28, r0
	lw r4, r16, 4
	lw r2, r21, 8
	add r1, r4, r1
	sub r5, r0, r11
	lw r19, r22, -112
	jgts r1, r5, .LBB32_100
// %bb.99:                              //   in Loop: Header=BB32_94 Depth=4
	move r1, r5
.LBB32_100:                             //   in Loop: Header=BB32_94 Depth=4
	sub r4, r2, r11
	jgts r1, r4, .LBB32_102
// %bb.101:                             //   in Loop: Header=BB32_94 Depth=4
	move r1, r4
.LBB32_102:                             //   in Loop: Header=BB32_94 Depth=4
	sw r21, 32, r1
	lw r6, r16, 8
	lw r4, r21, 12
	add r2, r6, r2
	sub r7, r1, r11
	jgts r2, r7, .LBB32_104
// %bb.103:                             //   in Loop: Header=BB32_94 Depth=4
	move r2, r7
.LBB32_104:                             //   in Loop: Header=BB32_94 Depth=4
	sub r6, r4, r11
	jgts r2, r6, .LBB32_106
// %bb.105:                             //   in Loop: Header=BB32_94 Depth=4
	move r2, r6
.LBB32_106:                             //   in Loop: Header=BB32_94 Depth=4
	sw r21, 36, r2
	lw r8, r16, 12
	lw r6, r21, 16
	add r4, r8, r4
	sub r10, r2, r11
	jgts r4, r10, .LBB32_108
// %bb.107:                             //   in Loop: Header=BB32_94 Depth=4
	move r4, r10
.LBB32_108:                             //   in Loop: Header=BB32_94 Depth=4
	sub r6, r6, r11
	jgts r4, r6, .LBB32_110
// %bb.109:                             //   in Loop: Header=BB32_94 Depth=4
	move r4, r6
.LBB32_110:                             //   in Loop: Header=BB32_94 Depth=4
	sw r21, 40, r4
	lw r6, r22, -128
	lw r8, r6, 0
	lw r6, r21, 48
	add r3, r8, r3
	sub r8, r6, r11
	jgts r3, r8, .LBB32_112
// %bb.111:                             //   in Loop: Header=BB32_94 Depth=4
	move r3, r8
.LBB32_112:                             //   in Loop: Header=BB32_94 Depth=4
	jgts r3, r5, .LBB32_114
// %bb.113:                             //   in Loop: Header=BB32_94 Depth=4
	move r3, r5
.LBB32_114:                             //   in Loop: Header=BB32_94 Depth=4
	sw r21, 52, r3
	lw r5, r16, 20
	add r0, r5, r0
	sub r8, r3, r11
	jgts r0, r8, .LBB32_116
// %bb.115:                             //   in Loop: Header=BB32_94 Depth=4
	move r0, r8
.LBB32_116:                             //   in Loop: Header=BB32_94 Depth=4
	jgts r0, r7, .LBB32_118
// %bb.117:                             //   in Loop: Header=BB32_94 Depth=4
	move r0, r7
.LBB32_118:                             //   in Loop: Header=BB32_94 Depth=4
	sw r21, 56, r0
	lw r5, r16, 24
	add r1, r5, r1
	sub r9, r0, r11
	jgts r1, r9, .LBB32_120
// %bb.119:                             //   in Loop: Header=BB32_94 Depth=4
	move r1, r9
.LBB32_120:                             //   in Loop: Header=BB32_94 Depth=4
	jgts r1, r10, .LBB32_122
// %bb.121:                             //   in Loop: Header=BB32_94 Depth=4
	move r1, r10
.LBB32_122:                             //   in Loop: Header=BB32_94 Depth=4
	sw r21, 60, r1
	lw r5, r16, 28
	add r5, r5, r2
	sub r10, r1, r11
	jgts r5, r10, .LBB32_124
// %bb.123:                             //   in Loop: Header=BB32_94 Depth=4
	move r5, r10
.LBB32_124:                             //   in Loop: Header=BB32_94 Depth=4
	sub r2, r4, r11
	jgts r5, r2, .LBB32_126
// %bb.125:                             //   in Loop: Header=BB32_94 Depth=4
	move r5, r2
.LBB32_126:                             //   in Loop: Header=BB32_94 Depth=4
	sw r21, 64, r5
	lw r2, r22, -124
	lw r2, r2, 0
	lw r7, r21, 72
	add r4, r2, r6
	sub r2, r7, r11
	jgts r4, r2, .LBB32_128
// %bb.127:                             //   in Loop: Header=BB32_94 Depth=4
	move r4, r2
.LBB32_128:                             //   in Loop: Header=BB32_94 Depth=4
	jgts r4, r8, .LBB32_130
// %bb.129:                             //   in Loop: Header=BB32_94 Depth=4
	move r4, r8
.LBB32_130:                             //   in Loop: Header=BB32_94 Depth=4
	sw r21, 76, r4
	lw r2, r16, 36
	add r2, r2, r3
	sub r3, r4, r11
	jgts r2, r3, .LBB32_132
// %bb.131:                             //   in Loop: Header=BB32_94 Depth=4
	move r2, r3
.LBB32_132:                             //   in Loop: Header=BB32_94 Depth=4
	jgts r2, r9, .LBB32_134
// %bb.133:                             //   in Loop: Header=BB32_94 Depth=4
	move r2, r9
.LBB32_134:                             //   in Loop: Header=BB32_94 Depth=4
	sw r21, 80, r2
	lw r6, r16, 40
	add r0, r6, r0
	sub r6, r2, r11
	jgts r0, r6, .LBB32_136
// %bb.135:                             //   in Loop: Header=BB32_94 Depth=4
	move r0, r6
.LBB32_136:                             //   in Loop: Header=BB32_94 Depth=4
	jgts r0, r10, .LBB32_138
// %bb.137:                             //   in Loop: Header=BB32_94 Depth=4
	move r0, r10
.LBB32_138:                             //   in Loop: Header=BB32_94 Depth=4
	sw r21, 84, r0
	lw r8, r16, 44
	add r1, r8, r1
	sub r8, r0, r11
	jgts r1, r8, .LBB32_140
// %bb.139:                             //   in Loop: Header=BB32_94 Depth=4
	move r1, r8
.LBB32_140:                             //   in Loop: Header=BB32_94 Depth=4
	sub r5, r5, r11
	jgts r1, r5, .LBB32_142
// %bb.141:                             //   in Loop: Header=BB32_94 Depth=4
	move r1, r5
.LBB32_142:                             //   in Loop: Header=BB32_94 Depth=4
	sw r21, 88, r1
	lw r5, r22, -120
	lw r5, r5, 0
	lw r9, r21, 96
	add r5, r5, r7
	sub r7, r9, r11
	jgts r5, r7, .LBB32_144
// %bb.143:                             //   in Loop: Header=BB32_94 Depth=4
	move r5, r7
.LBB32_144:                             //   in Loop: Header=BB32_94 Depth=4
	jgts r5, r3, .LBB32_146
// %bb.145:                             //   in Loop: Header=BB32_94 Depth=4
	move r5, r3
.LBB32_146:                             //   in Loop: Header=BB32_94 Depth=4
	sw r21, 100, r5
	lw r3, r16, 52
	add r3, r3, r4
	sub r4, r5, r11
	jgts r3, r4, .LBB32_148
// %bb.147:                             //   in Loop: Header=BB32_94 Depth=4
	move r3, r4
.LBB32_148:                             //   in Loop: Header=BB32_94 Depth=4
	jgts r3, r6, .LBB32_150
// %bb.149:                             //   in Loop: Header=BB32_94 Depth=4
	move r3, r6
.LBB32_150:                             //   in Loop: Header=BB32_94 Depth=4
	sw r21, 104, r3
	lw r4, r16, 56
	add r2, r4, r2
	sub r3, r3, r11
	jgts r2, r3, .LBB32_152
// %bb.151:                             //   in Loop: Header=BB32_94 Depth=4
	move r2, r3
.LBB32_152:                             //   in Loop: Header=BB32_94 Depth=4
	jgts r2, r8, .LBB32_154
// %bb.153:                             //   in Loop: Header=BB32_94 Depth=4
	move r2, r8
.LBB32_154:                             //   in Loop: Header=BB32_94 Depth=4
	sw r21, 108, r2
	lw r3, r16, 60
	add r0, r3, r0
	sub r2, r2, r11
	jgts r0, r2, .LBB32_156
// %bb.155:                             //   in Loop: Header=BB32_94 Depth=4
	move r0, r2
.LBB32_156:                             //   in Loop: Header=BB32_94 Depth=4
	sub r1, r1, r11
	jgts r0, r1, .LBB32_158
// %bb.157:                             //   in Loop: Header=BB32_94 Depth=4
	move r0, r1, true, .LBB32_158
.LBB32_159:                             //   in Loop: Header=BB32_88 Depth=3
	move r18, my_barrier
	move r1, 0
	move r4, 15
	move r0, r18
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, r18, 4
	add r0, r0, 1
	sw r18, 4, r0
	lw r1, r18, 8
	jneq r0, r1, .LBB32_161
// %bb.160:                             //   in Loop: Header=BB32_88 Depth=3
	move r1, 0
	move r4, 18
	move r0, r18
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r18, 4, 0
	jump .LBB32_162
.Lfunc_end32:
	.size	main1, .Lfunc_end32-main1
	.section	.stack_sizes,"o",@progbits,.text.main1
	.long	.Lfunc_begin32
	.ascii	"\250\001"
	.section	.text.main1,"ax",@progbits
                                        // -- End function
	.type	blosum62,@object                // @blosum62
	.section	.data.blosum62,"aw",@progbits
	.globl	blosum62
	.p2align	2
blosum62:
	.long	4                               // 0x4
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	0                               // 0x0
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	0                               // 0x0
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	1                               // 0x1
	.long	0                               // 0x0
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	0                               // 0x0
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	0                               // 0x0
	.long	4294967292                      // 0xfffffffc
	.long	4294967295                      // 0xffffffff
	.long	5                               // 0x5
	.long	0                               // 0x0
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	1                               // 0x1
	.long	0                               // 0x0
	.long	4294967294                      // 0xfffffffe
	.long	0                               // 0x0
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	2                               // 0x2
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	0                               // 0x0
	.long	4294967295                      // 0xffffffff
	.long	4294967292                      // 0xfffffffc
	.long	4294967294                      // 0xfffffffe
	.long	0                               // 0x0
	.long	6                               // 0x6
	.long	1                               // 0x1
	.long	4294967293                      // 0xfffffffd
	.long	0                               // 0x0
	.long	0                               // 0x0
	.long	0                               // 0x0
	.long	1                               // 0x1
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	0                               // 0x0
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	1                               // 0x1
	.long	0                               // 0x0
	.long	4294967292                      // 0xfffffffc
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	3                               // 0x3
	.long	0                               // 0x0
	.long	4294967295                      // 0xffffffff
	.long	4294967292                      // 0xfffffffc
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	1                               // 0x1
	.long	6                               // 0x6
	.long	4294967293                      // 0xfffffffd
	.long	0                               // 0x0
	.long	2                               // 0x2
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	4294967292                      // 0xfffffffc
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	0                               // 0x0
	.long	4294967295                      // 0xffffffff
	.long	4294967292                      // 0xfffffffc
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4                               // 0x4
	.long	1                               // 0x1
	.long	4294967295                      // 0xffffffff
	.long	4294967292                      // 0xfffffffc
	.long	0                               // 0x0
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	9                               // 0x9
	.long	4294967293                      // 0xfffffffd
	.long	4294967292                      // 0xfffffffc
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	4294967292                      // 0xfffffffc
	.long	4294967295                      // 0xffffffff
	.long	1                               // 0x1
	.long	0                               // 0x0
	.long	0                               // 0x0
	.long	4294967293                      // 0xfffffffd
	.long	5                               // 0x5
	.long	2                               // 0x2
	.long	4294967294                      // 0xfffffffe
	.long	0                               // 0x0
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	1                               // 0x1
	.long	0                               // 0x0
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	0                               // 0x0
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	0                               // 0x0
	.long	3                               // 0x3
	.long	4294967295                      // 0xffffffff
	.long	4294967292                      // 0xfffffffc
	.long	4294967295                      // 0xffffffff
	.long	0                               // 0x0
	.long	0                               // 0x0
	.long	2                               // 0x2
	.long	4294967292                      // 0xfffffffc
	.long	2                               // 0x2
	.long	5                               // 0x5
	.long	4294967294                      // 0xfffffffe
	.long	0                               // 0x0
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	1                               // 0x1
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	0                               // 0x0
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	1                               // 0x1
	.long	4                               // 0x4
	.long	4294967295                      // 0xffffffff
	.long	4294967292                      // 0xfffffffc
	.long	0                               // 0x0
	.long	4294967294                      // 0xfffffffe
	.long	0                               // 0x0
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	6                               // 0x6
	.long	4294967294                      // 0xfffffffe
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	0                               // 0x0
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	4294967292                      // 0xfffffffc
	.long	4294967294                      // 0xfffffffe
	.long	0                               // 0x0
	.long	1                               // 0x1
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	0                               // 0x0
	.long	0                               // 0x0
	.long	4294967294                      // 0xfffffffe
	.long	8                               // 0x8
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	2                               // 0x2
	.long	4294967293                      // 0xfffffffd
	.long	0                               // 0x0
	.long	0                               // 0x0
	.long	4294967295                      // 0xffffffff
	.long	4294967292                      // 0xfffffffc
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967292                      // 0xfffffffc
	.long	4294967293                      // 0xfffffffd
	.long	4                               // 0x4
	.long	2                               // 0x2
	.long	4294967293                      // 0xfffffffd
	.long	1                               // 0x1
	.long	0                               // 0x0
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	3                               // 0x3
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	4294967292                      // 0xfffffffc
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	4294967292                      // 0xfffffffc
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	4294967292                      // 0xfffffffc
	.long	4294967293                      // 0xfffffffd
	.long	2                               // 0x2
	.long	4                               // 0x4
	.long	4294967294                      // 0xfffffffe
	.long	2                               // 0x2
	.long	0                               // 0x0
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	1                               // 0x1
	.long	4294967292                      // 0xfffffffc
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	4294967292                      // 0xfffffffc
	.long	4294967295                      // 0xffffffff
	.long	2                               // 0x2
	.long	0                               // 0x0
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	1                               // 0x1
	.long	1                               // 0x1
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	5                               // 0x5
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	0                               // 0x0
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	0                               // 0x0
	.long	1                               // 0x1
	.long	4294967295                      // 0xffffffff
	.long	4294967292                      // 0xfffffffc
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	0                               // 0x0
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	1                               // 0x1
	.long	2                               // 0x2
	.long	4294967295                      // 0xffffffff
	.long	5                               // 0x5
	.long	0                               // 0x0
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	1                               // 0x1
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967292                      // 0xfffffffc
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	0                               // 0x0
	.long	0                               // 0x0
	.long	4294967293                      // 0xfffffffd
	.long	0                               // 0x0
	.long	6                               // 0x6
	.long	4294967292                      // 0xfffffffc
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	1                               // 0x1
	.long	3                               // 0x3
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	4294967292                      // 0xfffffffc
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967292                      // 0xfffffffc
	.long	7                               // 0x7
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967292                      // 0xfffffffc
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967292                      // 0xfffffffc
	.long	1                               // 0x1
	.long	4294967295                      // 0xffffffff
	.long	1                               // 0x1
	.long	0                               // 0x0
	.long	4294967295                      // 0xffffffff
	.long	0                               // 0x0
	.long	0                               // 0x0
	.long	0                               // 0x0
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	0                               // 0x0
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	4                               // 0x4
	.long	1                               // 0x1
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	0                               // 0x0
	.long	0                               // 0x0
	.long	0                               // 0x0
	.long	4294967292                      // 0xfffffffc
	.long	0                               // 0x0
	.long	4294967295                      // 0xffffffff
	.long	0                               // 0x0
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	1                               // 0x1
	.long	5                               // 0x5
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	0                               // 0x0
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	0                               // 0x0
	.long	4294967292                      // 0xfffffffc
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	1                               // 0x1
	.long	4294967292                      // 0xfffffffc
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	11                              // 0xb
	.long	2                               // 0x2
	.long	4294967293                      // 0xfffffffd
	.long	4294967292                      // 0xfffffffc
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	4294967292                      // 0xfffffffc
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	2                               // 0x2
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	3                               // 0x3
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	2                               // 0x2
	.long	7                               // 0x7
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	4294967292                      // 0xfffffffc
	.long	0                               // 0x0
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	3                               // 0x3
	.long	1                               // 0x1
	.long	4294967294                      // 0xfffffffe
	.long	1                               // 0x1
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	0                               // 0x0
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	4                               // 0x4
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	4294967292                      // 0xfffffffc
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	3                               // 0x3
	.long	4                               // 0x4
	.long	4294967293                      // 0xfffffffd
	.long	0                               // 0x0
	.long	1                               // 0x1
	.long	4294967295                      // 0xffffffff
	.long	0                               // 0x0
	.long	4294967293                      // 0xfffffffd
	.long	4294967292                      // 0xfffffffc
	.long	0                               // 0x0
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	0                               // 0x0
	.long	4294967295                      // 0xffffffff
	.long	4294967292                      // 0xfffffffc
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	4                               // 0x4
	.long	1                               // 0x1
	.long	4294967295                      // 0xffffffff
	.long	4294967292                      // 0xfffffffc
	.long	4294967295                      // 0xffffffff
	.long	0                               // 0x0
	.long	0                               // 0x0
	.long	1                               // 0x1
	.long	4294967293                      // 0xfffffffd
	.long	3                               // 0x3
	.long	4                               // 0x4
	.long	4294967294                      // 0xfffffffe
	.long	0                               // 0x0
	.long	4294967293                      // 0xfffffffd
	.long	4294967293                      // 0xfffffffd
	.long	1                               // 0x1
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	4294967295                      // 0xffffffff
	.long	0                               // 0x0
	.long	4294967295                      // 0xffffffff
	.long	4294967293                      // 0xfffffffd
	.long	4294967294                      // 0xfffffffe
	.long	4294967294                      // 0xfffffffe
	.long	1                               // 0x1
	.long	4                               // 0x4
	.long	4294967295                      // 0xffffffff
	.long	4294967292                      // 0xfffffffc
	.long	0                               // 0x0
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967294                      // 0xfffffffe
	.long	0                               // 0x0
	.long	0                               // 0x0
	.long	4294967294                      // 0xfffffffe
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967295                      // 0xffffffff
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	4294967292                      // 0xfffffffc
	.long	1                               // 0x1
	.size	blosum62, 2304

	.type	nr_tasklets,@object             // @nr_tasklets
	.section	.bss.nr_tasklets,"aw",@nobits
	.globl	nr_tasklets
	.p2align	2
nr_tasklets:
	.long	0                               // 0x0
	.size	nr_tasklets, 4

	.type	my_barrier,@object              // @my_barrier
	.section	.bss.my_barrier,"aw",@nobits
	.globl	my_barrier
	.p2align	2
my_barrier:
	.zero	16
	.size	my_barrier, 16

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
	.p2align	2
DPU_INPUT_ARGUMENTS:
	.zero	16
	.size	DPU_INPUT_ARGUMENTS, 16

	.addrsig
	.addrsig_sym main1
	.addrsig_sym my_barrier
	.addrsig_sym DPU_INPUT_ARGUMENTS
