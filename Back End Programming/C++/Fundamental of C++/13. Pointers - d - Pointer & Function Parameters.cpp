#include <iostream>
using namespace std;

void test (int *, int *); // Prototype

int main()
{
	int A = 1, *B = &A,
		C = 2, *D = &C;
	
	test(B, &C); // Call
	
    return 0;
}

void test (int *B, int *D) // Header
{
	cout << B << endl; // Output will be the address of A in hexadecimal.
	cout << D;         // Output will be the address of C in hexadecimal.
}
