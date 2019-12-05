	.text
	.globl main
main:
	li $v0, 5
	syscall
	move $s0, $v0
	
	addi $s1, $s0, -1
fatorial:
	mult $s0, $s1
	mflo $s0
	addi $s1, $s1, -1
	bne $s1, $zero, fatorial
	
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	li $v0, 10
	syscall