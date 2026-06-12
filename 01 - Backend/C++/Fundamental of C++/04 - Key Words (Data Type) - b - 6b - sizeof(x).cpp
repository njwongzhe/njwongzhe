#include <iostream>
using namespace std;

int main ()
{
	char a[9] = "zhangsan";
	
	cout << sizeof(int) << " bytes" << endl;
	// Output will be '4 bytes'.
	
	cout << sizeof(a) << " bytes";
	// Output will be '9 bytes'.
	
	return 0;
}
