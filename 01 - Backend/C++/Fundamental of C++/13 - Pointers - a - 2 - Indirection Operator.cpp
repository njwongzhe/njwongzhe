#include <iostream>
using namespace std;

int main ()
{
	int A = 1, *ptr = &A; 
	// ptr is a pointer variable which hold the address of A.
	
	cout << &A << endl;   // Output will be the address of A in hexadecimal.
	cout << ptr << endl;  // Output will be the address of A in hexadecimal.
						  // &A == ptr
	cout << *ptr;         // Output will be '1'.
						  // A == *ptr
	
	return 0;
}
