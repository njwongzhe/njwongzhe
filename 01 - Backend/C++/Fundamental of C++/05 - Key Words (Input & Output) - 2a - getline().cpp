#include <iostream>
#include <string>
using namespace std;

int main ()
{
	string name1;
	
	getline(cin, name1);
	cout << name1 << endl;
	// If input 'zhang san', output will be 'zhang san'.
	
	char name2[20];

    cin.getline(name2, 20); 
    cout << name2 << endl; 
	// If input 'zhang san', output will be 'zhang san'. 
	
	cin.getline(name2, 5);
	cout << name2 << endl;
	// If input 'zhang san', output will be 'zhan'. 

	return 0;
}
