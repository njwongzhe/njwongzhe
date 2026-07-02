#ifndef QUEUEARRAYCIRCULAR_H
#define QUEUEARRAYCIRCULAR_H

const int SIZECIRCULAR = 100;

class CircularQueue {
    private:
        int front, back, count;
        char item[SIZECIRCULAR];
    
    public:
        // Create Queue
        CircularQueue() {
            front = 0;
            back = SIZECIRCULAR - 1;
            count = 0;
        };

        bool isEmpty() {
            return count == 0;
        };

        bool isFull() {
            return count == SIZECIRCULAR;
        };

        // Insert into Queue
        void enQueue(char insertItem) {
            if(isFull()) 
                cout << "Cannot insert item. Queue is full." << endl << endl;
            
            else {
                back = (back + 1) % SIZECIRCULAR;
                item[back] = insertItem;
                count++;
            }
        };

        // Delete from Queue
        char deQueue() {
            char deletedItem = NULL; // For return purpose if needed.

            if(isEmpty())
                cout << "Cannot remove item. Queue is empty." << endl << endl; 

            else {
                deletedItem = item[front];
                front = (front + 1) % SIZECIRCULAR;
                count--;
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
        ~CircularQueue() {
            // delete [] item;
        }
};

#endif