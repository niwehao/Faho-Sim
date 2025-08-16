	.text
	.file	"VA.c"
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
	.section	.text.empty_syscall,"ax",@progbits
	.globl	empty_syscall                   // -- Begin function empty_syscall
	.type	empty_syscall,@function
empty_syscall:                          // @empty_syscall
.Lfunc_begin21:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r0, 0
	move r1, r0
	move r2, r0
	move r3, r0
	move r4, r0
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end21:
	.size	empty_syscall, .Lfunc_end21-empty_syscall
	.section	.stack_sizes,"o",@progbits,.text.empty_syscall
	.long	.Lfunc_begin21
	.byte	8
	.section	.text.empty_syscall,"ax",@progbits
                                        // -- End function
	.section	.text.empty_call,"ax",@progbits
	.globl	empty_call                      // -- Begin function empty_call
	.type	empty_call,@function
empty_call:                             // @empty_call
.Lfunc_begin22:
// %bb.0:
	move r0, 0
	jump r23
.Lfunc_end22:
	.size	empty_call, .Lfunc_end22-empty_call
	.section	.stack_sizes,"o",@progbits,.text.empty_call
	.long	.Lfunc_begin22
	.byte	0
	.section	.text.empty_call,"ax",@progbits
                                        // -- End function
	.section	.text.umram_read,"ax",@progbits
	.globl	umram_read                      // -- Begin function umram_read
	.type	umram_read,@function
umram_read:                             // @umram_read
.Lfunc_begin23:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r3, 0
	move r4, 22
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end23:
	.size	umram_read, .Lfunc_end23-umram_read
	.section	.stack_sizes,"o",@progbits,.text.umram_read
	.long	.Lfunc_begin23
	.byte	8
	.section	.text.umram_read,"ax",@progbits
                                        // -- End function
	.section	.text.umram_write,"ax",@progbits
	.globl	umram_write                     // -- Begin function umram_write
	.type	umram_write,@function
umram_write:                            // @umram_write
.Lfunc_begin24:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r3, 0
	move r4, 23
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end24:
	.size	umram_write, .Lfunc_end24-umram_write
	.section	.stack_sizes,"o",@progbits,.text.umram_write
	.long	.Lfunc_begin24
	.byte	8
	.section	.text.umram_write,"ax",@progbits
                                        // -- End function
	.section	.text.init_barrier,"ax",@progbits
	.globl	init_barrier                    // -- Begin function init_barrier
	.type	init_barrier,@function
init_barrier:                           // @init_barrier
.Lfunc_begin25:
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
.Lfunc_end25:
	.size	init_barrier, .Lfunc_end25-init_barrier
	.section	.stack_sizes,"o",@progbits,.text.init_barrier
	.long	.Lfunc_begin25
	.byte	16
	.section	.text.init_barrier,"ax",@progbits
                                        // -- End function
	.section	.text.wait_barrier,"ax",@progbits
	.globl	wait_barrier                    // -- Begin function wait_barrier
	.type	wait_barrier,@function
wait_barrier:                           // @wait_barrier
.Lfunc_begin26:
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
	jneq r0, r1, .LBB26_2
// %bb.1:
	move r1, 0
	move r4, 18
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r14, 4, 0
	jump .LBB26_3
.LBB26_2:
	move r2, 0
	move r4, 17
	move r0, r14
	move r1, r14
	move r3, r2
	call r23, syscall
.LBB26_3:
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
	.size	wait_barrier, .Lfunc_end26-wait_barrier
	.section	.stack_sizes,"o",@progbits,.text.wait_barrier
	.long	.Lfunc_begin26
	.byte	16
	.section	.text.wait_barrier,"ax",@progbits
                                        // -- End function
	.section	.text.wait,"ax",@progbits
	.globl	wait                            // -- Begin function wait
	.type	wait,@function
wait:                                   // @wait
.Lfunc_begin27:
// %bb.0:
	jump r23
.Lfunc_end27:
	.size	wait, .Lfunc_end27-wait
	.section	.stack_sizes,"o",@progbits,.text.wait
	.long	.Lfunc_begin27
	.byte	0
	.section	.text.wait,"ax",@progbits
                                        // -- End function
	.section	.text.active_wait_barrier,"ax",@progbits
	.globl	active_wait_barrier             // -- Begin function active_wait_barrier
	.type	active_wait_barrier,@function
active_wait_barrier:                    // @active_wait_barrier
.Lfunc_begin28:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r14, r0
	lw r0, r14, 12
	jeq r0, 0, .LBB28_5
