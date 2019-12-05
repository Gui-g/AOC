	.text
	.globl main
main:
	ori $v0, $zero, 5
	syscall
	ori $a0, $v0, 0
	jal binario
	ori $a0, $v0, 0
	ori $v0, $zero, 1
	syscall
	j end
binario:
	ori $t1, $zero, 2
	div $a0, $t1
	mfhi $t0
	mflo $a0

	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	slt $t2, $zero, $a0
	beq $t2, $zero, zero
	jal binario
	lw $ra, 0($sp)
	lw $t0, 4($sp)
	addi $sp, $sp, 8
	
	ori $t2, $zero, 10
	mult $v0, $t2
	mflo $v0
	add $v0, $v0, $t0
	jr $ra
zero:
	ori $v0, $zero, 0
	jr $ra
end:
	ori $v0, $zero, 10
	syscall