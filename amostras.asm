.data 
valorMax: .word 0
amostra: .word 0
contador: .word 0
str1: .asciiz "\nInsira o valor Máximo\n"
str2: .asciiz "\nDigite o valor da amostra\n"
str3: .asciiz "\n ####################### \n ATENÇÃO: \n VALOR MÁXIMO ULTRAPASSADO \n ####################### \n"

.text

lw $t0, contador # contador máximo e atual
li $t1, 10


li $v0, 4 # Imprime str1
la $a0, str1
syscall

li $v0, 5 # Inserindo os dados do valor máximo
syscall
sw $v0, valorMax
lw $t7, valorMax

loop: # Loop para as amostras
bge $t0, $t1, end   

li $v0, 4 # Imprime a str2
la $a0, str2
syscall

li $v0, 5 # Ler o valor da amostra
syscall
sw $v0, amostra

lw $t3, amostra

bgt $t3, $t7, warning  # Se ultrapassou o limite, vai ser avisado
j contagem # Incrementando a contagem.

warning:
li $v0, 4
la $a0, str3
syscall
j contagem

contagem:
addi $t0, $t0, 1
j loop


end:

li $v0, 10 # Encerra o programa
syscall
