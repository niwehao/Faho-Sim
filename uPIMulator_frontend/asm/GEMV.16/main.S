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
	sd r22, 120, d22
	add r22, r22, 128
	sd r22, -104, d14
	sd r22, -112, d16
	sd r22, -120, d18
	sd r22, -128, d20
	move r0, 0
	move r4, 6
	move r1, r0
	move r2, r0
	move r3, r0
	call r23, syscall
	move r18, r0, nz, .LBB30_3
// %bb.1:
	lw r0, zero, sd_host
	add r15, r22, -96
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
	move r1, 16
	move r4, 22
	move r2, r17
	move r3, r17
	call r23, syscall
	jgts r0, -1, .LBB30_3
// %bb.2:
	move r0, 3
	move r1, 0
	move r4, 7
	move r2, r1
	move r3, r1
	call r23, syscall
.LBB30_3:
	move r15, b
	move r1, 0
	move r4, 15
	move r0, r15
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, r15, 4
	add r0, r0, 1
	sw r15, 4, r0
	lw r1, r15, 8
	jneq r0, r1, .LBB30_5
// %bb.4:
	move r1, 0
	move r4, 18
	move r0, r15
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r15, 4, 0
	jump .LBB30_6
.LBB30_5:
	move r0, b
	move r2, 0
	move r4, 17
	move r1, r0
	move r3, r2
	call r23, syscall
.LBB30_6:
	move r0, b
	move r1, 0
	move r4, 16
	move r2, r1
	move r3, r1
	call r23, syscall
	move r1, 3
	move r0, r18
	call r23, print_debug
	move r2, DPU_INPUT_ARGUMENTS
	lw r4, r2, 8
	lsr r0, r4, 4
	and r0, r0, 268435454
	and r16, r4, 31
	lsl r3, r18, 1
	add r1, r0, 2
	move r6, r1
	jltu r3, r16, .LBB30_8
// %bb.7:
	move r6, r0
.LBB30_8:
	lw r5, zero, DPU_INPUT_ARGUMENTS
	sw r22, -36, r5
	lw r14, r2, 4
	lw r17, r2, 12
	sw r22, -88, r18
	sw r22, -40, r4
	sw r22, -84, r6
	jeq r16, 0, .LBB30_14
// %bb.9:
	jgeu r3, r16, .LBB30_10
// %bb.13:
	move r0, r1
.LBB30_14:
	move r1, r18
	call r23, __mulsi3
	move r15, r0
.LBB30_15:
	move r0, r14
	move r1, r17
	call r23, __mulsi3
	move r16, r0
	move r0, 2056
	sw r22, -80, r14
	move r14, 0
	move r21, 2
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r21
	call r23, syscall
	move r17, r0
	move r19, 8
	move r0, r19
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r21
	call r23, syscall
	move r18, r0
	move r0, 2048
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r21
	call r23, syscall
	move r20, r0
	move r0, r19
	move r1, r14
	move r2, r14
	sw r22, -72, r14
	move r3, r14
	move r4, r21
	call r23, syscall
	lw r1, r22, -84
	add r1, r15, r1
	lw r21, r22, -88
	lw r14, r22, -40
	sw r22, -20, r1
	jgeu r15, r1, .LBB30_21
// %bb.16:
	move r1, 16
	lsl_add r1, r1, r16, 2
	add r16, r17, -2056
	add r17, r18, -8
	add r20, r20, -2048
	add r18, r0, -8
	lw r0, r22, -80
	add r0, r15, r0
	sw r22, -32, r1
	lsl_add r19, r1, r0, 2
	lw r0, r22, -36
	lsl r1, r0, 2
	sw r22, -16, r1
	add r0, r0, -512
	sw r22, -64, r0
	lw r0, r22, -72
	sw r22, -52, r0
	sw r22, -60, r17
	sw r22, -68, r20
	sw r22, -56, r18
	jump .LBB30_17
.LBB30_48:                              //   in Loop: Header=BB30_17 Depth=1
	move r1, 5
	move r0, r21
	call r23, print_debug
	move r1, 8
	move r3, 0
	move r4, 23
	lw r18, r22, -56
	move r0, r18
	lw r19, r22, -24
	move r2, r19
	call r23, syscall
	move r1, 6
	move r0, r21
	call r23, print_debug
	add r15, r15, 2
	add r19, r19, 8
	lw r0, r22, -20
	jgeu r15, r0, .LBB30_21
