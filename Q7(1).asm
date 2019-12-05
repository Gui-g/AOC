	.text
	.globl main
main:
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $s0, 50
	
	slt $t1, $s0, $t0
	beq $s0, $t0, skip1
	beq $t1, $zero, printzero1
skip1:	
	div $t0, $s0
	mflo $s1
	
	li $v0, 1
	la $a0, ($s1)
	syscall
	
	li $a0, 32
	li $v0, 11
	syscall
	
	mult $s1, $s0
	mflo $s1
	sub $t0, $t0, $s1
vinte:
	li $s0, 20
	
	slt $t1, $s0, $t0
	beq $s0, $t0, skip2
	beq $t1, $zero, printzero2
skip2:
	div $t0, $s0
	mflo $s1
	
	li $v0, 1
	la $a0, ($s1)
	syscall
	
	li $a0, 32
	li $v0, 11
	syscall
	
	mult $s1, $s0
	mflo $s1
	sub $t0, $t0, $s1
dez:
	li $s0, 10
	
	slt $t1, $s0, $t0
	beq $s0, $t0, skip3
	beq $t1, $zero, printzero3
skip3:
	div $t0, $s0
	mflo $s1
	
	li $v0, 1
	la $a0, ($s1)
	syscall
	
	li $a0, 32
	li $v0, 11
	syscall
	
	mult $s1, $s0
	mflo $s1
cinco:
	li $s0, 5
	
	slt $t1, $s0, $t0
	beq $s0, $t0, skip4
	beq $t1, $zero, printzero4
skip4:
	
	div $t0, $s0
	mflo $s1
	sub $t0, $t0, $s1
	slt $t1, $s0, $t0
um:
	slt $t1, $zero, $t0
	beq $t1, $zero, printzero5
	li $v0, 1
	la $a0, ($s1)
	syscall
	
	li $a0, 32
	li $v0, 11
	syscall
	
	mult $s1, $t0
	mflo $s1
	sub $t0, $t0, $s1
	
	li $v0, 1
	la $a0, ($s1)
	syscall
	
end:
	li $v0, 10
	syscall
	
printzero1:
	li $v0, 1
	la $a0, ($zero)
	syscall
	li $a0, 32
	li $v0, 11
	syscall	
	j vinte
	
printzero2:
	li $v0, 1
	la $a0, ($zero)
	syscall
	li $a0, 32
	li $v0, 11
	syscall
	j dez
	
printzero3:
	li $v0, 1
	la $a0, ($zero)
	syscall
	li $a0, 32
	li $v0, 11
	syscall
	j cinco
	
printzero4:
	li $v0, 1
	la $a0, ($zero)
	syscall
	li $a0, 32
	li $v0, 11
	syscall
	j um
	
printzero5:
	li $v0, 1
	la $a0, ($zero)
	syscall
	j end