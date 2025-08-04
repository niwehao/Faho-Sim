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
fault_notif:                                // @syscall
// %bb.0:
	fault 1
.section	.text.print_debug,"ax",@progbits
	.globl	print_debug                         // -- Begin function syscall
	.type	print_debug,@function
print_debug:                                // @syscall
// %bb.0:
	add r1, r1, 89
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
.LBB26_1:                               // =>This Inner Loop Header: Depth=1
	move r1, 0
	move r4, 24
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	jneq r0, 0, .LBB26_1
	jump .LBB26_2
.LBB26_3:                               //   in Loop: Header=BB26_2 Depth=1
	move r1, 0
	move r4, 16
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
.LBB26_4:                               //   Parent Loop BB26_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	move r1, 0
	move r4, 24
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	jneq r0, 0, .LBB26_4
.LBB26_2:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB26_4 Depth 2
	lw r0, r14, 12
	jneq r0, 0, .LBB26_3
// %bb.5:
	lw r0, r14, 4
	add r0, r0, 1
	sw r14, 4, r0
	lw r1, r14, 8
	jneq r0, r1, .LBB26_6
// %bb.7:
	sw r14, 12, 1
	jump .LBB26_12
.LBB26_6:
	lw r1, r14, 12
	jneq r1, 0, .LBB26_12
.LBB26_9:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB26_10 Depth 2
	move r1, 0
	move r4, 16
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
.LBB26_10:                              //   Parent Loop BB26_9 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	move r1, 0
	move r4, 24
	move r0, r14
	move r2, r1
	move r3, r1
	call r23, syscall
	jneq r0, 0, .LBB26_10
// %bb.8:                               //   in Loop: Header=BB26_9 Depth=1
	lw r0, r14, 12
	jeq r0, 0, .LBB26_9
// %bb.11:
	lw r0, r14, 4
.LBB26_12:
	add r0, r0, -1
	sw r14, 4, r0
	jneq r0, 0, .LBB26_14
// %bb.13:
	sw r14, 12, 0
.LBB26_14:
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
	.section	.text.aa,"ax",@progbits
	.globl	aa                              // -- Begin function aa
	.type	aa,@function
aa:                                     // @aa
.Lfunc_begin30:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	lw r0, zero, nbl8
	move r14, 0
	move r15, 9
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	lw r0, zero, nbs8
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	lw r0, zero, nbl4
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	lw r0, zero, nbs4
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r15
	call r23, syscall
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end30:
	.size	aa, .Lfunc_end30-aa
	.section	.stack_sizes,"o",@progbits,.text.aa
	.long	.Lfunc_begin30
	.byte	16
	.section	.text.aa,"ax",@progbits
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
	move r0, 7
	move r14, 0
	move r1, r14
	call r23, print_debug
	move r0, nb_thread
	sw r0, 0, 16
	move r15, my_barrier
	move r16, 14
	move r0, r15
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r16
	call r23, syscall
	sw r15, 4, 0
	sw r15, 8, 16
	sw r15, 12, 0
	lw r17, zero, nb_thread
	move r15, bfsBarrier
	move r0, r15
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r16
	call r23, syscall
	sw r15, 4, 0
	sw r15, 8, r17
	sw r15, 12, 0
	move r0, nextFrontierMutex
	move r1, r14
	move r2, r14
	move r3, r14
	move r4, r16
	call r23, syscall
	move r4, 10
	move r0, r14
	move r1, r14
	move r2, r14
	move r3, r14
	call r23, syscall
	sw zero, sd_host, r0
	move r0, 48
	move r4, 2
	move r1, r14
	move r2, r14
	move r3, r14
	call r23, syscall
	lw r1, zero, nb_thread
	add r0, r0, -48
	sw zero, params_w, r0
	jlts r1, 2, .LBB31_3
// %bb.1:
	move r14, 1
.LBB31_2:                               // =>This Inner Loop Header: Depth=1
	move r0, main_prog
	move r1, 0
	move r4, 20
	move r2, r1
	move r3, r1
	call r23, syscall
	lw r0, zero, nb_thread
	add r14, r14, 1
	jlts r14, r0, .LBB31_2