// %bb.1:
	move r0, 100, true, .LBB28_2
.LBB28_4:                               //   in Loop: Header=BB28_2 Depth=1
	lw r1, r14, 12
	jeq r1, 0, .LBB28_5
.LBB28_2:                               // =>This Inner Loop Header: Depth=1
	add r0, r0, -1, nz, .LBB28_4
// %bb.3:                               //   in Loop: Header=BB28_2 Depth=1
	move r0, 0
	move r4, 1
	move r1, r0
	move r2, r0
	move r3, r0
	call r23, syscall
	move r0, 100, true, .LBB28_4
.LBB28_5:                               // =>This Inner Loop Header: Depth=1
	move r1, 0
	move r4, 24
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	jneq r0, 0, .LBB28_5
// %bb.6:
	lw r0, r14, 4
	add r0, r0, 1
	sw r14, 4, r0
	lw r1, r14, 8
	jneq r0, r1, .LBB28_8
// %bb.7:
	sw r14, 4, 0
	jump .LBB28_15
.LBB28_8:
	move r1, 0
	move r4, 16
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, r14, 4
	jeq r0, 0, .LBB28_13
// %bb.9:
	move r1, 100, true, .LBB28_10
.LBB28_12:                              //   in Loop: Header=BB28_10 Depth=1
	jeq r0, 0, .LBB28_13
.LBB28_10:                              // =>This Inner Loop Header: Depth=1
	add r1, r1, -1, nz, .LBB28_12
// %bb.11:                              //   in Loop: Header=BB28_10 Depth=1
	move r0, 0
	move r4, 1
	move r1, r0
	move r2, r0
	move r3, r0
	call r23, syscall
	lw r0, r14, 4
	move r1, 100, true, .LBB28_12
.LBB28_13:                              // =>This Inner Loop Header: Depth=1
	move r1, 0
	move r4, 24
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	jneq r0, 0, .LBB28_13
// %bb.14:
	lw r0, r14, 8
.LBB28_15:
	lw r1, r14, 12
	add r1, r1, 1
	sw r14, 12, r1
	lw r1, r14, 12
	jneq r1, r0, .LBB28_17
// %bb.16:
	sw r14, 12, 0
.LBB28_17:
	move r1, 0
	move r4, 16
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end28:
	.size	active_wait_barrier, .Lfunc_end28-active_wait_barrier
	.section	.stack_sizes,"o",@progbits,.text.active_wait_barrier
	.long	.Lfunc_begin28
	.byte	16
	.section	.text.active_wait_barrier,"ax",@progbits
                                        // -- End function
	.section	.text.init_handshake,"ax",@progbits
	.globl	init_handshake                  // -- Begin function init_handshake
	.type	init_handshake,@function
init_handshake:                         // @init_handshake
.Lfunc_begin29:
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
.Lfunc_end29:
	.size	init_handshake, .Lfunc_end29-init_handshake
	.section	.stack_sizes,"o",@progbits,.text.init_handshake
	.long	.Lfunc_begin29
	.byte	16
	.section	.text.init_handshake,"ax",@progbits
                                        // -- End function
	.section	.text.handshake_wait,"ax",@progbits
	.globl	handshake_wait                  // -- Begin function handshake_wait
	.type	handshake_wait,@function
handshake_wait:                         // @handshake_wait
.Lfunc_begin30:
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
.LBB30_2:                               // =>This Inner Loop Header: Depth=1
	call r23, syscall
	lbu r0, r15, 0
	jneq r0, 0, .LBB30_3
// %bb.1:                               //   in Loop: Header=BB30_2 Depth=1
	move r2, 0
	move r4, 17
	move r0, r15
	move r1, r14
	move r3, r2, true, .LBB30_2
.LBB30_3:
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
.Lfunc_end30:
	.size	handshake_wait, .Lfunc_end30-handshake_wait
	.section	.stack_sizes,"o",@progbits,.text.handshake_wait
	.long	.Lfunc_begin30
	.byte	16
	.section	.text.handshake_wait,"ax",@progbits
                                        // -- End function
	.section	.text.handshake_notify,"ax",@progbits
	.globl	handshake_notify                // -- Begin function handshake_notify
	.type	handshake_notify,@function
handshake_notify:                       // @handshake_notify
.Lfunc_begin31:
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
.Lfunc_end31:
	.size	handshake_notify, .Lfunc_end31-handshake_notify
	.section	.stack_sizes,"o",@progbits,.text.handshake_notify
	.long	.Lfunc_begin31
	.byte	24
	.section	.text.handshake_notify,"ax",@progbits
                                        // -- End function
	.section	.text.main1,"ax",@progbits
	.globl	main1                           // -- Begin function main1
	.type	main1,@function
