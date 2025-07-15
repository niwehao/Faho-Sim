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
	.section	.text.debug,"ax",@progbits
	.globl	debug                           // -- Begin function debug
	.type	debug,@function
debug:                                  // @debug
.Lfunc_begin5:
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
.Lfunc_end5:
	.size	debug, .Lfunc_end5-debug
	.section	.stack_sizes,"o",@progbits,.text.debug
	.long	.Lfunc_begin5
	.byte	16
	.section	.text.debug,"ax",@progbits
                                        // -- End function
	.section	.text.debug_int,"ax",@progbits
	.globl	debug_int                       // -- Begin function debug_int
	.type	debug_int,@function
debug_int:                              // @debug_int
.Lfunc_begin6:
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
.Lfunc_end6:
	.size	debug_int, .Lfunc_end6-debug_int
	.section	.stack_sizes,"o",@progbits,.text.debug_int
	.long	.Lfunc_begin6
	.byte	16
	.section	.text.debug_int,"ax",@progbits
                                        // -- End function
	.section	.text.init_lock,"ax",@progbits
	.globl	init_lock                       // -- Begin function init_lock
	.type	init_lock,@function
init_lock:                              // @init_lock
.Lfunc_begin7:
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
.Lfunc_end7:
	.size	init_lock, .Lfunc_end7-init_lock
	.section	.stack_sizes,"o",@progbits,.text.init_lock
	.long	.Lfunc_begin7
	.byte	16
	.section	.text.init_lock,"ax",@progbits
                                        // -- End function
	.section	.text.lock,"ax",@progbits
	.globl	lock                            // -- Begin function lock
	.type	lock,@function
lock:                                   // @lock
.Lfunc_begin8:
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
.Lfunc_end8:
	.size	lock, .Lfunc_end8-lock
	.section	.stack_sizes,"o",@progbits,.text.lock
	.long	.Lfunc_begin8
	.byte	16
	.section	.text.lock,"ax",@progbits
                                        // -- End function
	.section	.text.try_lock,"ax",@progbits
	.globl	try_lock                        // -- Begin function try_lock
	.type	try_lock,@function
try_lock:                               // @try_lock
.Lfunc_begin9:
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
.Lfunc_end9:
	.size	try_lock, .Lfunc_end9-try_lock
	.section	.stack_sizes,"o",@progbits,.text.try_lock
	.long	.Lfunc_begin9
	.byte	16
	.section	.text.try_lock,"ax",@progbits
                                        // -- End function
	.section	.text.unlock,"ax",@progbits
	.globl	unlock                          // -- Begin function unlock
	.type	unlock,@function
unlock:                                 // @unlock
.Lfunc_begin10:
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
.Lfunc_end10:
	.size	unlock, .Lfunc_end10-unlock
	.section	.stack_sizes,"o",@progbits,.text.unlock
	.long	.Lfunc_begin10
	.byte	16
	.section	.text.unlock,"ax",@progbits
                                        // -- End function
	.section	.text.sleep,"ax",@progbits
	.globl	sleep                           // -- Begin function sleep
	.type	sleep,@function
sleep:                                  // @sleep
.Lfunc_begin11:
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
.Lfunc_end11:
	.size	sleep, .Lfunc_end11-sleep
	.section	.stack_sizes,"o",@progbits,.text.sleep
	.long	.Lfunc_begin11
	.byte	16
	.section	.text.sleep,"ax",@progbits
                                        // -- End function
	.section	.text.wakeup,"ax",@progbits
	.globl	wakeup                          // -- Begin function wakeup
	.type	wakeup,@function
wakeup:                                 // @wakeup
.Lfunc_begin12:
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
.Lfunc_end12:
	.size	wakeup, .Lfunc_end12-wakeup
	.section	.stack_sizes,"o",@progbits,.text.wakeup
	.long	.Lfunc_begin12
	.byte	16
	.section	.text.wakeup,"ax",@progbits
                                        // -- End function
	.section	.text.create_job,"ax",@progbits
	.globl	create_job                      // -- Begin function create_job
	.type	create_job,@function
