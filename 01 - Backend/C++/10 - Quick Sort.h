#ifndef QUICKSORT_H 
#define QUICKSORT_H

int partition(int arr[], int first, int last) {
    int pivot, temp;
    int loop, cutPoint, bottom, top;

    pivot  = arr[first]; // First Element as Pivot
    bottom = first;
    top    = last;
    loop   = 1;          // Set Loop to True

    while(loop) {
        while(arr[top]    > pivot) top--;    // Find smaller value than pivot.
        while(arr[bottom] < pivot) bottom++; // Find larger value than pivot.

        // Change Pivot Place
        if(bottom < top) {
            temp = arr[bottom];
            arr[bottom] = arr[top];
            arr[top] = temp;
        }
        else {
            loop = 0; // Set Loop to False (Stop Loop)
            cutPoint = top;
        }
    }

    return cutPoint;
}

void quickSort(int arr[], int first, int last) {
    int cut;

    if(first < last) {
        cut = partition(arr, first, last);
        quickSort(arr, first, cut);
        quickSort(arr, cut + 1, last);
    }
}

#endif