main1:                                  // @main1
.Lfunc_begin32:
// %bb.0:
	sd r22, 88, d22
	add r22, r22, 96
	sd r22, -72, d14
	sd r22, -80, d16
	sd r22, -88, d18
	sd r22, -96, d20
	move r17, 1024
	move r18, 0
	move r14, 2
	move r0, r17
	move r1, r18
	move r2, r18
	move r3, r18
	move r4, r14
	call r23, syscall
	move r15, r0
	move r0, r17
	move r1, r18
	move r2, r18
	move r3, r18
	move r4, r14
	call r23, syscall
	move r16, r0
	move r4, 6
	move r0, r18
	move r1, r18
	move r2, r18
	move r3, r18
	call r23, syscall
	move r21, r0, nz, .LBB32_4
// %bb.1:
	move r14, r21
	lw r0, zero, sd_host
	add r19, r22, -64
	move r20, 1
	move r21, 0
	move r4, 12
	move r1, r19
	move r2, r20
	move r3, r21
	call r23, syscall
	lw r0, zero, sd_host
	move r4, 11
	move r1, r19
	move r2, r20
	move r3, r21
	call r23, syscall
	move r0, DPU_INPUT_ARGUMENTS
	move r1, 8
	move r4, 22
	move r2, r21
	move r3, r21
	call r23, syscall
	jgts r0, -1, .LBB32_3
// %bb.2:
	move r0, 3
	move r1, 0
	move r4, 7
	move r2, r1
	move r3, r1
	call r23, syscall
.LBB32_3:
	move r21, r14
.LBB32_4:
	add r0, r15, -1024
	sw r22, -56, r0
	add r0, r16, -1024
	sw r22, -32, r0
	lsl r0, r21, 10
	sw r22, -24, r0
	lsl_add r0, r17, r21, 10
	sw r22, -20, r0
	lsl_sub r0, r18, r21, 10
	sw r22, -16, r0
.LBB32_5:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB32_10 Depth 2
	move r17, b
	move r1, 0
	move r4, 15
	move r0, r17
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, r17, 4
	add r0, r0, 1
	sw r17, 4, r0
	lw r1, r17, 8
	jneq r0, r1, .LBB32_7
// %bb.6:                               //   in Loop: Header=BB32_5 Depth=1
	move r1, 0
	move r4, 18
	move r0, r17
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r17, 4, 0
	jump .LBB32_8
.LBB32_7:                               //   in Loop: Header=BB32_5 Depth=1
	move r0, b
	move r2, 0
	move r4, 17
	move r1, r0
	move r3, r2
	call r23, syscall
.LBB32_8:                               //   in Loop: Header=BB32_5 Depth=1
	move r0, b
	move r1, 0
	move r4, 16
	sw r22, -28, r0
	move r2, r1
	move r3, r1
	call r23, syscall
	move r1, 3
	move r0, r21
	call r23, print_debug
	lw r1, zero, DPU_INPUT_ARGUMENTS
	lw r0, r22, -24
	jleu r1, r0, .LBB32_13
// %bb.9:                               //   in Loop: Header=BB32_5 Depth=1
	move r0, DPU_INPUT_ARGUMENTS
	lw r0, r0, 4
	add r0, r0, 8
	sw r22, -36, r0
	lw r14, r22, -16
	lw r16, r22, -20
	lw r20, r22, -24
	sw r22, -40, r1
	jump .LBB32_10
.LBB32_12:                              //   in Loop: Header=BB32_10 Depth=2
	add r18, r0, r14
	move r15, 5
	move r0, r21
	move r1, r15
	sw r22, -52, r15
	call r23, print_debug
	add r2, r20, 8
	move r17, 0
	move r19, 22
	lw r0, r22, -56
	move r1, r18
	move r3, r17
	move r4, r19
	call r23, syscall
	move r1, 6
	sw r22, -44, r1
	move r0, r21
	call r23, print_debug
	move r0, r21
	move r1, r15
	call r23, print_debug
	lw r0, r22, -36
	add r2, r0, r20
	sw r22, -48, r2
	lw r15, r22, -32
	move r0, r15
	move r1, r18
	move r3, r17
	move r4, r19
	call r23, syscall
	move r0, r21
	lw r19, r22, -44
	move r1, r19
	call r23, print_debug
	lsr r2, r18, 2
	move r0, r15
	lw r1, r22, -56
	call r23, vector_addition
	move r0, r21
	lw r1, r22, -52
	call r23, print_debug
	move r4, 23
	move r0, r15
	move r1, r18
	lw r2, r22, -48
	move r3, r17
	call r23, syscall
	move r0, r21
	move r1, r19
	call r23, print_debug
	add r20, r20, 16384
	add r16, r16, 16384
	add r14, r14, -16384
	lw r1, r22, -40
	jleu r1, r20, .LBB32_13
