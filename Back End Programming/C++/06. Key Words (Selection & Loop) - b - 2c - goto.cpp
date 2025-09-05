#include <iostream>
using namespace std;

int main ()
{
	int n = 1; // Let n as counter.	
	           // Initialization : counter, n set as 1.
	
	do 
	{
		A : n = n + 1;      // Updating  : Increment of the counter, n.
		
		if (n < 10) goto A; // Goto A (Line 11) if n less than 10.
		
		cout << n << " ";   // Repeated Action.
	} 
	while (n <= 1);         // Condition : Loop while n less or equal than 1. 
	
	// Output will be '11'.

	return 0;
}
