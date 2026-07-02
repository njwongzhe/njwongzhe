#include <iostream>
using namespace std;

int main ()
{
	int a = 1, b = 2;
	
	const int *c = &a;
	// *c = 4; // Error
	// c = &b; // Valid
	
	cout << *c;
	
	return 0;
} 
