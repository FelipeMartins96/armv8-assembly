/* main.c simple program to test assembler program */

#include <stdio.h>

extern void assembly(long long int* a, long long int* b);

int main(void)
{
	long long int a = 0, b = -1;
    assembly(&a, &b);
    return 0;
}
