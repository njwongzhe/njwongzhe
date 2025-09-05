#include <iostream>
using namespace std;

int refVariable (int &, int &);

int main ()
{
	int value = 4, sum;
	sum = refVariable(value, value);
	cout << value << endl; // Output will be '6'.
	cout << sum;           // Output will be '12'.
	
	return 0;
} 

int refVariable (int &num1, int &num2) // num1 and num2 become the reference variable to value.
{
	cout << num1 << " " << num2 << endl; // Output will be '4 4'.
	num1 = num1 + 1; // num1, num2 and value become 5.
	num2 = num2 + 1; // num1, num2 and value become 6.
	
	return num1 + num2; // Return 6 + 6 which is 12.
}
