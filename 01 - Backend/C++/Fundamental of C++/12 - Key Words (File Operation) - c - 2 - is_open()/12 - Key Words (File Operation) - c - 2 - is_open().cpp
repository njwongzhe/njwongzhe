#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main ()
{
	fstream outfile;
	int testOpen;
	
	testOpen = outfile.is_open();
	cout << testOpen << endl; // Output will be '0'.
	
	outfile.open ("outfile.txt", ios::out);  
	
	testOpen = outfile.is_open();
	cout << testOpen << endl; // Output will be '1'.
	
	outfile.close();
	
	testOpen = outfile.is_open();
	cout << testOpen; // Output will be '0'.
	
	return 0;
}
