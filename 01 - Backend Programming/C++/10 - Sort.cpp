// Pre ------------------------------------------------------------------------

#include <iostream>
using namespace std;

void arrOutput(int []);
void arrReset(int [], int);

const int SIZE = 5;
int arr1[SIZE] = {5, 2, 1, 4, 3}; // Case 1: Worst Case
int arr2[SIZE] = {1, 2, 3, 4, 5}; // Case 2: Best Case

#include "10 - Bubble Sort.h"
#include "10 - Selection Sort.h"
#include "10 - Insertion Sort.h"
#include "10 - Merge Sort.h"
#include "10 - Quick Sort.h"

// Main -----------------------------------------------------------------------

int main() {
    // cout << "Bubble Sort: " << endl; 
    // bubbleSort(arr1, SIZE); arrReset(arr1, 1); cout << endl;

    // cout << "Bubble Sort Advanced: " << endl; 
    // bubbleSortAdvanced(arr2, SIZE); arrReset(arr2, 2); cout << endl;

    // cout << "Selection Sort: " << endl;
    // selectionSort(arr1, SIZE); arrReset(arr1, 1); cout << endl; 

    // cout << "Selection Sort: " << endl;
    // selectionSortAdvanced(arr1, SIZE); arrReset(arr1, 1); cout << endl; 

    cout << "Insertion Sort: " << endl;
    insertionSort(arr1, SIZE); arrReset(arr1, 1); cout << endl; 

    cout << "Merge Sort: " << endl; 
    cout << "Origin - "; arrOutput(arr1);
    mergeSort(arr1, 0, 4); 
    cout << "Result - "; arrOutput(arr1); 
    arrReset(arr1, 1); cout << endl;

    cout << "Quick Sort: " << endl; 
    cout << "Origin - "; arrOutput(arr1);
    quickSort(arr1, 0, 4); 
    cout << "Result - "; arrOutput(arr1); 
    arrReset(arr1, 1); cout << endl;

    return 0;
}

// Function -------------------------------------------------------------------

void arrOutput(int arrIn[]) {
    for(int i = 0; i < SIZE; i++)
        cout << arrIn[i] << " ";
    cout << endl;
}

void arrReset(int arrIn[], int caseNum) {
    int arrWo[SIZE] = {5, 2, 1, 4, 3};
    int arrBe[SIZE] = {1, 2, 3, 4, 5};

    switch(caseNum) {
        case 1: for(int i = 0; i < SIZE; i++) arrIn[i] = arrWo[i]; break; // Case 1: Worst Case
        case 2: for(int i = 0; i < SIZE; i++) arrIn[i] = arrBe[i]; break; // Case 1: Best Case
    }
}