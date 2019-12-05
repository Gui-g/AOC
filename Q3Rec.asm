	.text
	.globl main
main:
	#Lê k
	ori $v0, $zero, 5
	syscall
	ori $a0, $v0, 0
	#Lê n
	ori $v0, $zero, 5
	syscall
	ori $a1, $v0, 0
	
	jal num
	ori $a0, $v0, 0
	ori $v0, $zero, 1
	syscall
	j end
	
num:
	ori $t0, $zero, 10
	div $a1, $t0
	mflo $a1
	mfhi $t2
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $t2, 4($sp)
	slt $t1, $zero, $a1
	beq $t1, $zero, num_0
	jal num
	lw $ra, 0($sp)
	lw $t2, 4($sp)
	addi $sp, $sp, 8
	bne $t2, $a0, not
	addi $v0, $v0, 1
not:
	jr $ra
num_0:
	ori $v0, $zero, 0
	jr $ra
end:
	ori $v0, $zero, 10
	syscall
