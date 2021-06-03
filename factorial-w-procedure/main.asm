# Class example number 2

    .data # data declaration section
    .align 0
# string declarations
string_num:     .asciiz "Enter a number: "
print_fat:      .asciiz "The factorial of "
print_is:       .asciiz " is "

    .text # process text section
    .globl main 

main: # glabal fuction main

    li $v0, 4
    la $a0, string_num
    syscall

    li $v0, 5 # enter a integer value
    syscall

    move $a1, $v0  # move the value to $a1 because $v0 is used in several commands
                   # by convention, $a's registers are used as arguments to the procedure. 
    jal factorial # call the procedure factorial 
                  # jal transfer the control to the procedure (update de value of pc register)

    move $t1, $a1 
    move $t2, $v0

# print all strings and values to create a phrase 
    li $v0, 4 # print string
    la $a0, print_fat
    syscall

    li $v0, 1 # print integer
    la $a0, ($t1)
    syscall

    li $v0, 4
    la $a0, print_is
    syscall

    li $v0, 1
    la $a0, ($t2)
    syscall

    li $v0, 10 #end program
    syscall



