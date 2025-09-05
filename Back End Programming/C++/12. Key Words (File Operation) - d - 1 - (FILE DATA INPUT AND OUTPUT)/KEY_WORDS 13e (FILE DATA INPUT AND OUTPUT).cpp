#include <iostream>
#include <fstream>
using namespace std;

int main ()
{
	fstream outfile("A.txt", ios::out); // Open file outfile which is "A.txt" at Declaration.
	                                    // Set the mode as output mode. (ios::out)
	fstream infile("A.txt", ios::in);   // Open file infile which is "A.txt" at Declaration.
	                                    // Set the mode as input mode. (ios::in)
	string A, B, C;
	
	A = "abcde fg\nhijkl mn";
	outfile << A;    // Send data to file outfile which is "A.txt" from variable A.
	outfile.close(); // Close file outfile to avoid effect the function of infile.
	
	infile >> B;               // Copy data from file infile which is "A.txt" to variable B.
	cout << B << endl << endl; // Output will be 'abcde'.
	infile.close();            // Close file infile first to avoid buffered output data waiting to send to file.
	
	infile.open("A.txt", ios::in); // Open again file infile which is "A.txt".
								   // Set the mode as input mode. (ios::in)
	
	while (getline(infile, C)) // Copy data from file infile which is "A.txt" to variable C.
		cout << C << endl;	   /* Output will be 'abcde fg
												  hijkl mn'.*/
	// Line 24 : The program will fully copy a line of string in the "A.txt" although meet whitespace.
	// Line 25 : The program will go to new line once done copy a line of string in the "A.txt"  everytimes.
	
	infile.close(); // Close file infile.
	
	return 0;
}
