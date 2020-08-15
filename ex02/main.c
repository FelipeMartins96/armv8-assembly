/* main.c simple program to test assembler program */

#include <stdio.h>

extern void assembly(long long int* a, long long int* b, long long int* c, long long int* x);

int main(void)
{
    long long int a, b, c, x;
    while(1){
		printf("a b c x -> ");
		scanf("%lld %lld %lld %lld", &a, &b, &c, &x);

		assembly(&a, &b, &c, &x);

		printf("x = %lld\n", x);
    }

    return 0;
}
