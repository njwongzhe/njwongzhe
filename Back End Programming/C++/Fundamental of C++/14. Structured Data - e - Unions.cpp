#include <iostream>
using namespace std;

union TestStruct 
{
	int test1;
	char test2;
};

int main ()
{
	TestStruct testData;

	testData.test2 = 'A';
	
	cout << testData.test1 << endl; // Output will be 65. (Refer decimal of A in ASCII)
	cout << testData.test2 << endl; // Output will be 'A'.
	
	testData.test1 = 66;
	
	cout << testData.test1 << endl; // Output will be 66. 
	cout << testData.test2;         // Output will be 'B'. (Refer character of 66 in ASCII)
	
	return 0;
}
