.data
	comand: .asciiz "o tanto que quer percorrer: "
	msg: .asciiz "o numero na posição: "
	pont: .asciiz "\n"

.text

main:

  li $v0, 4
  la $a0, comand
  syscall
  
  li $v0, 5
  syscall
  add $t1, $v0, $zero

 li $t2,10

  li $t0, 1

Loop:
  
  mul $t4, $t1, $t0
  
  li $v0,4
  la $a0, msg 
  syscall
  
  li $v0,1
  add $a0, $t4, $zero
  syscall
  
  li $v0,4
  la $a0, pont 
  syscall

  bge $t0, $t2, fim
    
  addi $t0, $t0, 1
  j Loop
  
fim:  
  
 