create_job:                             // @create_job
.Lfunc_begin13:
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
.Lfunc_end13:
	.size	create_job, .Lfunc_end13-create_job
	.section	.stack_sizes,"o",@progbits,.text.create_job
	.long	.Lfunc_begin13
	.byte	16
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
	move r3, 0
	move r4, 21
	move r0, r3
	move r1, r3
	move r2, r3
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
	move r3, 0
	move r4, 1
	move r0, r3
	move r1, r3
	move r2, r3
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
.Lfunc_end16:
	.size	sbrk, .Lfunc_end16-sbrk
	.section	.stack_sizes,"o",@progbits,.text.sbrk
	.long	.Lfunc_begin16
	.byte	16
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
	move r3, 0
	move r4, 3
	move r0, r3
	move r1, r3
	move r2, r3
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
	move r3, 0
	move r4, 4
	move r0, r3
	move r1, r3
	move r2, r3
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
	move r3, 0
	move r4, 5
	move r0, r3
	move r1, r3
	move r2, r3
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
.Lfunc_end20:
	.size	umram_read, .Lfunc_end20-umram_read
	.section	.stack_sizes,"o",@progbits,.text.umram_read
	.long	.Lfunc_begin20
	.byte	24
	.section	.text.umram_read,"ax",@progbits
                                        // -- End function
	.section	.text.umram_write,"ax",@progbits
	.globl	umram_write                     // -- Begin function umram_write
	.type	umram_write,@function
umram_write:                            // @umram_write
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
	move r4, 23
	call r23, syscall
	ld d22, r22, -8
	jump r23
.Lfunc_end21:
	.size	umram_write, .Lfunc_end21-umram_write
	.section	.stack_sizes,"o",@progbits,.text.umram_write
	.long	.Lfunc_begin21
	.byte	24
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
	jneq r0, r1, .LBB23_2
	jump .LBB23_1
.LBB23_1:
	lw r0, r22, -16
	call r23, wakeup
	lw r0, r22, -16
	sw r0, 4, 0
	jump .LBB23_3
.LBB23_2:
	lw r1, r22, -16
	move r0, r1
	call r23, sleep
	jump .LBB23_3
.LBB23_3:
	lw r0, r22, -16
	call r23, unlock
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
	sw r22, 0, r0
	sw r22, 4, 0
	jump .LBB24_1
.LBB24_1:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, 4
	lw r1, r22, 0
	jges r0, r1, .LBB24_4
	jump .LBB24_2
.LBB24_2:                               //   in Loop: Header=BB24_1 Depth=1
	jump .LBB24_3
.LBB24_3:                               //   in Loop: Header=BB24_1 Depth=1
	lw r0, r22, 4
	add r0, r0, 1
	sw r22, 4, r0
	jump .LBB24_1
.LBB24_4:
	jump r23
.Lfunc_end24:
	.size	wait, .Lfunc_end24-wait
	.section	.stack_sizes,"o",@progbits,.text.wait
	.long	.Lfunc_begin24
	.byte	8
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
	sw r22, -16, r0
	sw r22, -12, 100
	jump .LBB25_1
.LBB25_1:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -16
	lw r0, r0, 12
	jeq r0, 0, .LBB25_5
	jump .LBB25_2
.LBB25_2:                               //   in Loop: Header=BB25_1 Depth=1
	lw r0, r22, -12
	add r0, r0, -1
	sw r22, -12, r0
	jneq r0, 0, .LBB25_4
	jump .LBB25_3
.LBB25_3:                               //   in Loop: Header=BB25_1 Depth=1
	call r23, yield
	sw r22, -12, 100
	jump .LBB25_4
.LBB25_4:                               //   in Loop: Header=BB25_1 Depth=1
	jump .LBB25_1
.LBB25_5:
	jump .LBB25_6
