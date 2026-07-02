#include <iostream>
#include <string>
using namespace std;

void testbuffer_cin_getline ()
{
	string name1, name2, name3, name4;
	
	cin >> name1;          // If input 'zhang san',
	cout << name1 << endl; // output will be 'zhang'.
	
	cin >> name2;          // This statement will not executed because it receive ' san' which as the buffer.
	cout << name2 << endl; // Output will be 'san'.
	
	cin >> name3;          // If input 'zhang san',
	cout << name3 << endl; // output will be 'zhang'.
	
	getline(cin, name4);   // This statement will not executed because it receive ' san' which as the buffer.
	cout << name4 << endl; // Output will be ' san'.
}

void testbuffer_getline_get ()
{
	char str1[10], str2[10];
	
	cin.getline(str1, 10); // If input '1 2'.
	cin.get(str2, 10);     // If input '3 4'.
	cout << str1 << endl;  // Output will be '1 2'.
	cout << str2 << endl;  // Output will be '3 4'.
}

void testbuffer_get_getline ()
{
	char str1[10], str2[10];
	
	cin.get(str1, 10);     // If input '1 2'.
	cin.getline(str2, 10); // This statement will not executed because it receive '\n' which as the buffer.
	cout << str1 << endl;  // Output will be '1 2'.
	cout << str2 << endl;  // No output.
}

void removebuffer_get ()
{
	char str1[10], str2[10];
	
	cin.get(str1, 10);     // If input '1 2'.
	cin.get();			   // This statement will not executed because it receive '\n' which as the buffer.
	cin.getline(str2, 10); // If input '3 4'.
	cout << str1 << endl;  // Output will be '1 2'.
	cout << str2 << endl;  // Output will be '3 4'.
}

void removebuffer_ignore ()
{
	char str1[10], str2[10];
	string name1, name2;
	
	cin.get(str1, 10);     // If input '1 2'.
	cin.ignore(10, '\n');  // This statement will receive '\n' which as the buffer. 
	                       // It will ignore 10 character and stop early if meet '\n'.
	cin.getline(str2, 10); // If input '3 4'.
	cout << str1 << endl;  // Output will be '1 2'.
	cout << str2 << endl;  // Output will be '3 4'.
	
	cin >> name1;          // If input 'zhang san'.
	cout << name1 << endl; // Output will be 'zhang'.
	cin.ignore(10, '\n');  // This statement will receive ' san' which as the buffer. 
						   // It will ignore 10 character and stop early if meet '\n'.
	getline(cin, name2);   // If input 'zhang san'.
	cout << name2 << endl; // Output will be 'zhang san'.
}

void exceedsize_cingetline ()
{
	char name1[20], name2[20];
	
	cin.getline(name1, 5);
	cout << name1 << endl; // If input 'zhang san', output will be 'zhan'.
	
	cin.getline(name2, 10); // Error happen and this statement will not executed.
	cout << name2 << endl;
}

void solve_exceedsize_cingetline1()
{
	char name1[20], name2[20];
	
	cin.getline(name1, 5);
	cout << name1 << endl; // If input 'zhang san', output will be 'zhan'.

	cin.clear(); // Clear the error.	

	cin.getline(name2, 10); // This statement will not executed because it receive 'g san' which as the buffer.
	cout << name2 << endl;
}

void solve_exceedsize_cingetline2()
{
	char name1[20], name2[20];
	
	cin.getline(name1, 5);
	cout << name1 << endl; // If input 'zhang san', output will be 'zhan'.

	cin.clear();          // Clear the error.
	cin.ignore(10, '\n'); // This statement will receive 'g san' which as the buffer. 
						  // It will ignore 10 character and stop early if meet '\n'.

	cin.getline(name2, 10); // If input 'zhang san', output will be 'zhang san'.
	cout << name2 << endl;
}

void solve_exceedsize_cingetline3()
{
	char name1[20], name2[20];
	
	cin.getline(name1, 5);
	cout << name1 << endl; // If input 'zhang san', output will be 'zhan'.

	if (cin.fail())
	{
		cin.clear();          // Clear the error.
		cin.ignore(10, '\n'); // This statement will receive 'g san' which as the buffer. 
					          // It will ignore 10 character and stop early if meet '\n'.
	}
	
	cin.getline(name2, 10); // If input 'zhang san', output will be 'zhang san'.
	cout << name2 << endl;
}

int main ()
{
	return 0;
}
