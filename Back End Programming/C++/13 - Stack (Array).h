#ifndef STACKARRAY_H 
#define STACKARRAY_H

const int SIZE = 100;

class Stack {
    private: 
        int top;         // Index of Top Element in Stack
        char data[SIZE]; // Stack Container

    public: 
        void createStack() {
            top = -1;
        };

        bool isFull() {
            return (top == SIZE - 1);
        };

        bool isEmpty() {
            return (top == -1);
        };

        // Add New Item To Stack
        void push(char newItem) { 
            if(isFull()) 
                cout << "Sorry, stack is full." << endl << endl;

            else {
                top = top + 1;
                data[top] = newItem;
            }
        };

        // Remove Item From Stack
        void pop() {
            if(isEmpty()) 
                cout << "Sorry, stack is empty." << endl << endl;
                
            else {
                cout << "Popped Value: " << data[top] << endl << endl;
                top = top - 1;
            }
        };

        char stackTop() {
            if(isEmpty()) 
                cout << "Sorry, stack is empty." << endl << endl;
            else
                return data[top];
        };
};

#endif