.LBB25_6:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -16
	call r23, try_lock
	jeq r0, 0, .LBB25_8
	jump .LBB25_7
.LBB25_7:                               //   in Loop: Header=BB25_6 Depth=1
	jump .LBB25_6
.LBB25_8:
	lw r0, r22, -16
	lw r1, r0, 4
	add r1, r1, 1
	sw r0, 4, r1
	lw r1, r22, -16
	lw r0, r1, 4
	lw r1, r1, 8
	jneq r0, r1, .LBB25_10
	jump .LBB25_9
.LBB25_9:
	lw r0, r22, -16
	sw r0, 4, 0
	jump .LBB25_19
.LBB25_10:
	lw r0, r22, -16
	call r23, unlock
	sw r22, -12, 100
	jump .LBB25_11
.LBB25_11:                              // =>This Inner Loop Header: Depth=1
	lw r0, r22, -16
	lw r0, r0, 4
	jeq r0, 0, .LBB25_15
	jump .LBB25_12
.LBB25_12:                              //   in Loop: Header=BB25_11 Depth=1
	lw r0, r22, -12
	add r0, r0, -1
	sw r22, -12, r0
	jneq r0, 0, .LBB25_14
	jump .LBB25_13
.LBB25_13:                              //   in Loop: Header=BB25_11 Depth=1
	call r23, yield
	sw r22, -12, 100
	jump .LBB25_14
.LBB25_14:                              //   in Loop: Header=BB25_11 Depth=1
	jump .LBB25_11
.LBB25_15:
	jump .LBB25_16
.LBB25_16:                              // =>This Inner Loop Header: Depth=1
	lw r0, r22, -16
	call r23, try_lock
	jeq r0, 0, .LBB25_18
	jump .LBB25_17
.LBB25_17:                              //   in Loop: Header=BB25_16 Depth=1
	jump .LBB25_16
.LBB25_18:
	jump .LBB25_19
.LBB25_19:
	lw r0, r22, -16
	lw r1, r0, 12
	add r1, r1, 1
	sw r0, 12, r1
	lw r0, r22, -16
	lw r0, r0, 12
	lw r1, r22, -16
	lw r1, r1, 8
	jneq r0, r1, .LBB25_21
	jump .LBB25_20
.LBB25_20:
	lw r0, r22, -16
	sw r0, 12, 0
	jump .LBB25_21
.LBB25_21:
	lw r0, r22, -16
	call r23, unlock
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
	sw r22, -16, r0
	lw r0, r22, -16
	add r0, r0, 4
	call r23, init_lock
	lw r0, r22, -16
	sb r0, 0, 0
	move r0, 0
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
	sw r22, -16, r0
	lw r0, r22, -16
	add r0, r0, 4
	call r23, lock
	jump .LBB27_1
.LBB27_1:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -16
	lbu r0, r0, 0
	jneq r0, 0, .LBB27_3
	jump .LBB27_2
.LBB27_2:                               //   in Loop: Header=BB27_1 Depth=1
	lw r0, r22, -16
	add r1, r0, 4
	call r23, sleep
	jump .LBB27_1
.LBB27_3:
	lw r0, r22, -16
	sb r0, 0, 0
	lw r0, r22, -16
	add r0, r0, 4
	call r23, unlock
	move r0, 0
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
.Lfunc_end28:
	.size	handshake_notify, .Lfunc_end28-handshake_notify
	.section	.stack_sizes,"o",@progbits,.text.handshake_notify
	.long	.Lfunc_begin28
	.byte	16
	.section	.text.handshake_notify,"ax",@progbits
                                        // -- End function
	.section	.text.main1,"ax",@progbits
	.globl	main1                           // -- Begin function main1
	.type	main1,@function
main1:                                  // @main1
.Lfunc_begin29:
// %bb.0:
	sd r22, 176, d22
	add r22, r22, 184
	call r23, get_jid
	sw r22, -184, r0
	move r0, b
	call r23, wait_barrier
	lw r0, r22, -184
	jneq r0, 0, .LBB29_4
	jump .LBB29_1
