#include <iostream>
using namespace std;

#include "11 - Sequential Search.h"
#include "11 - Binary Search.h"

const int SIZE = 5;

int main() {
    int arr1[SIZE] = {5, 2, 1, 4, 3}; // Case 1: Unsorted List
    int arr2[SIZE] = {1, 2, 3, 4, 5}; // Case 2: Sorted List

    int resultIndex;
    
    resultIndex = sequenceSearch(1, arr1, SIZE);
    cout << "Sequential Search" << endl;
    cout << "Location Index : " << resultIndex << endl;
    cout << "Result         : " << arr1[resultIndex] << endl << endl;

    resultIndex = sequenceSearch(3, arr2, SIZE);
    cout << "Sequential Search (Sorted)" << endl;
    cout << "Location Index : " << resultIndex << endl;
    cout << "Result         : " << arr2[resultIndex] << endl << endl;

    resultIndex = sequenceSearch(0, arr2, SIZE);
    cout << "Sequential Search (Sorted)" << endl;
    cout << "Location Index : " << resultIndex << endl; // Show -1 means not found.
    cout << "Result         : " << arr2[resultIndex] << endl << endl;
}