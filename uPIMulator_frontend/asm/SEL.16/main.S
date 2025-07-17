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
	move r1, 8
	time_cfg r0,r1
	jump r23

	.section	.text.socket_read,"ax",@progbits
	.globl	socket_read                     // -- Begin function socket_read
	.type	socket_read,@function
socket_read:                            // @socket_read
.Lfunc_begin0:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sw r22, -24, r0
	sw r22, -20, r1
	sw r22, -16, r2
	lw r0, r22, -24
	lw r1, r22, -20
	lw r2, r22, -16
	move r3, 0
	move r4, 11
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	socket_read, .Lfunc_end0-socket_read
	.section	.stack_sizes,"o",@progbits,.text.socket_read
	.long	.Lfunc_begin0
	.byte	24
	.section	.text.socket_read,"ax",@progbits
                                        // -- End function
	.section	.text.socket_write,"ax",@progbits
	.globl	socket_write                    // -- Begin function socket_write
	.type	socket_write,@function
socket_write:                           // @socket_write
.Lfunc_begin1:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sw r22, -24, r0
	sw r22, -20, r1
	sw r22, -16, r2
	lw r0, r22, -24
	lw r1, r22, -20
	lw r2, r22, -16
	move r3, 0
	move r4, 12
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end1:
	.size	socket_write, .Lfunc_end1-socket_write
	.section	.stack_sizes,"o",@progbits,.text.socket_write
	.long	.Lfunc_begin1
	.byte	24
	.section	.text.socket_write,"ax",@progbits
                                        // -- End function
	.section	.text.socket_open,"ax",@progbits
	.globl	socket_open                     // -- Begin function socket_open
	.type	socket_open,@function
socket_open:                            // @socket_open
.Lfunc_begin2:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
                                        // kill: def $r1 killed $r0
	sb r22, -16, r0
	lbu r0, r22, -16
	move r3, 0
	move r4, 10
	move r1, r3
	move r2, r3
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end2:
	.size	socket_open, .Lfunc_end2-socket_open
	.section	.stack_sizes,"o",@progbits,.text.socket_open
	.long	.Lfunc_begin2
	.byte	16
	.section	.text.socket_open,"ax",@progbits
                                        // -- End function
	.section	.text.socket_close,"ax",@progbits
	.globl	socket_close                    // -- Begin function socket_close
	.type	socket_close,@function
socket_close:                           // @socket_close
.Lfunc_begin3:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
                                        // kill: def $r1 killed $r0
	sb r22, -16, r0
	lbu r0, r22, -16
	move r3, 0
	move r4, 13
	move r1, r3
	move r2, r3
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end3:
	.size	socket_close, .Lfunc_end3-socket_close
	.section	.stack_sizes,"o",@progbits,.text.socket_close
	.long	.Lfunc_begin3
	.byte	16
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
	move r3, 0
	move r4, 6
	move r0, r3
	move r1, r3
	move r2, r3
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
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, r0
	lw r0, r22, -16
	move r3, 0
	move r4, 7
	move r1, r3
	move r2, r3
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end5:
	.size	exit_proc, .Lfunc_end5-exit_proc
	.section	.stack_sizes,"o",@progbits,.text.exit_proc
	.long	.Lfunc_begin5
	.byte	16
	.section	.text.exit_proc,"ax",@progbits
                                        // -- End function
	.section	.text.debug,"ax",@progbits
	.globl	debug                           // -- Begin function debug
	.type	debug,@function
debug:                                  // @debug
.Lfunc_begin6:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, r0
	lw r0, r22, -16
	move r3, 0
	move r4, 8
	move r1, r3
	move r2, r3
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end6:
	.size	debug, .Lfunc_end6-debug
	.section	.stack_sizes,"o",@progbits,.text.debug
	.long	.Lfunc_begin6
	.byte	16
	.section	.text.debug,"ax",@progbits
                                        // -- End function
	.section	.text.debug_int,"ax",@progbits
	.globl	debug_int                       // -- Begin function debug_int
	.type	debug_int,@function
debug_int:                              // @debug_int
.Lfunc_begin7:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, r0
	lw r0, r22, -16
	move r3, 0
	move r4, 9
	move r1, r3
	move r2, r3
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end7:
	.size	debug_int, .Lfunc_end7-debug_int
	.section	.stack_sizes,"o",@progbits,.text.debug_int
	.long	.Lfunc_begin7
	.byte	16
	.section	.text.debug_int,"ax",@progbits
                                        // -- End function
	.section	.text.init_lock,"ax",@progbits
	.globl	init_lock                       // -- Begin function init_lock
	.type	init_lock,@function
