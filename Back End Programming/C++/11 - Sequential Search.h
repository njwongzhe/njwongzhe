#ifndef SEQUENTIALSEARCH_H 
#define SEQUENTIALSEARCH_H

int sequenceSearch(int searchKey, int arr[], int arrSize ) {
    int index = -1; // -1 means record is not found.
    for ( int p = 0; p < arrSize; p++ ) {
        if (searchKey == arr[p]) {
            index = p; // Assign current array index.
            break; 
        }
    } 
    return index; // Return location of value.
}

#endif