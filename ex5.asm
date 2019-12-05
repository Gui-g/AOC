	.data
primQuart: .asciiz "Ponto no primeiro quadrante \n"
secQuart: .asciiz "Ponto no segundo quadrante \n"
terQuart: .asciiz "Ponto no terceiro quadrante \n"
quaQuart: .asciiz "Ponto no quarto quadrante \n"
origem: .asciiz "Ponto na origem \n"
eixoX: .asciiz "Ponto sobre o eixo X \n"
eixoY: .asciiz "Ponto sobre o eixo Y \n"

	
	.text	
	.globl main
main:
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	li $t0, -1
	
	bne $s0, $zero, notOri
	bne $s1, $zero, Y
	
	li $v0, 4
	la $a0, origem
	syscall
	j end
	
Y:
	li $v0, 4
	la $a0, eixoY
	syscall
	j end
	
notOri:
	
	bne $s1, $zero, notX
	
	li $v0, 4
	la $a0, eixoX
	syscall
	j end
	
notX:	
	mult $t0, $s0
	mflo $s0
	slt $t1, $s0, $zero
	
	mult $t0, $s1
	mflo $s1
	slt $t2, $s1, $zero 
	
	bne $t1, $zero, notPrimQuart
	bne $t2, $zero, notTer
	
	li $v0, 4
	la $a0, terQuart
	syscall
	j end

notTer:
	li $v0, 4
	la $a0, secQuart
	syscall
	j end
	
notPrimQuart:
	bne $t2, $zero, notPrim
	
	li $v0, 4
	la $a0, quaQuart
	syscall
	j end
	
notPrim:
	li $v0, 4
	la $a0, primQuart
	syscall
	
end:
	li $v0, 10
	syscall