.LBB30_17:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB30_19 Depth 2
                                        //       Child Loop BB30_29 Depth 3
                                        //         Child Loop BB30_31 Depth 4
                                        //       Child Loop BB30_39 Depth 3
                                        //       Child Loop BB30_45 Depth 3
	sw r22, -24, r19
	sw r18, 4, 0
	sw r18, 0, 0
	jgeu r15, r14, .LBB30_48
// %bb.18:                              //   in Loop: Header=BB30_17 Depth=1
	lw r0, r22, -16
	move r1, r15
	call r23, __mulsi3
	add r3, r0, 16
	move r0, 0
	move r2, 1
	sw r22, -28, r0
	sw r22, -76, r0
	sw r22, -44, r15
	jump .LBB30_19
.LBB30_47:                              //   in Loop: Header=BB30_19 Depth=2
	lw r0, r22, -52
	lw r1, r22, -84
	add r0, r1, r0
	lsl_add r0, r0, r14, 2
	and r3, r0, 7
	lw r15, r22, -44
	lw r1, r22, -76
	add r1, r1, r15
	add r1, r1, 1
	lw r14, r22, -40
	sub r1, r1, r14, ltu
	lw r2, r22, -48
	and r1, r2, r1
	move r2, 0
	sw r22, -52, r3
	sub r3, r3, r2, neq
	sw r22, -72, r3
	and r3, r0, -8
	move r0, 1
	sw r22, -76, r0
	lw r17, r22, -60
	jz r1, .LBB30_48
.LBB30_19:                              //   Parent Loop BB30_17 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB30_29 Depth 3
                                        //         Child Loop BB30_31 Depth 4
                                        //       Child Loop BB30_39 Depth 3
                                        //       Child Loop BB30_45 Depth 3
	sw r22, -48, r2
	lw r0, r22, -64
	jlts r0, 1, .LBB30_20
// %bb.28:                              //   in Loop: Header=BB30_19 Depth=2
	move r18, 0
	lw r15, r22, -32
	lw r20, r22, -68
	move r14, r3, true, .LBB30_29
.LBB30_33:                              //   in Loop: Header=BB30_29 Depth=3
	add r19, r19, 2048
	lw r17, r22, -60
	move r14, r19
.LBB30_34:                              //   in Loop: Header=BB30_29 Depth=3
	lw r18, r22, -80
	lw r0, r22, -56
	move r1, r16
	lw r20, r22, -68
	move r2, r20
	lw r3, r22, -76
	call r23, gemv
	add r18, r18, 512
	add r15, r15, 2048
	lw r0, r22, -64
	jges r18, r0, .LBB30_35
.LBB30_29:                              //   Parent Loop BB30_17 Depth=1
                                        //     Parent Loop BB30_19 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB30_31 Depth 4
	sw r22, -84, r15
	sw r22, -80, r18
	move r17, 5
	move r0, r21
	move r1, r17
	call r23, print_debug
	move r15, 2048
	move r21, 0
	move r18, 22
	move r0, r16
	move r1, r15
	move r2, r14
	move r3, r21
	move r4, r18
	call r23, syscall
	move r19, r14
	move r14, 6
	lw r0, r22, -88
	move r1, r14
	call r23, print_debug
	lw r0, r22, -88
	move r1, r17
	call r23, print_debug
	move r0, r20
	move r1, r15
	lw r15, r22, -84
	move r2, r15
	move r3, r21
	lw r21, r22, -88
	move r4, r18
	call r23, syscall
	move r0, r21
	move r1, r14
	call r23, print_debug
	lw r0, r22, -72
	jeq r0, 0, .LBB30_33
// %bb.30:                              //   in Loop: Header=BB30_29 Depth=3
	move r0, 1
.LBB30_31:                              //   Parent Loop BB30_17 Depth=1
                                        //     Parent Loop BB30_19 Depth=2
                                        //       Parent Loop BB30_29 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	lsl_add r1, r16, r0, 2
	lw r2, r1, 0
	sw r1, -4, r2
	add r0, r0, 1
	jneq r0, 512, .LBB30_31
