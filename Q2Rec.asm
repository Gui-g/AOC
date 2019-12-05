	.text
	.globl main
main:
	ori $v0, $zero, 5
	syscall
	ori $a0, $v0, 0
	jal fib
	ori $a0, $v0, 0
	ori $v0, $zero, 1
	syscall
	j end
fib:
	slti $t0, $a0, 1
	bne $t0, $zero, fib_0
	slti $t0, $a0, 2
	bne $t0, $zero, fib_1
	#fib(n-1)
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $a0, $a0, -1
	jal fib #fib(n-1)
	addi $a0, $a0, 1
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	sw $v0, 0($sp)
	#fib(n-2)
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $a0, $a0, -2
	jal fib #fib(n-2)
	addi $a0, $a0, 2
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $v1, 0($sp)
	addi $sp, $sp, 4
	
	add $v0, $v0, $v1 #fib(n-1) + fib(n-2)
	jr $ra
fib_0:
	ori $v0, $zero, 0
	jr $ra
fib_1:
	ori $v0, $zero, 1
	jr $ra
end:
	ori $v0, $zero, 10
	syscall