.LBB31_3:
	call r23, main_prog
.Lfunc_end31:
	.size	main, .Lfunc_end31-main
	.section	.stack_sizes,"o",@progbits,.text.main
	.long	.Lfunc_begin31
	.byte	24
	.section	.text.main,"ax",@progbits
                                        // -- End function
	.section	.text.main_prog,"ax",@progbits
	.globl	main_prog                       // -- Begin function main_prog
	.type	main_prog,@function
main_prog:                              // @main_prog
.Lfunc_begin32:
// %bb.0:
	sd r22, 128, d22
	add r22, r22, 136
	sd r22, -112, d14
	sd r22, -120, d16
	sd r22, -128, d18
	sd r22, -136, d20
	move r0, 0
	move r4, 6
	move r1, r0
	move r2, r0
	move r3, r0
	call r23, syscall
	move r18, r0, nz, .LBB32_3
// %bb.1:
	lw r0, zero, sd_host
	move r15, ok
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
	lw r0, zero, params_w
	move r1, 48
	move r4, 22
	move r2, r17
	move r3, r17
	call r23, syscall
	jeq r0, 0, .LBB32_3
// %bb.2:
	call r23, fault_notif
.LBB32_3:
	sw r22, -84, r18
.LBB32_4:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB32_10 Depth 2
                                        //       Child Loop BB32_21 Depth 3
                                        //     Child Loop BB32_31 Depth 2
                                        //       Child Loop BB32_37 Depth 3
	move r15, my_barrier
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
	jneq r0, r1, .LBB32_6
// %bb.5:                               //   in Loop: Header=BB32_4 Depth=1
	move r1, 0
	move r4, 18
	move r0, r15
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r15, 4, 0
	jump .LBB32_7
.LBB32_6:                               //   in Loop: Header=BB32_4 Depth=1
	move r0, my_barrier
	move r2, 0
	move r4, 17
	move r1, r0
	move r3, r2
	call r23, syscall
.LBB32_7:                               //   in Loop: Header=BB32_4 Depth=1
	move r0, my_barrier
	move r1, 0
	move r4, 16
	sw r22, -28, r0
	move r2, r1
	move r3, r1
	call r23, syscall
	move r1, 3
	move r0, r18
	call r23, print_debug
	lw r0, zero, params_w
	lw r1, r0, 0
	jeq r1, 0, .LBB32_46
// %bb.8:                               //   in Loop: Header=BB32_4 Depth=1
	sw r22, -16, r1
	lw r1, r0, 12
	sw r22, -36, r1
	lw r1, r0, 20
	sw r22, -32, r1
	lw r1, r0, 24
	sw r22, -72, r1
	lw r1, r0, 32
	sw r22, -76, r1
	lw r1, r0, 4
	lw r2, r0, 36
	sw r22, -48, r2
	lw r14, r0, 40
	lsr r1, r1, 6
	sw r22, -68, r14
	sw r22, -44, r1
	jgeu r18, r1, .LBB32_25
// %bb.9:                               //   in Loop: Header=BB32_4 Depth=1
	lw r1, r0, 8
	lw r2, r0, 16
	sw r22, -60, r2
	lw r0, r0, 28
	sw r22, -56, r0
	lsr r0, r1, 6
	sw r22, -52, r0
	lw r0, r22, -16
	lsr r0, r0, 6
	lsr_add r0, r0, r1, 6
	sw r22, -40, r0
	move r0, 0
	lsl_sub r0, r0, r1, 2
	sw r22, -24, r0
	neg r0, r1
	sw r22, -20, r0
	move r16, r18, true, .LBB32_10
.LBB32_24:                              //   in Loop: Header=BB32_10 Depth=2
	lw r0, zero, nb_thread
	lw r16, r22, -80
	add r16, r0, r16
	lw r14, r22, -68
	lw r0, r22, -44
	jgeu r16, r0, .LBB32_25
