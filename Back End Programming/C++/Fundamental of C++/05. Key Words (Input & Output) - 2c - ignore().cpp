#include <iostream>
using namespace std;

int main ()
{
	char letter [20], letter2 [20];
	
	cin.ignore(10, 'A');
	cin.getline(letter, 20); 
	cout << letter << endl;
	// If input 'ABCDEFGHIJKLMN', output will be 'BCDEFGHIJKLMN'.
	
	cin.ignore(10, '\n'); 
	cin.get(letter2, 20);
	cout << letter2;
	// If input 'ABCDEFGHIJKLMN', output will be 'KLMN'.
	
    return 0;
}
