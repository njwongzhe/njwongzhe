#include <iostream>
using namespace std;

const int COLUMNS = 3;

void testOUTPUT (int [][COLUMNS], int, int);
void testCHANGE (int [][COLUMNS], int, int);

int main ()
{
	const int ROWS = 3;
	int a[ROWS][COLUMNS] = { {1, 2, 3}, 
							 {4, 5, 6}, 
			 			  	 {7, 8, 9} };
			 			  	 
	testOUTPUT (a, ROWS, COLUMNS); // Output will be '1 2 3
	                               //                 4 5 6
	                               //                 7 8 9'.
	                               
	testCHANGE (a, ROWS, COLUMNS); cout << endl;
	testOUTPUT (a, ROWS, COLUMNS); // Output will be '1 1 1
	                               //                 1 1 1
	                               //                 1 1 1'.
	
	return 0;
}

void testOUTPUT (int aF[][COLUMNS], int ROWS, int COLUMNS)
{
	for (int i = 0; i < ROWS; i += 1)
	{
		for (int j = 0; j < COLUMNS; j += 1)
			cout << aF[i][j] << " ";
			
		cout << endl;
	}
}

void testCHANGE (int aF[][COLUMNS], int ROWS, int COLUMNS)
{
	for (int i = 0; i < ROWS; i += 1)
	{
		for (int j = 0; j < COLUMNS; j += 1)
			aF[i][j] = 1;
	}
}