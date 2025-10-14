#include <iostream>
using namespace std;

int main ()
{
	int Array[4] = {2, 4, 6, 8};
	int *ptrArray = Array;


	cout << *ptrArray << endl; // Output will be '2'.
	cout << endl;
	
	
	cout << *(ptrArray++) << endl; /* Output will be '2'. ptrArray increment from 0 to 1 after operation done.  */
	cout << *ptrArray     << endl; /* Output will be '4'. ptrArray now points at 4. 
								    					  Thus, *ptrArray == ptrArray[1] == 4.                  */
	cout << *(--ptrArray) << endl; /* Output will be '2'. ptrArray decrement from 1 to 0 before operation done. */
	cout << *ptrArray     << endl; /* Output will be '2'. ptrArray now points at 2. 
														  Thus, *ptrArray == ptrArray[0] == 2.                  */
	cout << endl;
	
	
	cout << *(ptrArray + 3) << endl; /* Output will be '8'. ptrArray no change.                  */
	cout << *ptrArray       << endl; /* Output will be '2'. ptrArray now points at 2.
															Thus, *ptrArray == ptrArray[0] == 2. */
	cout << *(ptrArray - 1) << endl; /* Output will be '0'. ptrArray no change.                  */
	cout << *ptrArray       << endl; /* Output will be '2'. ptrArray now points at 2. 
															Thus, *ptrArray == ptrArray[0] == 2. */
	cout << endl;
	
	
	cout << *(ptrArray += 3) << endl; /* Output will be '8'. ptrArray change from 0 to 3.         */
	cout << *ptrArray        << endl; /* Output will be '8'. ptrArray now points at 8. 
															 Thus, *ptrArray == ptrArray[3] == 8. */
	cout << *(ptrArray -= 1) << endl; /* Output will be '6'. ptrArray change from 3 to 2.         */
	cout << *ptrArray        << endl; /* Output will be '6'. ptrArray now points at 6. 
															 Thus, *ptrArray == ptrArray[2] == 6. */
	
	return 0;
}
