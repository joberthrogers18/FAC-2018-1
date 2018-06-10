.data
	Numero1: .asciiz "Informe o primeiro número: " 
	Numero2: .asciiz "Informe o segundo número: "
	Resultado: .asciiz "O resultado foi: "

.text

 	li $v0, 4		#dizendo ao registrador v0 que quer imprimir uma string
 	la $a0, Numero1		#salvou a string em a0
 	syscall 		# função que faz o output de acordo com o que esta em v0
 	
 	li $v0, 5		#pedir par a fução ler do teclado
 	syscall
 	
 	move $t0, $v0		#mover o que estar em v0 e colocar na variavel t0
 	
 	li $v0, 4		#
 	la $a0, Numero2
 	syscall
 	
 	li $v0, 5
 	syscall
 	
 	move $t1, $v0
 	
 	add $t2, $t1, $t0	# somar os dois numeros e salvar em t2

	li $v0, 4		#exibi o resultado "string"
	la $a0, Resultado
	syscall
	
	li $v0, 1		# exibir a variavel em t2
	move $a0, $t2
	syscall
	
	mult $t1, $t2
	
	mflo $s3