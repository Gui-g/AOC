	.data
par: .asciiz "Par\n"
impar: .asciiz "Impar\n"
	
	.text
	.globl main
main:
	li $t0, 2
loop:
	li $v0, 5
	syscall
	move $s0, $v0
	
	beq $s0, $zero, end
	
	div $v0, $t0
	mfhi $t2
	
	beq $t2, $zero, printPar
	
	li $v0, 4
	la $a0, impar
	syscall
	j loop
	
printPar:
	li $v0, 4
	la $a0, par
	syscall
	j loop
	
end:
	li $v0, 10
	syscall
