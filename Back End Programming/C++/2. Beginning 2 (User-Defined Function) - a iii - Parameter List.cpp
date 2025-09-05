#include <iostream>
using namespace std;

int num (int num1, int num2) // Formal Parameter (Formal Argument)
{
	return num1 + num2;
}

int main ()	
{
	int num1, num2, a, b;
	
	// Call Function num.
	a = num (1, 2); // Actual Parameter (Actual Argument)
	                // num1 = 1 and num2 = 2.
	cout << a << endl;    
	
	/* or */
	
	num1 = 1; num2 = 2;
	// Call Function num.
	b = num (num1, num2); // Actual Parameter (Actual Argument)
	cout << b;
	
	// Both output will be 3.
	
	return 0;
}
