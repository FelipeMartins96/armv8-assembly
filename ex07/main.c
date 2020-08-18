/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int assembly(char* player1, char* player2);

int main(void)
{
	char player1[] = "ARM", player2[] = "RISCV";
	char result;

	result = assembly(player1, player2);
	printf("%c \n", result);
    return 0;
}
