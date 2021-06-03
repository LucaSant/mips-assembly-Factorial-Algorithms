# Class example number 3

     .data             #identifies the data declaration segment
    .align 0          #align data in memory so that it fits in 2^n bytes
                      #...here it aligns by 1 byte (character value)
                      
string_num:    .asciiz "enter a number: " # string variables 'declarations'
print_num:     .asciiz "The factorial of  "
print_is:      .asciiz " is "

    .text           #identifies the beginning of the text segment 
    .globl main     #labels the  process entry point 

main:               #process entry point 

    li $v0, 4       # $v0 = 4 - Command to print string
    la $a0, string_num  # $a0 = string_num adress - the string in $a0  that will be printed
    syscall             #call the system

    li $v0, 5      #$v0 = 5 - Command to read a integer value
    syscall

    move $a2, $v0
    li $v0, 1

    jal factorial

    move $t2, $v0
    move $t1, $a2

    #print the print_num string
    li $v0, 4
    la $a0, print_num 
    syscall

    #print a integer value - the adress of the value is in $a0 register
    li $v0, 1
    la $a0, ($t1) 
    syscall

    #print the print_is string
    li $v0, 4
    la $a0, print_is
    syscall

    #print the calculated factorial - the value is $t2 register
    li $v0, 1
    la $a0, ($t2)
    syscall

    li $v0, 10 # $v0 = 10 - Command to end the program 
    syscall
