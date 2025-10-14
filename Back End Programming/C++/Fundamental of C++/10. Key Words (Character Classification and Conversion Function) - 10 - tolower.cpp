#include <iostream>
#include <cctype>
using namespace std;

int main ()
{
	char a = 'A'         , b = 'a'         , c = '!';
	char d = tolower(a)  , e = tolower(b)  , f = tolower(c);
	char g = tolower('A'), h = tolower('a'), i = tolower('!');
	
	cout << tolower(a) << endl; // Output will be '97' which is 'a'.
	cout << tolower(b) << endl; // Output will be '97' which is 'a'.
	cout << tolower(c) << endl; // Output will be '33' which is '!'.
	
	cout << d << endl; // Output will be 'a'.
	cout << e << endl; // Output will be 'a'.
	cout << f << endl; // Output will be '!'.
	
	cout << g << endl; // Output will be 'a'.
	cout << h << endl; // Output will be 'a'.
	cout << i;         // Output will be '!'.
	
	return 0;
}
