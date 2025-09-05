#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

int main ()
{
	int seed1 = time(0);
	unsigned int seed2 = time(0); 
	// unsigned int can produce larger range of seed compare with int.
	
	cout << rand() << endl; 
	// The random number will always same everytime we execute. 
		
	srand(seed2);
	cout << rand() << " " << rand() << " " << rand() << endl;
	// The random number will always change everytime we ececute.
	
	cout << rand()%10 << endl;  // The random number will be [0,10) or [0,9].
	cout << rand()%100 << endl; // The random number will be [0,100) or [0,99].
	
	cout << rand()%10+0 << endl; // The random number will be [0,10) or [0,9].
	cout << rand()%10+5 << endl; // The random number will be [5,15) or [5,14].
	cout << rand()%10+8 << endl; // The random number will be [8,18) or [8,17].
	cout << rand()%100+50;       // The random number will be [50,150) or [50,149].
	
	return 0;
}
