#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main ()
{
	fstream infile, outfile; // Variables Declaration.
	string A, B;
	
	outfile.open("outfile.txt", ios::out); // Open file outfile which is "outfile.txt".
	                                       // Set the mode as output mode. (ios::out)
	A = "abcdefg";
	outfile << A; // Send data to file outfile which is "outfile.txt" from variable A.
	
	outfile.close(); // Close file outfile.
	
	infile.open("outfile.txt", ios::in); // Open file infile which is "outfile.txt".
	
	infile >> B; // Copy data from file outfile which is "outfile.txt" to variable .
	cout << B;
	
	outfile.close(); // Close file outfile.
	
	return 0;
}
