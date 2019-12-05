	.text
	.globl main
main:
	ori $v0, $zero, 5
	syscall
	ori $a0, $v0, 0
	jal sum
	ori $a0, $v0, 0
	ori $v0, $zero, 1
	syscall
	j end
sum:
	ori $t1, $zero, 10
	div $a0, $t1
	mfhi $t0
	mflo $a0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	slt $t2, $zero, $a0
	beq $t2, $zero, zero
	jal sum
	lw $ra, 0($sp)
	lw $t0, 4($sp)
	addi $sp, $sp, 8
	add $v0, $v0, $t0
	jr $ra
zero:
	ori $v0, $zero, 0
	jr $ra
end:
	ori $v0, $zero, 10
	syscall