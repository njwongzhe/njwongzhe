#ifndef MERGESORT_H 
#define MERGESORT_H

// first = First Index
// last  = Last Index

void merge(int arr[], int first, int mid, int last) {
    int tempArr[SIZE]; // Store Temporary Array

    int first1 = first; // First Index in Left Half
    int last1  = mid;   // Last Index in Left Half

    int first2 = mid + 1; // First Index in Right Half
    int last2  = last;    // Last Index in Right Half

    int index = first1;

    // Compare Element at Left Half & Right Half
    for(; (first1 <= last1) && (first2 <= last2); index++) {
        if(arr[first1] < arr[first2]) {   // If the 1st element at left half smaller than 1st element at right half.
            tempArr[index] = arr[first1]; // Store the smaller element (1st at left) to tempArr.
            first1++;                     // Move the index of left half to next.
        } 
        else {                            // If the 1st element at left half larger than 1st element at right half.
            tempArr[index] = arr[first2]; // Store the smaller element (1st at Right) to tempArr.
            first2++;                     // Move the index of right half to next.
        }
    }

    // When Left Half or Right Half left 1 Element 
    // (No Element Can Compare With It Since It is Last Element Left)
    for(; first1 <= last1; first1++, index++) tempArr[index] = arr[first1];
    for(; first2 <= last2; first2++, index++) tempArr[index] = arr[first2];

    // Replace Original Array With New Array After Sorted
    for(index = first; index <= last; index++) arr[index] = tempArr[index];
}

void mergeSort(int arr[], int first, int last) {
    if(first < last) {
        int mid = (first + last) / 2;  // Index of Midpoint
        mergeSort(arr, first, mid);    // Left Half
        mergeSort(arr, mid + 1, last); // Right Half
        merge(arr, first, mid, last);
    }
}

#endif