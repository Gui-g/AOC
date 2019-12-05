	.data
x: .asciiz " x "
pontos: .asciiz " : "
newLine: .asciiz "\n"
	
	.text
	.globl main
main:
	li $s0, 2
	li $t0, 1
	li $t2, 11
	
tabuada:
	mult $s0, $t0
	mflo $t1
	
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	li $v0, 4
	la $a0, x
	syscall
	
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	li $v0, 4
	la $a0, pontos
	syscall
	
	li $v0, 1
	la $a0, ($t1)
	syscall
	
	li $v0, 4
	la $a0, newLine
	syscall
	
	addi $t0, $t0, 1
	
	bne $t0, $t2, tabuada
	
	li $v0, 4
	la $a0, newLine
	syscall
	
	addi $s0, $s0, 1
	li $t0, 1
	bne $s0, $t2, tabuada
	
	li $v0, 10
	syscall
