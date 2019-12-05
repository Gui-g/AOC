	.data
textox: .asciiz "x:\n"
textofunc: .asciiz "ax³ + bx² + cx + d\n"
newline: .asciiz "\n"

	.text
	.globl main
main:
	li $v0, 4
	la $a0, textofunc
	syscall
	
	addi $sp, $sp, -4
	
	li $v0, 5
	syscall
	or $a0, $v0, $zero
	
	sw $a0, 0($sp)
	
	li $v0, 5
	syscall
	or $a0, $v0, $zero
	
	li $v0, 5
	syscall
	or $a1, $v0, $zero
	
	li $v0, 5
	syscall
	or $a2, $v0, $zero
	
	li $v0, 5
	syscall
	or $a3, $v0, $zero
	
	jal func
	or $a0, $v0, $zero
	li $v0, 1
	syscall
	addi $sp, $sp, 4
end:
	li $v0, 10
	syscall
func:
	lw $t0, 0($sp)
	
	mult $a3, $a3
	mflo $t1
	mult $t1, $a3
	mflo $t1
	mult $t1, $t0
	mflo $v0
	
	mult $a3, $a3
	mflo $t1
	mult $t1, $a0
	mflo $t1
	add $v0, $v0, $t1
	
	mult $a3, $a1
	mflo $t1
	add $v0, $v0, $t1
	add $v0, $v0, $a2
	jr $ra
	