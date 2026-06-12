#include <iostream>
#include <iomanip>
using namespace std;

void significant_figures ()
{
	double x = 123;
	
	cout << showpoint << x << endl;       
	cout << setprecision(10) << x << endl; 
}

void floating_point ()
{
	double x = 123;
	
	cout << x << endl;                     
	cout << fixed << x << endl;           
	cout << setprecision(10) << x << endl; 
}

int main ()
{
	significant_figures(); // Output will be '123.000
	                       //                 123.0000000'.
	                       
	floating_point(); // Output will be '123.0000000
	                  //                 123.0000000000
	                  //                 123.0000000000'.
	                  
	significant_figures(); // Output will be '123.0000000000
	                       //                 123.0000000000'.
	
	return 0;
}