init_lock:                              // @init_lock
.Lfunc_begin8:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, r0
	lw r0, r22, -16
	move r3, 0
	move r4, 14
	move r1, r3
	move r2, r3
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end8:
	.size	init_lock, .Lfunc_end8-init_lock
	.section	.stack_sizes,"o",@progbits,.text.init_lock
	.long	.Lfunc_begin8
	.byte	16
	.section	.text.init_lock,"ax",@progbits
                                        // -- End function
	.section	.text.lock,"ax",@progbits
	.globl	lock                            // -- Begin function lock
	.type	lock,@function
lock:                                   // @lock
.Lfunc_begin9:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, r0
	lw r0, r22, -16
	move r3, 0
	move r4, 15
	move r1, r3
	move r2, r3
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end9:
	.size	lock, .Lfunc_end9-lock
	.section	.stack_sizes,"o",@progbits,.text.lock
	.long	.Lfunc_begin9
	.byte	16
	.section	.text.lock,"ax",@progbits
                                        // -- End function
	.section	.text.try_lock,"ax",@progbits
	.globl	try_lock                        // -- Begin function try_lock
	.type	try_lock,@function
try_lock:                               // @try_lock
.Lfunc_begin10:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, r0
	lw r0, r22, -16
	move r3, 0
	move r4, 24
	move r1, r3
	move r2, r3
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end10:
	.size	try_lock, .Lfunc_end10-try_lock
	.section	.stack_sizes,"o",@progbits,.text.try_lock
	.long	.Lfunc_begin10
	.byte	16
	.section	.text.try_lock,"ax",@progbits
                                        // -- End function
	.section	.text.unlock,"ax",@progbits
	.globl	unlock                          // -- Begin function unlock
	.type	unlock,@function
unlock:                                 // @unlock
.Lfunc_begin11:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, r0
	lw r0, r22, -16
	move r3, 0
	move r4, 16
	move r1, r3
	move r2, r3
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end11:
	.size	unlock, .Lfunc_end11-unlock
	.section	.stack_sizes,"o",@progbits,.text.unlock
	.long	.Lfunc_begin11
	.byte	16
	.section	.text.unlock,"ax",@progbits
                                        // -- End function
	.section	.text.sleep,"ax",@progbits
	.globl	sleep                           // -- Begin function sleep
	.type	sleep,@function
sleep:                                  // @sleep
.Lfunc_begin12:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, r0
	sw r22, -12, r1
	lw r0, r22, -16
	lw r1, r22, -12
	move r3, 0
	move r4, 17
	move r2, r3
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end12:
	.size	sleep, .Lfunc_end12-sleep
	.section	.stack_sizes,"o",@progbits,.text.sleep
	.long	.Lfunc_begin12
	.byte	16
	.section	.text.sleep,"ax",@progbits
                                        // -- End function
	.section	.text.wakeup,"ax",@progbits
	.globl	wakeup                          // -- Begin function wakeup
	.type	wakeup,@function
wakeup:                                 // @wakeup
.Lfunc_begin13:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, r0
	lw r0, r22, -16
	move r3, 0
	move r4, 18
	move r1, r3
	move r2, r3
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end13:
	.size	wakeup, .Lfunc_end13-wakeup
	.section	.stack_sizes,"o",@progbits,.text.wakeup
	.long	.Lfunc_begin13
	.byte	16
	.section	.text.wakeup,"ax",@progbits
                                        // -- End function
	.section	.text.create_job,"ax",@progbits
	.globl	create_job                      // -- Begin function create_job
	.type	create_job,@function
