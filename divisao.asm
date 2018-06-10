.data
	msg1: .asciiz "informe o primeiro numero:"
	msg2: .asciiz  "informe o segundo numero:"
	resul: .asciiz "O resultado eh: "
	
.text

 	li $v0, 4
 	la $a0, msg1
 	syscall
 	
 	li $v0, 5
 	syscall
 	
 	move $t0, $v0
 	
 	li $v0, 4
 	la $a0, msg2
 	syscall
 	
 	li $v0, 5
 	syscall
 	
 	move $t1, $v0
 	
 	div $t0, $t1
 	
 	mflo $s3
 	
 	li $v0, 4
 	la $a0, resul
 	syscall
 	
 	li $v0, 1
 	move $a0, $s3
 	syscall
 	
 
 	 