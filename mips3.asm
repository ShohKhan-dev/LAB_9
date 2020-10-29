.data
	flt: .float 1000.0
	prompt: .asciiz "Please enter 8 float numbers one by one\n"
	ask: .asciiz  "Enter number: "
	answer: .asciiz "\nMinimum is: "
.text
.globl main

main:
	li $t0, 0 ## Startting
        li $t1, 8 ### Number of inputs ofr iter
        l.s $f2, flt
        
        li $v0, 4
	la $a0, prompt
	syscall

loop:
	li $v0, 4
	la $a0, ask
	syscall

	beq $t0, $t1, Result 
	addi $t0, $t0, 1
	li $v0, 6 
	syscall 
	c.lt.s $f2, $f0  
	bc1t loop 
	mov.s $f2, $f0  
	j loop  
Result:
	li $v0, 4
	la $a0, answer
	syscall

	mov.s $f12, $f2
	li $v0, 2              
	syscall
	j Exit

Exit:
        li $v0, 10
     	syscall
