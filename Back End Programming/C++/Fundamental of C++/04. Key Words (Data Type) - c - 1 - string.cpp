#include <iostream>
#include <string>
#include <cstring>
using namespace std;

int main ()
{
	string name,
	       name1 = "zhang", name2 = "san";
	
	name = name1 + name2;
	
	cout << name << endl;           // Output will be 'zhangsan'.
	cout << name2 << name1 << endl; // Output will be 'sanzhang'.
	
	cout << strlen(name) << endl; // Output will be 8.
	cout << strcat(name2, name1); // Output will be 'sanzhang'. 
	
	return 0;
}
