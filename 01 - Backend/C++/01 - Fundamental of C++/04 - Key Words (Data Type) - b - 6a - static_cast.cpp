#include <iostream>
using namespace std;

int main ()
{
	char a = 65; int b = 66; double c = 65.5;

    cout << static_cast <char> (a) << endl;
    // Output will be A.
    cout << static_cast <int> (a) << endl;
    // Output will be 65.

    cout << static_cast <char> (b) << endl;
    // Output will be B.
    cout << static_cast <int> (b) << endl;
    // Output will be 66.
    
    cout << static_cast <double> (c) << endl;
    // Output will be 65.5.    
	cout << static_cast <char> (a) << endl;
    // Output will be A.
    cout << static_cast <int> (c) << endl;
    // Output will be 65.
    
    // Output will be 65 
    cout << (int)a << endl;
	cout << int(a) << endl;
	
	// Output will be A
	cout << (char)a << endl;
	cout << char(a) << endl;
	
	return 0;
}
