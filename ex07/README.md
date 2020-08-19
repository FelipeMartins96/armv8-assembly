## Lista 2 Exercicio 7

7. [1.5] Um estudante de pós-graduação resolveu criar um jogo que desafiasse sua
inteligência, e, para isso, ele resolveu convocar você para ajudá-lo! O jogo, que é em
dupla, começa quando os jogadores 1 e 2 enviam uma palavra (string) cada. Após
enviar, esperam para que sua pontuação seja calculada e assim descobrir quem
ganhou. Caso o jogador 1 ganhe, a saída será "A", por outro lado, caso o jogador 2
ganhe, a saída será "B". No caso de empate, a saída será "E".
A pontuação de cada jogador é calculada baseada na soma dos valores referentes as
letras da tabela abaixo:
    ```
    Letras Valor
    A, E, I, O, U, N, R, S 1
    D, G, T 2
    B, C, M, P 3
    F, H, V, W, Y 4
    K 5
    J, L, X 8
    Q, Z 10

    Exemplo:
    A pontuação da palavra "GOTICO" é 10, pois:
    - 2 pontos para G
    - 1 ponto para O, duas vezes
    - 2 pontos para T
    - 1 ponto para I
    - 3 pontos para C
    Sugestão: Salvar o resultado no registrador x5.
    Obs: O jogo só aceitará letras maiúsculas.
    Obs2: Acentuação será desconsiderada (não serão enviadas palavras com
    acentuação ou cedilha).
    ```