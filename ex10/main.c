/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int assembly(char* number, long long int* base);

int main(void)
{
	char number[] = "145";
	long long int result, base = 10;

	result = assembly(number, &base);
	printf("%lld \n", result);
    return 0;
}
