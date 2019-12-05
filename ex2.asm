	.data
par: .asciiz "Par\n"
impar: .asciiz "Impar\n"
	.text
	.globl main
main:
loop:
	li $v0, 5
	syscall
	move $s0, $v0
	
	beq $v0, $zero, end
	
	andi $v0, $v0, 0x00000001
	beq $v0, $zero, printPar

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