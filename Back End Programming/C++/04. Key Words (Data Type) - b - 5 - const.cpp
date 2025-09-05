#include <iostream>
#include <string>
using namespace std;

int main ()
{
	double r = 5.0, circle;
	const double PI = 3.14159;
	const char NEWLINE = '\n';
	
	circle = 2 * PI * r;
	cout << circle << NEWLINE; 
	cout << PI;
	/* Output will be '31.4159
	                   3.14159' */
	
	return 0;
}
