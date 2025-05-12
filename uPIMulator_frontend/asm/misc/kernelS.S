.global stop
stop:  //save the flow context in the stack and save the stack offset in r0 and stop. resume function will restart after this function

    sd r22,0,d14
    sd r22,8,d16
    sd r22,16,d18
    sd r22,24,d20
    sd r22,32,d22

    sw r0,0,r22  
    add r22, r22, 40
    move r4, 0       //put 0 when run again fall in syscall with value 0
    stop true, stop+0x40
    fault 0x1        //should be never reach
    jump  syscall    //parse by the mram_creator and write at 0 in MRAM.    


.global resume
resume:   //restore the flow context store in r1 and continue the execution after the stop. This function will never returns

    move r22,r0 
    move r0,r23

    ld d14,r22,0
    ld d16,r22,8
    ld d18,r22,16
    ld d20,r22,24
    ld d22,r22,32

    jump r0



.global swap_context
swap_context : //Save the current flow context inside the stack (and store stack offset in r0), load the new stack (store in r1) and restore the flow context contain in it. 


    sd r22,0,d14
    sd r22,8,d16
    sd r22,16,d18
    sd r22,24,d20
    sd r22,32,d22

    sw r0,0,r22   //save the stack inside r0
//------------------------
    move r22,r1 //saveback the stack save in r1

    ld d14,r22,0
    ld d16,r22,8
    ld d18,r22,16
    ld d20,r22,24
    ld d22,r22,32

    jump r23    


.global first_swap_context
first_swap_context : //Same that swap_context but there are 3 parameters the last one if the place to jump


    sd r22,0,d14
    sd r22,8,d16
    sd r22,16,d18
    sd r22,24,d20
    sd r22,32,d22

    sw r0,0,r22   //save the stack inside r0
//------------------------
    move r22,r1 //saveback the stack save in r1

    ld d14,r22,0
    ld d16,r22,8
    ld d18,r22,16
    ld d20,r22,24
    ld d22,r22,32

    jump r2    
