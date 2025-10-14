#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main ()
{
	ifstream infile_A, infile_B; // Variables Declaration.
	string A;
	int B;
	
	infile_A.open("A.txt"); // Open file infile_A which is "A.txt".
	infile_B.open("B.txt"); // Open file infile_B which is "B.txt".
	
	infile_A >> A;     // Copy data from file infile_A which is "A.txt" to variable A.
	cout << A << endl; 
	
	infile_B >> B;     // Copy data from file infile_B which is "B.txt" to variable B.
	cout << B;
	
	infile_A.close(); // Close file infile_A.
	infile_B.close(); // Close file infile_B.
	
	return 0;
}
