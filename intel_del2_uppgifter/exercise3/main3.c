#include <stdio.h>
int readInt(char* str);

int main()
{
    char str [12];
    int res;
    printf("Mata in ett tal! Avsluta med #!\n");
    fgets(str, 12, stdin);
    res = readInt(str);
    printf("Talet är: %d \n", res);
    return 0;
}