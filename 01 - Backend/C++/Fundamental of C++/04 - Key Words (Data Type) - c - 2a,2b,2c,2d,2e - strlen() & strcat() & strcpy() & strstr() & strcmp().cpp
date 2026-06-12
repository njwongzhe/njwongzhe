#include <iostream> 
#include <cstring>
using namespace std;

int main ()
{
	char name1[6] = "zhang", name2[4] = "san", name3[20];
	char name4[6] = "abcde", name5[5] = "abcd", name6[4] = "abc",
	     name7[5] = "bcde" , name8[4] = "cde";
	
	cout << strlen(name1) << endl; // Output will be '5'.
	
	strcat(name1, name2);
	cout << name1 << endl; // Output will be 'zhangsan'. 
	
	strcpy(name3, name1);
	cout << name3 << endl; // Output will be 'zhangsan'.
	strcpy(name1, "zhang");
	cout << name1 << endl; // Output will be 'zhang'.

	if (strstr(name2, name1) != NULL);
	else;
	/* If put 'cout << strstr(name2, name1) << endl;',
	   the program will terminate because the result is NULL 
	   and cout at line 27 cannot handle. */
	
	cout << strstr(name4, name4) << endl; // Output will be 'abcde'.
	cout << strstr(name4, name5) << endl; // Output will be 'abcde'.
	cout << strstr(name4, name6) << endl; // Output will be 'abcde'.
	cout << strstr(name4, name7) << endl; // Output will be 'bcde'.
	cout << strstr(name4, name8) << endl; // Output will be 'cde'.
	
	cout << strcmp(name1, name1) << endl; // Output will be '0'.
	cout << strcmp(name1, name2) << endl; // Output will be more than 0.
	cout << strcmp(name2, name1);         // Output will be less than 0.
	
	return 0;
}
