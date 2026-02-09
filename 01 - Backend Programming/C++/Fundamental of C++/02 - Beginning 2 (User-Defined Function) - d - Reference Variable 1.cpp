#include <iostream>
using namespace std;

int main ()
{
	int a = 1;
	int &b = a, &c = a; // b become the reference variable to a,
	
	cout << a << endl; // Output will be '1'. 
	cout << b << endl; // Output will be '1'.
	cout << c << endl; // Output will be '1'.
	 
	b = 2;             // Edit the reference variable b.
	cout << a << endl; // Output will be '2'. The change of the &b reflect to the a also.
	cout << b << endl; // Output will be '2'. 
	cout << c << endl; // Output will be '2'. The change of the a reflect to the &c also.
	
	a = 3;             // Edit the variable a.
	cout << a << endl; // Output will be '3'. 
	cout << b << endl; // Output will be '3'. The change of the a reflect to the &b also.
	cout << c;         // Output will be '3'. The change of the a reflect to the &c also.
	
	return 0;
} 
