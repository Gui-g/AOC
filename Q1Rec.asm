	.text
	.globl main
main:
	ori $v0, $zero, 5
	syscall
	ori $a0, $v0, 0
	jal factorial_rec
	ori $a0, $v0, 0
	ori $v0, $zero, 1
	syscall
	j end
factorial_rec:
	slti $t0, $a0, 1
	bne $t0, $zero, factorial_0
	addi $sp, $sp, -8
	sw $a0, 0($sp)
	sw $ra, 4($sp)
	addi $a0, $a0, -1
	jal factorial_rec
	lw $a0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	mul $v0, $a0, $v0
	jr $ra
factorial_0:
	ori $v0, $zero, 1
	jr $ra
end:
	li $v0, 10
	syscall