.LBB29_1:
	lw r0, zero, sd_host
	add r1, r22, -180
	sw r22, -44, r1
	move r2, 1
	sw r22, -48, r2
	call r23, socket_write
	lw r1, r22, -44
	lw r2, r22, -48
	lw r0, zero, sd_host
	call r23, socket_read
	move r0, DPU_INPUT_ARGUMENTS
	move r1, 32
	move r2, 0
	call r23, umram_read
	jgts r0, -1, .LBB29_3
	jump .LBB29_2
.LBB29_2:
	call r23, fault_notif
	jump .LBB29_3
.LBB29_3:
	jump .LBB29_4
.LBB29_4:
	move r0, b
	call r23, wait_barrier
	call r23, get_jid
	sw r22, -172, r0
	move r0, DPU_INPUT_ARGUMENTS
	lw r1, r0, 4
	sw r22, -168, r1
	lw r1, r0, 8
	sw r22, -164, r1
	lw r1, r0, 12
	sw r22, -160, r1
	lw r0, r0, 16
	sw r22, -156, r0
	lw r0, r22, -172
	lw r1, r22, -156
	lsr r1, r1, 2
	call r23, __mulsi3
	sw r22, -152, r0
	lw r0, r22, -172
	jneq r0, 3, .LBB29_6
	jump .LBB29_5
.LBB29_5:
	lw r1, r22, -156
	lw r0, r22, -168
	not r0, r0
	add r0, r0, r1
	sw r22, -148, r0
	jump .LBB29_7
.LBB29_6:
	lw r0, r22, -152
	lw r1, r22, -156
	lsr_add r0, r0, r1, 2
	sw r22, -148, r0
	jump .LBB29_7
.LBB29_7:
	sw r22, -144, 32
	lw r0, r22, -144
	sw r22, -140, r0
	lw r1, r22, -168
	lw r0, r22, -144
	lsl_add r0, r0, r1, 2
	sw r22, -144, r0
	lw r1, r22, -152
	lw r0, r22, -144
	lsl_add r0, r0, r1, 2
	sw r22, -144, r0
	lw r0, r22, -144
	sw r22, -136, r0
	lw r0, r22, -144
	sw r22, -132, r0
	lw r0, r22, -156
	lw r1, r22, -168
	add r1, r0, r1
	lw r0, r22, -144
	lsl_add r0, r0, r1, 2
	sw r22, -144, r0
	lw r0, r22, -144
	sw r22, -128, r0
	lw r0, r22, -156
	lw r1, r22, -168
	add r1, r0, r1
	lw r0, r22, -144
	lsl_add r0, r0, r1, 2
	sw r22, -144, r0
	lw r0, r22, -144
	sw r22, -124, r0
	move r0, 512
	sw r22, -40, r0
	call r23, sbrk
	move r1, r0
	lw r0, r22, -40
	add r1, r1, -512
	sw r22, -120, r1
	call r23, sbrk
	move r1, r0
	lw r0, r22, -40
	add r1, r1, -512
	sw r22, -116, r1
	call r23, sbrk
	move r1, r0
	lw r0, r22, -40
	add r1, r1, -512
	sw r22, -112, r1
	call r23, sbrk
	move r1, r0
	lw r0, r22, -40
	add r1, r1, -512
	sw r22, -108, r1
	call r23, sbrk
	move r1, r0
	lw r0, r22, -40
	add r1, r1, -512
	sw r22, -104, r1
	call r23, sbrk
	add r0, r0, -512
	sw r22, -100, r0
	lw r1, r22, -172
	move r0, DPU_RESULTS
	lsl_add r0, r0, r1, 4
	sw r22, -96, r0
	move r0, 2147483647
	sw r22, -88, r0
	sw r22, -84, 0
	lw r0, r22, -152
	sw r22, -80, r0
	jump .LBB29_8
