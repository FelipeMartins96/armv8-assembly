 /* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int assembly(char* string, char* word);

int main(void)
{
	char str[] = "aaaaa";
	char word[] = "aa";
	long long int result;

	result = assembly(str, word);

	printf("%lld \n", result);

    return 0;
}
