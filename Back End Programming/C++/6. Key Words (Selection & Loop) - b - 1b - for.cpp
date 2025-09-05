#include <iostream>
using namespace std;

int main ()
{
	int n, num; // Let n as counter.
	
	cout << "Number start from 1 until ?" << endl;
	cin >> num;
	
	// Initialization : counter, n set as 1.
	// Condition      : Loop while n less or equal to num.
	// Updating       : Increment of the counter, n.
	for (n = 1; n <= num; n = n + 1) 
	{                                
		cout << n << " "; // Repeated Action.
	}
	
	// if input num = 10, output will be '1 2 3 4 5 6 7 8 9 10'.
	
	return 0; 
}
