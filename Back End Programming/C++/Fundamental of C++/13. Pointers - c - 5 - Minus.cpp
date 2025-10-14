#include <iostream>
using namespace std;

int main ()
{
	short int D[] = {0, 1, 2}, *ptrD = D;
	
	cout << ptrD - &ptrD[1] << endl; // Output will be '-1'. 
	cout << ptrD - &ptrD[2] << endl; // Output will be '-2'.
	
	cout << &ptrD[2] - &ptrD[1] << endl; // Output will be '1'.
	cout << &ptrD[2] - ptrD;             // Output will be '2'.
	
	/* 
		0x001 0x002 0x003 0x004 0x005 0x006
		| 2 Bytes | | 2 Bytes | | 2 Bytes |
		|   D[0]  | |   D[1]  | |   D[2]  |
		
		ptrD - &ptrD[1] == -1 
		(-) because ptrD has lower order in array. 
		'1' because space between both pointer is one(1) 2 bytes. 
		
		ptrD - &ptrD[2] == -2
		(-) because ptrD has lower order in array. 
		'2' because space between both pointer is two(2) 2 bytes. 
		
		&ptrD[2] - &ptrD[1] == 1
		(+) because &ptrD[2] has higher order in array. 
		'1' because space between both pointer is one(1) 2 bytes.  
		
		&ptrD[2] - ptrD == 2
		(+) because &ptrD[2] has higher order in array. 
		'1' because space between both pointer is two(2) 2 bytes. 
	*/					  
	
	return 0;
}
