# f = (g + h) - ( i + j)

	.data

Pri:    .asciiz "Entre com o valor de x: "
Sec:    .asciiz "Entre com o valor de y:"
Tre:    .asciiz "À soma de x e y é: "

	.text #inicio do segmento de codigo 

	#variavel x
	
	addi $v0, $zero, 4    #tipo de chamada de exibição
	la   $a0,Pri	      #carregando no a0 a mensagem 1
	syscall
	
	li $v0, 5            #chamada de leitura
	syscall 
	add $s0, $v0, $s0    # salva a entrada em $s0
	

	#variavel y
	
	addi $v0, $zero, 4    #tipo de chamada de exibição
	la   $a0,Sec	      #carregando no a0 a mensagem 2
	syscall
	
	li $v0, 5            #chamada de leitura
	syscall 
	add $s1, $v0, $s1    # salva a entrada em $s0
		
	#soma x + y
	
	add $s2, $s0, $s1   # soma dos inputs
	
	li $v0, 4          
	la $a0, Tre			#carrecgand em a0 a mensagem 3
	syscall
	
	li $v0, 1
	add $a0,$s2, $zero
	syscall
	