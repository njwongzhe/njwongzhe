#include <iostream>
using namespace std;

int main ()
{
	int n = 1; // Let n as counter.	
	           // Initialization : counter, n set as 1.
	
	do 
	{
		n = n + 1;                      // Updating  : Increment of the counter, n.
		/* If use n = n + 1 after cout, the statement below 'continue' will cannot execute forever.
		   Thus, the counter cannot increment since the initial value of the counter is 1 which is
		   odd number at beginning.                                                                  */
		
		if (n % 2 != 0) continue; // Not execute the statement below if n is not Even Number.
		
		cout << n << " ";         // Repeated Action.
	} 
	while (n < 20);               // Condition : Loop while n less than 20. 
	
	// Output will be '2 4 6 8 10 12 14 16 18 20'.

	return 0;
}