.LBB29_8:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB29_12 Depth 2
                                        //     Child Loop BB29_16 Depth 2
                                        //     Child Loop BB29_27 Depth 2
	lw r0, r22, -80
	lw r1, r22, -148
	jgeu r0, r1, .LBB29_36
	jump .LBB29_9
.LBB29_9:                               //   in Loop: Header=BB29_8 Depth=1
	lw r0, r22, -148
	lw r1, r22, -80
	sub r0, r0, r1
	sw r22, -76, r0
	lw r0, r22, -76
	jltu r0, 129, .LBB29_11
	jump .LBB29_10
.LBB29_10:                              //   in Loop: Header=BB29_8 Depth=1
	sw r22, -76, 128
	jump .LBB29_11
.LBB29_11:                              //   in Loop: Header=BB29_8 Depth=1
	sw r22, -72, 0
	jump .LBB29_12
.LBB29_12:                              //   Parent Loop BB29_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lw r0, r22, -72
	jgtu r0, 127, .LBB29_15
	jump .LBB29_13
.LBB29_13:                              //   in Loop: Header=BB29_12 Depth=2
	lw r0, r22, -100
	lw r1, r22, -72
	lsl_add r0, r0, r1, 2
	sw r0, 0, 0
	jump .LBB29_14
.LBB29_14:                              //   in Loop: Header=BB29_12 Depth=2
	lw r0, r22, -72
	add r0, r0, 1
	sw r22, -72, r0
	jump .LBB29_12
.LBB29_15:                              //   in Loop: Header=BB29_8 Depth=1
	lw r0, r22, -136
	lw r1, r22, -80
	lw r2, r22, -152
	sub r1, r1, r2
	lsl_add r0, r0, r1, 2
	sw r22, -132, r0
	sw r22, -140, 32
	lw r0, r22, -168
	add r0, r0, -1
	lsr r0, r0, 7
	sw r22, -68, r0
	sw r22, -64, 0
	jump .LBB29_16
.LBB29_16:                              //   Parent Loop BB29_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lw r0, r22, -64
	lw r1, r22, -68
	add r1, r1, 1
	jgeu r0, r1, .LBB29_22
	jump .LBB29_17
.LBB29_17:                              //   in Loop: Header=BB29_16 Depth=2
	lw r0, r22, -120
	lw r2, r22, -132
	move r1, 512
	sw r22, -36, r1
	call r23, umram_read
	lw r1, r22, -36
	lw r0, r22, -116
	lw r2, r22, -132
	add r2, r2, 512
	call r23, umram_read
	lw r1, r22, -36
	lw r0, r22, -112
	lw r2, r22, -140
	call r23, umram_read
	lw r0, r22, -132
	add r0, r0, 512
	sw r22, -132, r0
	lw r0, r22, -140
	add r0, r0, 512
	sw r22, -140, r0
	lw r0, r22, -64
	lw r1, r22, -68
	jneq r0, r1, .LBB29_19
	jump .LBB29_18
.LBB29_18:                              //   in Loop: Header=BB29_16 Depth=2
	lw r0, r22, -168
	sw r22, -60, r0
	jump .LBB29_20
.LBB29_19:                              //   in Loop: Header=BB29_16 Depth=2
	sw r22, -60, 128
	jump .LBB29_20
.LBB29_20:                              //   in Loop: Header=BB29_16 Depth=2
	lw r0, r22, -120
	lw r1, r22, -116
	lw r2, r22, -112
	lw r3, r22, -100
	lw r4, r22, -76
	lw r5, r22, -60
	call r23, dot_product
	jump .LBB29_21
.LBB29_21:                              //   in Loop: Header=BB29_16 Depth=2
	lw r0, r22, -64
	add r0, r0, 1
	sw r22, -64, r0
	jump .LBB29_16
.LBB29_22:                              //   in Loop: Header=BB29_8 Depth=1
	lw r0, r22, -108
	lw r2, r22, -128
	move r1, 512
	call r23, umram_read
	sw r22, -176, r0
	jgts r0, -1, .LBB29_24
	jump .LBB29_23