.LBB32_10:                              //   Parent Loop BB32_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	move r0, r1
	jltu r1, r16, .LBB32_12
// %bb.11:                              //   in Loop: Header=BB32_10 Depth=2
	move r0, r16, true, .LBB32_12
.LBB32_13:                              //   in Loop: Header=BB32_5 Depth=1
	move r1, 4
	move r0, r21
	call r23, print_debug
	move r1, 0
	move r4, 15
	lw r14, r22, -28
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, r14, 4
	add r0, r0, 1
	sw r14, 4, r0
	lw r1, r14, 8
	jneq r0, r1, .LBB32_15
// %bb.14:                              //   in Loop: Header=BB32_5 Depth=1
	move r17, b
	move r1, 0
	move r4, 18
	move r0, r17
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r17, 4, 0
	jump .LBB32_16
.LBB32_15:                              //   in Loop: Header=BB32_5 Depth=1
	move r0, b
	move r2, 0
	move r4, 17
	move r1, r0
	move r3, r2
	call r23, syscall
.LBB32_16:                              //   in Loop: Header=BB32_5 Depth=1
	move r0, b
	move r1, 0
	move r4, 16
	move r2, r1
	move r3, r1
	call r23, syscall
	jneq r21, 0, .LBB32_5
// %bb.17:                              //   in Loop: Header=BB32_5 Depth=1
	lw r0, zero, sd_host
	add r15, r22, -60
	move r17, 1
	move r18, 0
	move r4, 12
	move r1, r15
	move r2, r17
	move r3, r18
	call r23, syscall
	lw r0, zero, sd_host
	move r4, 11
	move r1, r15
	move r2, r17
	move r3, r18
	call r23, syscall
	move r0, DPU_INPUT_ARGUMENTS
	move r1, 8
	move r4, 22
	move r2, r18
	move r3, r18
	call r23, syscall
	jgts r0, -1, .LBB32_5
// %bb.18:                              //   in Loop: Header=BB32_5 Depth=1
	move r0, 3
	move r1, 0
	move r4, 7
	move r2, r1
	move r3, r1
	call r23, syscall
	jump .LBB32_5
.Lfunc_end32:
	.size	main1, .Lfunc_end32-main1
	.section	.stack_sizes,"o",@progbits,.text.main1
	.long	.Lfunc_begin32
	.byte	96
	.section	.text.main1,"ax",@progbits
                                        // -- End function
	.section	.text.vector_addition,"ax",@progbits
	.type	vector_addition,@function       // -- Begin function vector_addition
vector_addition:                        // @vector_addition
.Lfunc_begin33:
// %bb.0:
	jeq r2, 0, .LBB33_2
.LBB33_1:                               // =>This Inner Loop Header: Depth=1
	lw r3, r1, 0
	lw r4, r0, 0
	add r3, r4, r3
	sw r0, 0, r3
	add r0, r0, 4
	add r1, r1, 4
	add r2, r2, -1, nz, .LBB33_1
.LBB33_2:
	jump r23
.Lfunc_end33:
	.size	vector_addition, .Lfunc_end33-vector_addition
	.section	.stack_sizes,"o",@progbits,.text.vector_addition
	.long	.Lfunc_begin33
	.byte	0
	.section	.text.vector_addition,"ax",@progbits
                                        // -- End function
	.section	.text.main,"ax",@progbits
	.globl	main                            // -- Begin function main
	.type	main,@function
main:                                   // @main
.Lfunc_begin34:
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
.Lfunc_end34:
	.size	main, .Lfunc_end34-main
	.section	.stack_sizes,"o",@progbits,.text.main
	.long	.Lfunc_begin34
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
	.zero	8
	.size	DPU_INPUT_ARGUMENTS, 8

	.type	b,@object                       // @b
	.section	.bss.b,"aw",@nobits
	.globl	b
	.p2align	2
b:
	.zero	16
	.size	b, 16

	.addrsig
	.addrsig_sym main1
	.addrsig_sym DPU_INPUT_ARGUMENTS
	.addrsig_sym b
