#include <iostream>
using namespace std;

void test (int [], int);
void testREF (int [], int);

int main ()
{
	const int size = 5;
	int a[size] = {1, 2, 3, 4, 5};
	
	test (a, size); // Outputbwill be '1, 2, 3, 4, 5'.
	
	testREF (a, size); cout << endl;
	test (a, size); // Output will be '1, 1, 1, 1, 1'.
	
	return 0;
}

void test (int aF[], int sizeF)
{
	for (int i = 0; i < sizeF; i += 1)
		cout << aF[i] << " ";
}

void testREF (int aF[], int sizeF)
{
	for (int i = 0; i < sizeF; i += 1)
		aF[i] = 1;
}
