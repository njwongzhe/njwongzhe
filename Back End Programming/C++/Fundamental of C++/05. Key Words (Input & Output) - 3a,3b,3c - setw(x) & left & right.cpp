#include <iostream>
#include <string>
#include <iomanip>
using namespace std;

int main ()
{
	int num1 = 1     , num2 = 2   , num3 = 3,
	    num4 = 400   , num5 = 5000, num6 = 60000,
	    num7 = 700000, num8 = 8   , num9 = 9000000;
	char letter = 'A';
	string name = "zhangsan";
	
	// Assume ' * ' is space(columns/width).
	
	cout << setw(3) << num1 << endl; // Output is ' **1 '.
	cout << setw(1) << num1 << endl; // Output is ' 1   '.
	cout << setw(1) << num4 << endl; // Output is ' 400 '.
	
	cout << setw(6) << num1 << setw(6) << num2 << setw(6) << num3 << endl;
	cout << setw(6) << num4 << setw(6) << num5 << setw(6) << num6 << endl;
	cout << setw(6) << num7 << setw(6) << num8 << setw(6) << num9 << endl;
	/* Output is ' *****1*****2*****3
	               ***400**5000*60000
	               700000*****89000000 ' */
	               
	cout << setw(10) << "Hello" << setw(10) << name << setw(10) << letter << endl;
	// Output is ' *****Hello**zhangsan*********A '. 
	
	cout << left;
	cout << setw(10) << "Hello" << setw(10) << name << setw(10) << letter << endl;
	// Output is ' Hello*****zhangsan**A********* '.
	
	cout << right;
	cout << setw(10) << "Hello" << setw(10) << name << setw(10) << letter << endl;
	// Output is ' *****Hello**zhangsan*********A '.
       
	return 0;
}
