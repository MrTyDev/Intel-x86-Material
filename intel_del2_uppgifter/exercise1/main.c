#include <stdio.h>

int max(int x, int y);

int main()
{
    int x,y,res;
    printf("Mata in två heltal\n");
    scanf("%d", &x);
    scanf("%d", &y);
    res = max(x,y);
    printf("Talet %d var störst av dem\n", res);
    return 0;
}
