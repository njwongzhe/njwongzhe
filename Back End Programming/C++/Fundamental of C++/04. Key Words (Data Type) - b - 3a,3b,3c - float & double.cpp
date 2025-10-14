#include <iostream>
using namespace std;

int main ()
{
	float num1 = 0.123456789, num2 = 123.456789;  
	
	cout << num1 << endl; // Output will be 0.123457.
	                      // 6 will be rounded into 7.
	                      
	cout << num2;         // Output will be 123.457.     
	                      // 6 will be rounded into 7.
	                
	return 0;
}
