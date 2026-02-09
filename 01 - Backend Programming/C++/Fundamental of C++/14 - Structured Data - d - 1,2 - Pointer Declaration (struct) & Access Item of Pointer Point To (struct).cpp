#include <iostream>
using namespace std;

struct TestStruct 
{
	int test1;
	char test2;
};

int main ()
{
	TestStruct testData, *ptrtestData = &testData;
	
	(*ptrtestData).test1 = 1;
	(*ptrtestData).test2 = 'A';
	
	cout << ptrtestData          << endl; // Output will be the address of testData in hexadecimal.
	cout << (*ptrtestData).test1 << endl; // Output will be '1'.
	cout << ptrtestData->test2;           // Output will be 'A'.
	
	return 0;
}
