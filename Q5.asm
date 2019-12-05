	.text
	.globl main
main:
	li $t0, 0
	li $t1, 1
	li $t2, 20
	ori $s0, $zero, 1
fib:
	add $s1, $t1, $t0
	move $t0, $t1
	move $t1, $s1
	addi $s0, $s0, 1
	beq $s0, $t2, end
	j fib
end:
	li $v0, 1
	la $a0, ($s1)
	syscall
	
	li $v0, 10
	syscall