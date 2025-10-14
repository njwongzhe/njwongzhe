#include <iostream>
#include <string>
using namespace std;

struct Student
{
	char Name[30], Code[10];
	string CourseName;
	double CourseFee;
};

int main ()
{
	int numStudent;
	
	cout << "numStudent = ";
	cin >> numStudent; 
	cout << endl;
	
	// Array of Structure Declaration
	Student student[numStudent]; 
	
	// Accessing Array of Structure
	for (int i = 0; i < numStudent; i += 1)
	{
		cout << "Student " << i + 1 << endl;
		cout << "------------"      << endl;
		cout << "Name = "      ; cin >> student[i].Name; 
		cout << "Code = "      ; cin >> student[i].Code; 
		cin.ignore(100, '\n')  ; 
		cout << "CourseName = "; getline(cin, (student[i].CourseName));
		cout << "CourseFee = " ; cin >> student[i].CourseFee; 
		cout << endl;
	}
	
	// Accessing Array of Structure
	for (int i = 0; i < numStudent; i += 1)
	{
		cout << "Student " << i + 1 << "   ";
		cout << student[i].Name       << " ";  
		cout << student[i].Code       << " ";  
		cout << student[i].CourseName << " ";
		cout << student[i].CourseFee  << " "; 
		cout << endl;
	}
	
	return 0;
}
