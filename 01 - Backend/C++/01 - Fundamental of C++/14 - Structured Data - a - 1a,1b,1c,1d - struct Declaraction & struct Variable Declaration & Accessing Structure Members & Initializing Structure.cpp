#include <iostream>
#include <string>
#include <iomanip>
#include <cstring>
using namespace std;

// struct Declaration
struct Student
{
	char Name[30], Code[10];
	string CourseName;
	double CourseFee;
};

int main ()
{
	// struct Variable Declaration & Initializing Structure At Declaration
	Student student1 = {"Ali", "A24CS1234", "Software Engineering", 35000.2};
	
	// Accessing Structure Members
	cout << student1.Name       << endl; // Output will be 'Ali'.
	cout << student1.Name[0]    << endl; // Output will be 'A'.
	cout << student1.Code       << endl; // Output will be 'A24CS1234'.
	cout << student1.CourseName << endl; // Output will be 'Software Engineering'.
	cout << fixed << setprecision(2);    
	cout << student1.CourseFee  << endl; // Output will be '35000.20'. 
	cout << endl;
	
	// struct Variable Declaration
	Student student2;
	
	// Initializing Structure By Member
	strcpy(student2.Name, "Ali");
	strcpy(student2.Code, "A24CS1234");
	student2.CourseName = "Software Engineering";
	student2.CourseFee = 35000.2;
	
	// Accessing Structure Members
	cout << student2.Name       << endl; // Output will be 'Ali'.
	cout << student2.Name[0]    << endl; // Output will be 'A'.
	cout << student1.Code       << endl; // Output will be 'A24CS1234'.
	cout << student2.CourseName << endl; // Output will be 'Software Engineering'.
	cout << student2.CourseFee  << endl; // Output will be '35000.20'. 
	
	return 0;
}