.LBB29_23:                              //   in Loop: Header=BB29_8 Depth=1
	call r23, fault_notif
	jump .LBB29_24
.LBB29_24:                              //   in Loop: Header=BB29_8 Depth=1
	lw r0, r22, -104
	lw r2, r22, -124
	move r1, 512
	call r23, umram_read
	sw r22, -176, r0
	jgts r0, -1, .LBB29_26
	jump .LBB29_25
.LBB29_25:                              //   in Loop: Header=BB29_8 Depth=1
	call r23, fault_notif
	jump .LBB29_26
.LBB29_26:                              //   in Loop: Header=BB29_8 Depth=1
	lw r0, r22, -128
	add r0, r0, 512
	sw r22, -128, r0
	lw r0, r22, -124
	add r0, r0, 512
	sw r22, -124, r0
	sw r22, -56, 0
	jump .LBB29_27
.LBB29_27:                              //   Parent Loop BB29_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lw r0, r22, -56
	lw r1, r22, -76
	jgeu r0, r1, .LBB29_34
	jump .LBB29_28
.LBB29_28:                              //   in Loop: Header=BB29_27 Depth=2
	lw r0, r22, -80
	lw r1, r22, -56
	add r0, r0, r1
	jneq r0, 0, .LBB29_30
	jump .LBB29_29
.LBB29_29:                              //   in Loop: Header=BB29_27 Depth=2
	lw r0, r22, -168
	call r23, print_debug
	lw r0, r22, -100
	lw r1, r22, -56
	lsl_add r0, r0, r1, 2
	lw r0, r0, 0
	call r23, print_debug
	lw r0, r22, -168
	lw r1, r22, -108
	lw r2, r22, -56
	lsl_add r1, r1, r2, 2
	lw r1, r1, 0
	call r23, __mulsi3
	lw r1, r22, -164
	call r23, __mulsi3
	call r23, print_debug
	lw r0, r22, -104
	lw r1, r22, -56
	lsl_add r0, r0, r1, 2
	lw r0, r0, 0
	lw r1, r22, -160
	call r23, __mulsi3
	call r23, print_debug
	jump .LBB29_30
.LBB29_30:                              //   in Loop: Header=BB29_27 Depth=2
	lw r0, r22, -168
	sw r22, -32, r0
	lw r1, r22, -100
	lw r2, r22, -56
	sw r22, -20, r2
	lsl_add r1, r1, r2, 2
	lw r1, r1, 0
	sw r22, -24, r1
	lw r1, r22, -108
	lsl_add r1, r1, r2, 2
	lw r1, r1, 0
	call r23, __mulsi3
	lw r1, r22, -164
	call r23, __mulsi3
	lw r1, r22, -20
	move r2, r0
	lw r0, r22, -24
	sub r0, r0, r2
	sw r22, -28, r0
	lw r0, r22, -104
	lsl_add r0, r0, r1, 2
	lw r0, r0, 0
	lw r1, r22, -160
	call r23, __mulsi3
	move r1, r0
	lw r0, r22, -28
	call r23, __div32
	move r1, r0
	lw r0, r22, -32
	sub r0, r0, r1
	lsl r0, r0, 1
	sw r22, -92, r0
	lw r0, r22, -92
	call r23, print_debug
	lw r0, r22, -92
	lw r1, r22, -88
	jges r0, r1, .LBB29_32
	jump .LBB29_31
.LBB29_31:                              //   in Loop: Header=BB29_27 Depth=2
	lw r0, r22, -92
	sw r22, -88, r0
	lw r0, r22, -80
	lw r1, r22, -56
	add r0, r0, r1
	sw r22, -84, r0
	jump .LBB29_32
.LBB29_32:                              //   in Loop: Header=BB29_27 Depth=2
	jump .LBB29_33
