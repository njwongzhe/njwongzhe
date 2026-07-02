#include <iostream>
using namespace std;

int main ()
{
	// Array name can be used as a pointer constant.
	// Array name is the address of array at 0 (First Element In Array).
	int Array[3] = {1, 2, 3};
	cout << Array     << endl; // Output will be the address of Array[0] in hexadecimal.
	cout << &Array    << endl; // Output will be the address of Array[0] in hexadecimal.
	cout << &Array[0] << endl; // Output will be the address of Array[0] in hexadecimal.
	cout << &Array[1] << endl; // Output will be the address of Array[0] + 4 (int = 4 Byte) in hexadecimal.
	cout << &Array[2] << endl; // Output will be the address of Array[1] + 4 (int = 4 Byte) in hexadecimal.
	cout << *Array    << endl; // Output will be '1'.
	
	// Pointer can be used as a array name.
	int *ptrArray = Array;
	cout << ptrArray    << endl; // Output will be the address of Array[0] in hexadecimal.
	cout << *ptrArray   << endl; // Output will be '1'.
	cout << ptrArray[0] << endl; // Output will be '1'.
	cout << ptrArray[1] << endl; // Output will be '2'.
	cout << ptrArray[2] << endl; // Output will be '3'.
	
	return 0;
}
