#Fuction
    .text

    .globl factorial 

#arguments:
# $a1 ---> input number 
factorial:

    addi $sp, $sp, -4 # update the sp register, reserving 1 word on the stack
    sw $a1, 0 ($sp) #save the $a1 register's value on the reserved space of the stack 
    # now the value of $a1 can be used as a  iterator for the loop
    li $v0, 1   # the $v0 will be the result of the process
    li $t0, 1   #t0 is value for comparasion, loop stops when $a1's value be equals to $t0's value

loop:
    #decreasing iterator loop
    ble $a1, $t0, endloop 
    mul $v0, $v0, $a1 # $a1 is used to multiples with $v0 
    addi $a1, $a1, -1 #decrease the iterator until $a1 be equals to 1
    j loop # jump to loop

endloop:
    
    lw $a1, 0 ($sp) #now we can take back the value saved on the stack (the input value)
    addi $sp, $sp, 4 # and restore the memory 
    jr $ra # when procedure was colled, the return adress was saved at $ra register - now the process jump back
           # update de pc register (pc <--- $ra)
    
