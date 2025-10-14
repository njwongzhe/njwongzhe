#include <iostream>
using namespace std;

int main ()
{
	int length, width, area;
	
	cout << "This program calculates the area of a ";
	cout << "rectangle.\n\n";
	/* 
	   At this part also can present as
	      cout << "This program calculates the area of a ";
	      cout << "rectangle." << endl << endl;
	      
	   Also, you can make it as
	      cout << "This program calculates the area of a rectangle.\n\n";
	   or
	      cout << "This program calculates the area of a rectangle." << "\n\n";
	   or
	      cout << "This program calculates the area of a rectangle." << endl << endl;
	*/
	
	cout << "What is the length of the rectangle?" << endl;
	cin >> length;
	cout << endl;
	
	cout << "What is the width of the rectangle?" << endl;
	cin >> width;
	cout << endl;
	
	area = length * width;
	cout << "The area of the rectangle is " << area;
	
	return 0;
}
