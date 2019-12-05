	.data
texto1: .asciiz "N:\n"
newline: .asciiz "\n"
	
	.text
	.globl main
main:
loop:
	li $v0, 4
	la $a0, texto1
	syscall
	
	li $v0, 5
	syscall
	or $a0, $v0, $zero
	
	ori $t1, $zero, -1
	slt $t0, $t1, $a0
	beq $t0, $zero, end
	
	jal fib
	or $a0, $v0, $zero
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	j loop
end:
	li $v0, 10
	syscall
	
fib:
	beq $a0, $zero, zero
	
	ori $t5, $zero, 1
	beq $a0, $t5, um
	
	ori $t5, $zero, 1
	ori $t0, $zero, 0
	ori $t1, $zero, 1
fib_loop:
	add $v0, $t1, $t0
	or $t0, $t1, $zero
	or $t1, $v0, $zero
	addi $t5, $t5, 1
	slt $t2, $t5, $a0
	beq $t2, $zero, fim
	j fib_loop
zero:
	ori $v0, $zero, 0
	jr $ra
um:
	or $v0, $zero, $t5
	jr $ra
fim:
	jr $ra