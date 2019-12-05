	.data
	ncinquenta: .asciiz "nota(s) de 50."
	nvinte: .asciiz "nota(s) de 20."
	ndez: .asciiz "nota(s) de 10."
	ncinco: .asciiz "nota(s) de 5."
	mum: .asciiz "moeda(s) de 1."
	
	
	.text
	.globl main
main:
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $s0, 50
	
	slt $t1, $s0, $t0
	beq $s0, $t0, skip1
	beq $t1, $zero, vinte
skip1:
	div $t0, $s0
	mflo $s1
	
	li $v0, 1
	la $a0, ($s1)
	syscall
	
	li $a0, 32
	li $v0, 11
	syscall
	
	li $v0, 4
	la $a0, ncinquenta
	syscall
	
	li $a0, 32
	li $v0, 11
	syscall
	
	mult $s1, $s0
	mflo $s1
	beq $s1, $t0, end
	addi $t0, $t0, -50
	slt $t1, $zero, $t0
	beq $t1, $zero, end
	beq $t0, $zero, end
vinte:
	li $s0, 20
	
	slt $t1, $s0, $t0
	beq $s0, $t0, skip2
	beq $t1, $zero, dez
skip2:
	div $t0, $s0
	mflo $s1
	
	li $v0, 1
	la $a0, ($s1)
	syscall
	
	li $a0, 32
	li $v0, 11
	syscall
	
	li $v0, 4
	la $a0, nvinte
	syscall
	
	li $a0, 32
	li $v0, 11
	syscall
	
	mult $s1, $s0
	mflo $s1
	beq $s1, $t0, end
	addi $t0, $t0, -20
	slt $t1, $zero, $t0
	beq $t1, $zero, end
	beq $t0, $zero, end
dez:
	li $s0, 10
	
	slt $t1, $s0, $t0
	beq $s0, $t0, skip3
	beq $t1, $zero, cinco
skip3:
	div $t0, $s0
	mflo $s1
	
	li $v0, 1
	la $a0, ($s1)
	syscall
	
	li $a0, 32
	li $v0, 11
	syscall
	
	li $v0, 4
	la $a0, ndez
	syscall
	
	li $a0, 32
	li $v0, 11
	syscall
	
	mult $s1, $s0
	mflo $s1
	beq $s1, $t0, end
	addi $t0, $t0, -10
	slt $t1, $zero, $t0
	beq $t1, $zero, end
	beq $t0, $zero, end
cinco:
	li $s0, 5
	
	slt $t1, $s0, $t0
	beq $s0, $t0, skip4
	beq $t1, $zero, um
skip4:
	div $t0, $s0
	mflo $s1
um:
	li $v0, 1
	la $a0, ($s1)
	syscall
	
	li $a0, 32
	li $v0, 11
	syscall
	
	li $v0, 4
	la $a0, ncinco
	syscall
	
	li $a0, 32
	li $v0, 11
	syscall
	
	mult $s1, $s0
	mflo $s1
	beq $s1, $t0, end
	addi $t0, $t0, -5
	slt $t1, $zero, $t0
	beq $t1, $zero, end
	beq $t0, $zero, end
	
	li $s0, 1
	div $t0, $s0
	mflo $s1
	
	li $v0, 1
	la $a0, ($s1)
	syscall
	
	li $a0, 32
	li $v0, 11
	syscall
	
	li $v0, 4
	la $a0, mum
	syscall
	
	li $a0, 32
	li $v0, 11
	syscall
	
end:
	li $v0, 10
	syscall
