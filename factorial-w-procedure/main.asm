# Class example number 2

    .data 
    .align 0

string_num:     .asciiz "Enter a number: "
print_fat:      .asciiz "The factorial of "
print_is:       .asciiz " is "

    .text
    .globl main

main:

    li $v0, 4
    la $a0, string_num
    syscall

    li $v0, 5
    syscall

    move $a2, $v0;
    jal factorial

    move $t1, $a0
    move $t2, $v0

    li $v0, 4
    la $a0, print_fat
    syscall

    li $v0, 5
    la $a0, ($t1)
    syscall

    li $v0, 4
    la $a0, print_is
    syscall

    li $v0, 5
    la $a0, ($t2)

    

