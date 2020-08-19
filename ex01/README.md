## Lista 2 Exercicio 1

1. [0.5] Encontre a menor sequência de instruções LEGv8 que implementa a código abaixo,
onde a, b e m são variáveis inteiras na memória:
    ```
    int a = 5;
    int b = 4;
    int m = 12;
    m = a;
    if ( b == m )
    m = b - a;
    else
    m = a - b;
    ```