create_job:                             // @create_job
.Lfunc_begin14:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, r0
	lw r0, r22, -16
	move r3, 0
	move r4, 20
	move r1, r3
	move r2, r3
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end14:
	.size	create_job, .Lfunc_end14-create_job
	.section	.stack_sizes,"o",@progbits,.text.create_job
	.long	.Lfunc_begin14
	.byte	16
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
	move r3, 0
	move r4, 21
	move r0, r3
	move r1, r3
	move r2, r3
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
	move r3, 0
	move r4, 1
	move r0, r3
	move r1, r3
	move r2, r3
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
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, r0
	lw r0, r22, -16
	move r3, 0
	move r4, 2
	move r1, r3
	move r2, r3
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end17:
	.size	sbrk, .Lfunc_end17-sbrk
	.section	.stack_sizes,"o",@progbits,.text.sbrk
	.long	.Lfunc_begin17
	.byte	16
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
	move r3, 0
	move r4, 3
	move r0, r3
	move r1, r3
	move r2, r3
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
	move r3, 0
	move r4, 4
	move r0, r3
	move r1, r3
	move r2, r3
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
	move r3, 0
	move r4, 5
	move r0, r3
	move r1, r3
	move r2, r3
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
	sd r22, 16, d22
	add r22, r22, 24
	sw r22, -24, r0
	sw r22, -20, r1
	sw r22, -16, r2
	lw r0, r22, -24
	lw r1, r22, -20
	lw r2, r22, -16
	move r3, 0
	move r4, 22
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end21:
	.size	umram_read, .Lfunc_end21-umram_read
	.section	.stack_sizes,"o",@progbits,.text.umram_read
	.long	.Lfunc_begin21
	.byte	24
	.section	.text.umram_read,"ax",@progbits
                                        // -- End function
	.section	.text.umram_write,"ax",@progbits
	.globl	umram_write                     // -- Begin function umram_write
	.type	umram_write,@function
umram_write:                            // @umram_write
.Lfunc_begin22:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sw r22, -24, r0
	sw r22, -20, r1
	sw r22, -16, r2
	lw r0, r22, -24
	lw r1, r22, -20
	lw r2, r22, -16
	move r3, 0
	move r4, 23
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end22:
	.size	umram_write, .Lfunc_end22-umram_write
	.section	.stack_sizes,"o",@progbits,.text.umram_write
	.long	.Lfunc_begin22
	.byte	24
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
	sw r22, -16, r0
	sw r22, -12, r1
	lw r0, r22, -16
	call r23, init_lock
	lw r0, r22, -16
	sw r0, 4, 0
	lw r1, r22, -12
	lw r0, r22, -16
	sw r0, 8, r1
	lw r0, r22, -16
	sw r0, 12, 0
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
	sw r22, -16, r0
	lw r0, r22, -16
	call r23, lock
	lw r0, r22, -16
	lw r1, r0, 4
	add r1, r1, 1
	sw r0, 4, r1
	lw r1, r22, -16
	lw r0, r1, 4
	lw r1, r1, 8
	jneq r0, r1, .LBB24_2
	jump .LBB24_1
.LBB24_1:
	lw r0, r22, -16
	call r23, wakeup
	lw r0, r22, -16
	sw r0, 4, 0
	jump .LBB24_3
.LBB24_2:
	lw r1, r22, -16
	move r0, r1
	call r23, sleep
	jump .LBB24_3
.LBB24_3:
	lw r0, r22, -16
	call r23, unlock
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
	sw r22, 0, r0
	sw r22, 4, 0
	jump .LBB25_1
.LBB25_1:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, 4
	lw r1, r22, 0
	jges r0, r1, .LBB25_4
	jump .LBB25_2
.LBB25_2:                               //   in Loop: Header=BB25_1 Depth=1
	jump .LBB25_3
.LBB25_3:                               //   in Loop: Header=BB25_1 Depth=1
	lw r0, r22, 4
	add r0, r0, 1
	sw r22, 4, r0
	jump .LBB25_1
.LBB25_4:
	jump r23
.Lfunc_end25:
	.size	wait, .Lfunc_end25-wait
	.section	.stack_sizes,"o",@progbits,.text.wait
	.long	.Lfunc_begin25
	.byte	8
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
	sw r22, -16, r0
	jump .LBB26_1
.LBB26_1:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -16
	call r23, try_lock
	jeq r0, 0, .LBB26_3
	jump .LBB26_2
.LBB26_2:                               //   in Loop: Header=BB26_1 Depth=1
	jump .LBB26_1
.LBB26_3:
	jump .LBB26_4
.LBB26_4:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB26_6 Depth 2
	lw r0, r22, -16
	lw r0, r0, 12
	jeq r0, 0, .LBB26_9
	jump .LBB26_5
.LBB26_5:                               //   in Loop: Header=BB26_4 Depth=1
	lw r0, r22, -16
	call r23, unlock
	jump .LBB26_6
