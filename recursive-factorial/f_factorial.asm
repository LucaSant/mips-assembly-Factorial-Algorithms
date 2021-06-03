
    .text
    .globl factorial
    .globl recursion

factorial:

    addi $sp, $sp, -8          #reserve 2 word on the stack
    sw $a2, 0 ($sp)            #puts in the current place the number from the input 
    sw $ra, 4 ($sp)            #and puts in the other word place, the return address
    #(along the past number less one is going to be saved in diferents positiions of the stack)
    
    bne $zero, $a2, recursion  # branch to 'recursion' if $a2 value is not equal to 0
    j back                     # if is equal, doesn't branch

recursion:

    mul $v0, $v0, $a2   
    addi $a2, $a2, -1
    jal factorial             #calls the factorial function again


back:                         # the process just goes to 'back' when the stop condition has been reached
    lw $ra, 4 ($sp)           #return values address until backs to the first, in the main function 
    lw $a2, 0 ($sp)           #gives backs to $a2 values, increasing + 1 every time
    addi $sp, $sp, 8          #restore the 2 words of stack every time that fuction back is called
    jr $ra                    #jump to return address

