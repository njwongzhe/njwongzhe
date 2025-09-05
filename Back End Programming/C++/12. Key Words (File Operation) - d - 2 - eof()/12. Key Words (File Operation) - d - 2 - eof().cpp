#include <iostream>
#include <fstream>
using namespace std;

int main ()
{
	fstream infile("A.txt", ios::in);  
	string A;
	int testEnd;
	
	while (!infile.eof())   // Loop while the end of the file (string) copied has not been reached.
	{
		getline(infile, A);
		cout << A << "          ";
		
		testEnd = infile.eof();
		cout << testEnd << endl;  
		
		// Output will be 'abcde fg          0
		// 				   hijkl mn          1'.
	}		  
	
	infile.close();
	
	return 0;
}