.LBB29_33:                              //   in Loop: Header=BB29_27 Depth=2
	lw r0, r22, -56
	add r0, r0, 1
	sw r22, -56, r0
	jump .LBB29_27
.LBB29_34:                              //   in Loop: Header=BB29_8 Depth=1
	jump .LBB29_35
.LBB29_35:                              //   in Loop: Header=BB29_8 Depth=1
	lw r0, r22, -80
	add r0, r0, 128
	sw r22, -80, r0
	jump .LBB29_8
.LBB29_36:
	lw r1, r22, -88
	lw r0, r22, -96
	sw r0, 0, r1
	lw r1, r22, -84
	lw r0, r22, -96
	sw r0, 4, r1
	move r0, b
	call r23, wait_barrier
	lw r0, r22, -172
	jneq r0, 0, .LBB29_40
	jump .LBB29_37
.LBB29_37:
	lw r0, r22, -156
	lw r1, r22, -168
	add r2, r0, r1
	lsl r0, r2, 2
	lsl_add r0, r0, r2, 3
	lsl_add r0, r0, r1, 2
	add r2, r0, 32
	move r0, DPU_RESULTS
	move r1, 64
	call r23, umram_write
	sw r22, -176, r0
	jgts r0, -1, .LBB29_39
	jump .LBB29_38
.LBB29_38:
	call r23, fault_notif
	jump .LBB29_39
.LBB29_39:
	lw r0, zero, sd_host
	add r1, r22, -52
	sw r22, -12, r1
	move r2, 1
	sw r22, -16, r2
	call r23, socket_write
	lw r1, r22, -12
	lw r2, r22, -16
	lw r0, zero, sd_host
	call r23, socket_read
	jump .LBB29_40
.LBB29_40:
	move r0, b
	call r23, wait_barrier
	ld d22, r22, -8
	jump r23
.Lfunc_end29:
	.size	main1, .Lfunc_end29-main1
	.section	.stack_sizes,"o",@progbits,.text.main1
	.long	.Lfunc_begin29
	.ascii	"\270\001"
	.section	.text.main1,"ax",@progbits
                                        // -- End function
	.section	.text.dot_product,"ax",@progbits
	.type	dot_product,@function           // -- Begin function dot_product
dot_product:                            // @dot_product
.Lfunc_begin30:
// %bb.0:
	sd r22, 40, d22
	add r22, r22, 48
	sw r22, -48, r0
	sw r22, -44, r1
	sw r22, -40, r2
	sw r22, -36, r3
	sw r22, -32, r4
	sw r22, -28, r5
	sw r22, -24, 0
	jump .LBB30_1
.LBB30_1:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB30_3 Depth 2
	lw r0, r22, -24
	lw r1, r22, -28
	jgeu r0, r1, .LBB30_11
	jump .LBB30_2
.LBB30_2:                               //   in Loop: Header=BB30_1 Depth=1
	sw r22, -20, 0
	jump .LBB30_3
.LBB30_3:                               //   Parent Loop BB30_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lw r0, r22, -20
	lw r1, r22, -32
	jgeu r0, r1, .LBB30_9
	jump .LBB30_4
.LBB30_4:                               //   in Loop: Header=BB30_3 Depth=2
	lw r0, r22, -20
	lw r1, r22, -24
	add r0, r0, r1
	jltu r0, 128, .LBB30_6
	jump .LBB30_5
.LBB30_5:                               //   in Loop: Header=BB30_3 Depth=2
	lw r0, r22, -44
	lw r1, r22, -20
	sw r22, -16, r1
	lw r2, r22, -24
	add r1, r1, r2
	lsl_add r0, r0, r1, 2
	lw r0, r0, -512
	lw r1, r22, -40
	lsl_add r1, r1, r2, 2
	lw r1, r1, 0
	call r23, __mulsi3
	lw r1, r22, -16
	move r2, r0
	lw r0, r22, -36
	lsl_add r0, r0, r1, 2
	lw r1, r0, 0
	add r1, r1, r2
	sw r0, 0, r1
	jump .LBB30_7