.LBB32_10:                              //   Parent Loop BB32_4 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB32_21 Depth 3
	move r1, 5
	move r0, r18
	call r23, print_debug
	lw r0, zero, nbl8
	add r0, r0, 1
	sw zero, nbl8, r0
	lsl_add r17, r14, r16, 3
	add r0, r22, -104
	move r1, 8
	move r3, 0
	move r4, 22
	move r2, r17
	call r23, syscall
	jeq r0, 0, .LBB32_12
// %bb.11:                              //   in Loop: Header=BB32_10 Depth=2
	move r0, .L.str
	move r20, 0
	move r4, 8
	move r1, r20
	move r2, r20
	move r3, r20
	call r23, syscall
	move r4, 7
	move r0, r14
	move r1, r20
	move r2, r20
	move r3, r20
	call r23, syscall
.LBB32_12:                              //   in Loop: Header=BB32_10 Depth=2
	ld d14, r22, -104
	move r1, 6
	move r0, r18
	call r23, print_debug
	move.s d0, 0
	sd r22, -96, d14
	jneq r15, r1, .LBB32_53
// %bb.52:                              //   in Loop: Header=BB32_10 Depth=2
	jeq r14, r0, .LBB32_16
.LBB32_53:                              //   in Loop: Header=BB32_10 Depth=2
// %bb.13:                              //   in Loop: Header=BB32_10 Depth=2
	sw r22, -88, r17
	lsl r14, r16, 3
	move r1, 5
	move r0, r18
	call r23, print_debug
	lw r0, zero, nbl8
	add r0, r0, 1
	sw zero, nbl8, r0
	lw r15, r22, -76
	add r20, r14, r15
	add r0, r22, -104
	move r1, 8
	move r3, 0
	move r4, 22
	move r2, r20
	call r23, syscall
	jeq r0, 0, .LBB32_15
// %bb.14:                              //   in Loop: Header=BB32_10 Depth=2
	move r0, .L.str
	move r21, 0
	move r4, 8
	move r1, r21
	move r2, r21
	move r3, r21
	call r23, syscall
	move r4, 7
	move r0, r15
	move r1, r21
	move r2, r21
	move r3, r21
	call r23, syscall
.LBB32_15:                              //   in Loop: Header=BB32_10 Depth=2
	ld d14, r22, -104
	move r21, 6
	move r0, r18
	move r1, r21
	call r23, print_debug
	ld d0, r22, -96
	or r15, r15, r1
	or r14, r14, r0
	move r1, 5
	move r0, r18
	call r23, print_debug
	lw r0, zero, nbs8
	add r0, r0, 1
	sw zero, nbs8, r0
	sd r22, -104, d14
	add r15, r22, -104
	move r17, 8
	move r18, 0
	move r19, 23
	move r0, r15
	move r1, r17
	move r2, r20
	move r3, r18
	move r4, r19
	call r23, syscall
	lw r0, zero, nbs8
	add r0, r0, 1
	sw zero, nbs8, r0
	sd r22, -104, 0
	move r0, r15
	move r1, r17
	lw r2, r22, -88
	move r3, r18
	lw r18, r22, -84
	move r4, r19
	call r23, syscall
	move r0, r18
	move r1, r21
	call r23, print_debug
.LBB32_16:                              //   in Loop: Header=BB32_10 Depth=2
	lw r0, r22, -52
	sw r22, -80, r16
	jltu r16, r0, .LBB32_24
// %bb.17:                              //   in Loop: Header=BB32_10 Depth=2
	lw r0, r22, -40
	lw r1, r22, -80
	jgeu r1, r0, .LBB32_24
// %bb.18:                              //   in Loop: Header=BB32_10 Depth=2
	move r1, 5
	move r0, r18
	call r23, print_debug
	lw r0, zero, nbs8
	lw r1, r22, -52
	lw r2, r22, -80
	sub r1, r2, r1
	add r0, r0, 1
	sw zero, nbs8, r0
	ld d14, r22, -96
	sd r22, -104, d14
	lw r0, r22, -48
	lsl_add r2, r0, r1, 3
	add r0, r22, -104
	move r1, 8
	move r3, 0
	move r4, 23
	call r23, syscall
	move r1, 6
	move r0, r18
	call r23, print_debug
	move.s d0, 0
	jneq r15, r1, .LBB32_55
