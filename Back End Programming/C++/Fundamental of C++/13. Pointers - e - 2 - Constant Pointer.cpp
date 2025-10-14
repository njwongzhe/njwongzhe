#include <iostream>
using namespace std;

int main ()
{
	int a = 1, b = 2;
	
	int * const c = &a;
	// *c = 4; // Valid
	// c = &b; // Error
	
	cout << *c;
	
	return 0;
} 