// %bb.32:                              //   in Loop: Header=BB30_29 Depth=3
	move r1, 5
	move r0, r21
	call r23, print_debug
	move r14, r19
	add r14, r14, 2048
	move r1, 8
	move r3, 0
	move r4, 22
	lw r17, r22, -60
	move r0, r17
	move r2, r14
	call r23, syscall
	move r1, 6
	move r0, r21
	call r23, print_debug
	lw r0, r17, 0
	sw r16, 2044, r0
	jump .LBB30_34
.LBB30_20:                              //   in Loop: Header=BB30_19 Depth=2
	lw r15, r22, -32
	lw r18, r22, -28
	move r14, r3
.LBB30_35:                              //   in Loop: Header=BB30_19 Depth=2
	move r1, 5
	move r0, r21
	call r23, print_debug
	move r1, 2048
	move r3, 0
	move r4, 22
	move r0, r16
	move r2, r14
	call r23, syscall
	jgts r0, -1, .LBB30_37
// %bb.36:                              //   in Loop: Header=BB30_19 Depth=2
	move r1, 0
	move r4, 7
	move r2, r1
	move r3, r1
	call r23, syscall
.LBB30_37:                              //   in Loop: Header=BB30_19 Depth=2
	move r19, r15
	move r1, 6
	move r0, r21
	call r23, print_debug
	lw r0, r22, -72
	jeq r0, 0, .LBB30_43
// %bb.38:                              //   in Loop: Header=BB30_19 Depth=2
	move r0, 1
.LBB30_39:                              //   Parent Loop BB30_17 Depth=1
                                        //     Parent Loop BB30_19 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	lsl_add r1, r16, r0, 2
	lw r2, r1, 0
	sw r1, -4, r2
	add r0, r0, 1
	jneq r0, 512, .LBB30_39
// %bb.40:                              //   in Loop: Header=BB30_19 Depth=2
	move r1, 5
	move r0, r21
	call r23, print_debug
	add r2, r14, 2048
	move r1, 8
	move r3, 0
	move r4, 22
	move r0, r17
	call r23, syscall
	jges r0, 0, .LBB30_42
// %bb.41:                              //   in Loop: Header=BB30_19 Depth=2
	move r0, -2
	move r1, 0
	move r4, 7
	move r2, r1
	move r3, r1
	call r23, syscall
.LBB30_42:                              //   in Loop: Header=BB30_19 Depth=2
	move r1, 6
	move r0, r21
	call r23, print_debug
	lw r0, r17, 0
	sw r16, 2044, r0
.LBB30_43:                              //   in Loop: Header=BB30_19 Depth=2
	sw r22, -84, r14
	move r1, 5
	move r0, r21
	call r23, print_debug
	move r1, 2048
	move r15, 0
	move r4, 22
	lw r17, r22, -68
	move r0, r17
	move r2, r19
	move r3, r15
	call r23, syscall
	move r1, 6
	move r0, r21
	call r23, print_debug
	lw r0, r22, -36
	sub r14, r0, r18
	move r20, r17
	jlts r14, 1, .LBB30_47
// %bb.44:                              //   in Loop: Header=BB30_19 Depth=2
	lw r0, r22, -56
	lw r1, r22, -76
	lsl_add r17, r0, r1, 2
	lw r18, r17, 0
.LBB30_45:                              //   Parent Loop BB30_17 Depth=1
                                        //     Parent Loop BB30_19 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	move r19, r15
	lsl_add r0, r16, r19, 2
	lw r1, r0, 0
	lsl_add r0, r20, r19, 2
	lw r0, r0, 0
	call r23, __mulsi3
	add r18, r18, r0
	add r15, r19, 1
	sw r17, 0, r18
	jges r15, r14, .LBB30_47
// %bb.46:                              //   in Loop: Header=BB30_45 Depth=3
	jltu r19, 511, .LBB30_45
	jump .LBB30_47
.LBB30_21:
	move r1, 4
	move r0, r21
	call r23, print_debug
	move r15, b
	move r1, 0
	move r4, 15
	move r0, r15
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, r15, 4
	add r0, r0, 1
	sw r15, 4, r0
	lw r1, r15, 8
	jneq r0, r1, .LBB30_23
// %bb.22:
	move r1, 0
	move r4, 18
	move r0, r15
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r15, 4, 0
	jump .LBB30_24
