.data
   pedido : .asciiz "Digite o numero que se deseja calcular: " 
   int_a : .double 0
   int_b : .double 1
   valor_medio: .double 0
   erro: .double 0.0000000000001
   divi: .double 2
   int_maior: .double 1
   resul_1: .asciiz "A raiz cubica é "
   resul_2: .asciiz " erro eh menor que  "   
   
     
.text

main: 

   la $a0, pedido   # imprime na tela a mensagem
   li $v0, 4
   syscall
   
   li $v0, 7	# le o numero do usuario
   syscall
   
def_int:
   
    ldc1 $f2, int_a # Adiciona o intervalo a no registrador $f2
    ldc1 $f4, int_b # Adiciona o intervalo b no registrador $f4
    ldc1 $f6, erro # Adiciona o erro associado no registrador $f6
    ldc1 $f10, valor_medio # Adiciona o valor medio no registrador $f8
    ldc1 $f30, divi #numero para media
    ldc1 $f20, int_maior #intervalor maior
    

Loop:
  #/*
  sub.d $f18, $f4, $f2    # faz a diferença do intervalo atual
  abs.d $f18, $f18	# tira o valor absoluto
  
  c.lt.d $f18, $f6	# verifica se o valor absoluto da subtração do intervalo é menor que o erro
  bc1t exit
  #*/
  add.d $f10, $f2, $f4 
  div.d $f10, $f10, $f30   # pegando os intervalos e dividindo por dois e achando o x medio
  j valor_med_maior_zero
  

valor_med_maior_zero:
  mov.d $f28, $f10	# salvando no $f12 o conteudo da media do intervalo
  mul.d $f12, $f28, $f28
  mul.d $f12, $f12, $f28  # eleva ao cubo
  sub.d $f12, $f12, $f0 
  
  c.lt.d $f24 ,$f12	# se o numero elevado ao cubo for menor que 0 ele vai pra multi med 2
  bc1t muti_med2

  j valor_med_menor_zero

muti_med2:
  mov.d $f28, $f2	# salvando no $f2 o conteudo do primeiro intervalo x1
  mul.d $f12, $f28, $f28
  mul.d $f12, $f12, $f28  # eleva ao cubo
  sub.d $f12, $f12, $f0 
  
  c.lt.d $f24 ,$f12	# se o intervalo 1 ao cubo menos o a raiz que o numero da raiz ele vai pra x1 
  bc1t x1
 
  j x2	#caso contrario para x2

 	
valor_med_menor_zero:
  mov.d $f28, $f2	# salvando no $f2 o conteudo do primeiro intervalo x1
  mul.d $f12, $f28, $f28
  mul.d $f12, $f12, $f28  # eleva ao cubo
  sub.d $f12, $f12, $f0 
  
  c.lt.d $f12, $f20	# verifica se o intervalo e o valor calculado é maior que zero
  bc1t x1
 
  j x2
 	 	
  	 	 	 	
x1:
   mov.d $f2, $f10	# movel o x medio para intervalo a
   j Loop
   
x2:
   mov.d $f4, $f10   # movel o x medio para intervalo a
   j Loop
   		
exit:
   mul.d $f24, $f10, $f10
   mul.d $f24, $f24, $f10	# eleva ao cubo o resultado para comparar com o valor da raiz
   sub.d $f24, $f0, $f24  
   
   la $a0, resul_1   # imprime na tela a mensagem
   li $v0, 4
   syscall
   
   li $v0, 3
   mov.d $f12, $f10	
   syscall
   
   la $a0, resul_2   # imprime na tela a mensagem
   li $v0, 4
   syscall
   
   li $v0, 3
   mov.d $f12, $f24	
   syscall
