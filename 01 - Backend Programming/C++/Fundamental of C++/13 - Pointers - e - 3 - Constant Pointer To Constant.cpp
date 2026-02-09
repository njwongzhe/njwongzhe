#include <iostream>
using namespace std;

int main ()
{
	int a = 1, b = 2;
	
	const int * const c = &a;
	// *c = 4; // Error
	// c = &b; // Error
	
	cout << *c;
	
	return 0;
} 