// %bb.54:                              //   in Loop: Header=BB32_10 Depth=2
	jeq r14, r0, .LBB32_24
.LBB32_55:                              //   in Loop: Header=BB32_10 Depth=2
// %bb.19:                              //   in Loop: Header=BB32_10 Depth=2
	lw r0, r22, -80
	lsl r14, r0, 6
	jeq r14, -64, .LBB32_24
// %bb.20:                              //   in Loop: Header=BB32_10 Depth=2
	move r0, 64
	lw r1, r22, -80
	lsl_add r0, r0, r1, 6
	sw r22, -88, r0
	lw r0, r22, -24
	lsl_add r21, r0, r1, 8
	lw r0, r22, -20
	add r0, r0, r14
	sw r22, -64, r0
	move r16, 0, true, .LBB32_21
.LBB32_23:                              //   in Loop: Header=BB32_21 Depth=3
	add r16, r16, 1
	add r0, r14, r16
	add r21, r21, 4
	lw r1, r22, -88
	jgeu r0, r1, .LBB32_24
.LBB32_21:                              //   Parent Loop BB32_4 Depth=1
                                        //     Parent Loop BB32_10 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	lsl r0, one, r16
	move.s d0, r0
	ld d2, r22, -96
	and r1, r3, r1
	and r0, r2, r0
	move.s d2, 0
	jneq r1, r3, .LBB32_57
// %bb.56:                              //   in Loop: Header=BB32_21 Depth=3
	jeq r0, r2, .LBB32_23
.LBB32_57:                              //   in Loop: Header=BB32_21 Depth=3
// %bb.22:                              //   in Loop: Header=BB32_21 Depth=3
	move r1, 5
	move r0, r18
	call r23, print_debug
	lw r0, zero, nbs4
	lw r1, r22, -64
	add r1, r1, r16
	add r0, r0, 1
	sw zero, nbs4, r0
	and r20, r1, 1
	and r0, r21, -8
	lw r1, r22, -56
	add r15, r0, r1
	add r17, r22, -104
	move r18, 8
	move r19, 0
	move r4, 22
	move r0, r17
	move r1, r18
	move r2, r15
	move r3, r19
	call r23, syscall
	lsl_add r0, r17, r20, 2
	lw r1, r22, -60
	sw r0, 0, r1
	move r4, 23
	move r0, r17
	move r1, r18
	lw r18, r22, -84
	move r2, r15
	move r3, r19
	call r23, syscall
	move r1, 6
	move r0, r18
	call r23, print_debug
	jump .LBB32_23
.LBB32_25:                              //   in Loop: Header=BB32_4 Depth=1
	move r1, 1
	move r0, r18
	call r23, print_debug
	move r0, bfsBarrier
	call r23, active_wait_barrier
	move r1, 2
	move r0, r18
	call r23, print_debug
	lw r1, zero, nb_thread
	lw r14, r22, -16
	add r0, r14, r1
	add r0, r0, -1
	call r23, __udiv32
	move r20, r0
	move r1, r18
	call r23, __mulsi3
	move r17, r0
	add r1, r17, r20
	sub r0, r14, r17
	jgtu r1, r14, .LBB32_27
// %bb.26:                              //   in Loop: Header=BB32_4 Depth=1
	move r0, r20
.LBB32_27:                              //   in Loop: Header=BB32_4 Depth=1
	move r1, 0
	lw r16, r22, -48
	jltu r14, r17, .LBB32_29
// %bb.28:                              //   in Loop: Header=BB32_4 Depth=1
	move r1, r0
.LBB32_29:                              //   in Loop: Header=BB32_4 Depth=1
	add r0, r1, r17
	sw r22, -60, r0
	jgeu r17, r0, .LBB32_46
// %bb.30:                              //   in Loop: Header=BB32_4 Depth=1
	move r0, 0
	lw r1, r22, -36
	lsl_sub r0, r0, r1, 2
	sw r22, -56, r0
	jump .LBB32_31
