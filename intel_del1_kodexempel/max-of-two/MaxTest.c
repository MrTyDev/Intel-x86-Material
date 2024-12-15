#include <stdio.h>
extern int Max(int, int);

int main()
{
   int x,y,res;
   printf("Mata in två heltal\n");
   scanf("%d", &x);
   scanf("%d", &y);
   res = Max(x,y);
   printf("Talet %d var störst av dem\n", res);
   return 0;
}

