#include <iostream>
using namespace std;

int main ()
{
	int a[3] = {1, 2, 30};
	
	for (int i = 0; i < 3; i += 1)
		cout << a[i] << endl; // Output will be '1
		                      //                 2
		                      //                 30'.
	
	char b[9] = "zhangsan";
	
	for (int i = 0; i < 9; i += 1)
		cout << b[i];   // Output will be 'zhangsan'.
		
	// OR
		
	cout << endl << b; // Output will be 'zhangsan'.
	
	return 0;
}
