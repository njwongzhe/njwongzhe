#include <iostream>
#include <cstdlib> 
using namespace std;

void testexit ();

int main ()
{
	testexit();
	cout << "OK World";
	
	// Output will be 'Hello World'.
	// Line 22 and line 10 will not output because program end at line 21.
	
	return 0;
}

void testexit ()
{
	cout << "Hello World"; // Will generate.
	exit(0);               // Whole program end.
	cout << "Hello World"; // Will not generate.
}
