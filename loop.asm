.data		#segmento de dados

	msg1 : .asciiz " - "

.text		#segmento de codigo

	addi $s1, $zero, 11  # colocando 11 no registrador $s1
	
Loop:	li $v0, 1  	#chamada função imprime inteiro
	add $a0, $t0, $zero	#preparando o $t0 para imprimir
	syscall
	
	li $v0,4
	la $a0, msg1	# imprime caracter
	syscall
	
	addi $t0, $t0, 1	# incrementa em 1 o $t0
	bne $t0, $s1, Loop 	#enquanto $t0 for diferente de $s1, vai para loop