#include <iostream>
using namespace std;

int main ()
{
	int a1[3] = {1, 2, 30}, a2[3];
	
	for (int i = 0; i < 3; i += 1)
		a2[i] = a1[i];
		
	cout << a2[0] << endl  // Output will be '1
	     << a2[1] << endl  //                 2
	     << a2[2] << endl; //                 30'.
	
	char b1[9] = "zhangsan", b2[9];
	
	for (int i = 0; i < 9; i += 1)
		b2[i] = b1[i];
		
	cout << b2; // Output will be 'zhangsan'.
	
	return 0;
}
