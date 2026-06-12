#ifndef STACKLINKLIST_H 
#define STACKLINKLIST_H

class Node {
    public:
        int data;
        Node *next;
};

class Stack {
    private: 
        Node *top;

    public: 
        void createStack() {
            top = NULL;
        };

        bool isEmpty() {
            return (top == NULL);
        };

        // Add New Item To Stack
        void push(int newItem) { 
            Node *newNode;
            newNode = new Node();

            if(newNode == NULL) 
                cout << "Cannot allocate memory." << endl << endl;

            else {
                newNode->data = newItem;
                newNode->next = top;
                top = newNode;
            }
        };

        // Remove Item From Stack
        void pop() {
            Node *delNode;

            if(isEmpty()) 
                cout << "Sorry, stack is empty." << endl << endl;
                
            else {
                delNode = top;
                cout << "Popped Value: " << top->data << endl << endl;
                top = delNode->next;
                delete delNode;
            }
        };

        int stackTop() {
            if(isEmpty()) {
                cout << "Sorry, stack is empty." << endl << endl;
                return 0;
            }
            else
                return top->data;
        };
};

#endif