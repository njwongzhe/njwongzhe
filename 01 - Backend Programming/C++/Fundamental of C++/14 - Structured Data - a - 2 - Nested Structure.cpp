#include <iostream>
#include <string>
using namespace std;

struct PersonInfo
{
	string name, birthday;
};

// Nested Structure
struct StudentInfo
{
	string StudentID;
	PersonInfo PInfo;
	double cgpa;
};

int main ()
{
	// struct Variable Declaration & Initializing Structure
	StudentInfo info1 = {"A24CS1234", "Ali", "2005/1/1", 3.58};
	// OR StudentInfo info1 = {"A24CS1234", {"Ali", "2005/1/1"}, 3.58};
	
	// Accessing Structure Members
	cout << info1.StudentID << endl;
	cout << info1.PInfo.name << endl;
	cout << info1.PInfo.birthday << endl;
	cout << info1.cgpa << endl;
	
	return 0;
}