.LBB26_6:                               //   Parent Loop BB26_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lw r0, r22, -16
	call r23, try_lock
	jeq r0, 0, .LBB26_8
	jump .LBB26_7
.LBB26_7:                               //   in Loop: Header=BB26_6 Depth=2
	jump .LBB26_6
.LBB26_8:                               //   in Loop: Header=BB26_4 Depth=1
	jump .LBB26_4
.LBB26_9:
	lw r0, r22, -16
	lw r1, r0, 4
	add r1, r1, 1
	sw r0, 4, r1
	lw r1, r22, -16
	lw r0, r1, 4
	lw r1, r1, 8
	jneq r0, r1, .LBB26_11
	jump .LBB26_10
.LBB26_10:
	lw r0, r22, -16
	sw r0, 12, 1
	jump .LBB26_18
.LBB26_11:
	jump .LBB26_12
.LBB26_12:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB26_14 Depth 2
	lw r0, r22, -16
	lw r0, r0, 12
	jneq r0, 0, .LBB26_17
	jump .LBB26_13
.LBB26_13:                              //   in Loop: Header=BB26_12 Depth=1
	lw r0, r22, -16
	call r23, unlock
	jump .LBB26_14
.LBB26_14:                              //   Parent Loop BB26_12 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lw r0, r22, -16
	call r23, try_lock
	jeq r0, 0, .LBB26_16
	jump .LBB26_15
.LBB26_15:                              //   in Loop: Header=BB26_14 Depth=2
	jump .LBB26_14
.LBB26_16:                              //   in Loop: Header=BB26_12 Depth=1
	jump .LBB26_12
.LBB26_17:
	jump .LBB26_18
.LBB26_18:
	lw r0, r22, -16
	lw r1, r0, 4
	add r1, r1, -1
	sw r0, 4, r1
	lw r0, r22, -16
	lw r0, r0, 4
	jneq r0, 0, .LBB26_20
	jump .LBB26_19
.LBB26_19:
	lw r0, r22, -16
	sw r0, 12, 0
	jump .LBB26_20
.LBB26_20:
	lw r0, r22, -16
	call r23, unlock
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
	sw r22, -16, r0
	lw r0, r22, -16
	add r0, r0, 4
	call r23, init_lock
	lw r0, r22, -16
	sb r0, 0, 0
	move r0, 0
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
	sw r22, -16, r0
	lw r0, r22, -16
	add r0, r0, 4
	call r23, lock
	jump .LBB28_1
.LBB28_1:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -16
	lbu r0, r0, 0
	jneq r0, 0, .LBB28_3
	jump .LBB28_2
.LBB28_2:                               //   in Loop: Header=BB28_1 Depth=1
	lw r0, r22, -16
	add r1, r0, 4
	call r23, sleep
	jump .LBB28_1
.LBB28_3:
	lw r0, r22, -16
	sb r0, 0, 0
	lw r0, r22, -16
	add r0, r0, 4
	call r23, unlock
	move r0, 0
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
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, r0
	lw r0, r22, -16
	add r0, r0, 4
	call r23, lock
	lw r0, r22, -16
	sb r0, 0, 1
	lw r0, r22, -16
	call r23, wakeup
	lw r0, r22, -16
	add r0, r0, 4
	call r23, unlock
	move r0, 0
	ld d22, r22, -8
	jump r23
.Lfunc_end29:
	.size	handshake_notify, .Lfunc_end29-handshake_notify
	.section	.stack_sizes,"o",@progbits,.text.handshake_notify
	.long	.Lfunc_begin29
	.byte	16
	.section	.text.handshake_notify,"ax",@progbits
                                        // -- End function
	.section	.text.active_handshake_wait,"ax",@progbits
	.globl	active_handshake_wait           // -- Begin function active_handshake_wait
	.type	active_handshake_wait,@function
active_handshake_wait:                  // @active_handshake_wait
.Lfunc_begin30:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, r0
	jump .LBB30_1
.LBB30_1:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -16
	add r0, r0, 4
	call r23, try_lock
	jeq r0, 0, .LBB30_3
	jump .LBB30_2
.LBB30_2:                               //   in Loop: Header=BB30_1 Depth=1
	jump .LBB30_1
.LBB30_3:
	jump .LBB30_4
.LBB30_4:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB30_6 Depth 2
	lw r0, r22, -16
	lbu r0, r0, 0
	jneq r0, 0, .LBB30_9
	jump .LBB30_5
