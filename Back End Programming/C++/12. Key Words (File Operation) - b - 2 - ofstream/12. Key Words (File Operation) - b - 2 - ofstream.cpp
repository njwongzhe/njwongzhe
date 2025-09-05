#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main ()
{
	ofstream outfile_A, outfile_B; // Variables Declaration.
	string A;
	int B;
	
	outfile_A.open("A.txt"); // Open file outfile_A which is "A.txt".
	outfile_B.open("B.txt"); // Open file outfile_B which is "B.txt".
	
	A = "abcdefg";
	outfile_A << A;    // Send data to file outfile_A which is "A.txt" from variable A.

    B = 123456789;
	outfile_B << B;    // Send data to file outfile_B which is "B.txt" from variable B.
	
	cout << "Your file is done!";
	
	outfile_A.close(); // Close file outfile_A.
	outfile_B.close(); // Close file outfile_B.
	
	return 0;
}
