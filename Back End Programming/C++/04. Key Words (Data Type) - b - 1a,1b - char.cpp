#include <iostream>
using namespace std;

int main ()
{
	char char1;
	
	char1 = 65; 
	cout << char1 << endl;
	// Output will be A. (Refer to ASCII Table.)
	
	char1 = 'B';
	cout << char1 << endl;
	// Output will be B.

	char char2[9] = "zhangsan"; 
	// System will show error if size less than 9.
	
	cout << char2;
	// Output will be 'zhangsan'.
	
	return 0;
} 
