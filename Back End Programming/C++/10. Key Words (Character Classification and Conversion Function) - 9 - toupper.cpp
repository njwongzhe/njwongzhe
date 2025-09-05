#include <iostream>
#include <cctype>
using namespace std;

int main ()
{
	char a = 'A'         , b = 'a'         , c = '!';
	char d = toupper(a)  , e = toupper(b)  , f = toupper(c);
	char g = toupper('A'), h = toupper('a'), i = toupper('!');
	
	cout << toupper(a) << endl; // Output will be '65' which is 'A'.
	cout << toupper(b) << endl; // Output will be '65' which is 'A'.
	cout << toupper(c) << endl; // Output will be '33' which is '!'.
	
	cout << d << endl; // Output will be 'A'.
	cout << e << endl; // Output will be 'A'.
	cout << f << endl; // Output will be '!'.
	
	cout << g << endl; // Output will be 'A'.
	cout << h << endl; // Output will be 'A'.
	cout << i;         // Output will be '!'.
	
	return 0;
}
