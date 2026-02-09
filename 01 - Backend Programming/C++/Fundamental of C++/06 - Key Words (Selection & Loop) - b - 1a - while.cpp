#include <iostream>
using namespace std;

int main ()
{
	int n = 1, num; // Let n as counter.
	                // Initialization : counter, n set as 1.
	
	cout << "Number start from 1 until ?" << endl;
	cin >> num;
	
	while (n <= num)      // Condition : Loop while n less or equal to num.
	{
		cout << n << " "; // Repeated Action.
		n = n + 1;        // Updating  : Increment of the counter, n.
	}
	
	// if input num = 10, output will be '1 2 3 4 5 6 7 8 9 10'.
	
	return 0; 
}
