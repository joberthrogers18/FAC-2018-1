.data
	ms1: .asciiz "Digite o valor: "
	ms2: .asciiz "o numero eh: "
	
.text

main: 
	li $v0, 4
	la $a0, ms1
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	li $v0, 1
	add $a0, $t1, $zero
	syscall
	