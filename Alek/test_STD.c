#include <stdio.h>
int maxNum(int *values, int nrOfValues);

int main(){

    int vect[5], res;

    printf("Mata in fem heltal\n");
    scanf("%d", &vect[0]);
    scanf("%d", &vect[1]);
    scanf("%d", &vect[2]);
    scanf("%d", &vect[3]);
    scanf("%d", &vect[4]);
    res = maxNum(vect, 5);

    printf("Talet %d var störst av dem\n", res);
    return 0;
}