.LBB30_5:                               //   in Loop: Header=BB30_4 Depth=1
	lw r0, r22, -16
	add r0, r0, 4
	call r23, unlock
	jump .LBB30_6
.LBB30_6:                               //   Parent Loop BB30_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lw r0, r22, -16
	add r0, r0, 4
	call r23, try_lock
	jeq r0, 0, .LBB30_8
	jump .LBB30_7
.LBB30_7:                               //   in Loop: Header=BB30_6 Depth=2
	jump .LBB30_6
.LBB30_8:                               //   in Loop: Header=BB30_4 Depth=1
	jump .LBB30_4
.LBB30_9:
	lw r0, r22, -16
	sb r0, 0, 0
	lw r0, r22, -16
	add r0, r0, 4
	call r23, unlock
	move r0, 0
	ld d22, r22, -8
	jump r23
.Lfunc_end30:
	.size	active_handshake_wait, .Lfunc_end30-active_handshake_wait
	.section	.stack_sizes,"o",@progbits,.text.active_handshake_wait
	.long	.Lfunc_begin30
	.byte	16
	.section	.text.active_handshake_wait,"ax",@progbits
                                        // -- End function
	.section	.text.active_handshake_notify,"ax",@progbits
	.globl	active_handshake_notify         // -- Begin function active_handshake_notify
	.type	active_handshake_notify,@function
active_handshake_notify:                // @active_handshake_notify
.Lfunc_begin31:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sw r22, -16, r0
	jump .LBB31_1
.LBB31_1:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -16
	add r0, r0, 4
	call r23, try_lock
	jeq r0, 0, .LBB31_3
	jump .LBB31_2
.LBB31_2:                               //   in Loop: Header=BB31_1 Depth=1
	jump .LBB31_1
.LBB31_3:
	lw r0, r22, -16
	sb r0, 0, 1
	lw r0, r22, -16
	call r23, wakeup
	lw r0, r22, -16
	add r0, r0, 4
	call r23, unlock
	move r0, 0
	ld d22, r22, -8
	jump r23
.Lfunc_end31:
	.size	active_handshake_notify, .Lfunc_end31-active_handshake_notify
	.section	.stack_sizes,"o",@progbits,.text.active_handshake_notify
	.long	.Lfunc_begin31
	.byte	16
	.section	.text.active_handshake_notify,"ax",@progbits
                                        // -- End function
	.section	.text.pred,"ax",@progbits
	.globl	pred                            // -- Begin function pred
	.type	pred,@function
pred:                                   // @pred
.Lfunc_begin32:
// %bb.0:
	sd r22, 0, d0
	lbu r0, r22, 0
	and r0, r0, 1
	move r1, 0
	sub r0, r0, r1, eq
	jump r23
.Lfunc_end32:
	.size	pred, .Lfunc_end32-pred
	.section	.stack_sizes,"o",@progbits,.text.pred
	.long	.Lfunc_begin32
	.byte	8
	.section	.text.pred,"ax",@progbits
                                        // -- End function
	.section	.text.main1,"ax",@progbits
	.globl	main1                           // -- Begin function main1
	.type	main1,@function
main1:                                  // @main1
.Lfunc_begin33:
// %bb.0:
	sd r22, 88, d22
	add r22, r22, 96
	call r23, get_jid
	sw r22, -92, r0
	move r0, b
	call r23, wait_barrier
	lw r0, r22, -92
	jneq r0, 0, .LBB33_4
	jump .LBB33_1
.LBB33_1:
	lw r0, zero, sd_host
	add r1, r22, -88
	sw r22, -28, r1
	move r2, 1
	sw r22, -32, r2
	call r23, socket_write
	lw r1, r22, -28
	lw r2, r22, -32
	lw r0, zero, sd_host
	call r23, socket_read
	move r0, DPU_INPUT_ARGUMENTS
	move r1, 8
	move r2, 0
	call r23, umram_read
	jgts r0, -1, .LBB33_3
	jump .LBB33_2
.LBB33_2:
	call r23, fault_notif
	jump .LBB33_3
.LBB33_3:
	jump .LBB33_4
