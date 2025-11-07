#ifndef SELECTIONSORT_H 
#define SELECTIONSORT_H

void selectionSort(int arr[], int arrSIZE) {
    cout << "Origin - "; arrOutput(arr);

    for(int last = arrSIZE - 1; last >= 1; last--) {
        int largestIndex = 0; // Assume the largest element is first element (index 0). 
        for(int i = 1; i <= last; i++) {
            if(arr[i] > arr[largestIndex]) // Compare each element with element store in "largestIndex" (index).
                largestIndex = i;          // If a element is larger than element store in "largestIndex" (index), replace the "largestIndex" (index).
        }

        // Replace the "last" element with element store in "largestIndex";
        int temp = arr[largestIndex]; 
        arr[largestIndex] = arr[last];
        arr[last] = temp;

        arrOutput(arr); // Output to show change.
    }

    cout << "Result - "; arrOutput(arr);
}

void selectionSortAdvanced(int arr[], int arrSIZE) {
    cout << "Origin - "; arrOutput(arr);

    for(int last = arrSIZE - 1; last >= 1; last--) {
        int largestIndex = 0;
        for(int i = 1; i <= last; i++) {
            if(arr[i] > arr[largestIndex]) 
                largestIndex = i;
        }

        if(largestIndex != last) { // Do not do swaping if index of "largestIndex" and "last" equal. (Largest element in "last".)
            int temp = arr[largestIndex];
            arr[largestIndex] = arr[last];
            arr[last] = temp;

            arrOutput(arr); // Output to show change.
        }
    }

    cout << "Result - "; arrOutput(arr);
}

#endif