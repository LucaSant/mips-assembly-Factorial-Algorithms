
    .text
    .globl factorial
    .globl recursion

factorial:

    addi $sp, $sp, -8
    sw $a2, 0 ($sp)
    sw $ra, 4 ($sp)

    bne $zero, $a2, recursion  # branch to 'recursion' if $t1 value is not equal to $a2 value
    j back

recursion:

    mul $v0, $v0, $a2
    addi $a2, $a2, -1
    jal factorial


back:
    lw $ra, 4 ($sp)
    lw $a2, 0 ($sp)
    addi $sp, $sp, 8
    jr $ra

