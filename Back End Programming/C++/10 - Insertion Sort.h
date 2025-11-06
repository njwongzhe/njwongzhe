#ifndef INSERTIONSORT_H 
#define INSERTIONSORT_H

void insertionSort(int arr[], int arrSize) {
    cout << "Origin - "; arrOutput(arr);

    int item, insertIndex;
    for(int pass = 1; pass < arrSize; pass++) {
        item = arr[pass]; // Element that ready to join sorted region.
        insertIndex = pass; // Index of element that ready to join sorted region.
        while((insertIndex > 0) && (arr[insertIndex - 1] > item)) {
            arr[insertIndex] = arr[insertIndex - 1];
            insertIndex--;
        }
        arr[insertIndex] = item;
        
        arrOutput(arr); // Output to show change.
    }

    cout << "Result - "; arrOutput(arr);
}

#endif