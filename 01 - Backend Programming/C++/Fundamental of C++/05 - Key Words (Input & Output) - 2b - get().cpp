#include <iostream>
using namespace std;

int main ()
{
	char name1, name2[20];
	
	cin.get(name1); 
	cout << name1 << endl;
	// If input 'A', output will be 'A'.
	
	cin.get();
	
	cin.get(name2, 20);
	cout << name2 << endl;
	// If input 'zhang san', output will be 'zhang san'.	

    return 0;
}
