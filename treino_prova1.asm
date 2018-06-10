.data 
Msg1 : .asciiz "Digite um numero:"
Msg2 : .asciiz " ,"

.text

main:

addi $v0, $zero, 4 	#adicionando comando de exiboção na tela "4"
la $a0, Msg1	#carregando o endereço de Ms1 em a0
syscall		

li $v0, 5 # comando carregar na memoria
syscall  

add $s5,$zero, $v0	#guarda o valor de $v0 em s4

addi $s4 , $s4, 1	#contador
addi $s1, $s1, 0 	#começando o registrador com 0
addi $s2, $s2, 1  	#começando o registrador com 1

Loop:
 
 
 add  $t2, $s2, $s1	# teporario guardadndo os valores dos dois
 add  $s1,$s1, $s2	#colocando o valor de s2 em s1
 add  $s2, $s2, $t2	#colocando o valor do temporario em s2
 
 li $v0, 1  	#chamada 1 imprime inteiro
 add $a0, $t2, $zero	#prepara t0 para imprimir
 syscall
 
 addi $v0, $zero, 4 	#adicionando comando de exiboção na tela "4"
 la $a0, Msg2	#carregando o endereço de Ms1 em a0
 syscall
 
 beq $s5, $s4, Label1 #condição para ver $s0 é igual o contador
 addi $s4, $s4 , 1	#caso a codição não seja satisfeita S4 soma se 1
 j Loop	#e volta pro loop novamente
 
Label1: 

