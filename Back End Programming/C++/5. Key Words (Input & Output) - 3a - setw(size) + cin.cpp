#include <iostream>
#include <iomanip>
using namespace std;

int main ()
{
	char name [6];
	
	cin >> setw(6) >> name; // If input 'zhangsan'. 
	cout << name;           // Output will be zhang.
	
	return 0;
}
