	.data
	barra: .asciiz "/"
	
	.text
	.globl main
main:
	li $t0, 365
	li $t1, 30
	li $t2, 7
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	div $s0, $t0
	mflo $s1
	
	li $v0, 1
	la $a0, ($s1)
	syscall
	
	li $v0, 4
	la $a0, barra
	syscall
	
	mult $s1, $t0
	mflo $s1
	sub $s0, $s0, $s1
	
	div $s0, $t1
	mflo $s1
	
	li $v0, 1
	la $a0, ($s1)
	syscall
	
	li $v0, 4
	la $a0, barra
	syscall
	
	mult $s1, $t1
	mflo $s1
	sub $s0, $s0, $s1
	
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	li $v0, 10
	syscall