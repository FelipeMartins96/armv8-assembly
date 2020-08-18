/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int assembly(char* str);

int main(void)
{
	char str[] = "THEQUICKBROWNFOXJUMPSOVERTHELAZYFOX"; // 11 vowel
	long long int vowelCount;
	vowelCount = assembly(str);
	printf("%lld \n", vowelCount);
    return 0;
}