.LBB33_4:
	move r0, b
	call r23, wait_barrier
	call r23, get_jid
	sw r22, -84, r0
	lw r1, r22, -84
	move r0, DPU_RESULTS
	lsl_add r0, r0, r1, 3
	sw r22, -80, r0
	lw r0, zero, DPU_INPUT_ARGUMENTS
	sw r22, -76, r0
	lw r0, r22, -84
	lsl r0, r0, 10
	sw r22, -72, r0
	sw r22, -68, 8
	lw r0, r22, -76
	add r0, r0, 40
	sw r22, -64, r0
	move r0, 1024
	sw r22, -24, r0
	call r23, sbrk
	move r1, r0
	lw r0, r22, -24
	add r1, r1, -1024
	sw r22, -60, r1
	call r23, sbrk
	add r0, r0, -1024
	sw r22, -56, r0
	lw r0, r22, -84
	jneq r0, 3, .LBB33_6
	jump .LBB33_5
.LBB33_5:
	move r0, message_partial_count
	sw r0, 0, 0
	jump .LBB33_6
.LBB33_6:
	move r0, b
	call r23, wait_barrier
	sw r22, -52, 0
	lw r0, r22, -72
	sw r22, -48, r0
	jump .LBB33_7
.LBB33_7:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -48
	lw r1, r22, -76
	jgeu r0, r1, .LBB33_16
	jump .LBB33_8
.LBB33_8:                               //   in Loop: Header=BB33_7 Depth=1
	lw r0, r22, -60
	lw r1, r22, -68
	lw r2, r22, -48
	add r2, r1, r2
	move r1, 1024
	call r23, umram_read
	sw r22, -96, r0
	lw r0, r22, -96
	jeq r0, 0, .LBB33_10
	jump .LBB33_9
.LBB33_9:                               //   in Loop: Header=BB33_7 Depth=1
	lw r0, r22, -96
	move r1, 0
	call r23, print_debug
	call r23, fault_notif
	jump .LBB33_10
.LBB33_10:                              //   in Loop: Header=BB33_7 Depth=1
	lw r0, r22, -56
	lw r1, r22, -60
	call r23, select
	sw r22, -44, r0
	lw r0, r22, -44
	lw r1, r22, -84
	call r23, handshake_sync
	sw r22, -40, r0
	move r0, b
	call r23, active_wait_barrier
	lw r0, r22, -56
	lw r1, r22, -44
	lsl r1, r1, 3
	lw r2, r22, -64
	lw r3, zero, message_partial_count
	lw r4, r22, -40
	add r3, r3, r4
	lsl_add r2, r2, r3, 3
	call r23, umram_write
	sw r22, -96, r0
	lw r0, r22, -96
	jeq r0, 0, .LBB33_12
	jump .LBB33_11
.LBB33_11:                              //   in Loop: Header=BB33_7 Depth=1
	lw r0, r22, -96
	move r1, 0
	call r23, print_debug
	call r23, fault_notif
	jump .LBB33_12
.LBB33_12:                              //   in Loop: Header=BB33_7 Depth=1
	move r0, b
	call r23, active_wait_barrier
	lw r0, r22, -84
	jneq r0, 3, .LBB33_14
	jump .LBB33_13
.LBB33_13:                              //   in Loop: Header=BB33_7 Depth=1
	lw r0, zero, message_partial_count
	lw r1, r22, -40
	add r0, r0, r1
	lw r1, r22, -44
	add r1, r0, r1
	lw r0, r22, -80
	sw r0, 0, r1
	lw r0, r22, -80
	lw r0, r0, 0
	sw zero, message_partial_count, r0
	jump .LBB33_14
.LBB33_14:                              //   in Loop: Header=BB33_7 Depth=1
	lw r0, r22, -52
	add r0, r0, 1
	sw r22, -52, r0
	jump .LBB33_15
.LBB33_15:                              //   in Loop: Header=BB33_7 Depth=1
	lw r0, r22, -48
	add r0, r0, 4096
	sw r22, -48, r0
	jump .LBB33_7
.LBB33_16:
	move r0, b
	call r23, wait_barrier
	lw r0, r22, -84
	jneq r0, 0, .LBB33_20
	jump .LBB33_17
.LBB33_17:
	lw r0, zero, DPU_INPUT_ARGUMENTS
	add r2, r0, 8
	move r0, DPU_RESULTS
	move r1, 32
	call r23, umram_write
	sw r22, -96, r0
	lw r0, r22, -96
	jeq r0, 0, .LBB33_19
	jump .LBB33_18