.LBB32_44:                              //   in Loop: Header=BB32_31 Depth=2
	lw r16, r22, -48
	lw r17, r22, -64
	lw r0, r22, -60
	jeq r17, r0, .LBB32_46
.LBB32_31:                              //   Parent Loop BB32_4 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB32_37 Depth 3
	move r1, 5
	move r0, r18
	call r23, print_debug
	lw r0, zero, nbl8
	add r0, r0, 1
	sw zero, nbl8, r0
	lsr r0, r17, 3
	and r0, r0, 536870904
	add r2, r0, r16
	add r0, r22, -104
	move r1, 8
	move r3, 0
	move r4, 22
	call r23, syscall
	jeq r0, 0, .LBB32_33
// %bb.32:                              //   in Loop: Header=BB32_31 Depth=2
	move r0, .L.str
	move r15, 0
	move r4, 8
	move r1, r15
	move r2, r15
	move r3, r15
	call r23, syscall
	move r4, 7
	move r0, r16
	move r1, r15
	move r2, r15
	move r3, r15
	call r23, syscall
.LBB32_33:                              //   in Loop: Header=BB32_31 Depth=2
	ld d14, r22, -104
	move r1, 6
	move r0, r18
	call r23, print_debug
	and r0, r17, 63
	lsl r0, one, r0
	move.s d0, r0
	and r1, r15, r1
	and r0, r14, r0
	move.s d2, 0
	jneq r1, r3, .LBB32_59
// %bb.58:                              //   in Loop: Header=BB32_31 Depth=2
	jeq r0, r2, .LBB32_34
.LBB32_59:                              //   in Loop: Header=BB32_31 Depth=2
// %bb.35:                              //   in Loop: Header=BB32_31 Depth=2
	move r1, 5
	move r0, r18
	call r23, print_debug
	lw r0, zero, nbl4
	add r0, r0, 1
	sw zero, nbl4, r0
	and r14, r17, 1
	lsl r0, r17, 2
	and r0, r0, -8
	lw r21, r22, -32
	add r2, r0, r21
	add r15, r22, -104
	move r16, 8
	move r18, 0
	move r20, 22
	move r0, r15
	move r1, r16
	move r3, r18
	move r4, r20
	call r23, syscall
	lsl_add r0, r15, r14, 2
	lw r14, r0, 0
	lw r0, zero, nbl4
	lw r19, r22, -36
	sub r1, r14, r19
	add r17, r17, 1
	add r0, r0, 1
	sw zero, nbl4, r0
	and r0, r17, 1
	sw r22, -96, r0
	sw r22, -64, r17
	lsl r0, r17, 2
	move r17, r1
	and r0, r0, -8
	add r2, r0, r21
	move r0, r15
	move r1, r16
	move r3, r18
	lw r18, r22, -84
	move r4, r20
	call r23, syscall
	lw r0, r22, -96
	lsl_add r0, r15, r0, 2
	lw r15, r0, 0
	sub r16, r15, r19
	move r1, 6
	move r0, r18
	call r23, print_debug
	jgeu r17, r16, .LBB32_44
// %bb.36:                              //   in Loop: Header=BB32_31 Depth=2
	sub r1, r15, r14
	lw r0, r22, -56
	lsl_add r14, r0, r14, 2, true, .LBB32_37
.LBB32_42:                              //   in Loop: Header=BB32_37 Depth=3
	ld d20, r22, -104
	move r15, 6
	lw r19, r22, -84
	move r0, r19
	move r1, r15
	call r23, print_debug
	or r17, r21, r17
	or r16, r20, r16
	move r1, 5
	move r0, r19
	call r23, print_debug
	lw r0, zero, nbs8
	add r0, r0, 1
	sw zero, nbs8, r0
	sd r22, -104, d16
	add r0, r22, -104
	move r1, 8
	move r17, 0
	move r4, 23
	move r2, r18
	move r18, r19
	move r3, r17
	call r23, syscall
	move r0, r18
	move r1, r15
	call r23, print_debug
	move r0, nextFrontierMutex
	move r4, 16
	move r1, r17
	move r2, r17
	move r3, r17
	call r23, syscall
