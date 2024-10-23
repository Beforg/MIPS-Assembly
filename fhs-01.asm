.data
    anoAtual: .word 2024
    anoNascimento01: .word 0
    anoNascimento02: .word 0
    strInput: .asciiz "Digite os dois anos de nascimento (YYYY)\n"
    strPessoa1: .asciiz "A primeira pessoa é mais velha.\n"
    strPessoa2: .asciiz "A segunda pessoa é mais velha.\n"
    strMesmaIdade: .asciiz "Ambas têm a mesma idade.\n"

.text
    # Mostra a mensagem de entrada
    li $v0, 4
    la $a0, strInput
    syscall

    # Recebe o ano de nascimento da primeira pessoa
    li $v0, 5
    syscall
    sw $v0, anoNascimento01

    # Recebe o ano de nascimento da segunda pessoa
    li $v0, 5
    syscall
    sw $v0, anoNascimento02

    # Carrega os anos de nascimento para registradores
    lw $t0, anoNascimento01  # t0 = ano de nascimento 01
    lw $t1, anoNascimento02  # t1 = ano de nascimento 02

    # Compara os anos de nascimento
    bgt $t0, $t1, pessoa2MaisVelha  # Se a ano de nascimento 1 > ano nascimento 2, pessoa 2 é mais velha
    blt $t0, $t1, pessoa1MaisVelha  # Se ano  de nascimento 1 < ano 2, pessoa 1 é mais velha

    # Caso as duas pessoas tenham a mesma idade
    li $v0, 4
    la $a0, strMesmaIdade
    syscall
    j fim

pessoa1MaisVelha:
    li $v0, 4
    la $a0, strPessoa1
    syscall
    j fim

pessoa2MaisVelha:
    li $v0, 4
    la $a0, strPessoa2
    syscall

fim:
    li $v0, 10  # Encerrar o programa
    syscall
