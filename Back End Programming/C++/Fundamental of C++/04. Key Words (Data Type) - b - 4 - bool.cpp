#include <iostream>
using namespace std;

int main ()
{
	int a = 1, b = 2;
	bool A, B, C;
	
	A = 1 , B = -1, C = 0;
	
	cout << A << endl;
	// Output A is 1 because A is non-zero value.
	cout << B << endl;
	// Output B is 1 because B is non-zero value.
	cout << C << endl << endl;
	// Output C is 0 because C is zero value.
	
	A = a > b;
	B = b > a;
	
	cout << A << endl;
	// Output A will be 0 because a not more than b.
	cout << B;
	// Output B will be 1 bacause b more than a. 
	
	return 0;
}
