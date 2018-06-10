.data
	x: .asciiz "X value: "
	y: .asciiz "Y value: "
	resul: .asciiz "the result is: "
.text
	
   	li $v0, 4
   	la, $a0, x
   	syscall
   	
   	li $v0, 5
   	syscall
   	add $8, $zero, $v0
   	
   	li $v0, 4
   	la, $a0, y
   	syscall
   	
   	li $v0, 5
   	syscall
   	add $9, $zero, $v0
   	
   	mul $t3, $t0, 3
   	mul $t4, $t1, 5
   	sub $t5, $t3, $t4
   	
   	li $v0, 4
   	la, $a0, resul
   	syscall
   	
   	li $v0, 1
   	add $a0, $zero $t5
   	syscall
   	
   	