.data
str1: .asciiz "Bem-Vindo a Calculadora Assembly.\n01-Soma\n02-Subtracao\n03-Multiplicacao\n04-Divisao(INTEIROS)\n05-Sair\n"
str2: .asciiz "Digite o primeiro valor\n"
str3: .asciiz "Digite o segundo valor\n"
strContinue: .asciiz "\nDigite 1 para continuar\n"
numContinue : .word 0
startOperation: .word 0
menu_option: .word 0 
num1: .word 0
num2: .word 0

.text
inicio:
    li $v0, 4 
    la $a0, str1 
    syscall 

    li $v0, 5  
    syscall
    sw $v0, menu_option  

    lw $t0, menu_option

    li $t1, 1
    beq $t0, $t1, soma

    li $t1, 2
    beq $t0, $t1, subtracao

    li $t1, 3
    beq $t0, $t1, multiplicacao

    li $t1, 4
    beq $t0, $t1, divisao

    li $t1, 5
    beq $t0, $t1, sair

    j erro

input_numbers:

    li $v0, 4
    la $a0, str2
    syscall

    li $v0, 5
    syscall
    move $t0, $v0  

    li $v0, 4
    la $a0, str3
    syscall

    li $v0, 5
    syscall
    move $t1, $v0 

    jr $ra  

soma:
    jal input_numbers  
    
    add $t2, $t1, $t0
    move $a0, $t2
    li $v0, 1
    syscall
    
    li $v0, 4
    la $a0, strContinue
    syscall
    
    li $v0, 5
    syscall
    sw $v0, numContinue
    lw $t1, numContinue
    
    li $t0, 1
    beq $t1, $t0, soma
    
    j inicio

subtracao:
    jal input_numbers  
    
    sub $t2, $t0, $t1
    move $a0, $t2
    li $v0, 1
    syscall
    
    li $v0, 4
    la $a0, strContinue
    syscall
    
    li $v0, 5
    syscall
    sw $v0, numContinue
    lw $t1, numContinue
    
    li $t0, 1
    beq $t1, $t0, subtracao
    
    j inicio

multiplicacao:
    jal input_numbers 
    
    mul $t2, $t0, $t1
    move $a0, $t2
    li $v0, 1
    syscall
    
    li $v0, 4
    la $a0, strContinue
    syscall
    
    li $v0, 5
    syscall
    sw $v0, numContinue
    lw $t1, numContinue
    
    li $t0, 1
    beq $t1, $t0, multiplicacao
    
    j inicio

divisao:
    jal input_numbers  
    
    div $t0, $t1 
    mflo $t2      
    move $a0, $t2
    li $v0, 1
    syscall
    
    li $v0, 4
    la $a0, strContinue
    syscall
    
    li $v0, 5
    syscall
    sw $v0, numContinue
    lw $t1, numContinue
    
    li $t0, 1
    beq $t1, $t0, divisao	
    
    j inicio

sair:
    li $v0, 10
    syscall

erro:
    li $v0, 4
    la $a0, erro_msg
    syscall
    j inicio

fim:
    li $v0, 10
    syscall

.data
erro_msg: .asciiz "Opcao invalida.\n"