.LBB33_18:
	lw r0, r22, -96
	move r1, 0
	call r23, print_debug
	call r23, fault_notif
	jump .LBB33_19
.LBB33_19:
	lw r0, zero, sd_host
	add r1, r22, -36
	sw r22, -16, r1
	move r2, 1
	sw r22, -20, r2
	call r23, socket_write
	lw r1, r22, -16
	lw r2, r22, -20
	lw r0, zero, sd_host
	call r23, socket_read
	jump .LBB33_20
.LBB33_20:
	move r0, b
	call r23, wait_barrier
	ld d22, r22, -8
	jump r23
.Lfunc_end33:
	.size	main1, .Lfunc_end33-main1
	.section	.stack_sizes,"o",@progbits,.text.main1
	.long	.Lfunc_begin33
	.byte	96
	.section	.text.main1,"ax",@progbits
                                        // -- End function
	.section	.text.select,"ax",@progbits
	.type	select,@function                // -- Begin function select
select:                                 // @select
.Lfunc_begin34:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sw r22, -24, r0
	sw r22, -20, r1
	sw r22, -16, 0
	sw r22, -12, 0
	jump .LBB34_1
.LBB34_1:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -12
	jgtu r0, 127, .LBB34_6
	jump .LBB34_2
.LBB34_2:                               //   in Loop: Header=BB34_1 Depth=1
	lw r0, r22, -20
	lw r1, r22, -12
	lsl_add r0, r0, r1, 3
	ld d0, r0, 0
	call r23, pred
	jnz r0, .LBB34_4
	jump .LBB34_3
.LBB34_3:                               //   in Loop: Header=BB34_1 Depth=1
	lw r0, r22, -20
	lw r1, r22, -12
	lsl_add r0, r0, r1, 3
	ld d2, r0, 0
	lw r0, r22, -24
	lw r1, r22, -16
	lsl_add r0, r0, r1, 3
	sd r0, 0, d2
	lw r0, r22, -16
	add r0, r0, 1
	sw r22, -16, r0
	jump .LBB34_4
.LBB34_4:                               //   in Loop: Header=BB34_1 Depth=1
	jump .LBB34_5
.LBB34_5:                               //   in Loop: Header=BB34_1 Depth=1
	lw r0, r22, -12
	add r0, r0, 1
	sw r22, -12, r0
	jump .LBB34_1
.LBB34_6:
	lw r0, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end34:
	.size	select, .Lfunc_end34-select
	.section	.stack_sizes,"o",@progbits,.text.select
	.long	.Lfunc_begin34
	.byte	24
	.section	.text.select,"ax",@progbits
                                        // -- End function
	.section	.text.handshake_sync,"ax",@progbits
	.type	handshake_sync,@function        // -- Begin function handshake_sync
handshake_sync:                         // @handshake_sync
.Lfunc_begin35:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sw r22, -24, r0
	sw r22, -20, r1
	lw r0, r22, -20
	jeq r0, 0, .LBB35_2
	jump .LBB35_1
.LBB35_1:
	lw r1, r22, -20
	move r0, handshakes
	lsl_add r0, r0, r1, 3
	add r0, r0, -8
	call r23, active_handshake_wait
	lw r0, r22, -20
	lsl r0, r0, 2
	lw r0, r0, message
	sw r22, -16, r0
	jump .LBB35_3
.LBB35_2:
	sw r22, -16, 0
	jump .LBB35_3
.LBB35_3:
	lw r0, r22, -20
	jgtu r0, 2, .LBB35_5
	jump .LBB35_4
.LBB35_4:
	lw r0, r22, -16
	lw r1, r22, -24
	add r1, r0, r1
	lw r2, r22, -20
	move r0, message
	lsl_add r0, r0, r2, 2
	sw r0, 4, r1
	lw r1, r22, -20
	move r0, handshakes
	lsl_add r0, r0, r1, 3
	call r23, active_handshake_notify
	jump .LBB35_5
.LBB35_5:
	lw r0, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end35:
	.size	handshake_sync, .Lfunc_end35-handshake_sync
	.section	.stack_sizes,"o",@progbits,.text.handshake_sync
	.long	.Lfunc_begin35
	.byte	24
	.section	.text.handshake_sync,"ax",@progbits
                                        // -- End function
	.section	.text.main,"ax",@progbits
	.globl	main                            // -- Begin function main
	.type	main,@function
main:                                   // @main
.Lfunc_begin36:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sw r22, -24, 0
	move r0, 0
	call r23, socket_open
	sw zero, sd_host, r0
	move r0, b
	move r1, 4
	call r23, init_barrier
	sw r22, -20, 0
	jump .LBB36_1
.LBB36_1:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -20
	jgts r0, 3, .LBB36_4
	jump .LBB36_2
.LBB36_2:                               //   in Loop: Header=BB36_1 Depth=1
	lw r1, r22, -20
	move r0, handshakes
	lsl_add r0, r0, r1, 3
	call r23, init_handshake
	jump .LBB36_3
.LBB36_3:                               //   in Loop: Header=BB36_1 Depth=1
	lw r0, r22, -20
	add r0, r0, 1
	sw r22, -20, r0
	jump .LBB36_1
.LBB36_4:
	sw r22, -16, 0
	jump .LBB36_5
.LBB36_5:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -16
	jgts r0, 2, .LBB36_8
	jump .LBB36_6
.LBB36_6:                               //   in Loop: Header=BB36_5 Depth=1
	move r0, main1
	call r23, create_job
	jump .LBB36_7
.LBB36_7:                               //   in Loop: Header=BB36_5 Depth=1
	lw r0, r22, -16
	add r0, r0, 1
	sw r22, -16, r0
	jump .LBB36_5
.LBB36_8:
	call r23, main1
	sw r22, -12, 0
	jump .LBB36_9
.LBB36_9:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -12
	jgts r0, 2, .LBB36_12
	jump .LBB36_10
.LBB36_10:                              //   in Loop: Header=BB36_9 Depth=1
	call r23, join_job
	jump .LBB36_11
.LBB36_11:                              //   in Loop: Header=BB36_9 Depth=1
	lw r0, r22, -12
	add r0, r0, 1
	sw r22, -12, r0
	jump .LBB36_9
.LBB36_12:
	move r0, 0
	ld d22, r22, -8
	jump r23
.Lfunc_end36:
	.size	main, .Lfunc_end36-main
	.section	.stack_sizes,"o",@progbits,.text.main
	.long	.Lfunc_begin36
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
	.zero	8
	.size	DPU_INPUT_ARGUMENTS, 8

	.type	DPU_RESULTS,@object             // @DPU_RESULTS
	.section	.bss.DPU_RESULTS,"aw",@nobits
	.globl	DPU_RESULTS
	.p2align	3
DPU_RESULTS:
	.zero	32
	.size	DPU_RESULTS, 32

	.type	message_partial_count,@object   // @message_partial_count
	.section	.bss.message_partial_count,"aw",@nobits
	.globl	message_partial_count
	.p2align	2
message_partial_count:
	.long	0                               // 0x0
	.size	message_partial_count, 4

	.type	handshakes,@object              // @handshakes
	.section	.bss.handshakes,"aw",@nobits
	.globl	handshakes
	.p2align	2
handshakes:
	.zero	32
	.size	handshakes, 32

	.type	message,@object                 // @message
	.section	.bss.message,"aw",@nobits
	.globl	message
	.p2align	2
message:
	.zero	16
	.size	message, 16

	.addrsig
	.addrsig_sym socket_read
	.addrsig_sym syscall
	.addrsig_sym socket_write
	.addrsig_sym socket_open
	.addrsig_sym get_jid
	.addrsig_sym init_lock
	.addrsig_sym lock
	.addrsig_sym try_lock
	.addrsig_sym unlock
	.addrsig_sym sleep
	.addrsig_sym wakeup
	.addrsig_sym create_job
	.addrsig_sym join_job
	.addrsig_sym sbrk
	.addrsig_sym umram_read
	.addrsig_sym umram_write
	.addrsig_sym init_barrier
	.addrsig_sym wait_barrier
	.addrsig_sym active_wait_barrier
	.addrsig_sym init_handshake
	.addrsig_sym active_handshake_wait
	.addrsig_sym active_handshake_notify
	.addrsig_sym pred
	.addrsig_sym main1
	.addrsig_sym fault_notif
	.addrsig_sym print_debug
	.addrsig_sym select
	.addrsig_sym handshake_sync
	.addrsig_sym b
	.addrsig_sym sd_host
	.addrsig_sym DPU_INPUT_ARGUMENTS
	.addrsig_sym DPU_RESULTS
	.addrsig_sym message_partial_count
	.addrsig_sym handshakes
	.addrsig_sym message
