#include <iostream>
using namespace std;

struct TestStruct 
{
	int test1;
	char test2;
};

void testFunction1 (TestStruct); // Prototype (Pass Entire Struct Variables)
void testFunction2 (int);        // Prototype (Pass Members of Struct Variables)

int main ()
{
	TestStruct testData = {1, 'A'};
	
	testFunction1(testData); // Calling (Pass Entire Struct Variables)        
							 // Output will be '1 A'.
	testFunction2(testData.test1); // Calling (Pass Members of Struct Variables)
								   // Output will be '1'.
	
	return 0;
}

void testFunction1 (TestStruct testData) // Header (Pass Entire Struct Variables)
{
	cout << testData.test1 << " " << testData.test2 << endl;
}

void testFunction2 (int testData) // Header (Pass Members of Struct Variables)
{
	cout << testData << endl;
}
