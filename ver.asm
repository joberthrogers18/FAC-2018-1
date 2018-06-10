.data 
	valor1:		.asciiz "Insira um valor para a base: "
valor2: 	.asciiz "Insira um valor para o expoente: "
valor3: 	.asciiz "Insira um valora supostamente primo: "
naoPrimo:	.asciiz "O valor inserido não é primo."
sucesso1:	.asciiz "A exponencial modular "
sucesso2:	.asciiz " elevado a "
sucesso3:	.asciiz " (mod "
	sucesso4:	.asciiz ") eh "

.text

le_inteiro:
	la $a0, valor1		# Imprime mensagem de inserção
	li $v0, 4
	syscall 
	
	li $v0, 5		#Leitura do primeiro inteiro
	syscall
	move $t0, $v0		# Salva o primeiro inteiro em $t0
	
	la $a0, valor2		# Imprime mensagem de inserção
	li $v0, 4
	syscall 
	
	li $v0, 5
	syscall			# Leitura do segundo inteiro
	move $t1, $v0		# Salva o segundo inteiro em $	t1

	la $a0, valor3		# Imprime mensagem de inserção
	li $v0, 4
	syscall 
	
	li $v0, 5
	syscall			# Leitura do terceiro inteiro
	move $t2, $v0		# Passa o inteiro lido para o registrador $t2

preparação:
	li $t3, 1		# $t3 == (cont)
	move $t6, $t2		# $t6 recebe as subtrações (total)
	li $t7, 1		# $t7 será o valor das subtrações (aux)
	jal sqrt
	
sqrt:					#encontrará a parte inteira da raiz quadrada
	slti $t4, $t6, 1		# ( aux < 1 )
	bne $t4, $zero, fim_sqrt		# if not( aux < 1 ), fim
	add $t7, $t7, 2			# aux += 2
	add $t3, $t3, 1			# cont++
	sub $t6, $t6, $t7		# total -= aux
	j sqrt
fim_sqrt:
	jr $ra