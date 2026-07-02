#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main ()
{
	fstream outfile ("outfile.txt", ios::out); // Open file outfile which is "outfile.txt" at Declaration.
	                                           // Set the mode as output mode. (ios::out)
	string A;   
	
	A = "abcdefg";
	outfile << A;  // Send data to file outfile which is "outfile.txt" from variable A.
	
	cout << "Your file is done!";
	
	outfile.close(); // Close file outfile.
	
	return 0;
}
