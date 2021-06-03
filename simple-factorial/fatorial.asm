# programmed in MIPS Assembly 
# No recursive  factorial with any procedure (without jar nor jr functions) 
# class example number one


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

    move $t1, $v0 #move the value from $v0 to $t1 register 
    
    li $t2, 1 # the $t2 register receives the inicial value of factorial
    # the $t2 will be the factorial of the entered number, the result of the process
    li $t3, 0 #so lets put a number to increase from 0 to entered value 

f_loop:

    beq $t1, $t3, endloop #condicinal branch beq - branch to 'endloop' if 
                          # $t3 is equal to $t1
    addi $t3, $t3, 1    # sume 1 with the value $t3 register and put the result in $t3 registe
    mul $t2,$t2,$t3     # multiples value in $t2 with value in $t3 and put the result in $t2
    j f_loop            #jump to label 'endloop'

endloop:
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


