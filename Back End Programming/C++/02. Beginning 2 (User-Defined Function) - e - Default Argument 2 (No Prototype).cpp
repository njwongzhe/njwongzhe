#include <iostream>
using namespace std;

void defArgument (int num1 = 0, int num2 = 1)
{
	cout << num1 << " " << num2 << endl;
}

int main ()
{	
	defArgument(); 
	// Output will be '0 1'.
	
	defArgument(5);
	// Output will be '5 1'.
	
	defArgument(5, 10);
	// Output will be '5,10'.
	
	return 0;
} 
