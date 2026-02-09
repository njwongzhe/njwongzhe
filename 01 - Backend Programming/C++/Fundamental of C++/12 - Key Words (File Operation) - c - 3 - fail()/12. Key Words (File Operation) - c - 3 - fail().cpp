#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main ()
{
	fstream infile;
	int testFail;
	
	infile.open ("infile.txt", ios::in);  
	
	if (infile.fail())
	{
		testFail = infile.fail();
		cout << testFail << endl; // Output will be '1'.
		cout << "ERROR: Cannot open file.";
	}
	
	infile.close();
	
	return 0;
}
