#include <iostream>
using namespace std;

int *test (int *); // Define the function name such as Pointer Variable.

int main ()
{
	int value = 5, *ptr = &value, *ptrAddress;
	 
	ptrAddress = test(ptr);
	
	cout << *ptrAddress << endl;
	cout << ptrAddress;
	
	return 0;
} 

int *test (int *address)
{
	return address; 
	// The function only can return address when the function name define such as Pointer Variable.
	// If not, the system will show error.
}
