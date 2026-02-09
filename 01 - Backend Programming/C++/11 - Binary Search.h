#ifndef BINARYSEARCH_H 
#define BINARYSEARCH_H

int binarySearch(int searchKey, int arr[], int arrSize) {
    bool found = false;
    int index = -1; // -1 means record not found.
    int MIDDLE,
        LEFT = 0,
        RIGHT = arrSize - 1;
    
    while((LEFT <= RIGHT) && (!found)) {
        MIDDLE = (LEFT + RIGHT) / 2; // Get middle index.
        
        if(arr[MIDDLE] == searchKey) {
            index = MIDDLE;
            found = true;
        }
        else if(arr[MIDDLE] > searchKey) {
            RIGHT = MIDDLE - 1; // Search is focused on the left side of list.
        }
        else {
            LEFT = MIDDLE + 1; // Search is focused on the right side of the list.
        }
    } 
    
    return index;
}

#endif