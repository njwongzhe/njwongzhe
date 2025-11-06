#ifndef BUBBLESORT_H 
#define BUBBLESORT_H

void bubbleSort(int arr[], int arrSize) {
    cout << "Origin - "; arrOutput(arr);

    for(int pass = 1; pass < arrSize; pass++) {
        for(int i = 0; i < arrSize - pass; i++) {
            if(arr[i] > arr[i + 1]) { // Change to (arr[i] < arr[i + 1]) if descending.
                int temp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = temp;

                arrOutput(arr); // Output to show change.
            }
        }
    }

    cout << "Result - "; arrOutput(arr);
}

void bubbleSortAdvanced(int arr[], int arrSize) {
    cout << "Origin - "; arrOutput(arr);

    bool sorted = false;
    for(int pass = 1; (pass < arrSize) && (!sorted); pass++) {
        sorted = true; // Assume the arr is sorted.
        for(int i = 0; i < arrSize - pass; i++) {
            if(arr[i] > arr[i + 1]) { // Change to (arr[i] < arr[i + 1]) if descending.
                int temp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = temp;
                sorted = false; // Since the operation entry compare branch. Thus, the arr is unsorted.
                
                arrOutput(arr); // Output to show change.
            }
        }
    }

    cout << "Result - "; arrOutput(arr);
}

#endif