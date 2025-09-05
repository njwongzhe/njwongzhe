#include <iostream>
using namespace std;

void defArgument (int = 0, int = 1);

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

void defArgument (int num1, int num2)
{
	cout << num1 << " " << num2 << endl;
}
