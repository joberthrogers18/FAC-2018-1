.data
	number1: .double 3.14
	number2: .double 2.71
	msg_erro: .asciiz "test"
	
.text
    ldc1 $f2, number1 # Adiciona o numero 1 no registrador $f2
    ldc1 $f4, number2	# Adiciona o numero 2 no registrador $f4
    c.lt.d $f4, $f2	# CC = $f4 < $f2
    bc1t op1		# se setado pra 1 ele vai pra op1 caso contrario vai pra op2
    
op1:
     li $v0, 4
    la $a0, msg_erro	# mostra a mensagem de erro teste
    syscall 
    j exit
    
op2:
     
    li $v0, 3
    add.d $f12, $f2, $f4		# soma os numeros acima e printa na tela
    syscall 
    j exit
    
exit: