#include <iostream>
#include <cmath>

using namespace std;
 
void divideTillPossible(int* n, int d){
    /**cout << *n << " " << d << endl;*/
    while (*n % d == 0)
        {
            cout << d << " ";
            *n = *n/d;
        }
}

int main()
{
    int n = 315;

    divideTillPossible(&n,2);
    for (int i = 3; i <= sqrt(n); i = i + 2)
    {
        divideTillPossible(&n,i);
    }

    if (n > 2)
        cout << n << " ";
    return 0;
}