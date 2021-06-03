
    .text

    .globl factorial
    
factorial:

    addi $sp, $sp, -4
    sw $a2, 0 ($sp)

    li $v0, 1   # the $v0 will be the result of the process
    li $t0, 0   #so lets put a number to increase from 0 to entered value 

loop:

    beq $a2, $t0, endloop
    addi $t0, $t0, 1
    mul $v0, $v0, $t0;
    j loop

endloop:
    
    lw $a2, 0 ($sp)
    addi $sp, $sp, 4
    jr $ra

    
