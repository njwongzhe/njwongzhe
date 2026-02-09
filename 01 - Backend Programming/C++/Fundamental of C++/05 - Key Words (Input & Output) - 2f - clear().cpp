#include <iostream>
using namespace std;

int main ()
{
	int test = 1, n;
	
	while(test >= 0)
	{
		cin >> test;
		cout << test << endl;
		
		if (cin.fail())
		{
			cin.clear();            // Remove error status.
			cin.ignore(1024, '\n'); // Ignore the buffer.
		}
	}	
	
	return 0;
}
