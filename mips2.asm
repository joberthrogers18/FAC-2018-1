.data
    endereço_de_X: .word 2, 4, 1, 6, 7, 9, 1, 3
    
    
.text
    add $s1 , $zero , $zero  
    add $s2 , $zero , $zero  
Loop: 
    slt $t0, $s1, $s3  
    beq $t0, $zero, Exit  

    la $t1, endereco_de_X       # Pegar o endereço de X e passar para $t1
    add $t2, $t1, $s1           # Somar com i resultando no endereço de X[i]
    lw $t3, 0($t2)              # Pegar da memória $t3 = X[i]
    add $s2, $s2, $t3           # Somar $t3 no total $s2

    addi $s1, $s1, 1  
    j Loop
Exit:
