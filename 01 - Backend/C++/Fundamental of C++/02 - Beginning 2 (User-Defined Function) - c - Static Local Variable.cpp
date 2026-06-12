#include <iostream>
using namespace std;

void staticLocal ();
void nonstaticLocal ();

int main ()
{
	int n;
	
	for (n = 1; n <= 5; n = n + 1) staticLocal();
	// Output will be '1 2 3 4 5'.
	
	cout << endl;
	
	for (n = 1; n <= 5; n = n + 1) nonstaticLocal();
	// Output will be '1 1 1 1 1'.
	
	return 0;
} 

void staticLocal ()
{
	static int num = 1; 
	// num always change because the update at line 28 will still retain.
	cout << num << " ";
	
	num = num + 1;	
} 

void nonstaticLocal ()
{
	int num = 1; 
	// num always be 1 because the update at line 37 will not retain.
	cout << num << " ";
	
	num = num + 1;
}
