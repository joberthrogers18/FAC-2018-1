# logica bit a bit

.data

.text
main: 
 
 
  li $t7,0x80000000
  ori $t1, $zero, 0x01
  move $t2, $t1
Loop:
  and $t6, $t2, $t7
  beq $t6,$t7, fim
  sll $t2, $t2, 1
  or $t1, $t1, $t2
  j Loop
 
fim: