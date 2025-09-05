#include <iostream>
using namespace std;

enum Day
{
	Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
} 
testDay1, testDay2;

int main ()
{
	cout << Sunday << Monday << Tuesday << Wednesday << Thursday << Friday << Saturday << endl;
	// Output will be 0123456.
	
	Day testDay3;
	
	testDay1 = Tuesday;
	testDay2 = static_cast <Day> (2);          // testDay2 = 2;          (Error)
	testDay3 = static_cast <Day> (Monday + 1); // testDay2 = Monday + 1; (Error)
	
	cout << testDay1 << endl; // Output will be 2.
	cout << testDay2 << endl; // Output will be 2.
	cout << testDay3;         // Output will be 2.
	
	return 0;
}
