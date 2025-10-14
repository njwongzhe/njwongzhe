#include <iostream>
using namespace std;

void NonArray ()
{
	int *test = new int;
	
	*test = 1;
	
	cout << *test << endl; // Output will be '1'. 
	
	delete test;
}

void Array ()
{
	int *ptrArray = new int[5];
	
	for (int i = 0; i < 5; i += 1)
	{
		*(ptrArray + i) = i; // OR ptrArray[i] = i 
		cout << ptrArray[i]; // Output will be '01234'.
	}
	
	delete [] ptrArray;		
}

int main ()
{
	NonArray();
	Array();
	
	return 0;
} 
