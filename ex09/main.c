 /* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int assembly(char* string, char* word);

int main(void)
{
	char str[] = "grnrclszemskvbgcluwtgyvieip";
	char word[] = "leg";
	long long int result;

	result = assembly(str, word);
	printf("%lld \n", result);
    return 0;
}
