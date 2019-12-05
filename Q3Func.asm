	.data
texto: .asciiz "Número:\n"
newline: .asciiz "\n"

	.text
	.globl main
main:
	li $v0, 4
	la $a0, texto
	syscall
	
	li $v0, 5
	syscall
	or $a0, $v0, $zero
	
	jal fun
	or $a0, $v0, $zero
	li $v0, 1
	syscall
end:
	li $v0, 10
	syscall
fun:
	li $t0, 10
	li $v0, 0
loop:
	slt $t1, $zero, $a0
	beq $t1, $zero, fim
	div $a0, $t0
	mflo $a0
	addi $v0, $v0, 1
	j loop
fim:
	jr $ra