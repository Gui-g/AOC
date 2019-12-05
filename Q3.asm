	.data
	newline: .asciiz "\n"
	
	.text
	.globl main
main:

	li $v0, 5
	syscall
	move $s0, $v0
	li $t0, -1
	beq $s0, $t0, end
	add $s1, $s0, $zero
	ori $t1, $zero, 1
	
loop:
	li $v0, 5
	syscall
	move $s0, $v0
	beq $s0, $t0, end
	add $s1, $s1, $s0
	addi $t1, $t1, 1
	j loop

end:
	
	li $v0, 1
	la $a0, ($s1)
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	mtc1 $s1, $f1
	cvt.s.w $f1, $f1
	mtc1 $t1, $f2
	cvt.s.w $f2, $f2
	li $v0, 2
	div.s $f12, $f1, $f2
	li $v0, 2
	syscall
