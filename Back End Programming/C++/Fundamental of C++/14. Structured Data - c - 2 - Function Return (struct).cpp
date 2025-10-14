#include <iostream>
using namespace std;

struct TestStruct 
{
	int test1;
	char test2;
};

TestStruct testFunction (); // Prototype

int main ()
{
	TestStruct testData;
	
	testData = testFunction(); // Calling
	
	cout << testData.test1 << " " << testData.test2;
	// Output will be '1 A'.
	
	return 0;
}

TestStruct testFunction () // Header
{
	TestStruct testData;
	
	testData.test1 = 1;
	testData.test2 = 'A';
	
	return testData;
}
