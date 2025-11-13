#ifndef SEQUENTIALSEARCHSORTED_H 
#define SEQUENTIALSEARCHSORTED_H

int sortedSequentialSearch(int searchKey, int arr[], int arrSize ) {
    int index = -1; // -1 means record is not found
    for (int p = 0; p < arrSize; p++ ) {
        if (searchKey < arr[p] )  
            break; // If search value is smaller than first number means the search value not exist in array.
        else if (searchKey == arr[p]) {
            index = p; // Assign current array index.
            break; 
        }
    } 
    return index; // Return location of value.
} 

#endif