.LBB30_23:
	move r0, b
	move r2, 0
	move r4, 17
	move r1, r0
	move r3, r2
	call r23, syscall
.LBB30_24:
	move r15, b
	move r1, 0
	move r4, 16
	move r0, r15
	move r2, r1
	move r3, r1
	call r23, syscall
	jneq r21, 0, .LBB30_26
// %bb.25:
	lw r0, zero, sd_host
	add r14, r22, -92
	move r16, 1
	move r17, 0
	move r4, 12
	move r1, r14
	move r2, r16
	move r3, r17
	call r23, syscall
	lw r0, zero, sd_host
	move r4, 11
	move r1, r14
	move r2, r16
	move r3, r17
	call r23, syscall
.LBB30_26:
	move r1, 0
	move r4, 15
	move r0, r15
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, r15, 4
	add r0, r0, 1
	sw r15, 4, r0
	lw r1, r15, 8
	jneq r0, r1, .LBB30_49
// %bb.27:
	move r14, b
	move r1, 0
	move r4, 18
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r14, 4, 0
	jump .LBB30_50
.LBB30_49:
	move r0, b
	move r2, 0
	move r4, 17
	move r1, r0
	move r3, r2
	call r23, syscall
.LBB30_50:
	move r0, b
	move r1, 0
	move r4, 16
	move r2, r1
	move r3, r1
	call r23, syscall
	ld d20, r22, -128
	ld d18, r22, -120
	ld d16, r22, -112
	ld d14, r22, -104
	ld d22, r22, -8
	jump r23
.LBB30_10:
	and r1, r4, 1, nz, .LBB30_11
// %bb.12:
	move r1, r18
	call r23, __mulsi3
	add r15, r0, r16, true, .LBB30_15
.LBB30_11:
	and r16, r4, 30
	move r1, r18
	call r23, __mulsi3
	add r0, r16, r0
	add r15, r0, 2, true, .LBB30_15
.Lfunc_end30:
	.size	main1, .Lfunc_end30-main1
	.section	.stack_sizes,"o",@progbits,.text.main1
	.long	.Lfunc_begin30
	.ascii	"\200\001"
	.section	.text.main1,"ax",@progbits
                                        // -- End function
	.section	.text.gemv,"ax",@progbits
	.type	gemv,@function                  // -- Begin function gemv
gemv:                                   // @gemv
.Lfunc_begin31:
// %bb.0:
	sd r22, 24, d22
	add r22, r22, 32
	sd r22, -16, d14
	sd r22, -24, d16
	sd r22, -32, d18
	lsl_add r16, r0, r3, 2
	lw r17, r16, 0
	move r14, r2
	move r15, r1
	move r18, 0
.LBB31_1:                               // =>This Inner Loop Header: Depth=1
	lsl_add r0, r15, r18, 2
	lw r1, r0, 0
	lsl_add r0, r14, r18, 2
	lw r0, r0, 0
	call r23, __mulsi3
	add r17, r17, r0
	sw r16, 0, r17
	add r18, r18, 1
	jneq r18, 512, .LBB31_1
// %bb.2:
	ld d18, r22, -32
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end31:
	.size	gemv, .Lfunc_end31-gemv
	.section	.stack_sizes,"o",@progbits,.text.gemv
	.long	.Lfunc_begin31
	.byte	32
	.section	.text.gemv,"ax",@progbits
                                        // -- End function
	.section	.text.main,"ax",@progbits
	.globl	main                            // -- Begin function main
	.type	main,@function
main:                                   // @main
.Lfunc_begin32:
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
.Lfunc_end32:
	.size	main, .Lfunc_end32-main
	.section	.stack_sizes,"o",@progbits,.text.main
	.long	.Lfunc_begin32
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
	.zero	16
	.size	DPU_INPUT_ARGUMENTS, 16

	.type	b,@object                       // @b
	.section	.bss.b,"aw",@nobits
	.globl	b
	.p2align	2
b:
	.zero	16
	.size	b, 16

	.type	dpu_info,@object                // @dpu_info
	.section	.bss.dpu_info,"aw",@nobits
	.globl	dpu_info
	.p2align	2
dpu_info:
	.long	0
	.size	dpu_info, 4

	.addrsig
	.addrsig_sym main1
	.addrsig_sym DPU_INPUT_ARGUMENTS
	.addrsig_sym b
