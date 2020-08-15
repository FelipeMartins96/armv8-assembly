/* main.c simple program to test assembler program */

#include <stdio.h>

extern void assembly(long long int* a, long long int* b, long long int* m);

int main(void)
{
    long long int a = 5;
    long long int b = 4;
    long long int m = 12;

    assembly(&a, &b, &m);

    printf("a = %lld\n", a);
    printf("b = %lld\n", b);
    printf("m = %lld\n", m);

    return 0;
}
