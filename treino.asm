.data
	msg: .asciiz "entre com o primeiro numero: "
	msg1: .asciiz "entre com o segundo numero: "
	resul: .asciiz "o maior numero eh: " 
.text
   li $v0, 4
   la  $a0, msg
   syscall
   
   li $v0, 5
   syscall
   add $t0, $v0, $zero
   
   li $v0, 4
   la  $a0, msg1
   syscall
   
   li $v0, 5
   syscall
   add $t1, $v0, $zero
   
   li $v0, 4
   la $a0, resul
   syscall
   
  bge $t0,$t1, se
  j senao 
   
   
se:
   
   li $v0, 1
   add $a0, $zero, $t0 
   syscall
   j fimse

senao:
   
   li $v0, 1
   add $a0, $zero, $t1 
   syscall
   
 fimse:
 
 

