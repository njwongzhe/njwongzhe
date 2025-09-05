#include <iostream> 
#include <cstdlib>
using namespace std;

int main ()
{
	char str1[6] = "12345", str2[7] = "123.45",
	     str3[7] = "-12345", str4[8] = "-123.45";
	
	int num1 = atoi(str1), num2 = atoi(str2),
		num3 = atoi(str3), num4 = atoi(str4);
	cout << num1 << endl; // Output will be '12345'.
	cout << num2 << endl; // Output will be '123'.
	cout << num3 << endl; // Output will be '-12345'.
	cout << num4 << endl; // Output will be '-123'.
	
	long int lnum1 = atoi(str1);
	cout << lnum1 << endl; // Output will be '12345'.
	
	double decimal1 = atof(str1), decimal2 = atof(str2),
	       decimal3 = atof(str3), decimal4 = atof(str4);
	cout << decimal1 << endl; // Output will be '12345'.
	cout << decimal2 << endl; // Output will be '123.45'.
	cout << decimal3 << endl; // Output will be '-12345'.
	cout << decimal4 << endl; // Output will be '-123.45'.
	
	char str5[6] = "A123B";
	
	int      num5     = atoi(str5);
	long int lnum2    = atoll(str5);
	double   decimal5 = atof(str5);
	cout << num5 << endl;     // Output will be '0'.
	cout << lnum2 << endl;    // Output will be '0'.
	cout << decimal5 << endl; // Output will be '0'.
	
	char str6[6] = "12.3A";
	
	int      num6     = atoi(str6);
	long int lnum3    = atoll(str6);
	double   decimal6 = atof(str6);
	cout << num6 << endl;  // Output will be '12'.
	cout << lnum3 << endl; // Output will be '12'.
	cout << decimal6;      // Output will be '12.3'.
	
	return 0;
}