.LBB30_6:                               //   in Loop: Header=BB30_3 Depth=2
	lw r0, r22, -48
	lw r1, r22, -20
	sw r22, -12, r1
	lw r2, r22, -24
	add r1, r1, r2
	lsl_add r0, r0, r1, 2
	lw r0, r0, 0
	lw r1, r22, -40
	lsl_add r1, r1, r2, 2
	lw r1, r1, 0
	call r23, __mulsi3
	lw r1, r22, -12
	move r2, r0
	lw r0, r22, -36
	lsl_add r0, r0, r1, 2
	lw r1, r0, 0
	add r1, r1, r2
	sw r0, 0, r1
	jump .LBB30_7
.LBB30_7:                               //   in Loop: Header=BB30_3 Depth=2
	jump .LBB30_8
.LBB30_8:                               //   in Loop: Header=BB30_3 Depth=2
	lw r0, r22, -20
	add r0, r0, 1
	sw r22, -20, r0
	jump .LBB30_3
.LBB30_9:                               //   in Loop: Header=BB30_1 Depth=1
	jump .LBB30_10
.LBB30_10:                              //   in Loop: Header=BB30_1 Depth=1
	lw r0, r22, -24
	add r0, r0, 1
	sw r22, -24, r0
	jump .LBB30_1
.LBB30_11:
	ld d22, r22, -8
	jump r23
.Lfunc_end30:
	.size	dot_product, .Lfunc_end30-dot_product
	.section	.stack_sizes,"o",@progbits,.text.dot_product
	.long	.Lfunc_begin30
	.byte	48
	.section	.text.dot_product,"ax",@progbits
                                        // -- End function
	.section	.text.main,"ax",@progbits
	.globl	main                            // -- Begin function main
	.type	main,@function
main:                                   // @main
.Lfunc_begin31:
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
	jump .LBB31_1
.LBB31_1:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -20
	jgts r0, 2, .LBB31_4
	jump .LBB31_2
.LBB31_2:                               //   in Loop: Header=BB31_1 Depth=1
	move r0, main1
	call r23, create_job
	jump .LBB31_3
.LBB31_3:                               //   in Loop: Header=BB31_1 Depth=1
	lw r0, r22, -20
	add r0, r0, 1
	sw r22, -20, r0
	jump .LBB31_1
.LBB31_4:
	call r23, main1
	sw r22, -16, 0
	jump .LBB31_5
.LBB31_5:                               // =>This Inner Loop Header: Depth=1
	lw r0, r22, -16
	jgts r0, 2, .LBB31_8
	jump .LBB31_6
.LBB31_6:                               //   in Loop: Header=BB31_5 Depth=1
	call r23, join_job
	jump .LBB31_7
.LBB31_7:                               //   in Loop: Header=BB31_5 Depth=1
	lw r0, r22, -16
	add r0, r0, 1
	sw r22, -16, r0
	jump .LBB31_5
.LBB31_8:
	move r0, 0
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
	.zero	32
	.size	DPU_INPUT_ARGUMENTS, 32

	.type	DPU_RESULTS,@object             // @DPU_RESULTS
	.section	.bss.DPU_RESULTS,"aw",@nobits
	.globl	DPU_RESULTS
	.p2align	3
DPU_RESULTS:
	.zero	64
	.size	DPU_RESULTS, 64

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
	.addrsig_sym yield
	.addrsig_sym sbrk
	.addrsig_sym umram_read
	.addrsig_sym umram_write
	.addrsig_sym init_barrier
	.addrsig_sym wait_barrier
	.addrsig_sym main1
	.addrsig_sym fault_notif
	.addrsig_sym dot_product
	.addrsig_sym print_debug
	.addrsig_sym b
	.addrsig_sym sd_host
	.addrsig_sym DPU_INPUT_ARGUMENTS
	.addrsig_sym DPU_RESULTS
