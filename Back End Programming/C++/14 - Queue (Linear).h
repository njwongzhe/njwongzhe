#ifndef QUEUE_H
#define QUEUE_H

const int SIZE = 100;

class Queue {
    private:
        int front, back;
        char item[SIZE];
    
    public:
        // Create Queue
        Queue() {
            front = 0;
            back = -1;
        };

        bool isEmpty() {
            return (back < front); // (-1 < 0)
        };

        bool isFull() {
            return (back == SIZE - 1);
        };

        // Insert into Queue
        void enQueue(char insertItem) {
            if(isFull()) 
                cout << "Cannot insert item. Queue is full." << endl << endl;
            
            else {
                back++;
                item[back] = insertItem;
            }
        };

        // Delete from Queue
        char deQueue() {
            char deletedItem = NULL; // For return purpose if needed.

            if(isEmpty())
                cout << "Cannot remove item. Queue is empty." << endl << endl; 

            else {
                deletedItem = item[front];
                front++;
            }

            return deletedItem;
        };

        char getFront() {
            return item[front];
        };

        char getBack() {
            return item[back];
        };

        // Destroy Queue
        ~Queue() {
            // delete [] item;
        }
};

#endif