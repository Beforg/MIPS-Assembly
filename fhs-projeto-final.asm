.data
maiorIdade: .word 0   # Variável para armazenar a maior idade
contador: .word 0     # Contador para as entradas
str1: .asciiz "Insira a Idade: "  # String para solicitar a entrada da idade
str2: .asciiz "A Maior Idade é: " # String para exibir o resultado

.text 
main:
# Início do loop
loop:
    lw $t2, contador   # Carregar o contador
    bge $t2, 10, getResult   # Se´o contador >= 10, ele para sai do loop

    # Solicitar entrada
    li $v0, 4       # Syscall para imprimir string
    la $a0, str1             
    syscall

    # Ler entrada do usuário
    li $v0, 5     # Syscall para ler um inteiro
    syscall
    move $t0, $v0     # Armazenar a entrada em $t0 (idade atual)

    # Verificar se é maior idade
    lw $t1, maiorIdade    # Carregar a maior idade atual
    bgt $t0, $t1, newValue   # Se idade atual > maior idade, vai receber o novo valor

    # Incrementar contador
    addi $t2, $t2, 1      # Incrementa contador
    sw $t2, contador        
    j loop          # Retorna ao início do loop

# Insere a nova maior idade
newValue:
    sw $t0, maiorIdade   # Atualiza a maior idade na memória
    addi $t2, $t2, 1
    sw $t2, contador
    j loop     # Retorna ao início do loop

# Exibe o resultado final
getResult:
    li $v0, 4                
    la $a0, str2            
    syscall

    li $v0, 1                
    lw $a0, maiorIdad  # Carregar a maior idade para a exibição
    syscall
    j end  # Pula para encerrar o programa

# Encerra o programa quando acionado
end:
    li $v0, 10 # Syscall para encerrar o programa
    syscall
