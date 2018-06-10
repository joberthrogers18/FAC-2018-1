Variaveis: 
.data
num: .word 0x55555555
.text

 __start:

lw $s1, num 

sll $s2, $s1 1