.LBB32_43:                              //   in Loop: Header=BB32_37 Depth=3
	lw r17, r22, -96
	add r17, r17, 1
	add r14, r14, 4
	lw r1, r22, -88
	add r1, r1, -1, z, .LBB32_44
.LBB32_37:                              //   Parent Loop BB32_4 Depth=1
                                        //     Parent Loop BB32_31 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	sw r22, -88, r1
	move r15, 5
	move r0, r18
	move r1, r15
	call r23, print_debug
	lw r0, zero, nbl4
	add r0, r0, 1
	sw zero, nbl4, r0
	sw r22, -96, r17
	and r16, r17, 1
	and r0, r14, -8
	lw r1, r22, -72
	add r2, r0, r1
	add r17, r22, -104
	move r19, 8
	move r20, 0
	move r21, 22
	move r0, r17
	move r1, r19
	move r3, r20
	move r4, r21
	call r23, syscall
	lsl_add r0, r17, r16, 2
	lw r16, r0, 0
	move r1, 6
	move r0, r18
	call r23, print_debug
	move r0, r18
	move r1, r15
	call r23, print_debug
	lw r0, zero, nbl8
	add r0, r0, 1
	sw zero, nbl8, r0
	lsr r0, r16, 3
	and r0, r0, 536870904
	lw r18, r22, -76
	sw r22, -80, r0
	add r2, r0, r18
	move r0, r17
	move r1, r19
	move r3, r20
	move r4, r21
	call r23, syscall
	jeq r0, 0, .LBB32_39
// %bb.38:                              //   in Loop: Header=BB32_37 Depth=3
	move r0, .L.str
	move r15, 0
	move r4, 8
	move r1, r15
	move r2, r15
	move r3, r15
	call r23, syscall
	move r4, 7
	move r0, r18
	move r1, r15
	move r2, r15
	move r3, r15
	call r23, syscall
.LBB32_39:                              //   in Loop: Header=BB32_37 Depth=3
	ld d20, r22, -104
	move r1, 6
	lw r18, r22, -84
	move r0, r18
	call r23, print_debug
	and r0, r16, 63
	lsl r0, one, r0
	move.s d16, r0
	and r1, r21, r17
	and r0, r20, r16
	move.s d2, 0
	jneq r1, r3, .LBB32_43
// %bb.60:                              //   in Loop: Header=BB32_37 Depth=3
	jneq r0, r2, .LBB32_43
// %bb.61:                              //   in Loop: Header=BB32_37 Depth=3
// %bb.40:                              //   in Loop: Header=BB32_37 Depth=3
	move r0, nextFrontierMutex
	move r15, 0
	move r4, 15
	move r1, r15
	move r2, r15
	move r3, r15
	call r23, syscall
	move r1, 5
	move r0, r18
	call r23, print_debug
	lw r0, zero, nbl8
	add r0, r0, 1
	sw zero, nbl8, r0
	lw r19, r22, -68
	lw r0, r22, -80
	add r18, r0, r19
	add r0, r22, -104
	move r1, 8
	move r4, 22
	move r2, r18
	move r3, r15
	call r23, syscall
	jeq r0, 0, .LBB32_42
// %bb.41:                              //   in Loop: Header=BB32_37 Depth=3
	move r0, .L.str
	move r15, 0
	move r4, 8
	move r1, r15
	move r2, r15
	move r3, r15
	call r23, syscall
	move r4, 7
	move r0, r19
	move r1, r15
	move r2, r15
	move r3, r15
	call r23, syscall
	jump .LBB32_42
.LBB32_34:                              //   in Loop: Header=BB32_31 Depth=2
	add r17, r17, 1
	lw r0, r22, -60
	jneq r17, r0, .LBB32_31
.LBB32_46:                              //   in Loop: Header=BB32_4 Depth=1
	move r1, 4
	move r0, r18
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
	jneq r0, r1, .LBB32_48
// %bb.47:                              //   in Loop: Header=BB32_4 Depth=1
	move r15, my_barrier
	move r1, 0
	move r4, 18
	move r0, r15
	move r2, r1
	move r3, r1
	call r23, syscall
	sw r15, 4, 0
	jump .LBB32_49
.LBB32_48:                              //   in Loop: Header=BB32_4 Depth=1
	move r0, my_barrier
	move r2, 0
	move r4, 17
	move r1, r0
	move r3, r2
	call r23, syscall
.LBB32_49:                              //   in Loop: Header=BB32_4 Depth=1
	move r0, my_barrier
	move r1, 0
	move r4, 16
	move r2, r1
	move r3, r1
	call r23, syscall
	jneq r18, 0, .LBB32_4
// %bb.50:                              //   in Loop: Header=BB32_4 Depth=1
	lw r0, zero, sd_host
	move r15, ok
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
	lw r0, zero, params_w
	move r1, 48
	move r4, 22
	move r2, r17
	move r3, r17
	call r23, syscall
	jeq r0, 0, .LBB32_4
// %bb.51:                              //   in Loop: Header=BB32_4 Depth=1
	call r23, fault_notif
	jump .LBB32_4
.Lfunc_end32:
	.size	main_prog, .Lfunc_end32-main_prog
	.section	.stack_sizes,"o",@progbits,.text.main_prog
	.long	.Lfunc_begin32
	.ascii	"\210\001"
	.section	.text.main_prog,"ax",@progbits
                                        // -- End function
	.type	nbl8,@object                    // @nbl8
	.section	.bss.nbl8,"aw",@nobits
	.globl	nbl8
	.p2align	2
nbl8:
	.long	0                               // 0x0
	.size	nbl8, 4

	.type	nbs8,@object                    // @nbs8
	.section	.bss.nbs8,"aw",@nobits
	.globl	nbs8
	.p2align	2
nbs8:
	.long	0                               // 0x0
	.size	nbs8, 4

	.type	nbl4,@object                    // @nbl4
	.section	.bss.nbl4,"aw",@nobits
	.globl	nbl4
	.p2align	2
nbl4:
	.long	0                               // 0x0
	.size	nbl4, 4

	.type	nbs4,@object                    // @nbs4
	.section	.bss.nbs4,"aw",@nobits
	.globl	nbs4
	.p2align	2
nbs4:
	.long	0                               // 0x0
	.size	nbs4, 4

	.type	nb_thread,@object               // @nb_thread
	.section	.bss.nb_thread,"aw",@nobits
	.globl	nb_thread
	.p2align	2
nb_thread:
	.long	0                               // 0x0
	.size	nb_thread, 4

	.type	my_barrier,@object              // @my_barrier
	.section	.bss.my_barrier,"aw",@nobits
	.globl	my_barrier
	.p2align	2
my_barrier:
	.zero	16
	.size	my_barrier, 16

	.type	bfsBarrier,@object              // @bfsBarrier
	.section	.bss.bfsBarrier,"aw",@nobits
	.globl	bfsBarrier
	.p2align	2
bfsBarrier:
	.zero	16
	.size	bfsBarrier, 16

	.type	nextFrontierMutex,@object       // @nextFrontierMutex
	.section	.bss.nextFrontierMutex,"aw",@nobits
	.globl	nextFrontierMutex
	.p2align	2
nextFrontierMutex:
	.zero	4
	.size	nextFrontierMutex, 4

	.type	sd_host,@object                 // @sd_host
	.section	.bss.sd_host,"aw",@nobits
	.globl	sd_host
	.p2align	2
sd_host:
	.long	0                               // 0x0
	.size	sd_host, 4

	.type	params_w,@object                // @params_w
	.section	.bss.params_w,"aw",@nobits
	.globl	params_w
	.p2align	2
params_w:
	.long	0
	.size	params_w, 4

	.type	ok,@object                      // @ok
	.section	.bss.ok,"aw",@nobits
	.globl	ok
ok:
	.byte	0                               // 0x0
	.size	ok, 1

	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"umram_read"
	.size	.L.str, 11

	.addrsig
	.addrsig_sym main_prog
	.addrsig_sym my_barrier
	.addrsig_sym bfsBarrier
	.addrsig_sym nextFrontierMutex
	.addrsig_sym ok
