	.text
	.globl main
main:
	ori $s0, $zero, 9
	addi $s1, $s0, -1
fatorial:
	mul $s0, $s0, $s1
	addi $s1, $s1, -1
	bne $s1, $zero, fatorial
	
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	li $v0, 10
	syscall