/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int assembly(char* number);

int main(void)
{
	char number[] = "678";
	long long int result;

	result = assembly(number);
	printf("%lld \n", result);
    return 0;
}
