#include <iostream>
using namespace std;

int main ()
{
	int n = 1; // Let n as counter.	
	           // Initialization : counter, n set as 1.
	
	do 
	{
		if (n > 10) break; // End the loop if n more than 10.
		
		cout << n << " ";  // Repeated Action.
		n = n + 1;         // Updating  : Increment of the counter, n.
	} 
	while (n > 1);         // Condition : Loop while n more than 1. 
	
	// Output will be '1 2 3 4 5 6 7 8 9 10'.

	return 0;
}
