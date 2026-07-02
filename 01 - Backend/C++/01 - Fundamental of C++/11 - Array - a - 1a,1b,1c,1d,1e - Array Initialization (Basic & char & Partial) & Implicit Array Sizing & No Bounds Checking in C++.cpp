#include <iostream>
#include <string>
using namespace std;

int main ()
{
	int a[3] = {1, 2, 30};
	
	cout << a[0] << endl  // Output will be '1
	     << a[1] << endl  //                 2
	     << a[2] << endl; //                 30'.
	     
	cout << sizeof(a)    << endl  // Output will be '12
	     << sizeof(a[0]) << endl; //                 4'.
	     
	     
	
	char b1[6] = {'z', 'h', 'a', 'n', 'g', '\0'};
	char b2[4] = "san"; // If size is 3 will show error.
	
	cout << b1 << b2 << endl; // Output will be 'zhangsan'.
	cout << b1[5] << endl;    // Output will be ' '.
	cout << b1[6] << endl;    // Output will be ' '.
	cout << b2[4] << endl;    // Output will be ' '.
	cout << b2[5] << endl;    // Output will be ' '.
	     
	     
	     
	int c[3] = {1, 2};                                    .
	
	cout << c[0] << endl  // Output will be '1
	     << c[1] << endl  //                 2
	     << c[2] << endl; //                 0'.
	     
	     
	     
	string d[] = {"zhang", "san"};
	
	cout << d[0] << endl  // Output will be 'zhang
	     << d[1] << endl; //                 san'.
	     
	     
	     
	int e[3] = {1, 2, 30};
	
	e[4] = e[1] + e[2];
	cout << e[0] << endl  // Output will be '1
	     << e[1] << endl  //                 2
	     << e[2] << endl  //                 30
	     << e[3] << endl  //                 0
	     << e[4] << endl; //                 32'.
	     
	return 0;
}                   
