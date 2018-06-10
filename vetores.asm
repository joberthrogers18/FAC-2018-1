.data
	Vetor_A: .word 0,0,0,0,0,0,0,0	#definição do vetor_A[]. coloca os valores de Vetor_A[0]
	Msg1: .asciiz "\n Entre com A["
	Msg2: .asciiz "]:"
	Msg3: .asciiz "\n A["
	Msg4: .asciiz "Apresentação do vetor lido:\n\n"
	
	
.text

main:

	#addi $t0, $zero, 0	#inicializa $t0 em zero			t0 = contador(i)
	addi $s1, $0, 8		#inicializa s1 em 8			s1 = maximo
	la $s2, Vetor_A		#inicilizando o vetor

Loop:	addi $v0,$zero, 4	#Tipo de chamada "no caso de exibição""
	la $a0, Msg1	#Msg1
	syscall
	
		#exibição do I Vetor_A[I]
	li $v0, 1  	#chamada 1 imprime inteiro
	add $a0, $t0, $s0	#prepara t0 para imprimir
	syscall
	
	addi $v0,$0, 4	#Tipo de chamada "no caso de exibição""
	la $a0, Msg2	#Msg2
	syscall
	
		#percorre vetor e prepara para receber valor
		
	add $t1, $t0, $t0	# t1 = 2.i
	add $t1, $t1, $t1	#t1 = 4.i
	add $t1, $t1, $s2	#t1 = end.base + 4.i(deslocamento) = end. de save[i]
	lw $t2, 0($t1)		#t0 = save[i]
	li $v0, 5
	syscall
	
		#gravar o valor na posição 
	add $t2, $v0, $0  #salvar v0 em t2
	sw $t2, 0($t1)	  #$t0 = save[i]
	addi $t0, $t0, 1  #incremente em o 1 o t0 
	
		#verificação do loop
		
	bne $t0, $s1, Loop #enquanto t0 for diferente de s1 (no caso 8) vai para loop
	
	
	la $s2, Vetor_A		#iniciando o vetor
	addi $t0, $zero, 0 	#iniciando t0 em zero i=0
	
	addi $v0, $zero, 4	#Tipo de chamada "caso de exibição"
	la $a0, Msg4		#Msg4
	syscall
	
Loop2:
	addi $v0, $zero, 4	#Tipo de chamada "caso de exibição"
	la $a0, Msg3		#Msg3
	syscall
	
		#exibição do vetor
		
	li $v0, 1	#chamada imprime inteiro
	add $a0, $t0, $s0	#preparando t0 para imprimir
	syscall
	
	addi $v0, $zero, 4	#Tipo de chamada "caso de exibição"
	la $a0, Msg2		#Msg2
	syscall
	
		#percorre vetor e prepara para exibir
	add $t1, $t0, $t0	# t1 = 2.i
	add $t1, $t1, $t1	#t1 = 4.i
	add $t1, $t1, $s2	#t1 = end.base + 4.i(deslocamento) = end. de save[i]
	lw $t2, 0($t1)		#t0 = save[i]
	li $v0, 1
	add $a0, $t2, $s0	#preparar t0 para imprimir
	syscall
	
	addi $t0, $t0, 1	#incrementando em 1 t0
	
		#verificação do loop
		
	bne $t0, $s1, Loop2	#enquanto t0 for diferente de s1 (no caso 8) vai para loop
	
	nop	#não faz nada
	
	
	
