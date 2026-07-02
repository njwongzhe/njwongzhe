#ifndef QUEUELINKLISTLINEAR_H
#define QUEUELINKLISTLINEAR_H

struct Node {
    int data;
    Node *next;
};

class Queue {
    private:
        Node *front;
        Node *rear;

    public:
        Queue() {
            front = NULL;
            rear = NULL;
        }

        ~Queue() {
            while (!isEmpty())
                dequeue();
        }

        bool isEmpty() {
            return (front == NULL);
        }

        void enqueue(int value) {
            Node* newNode = new Node;
            newNode->data = value;
            newNode->next = NULL;

            if (isEmpty()) {
                front = rear = newNode;
            } 
            else {
                rear->next = newNode;
                rear = newNode;
            }

            cout << value << " enqueued successfully." << endl;
        }

        void dequeue() {
            if (isEmpty()) {
                cout << "Queue is empty. Dequeue failed." << endl;
                return;
            }

            Node* temp = front;
            cout << temp->data << " dequeued successfully." << endl;

            front = front->next;
            delete temp;

            if (front == NULL) {
                rear = NULL;
            }
        }

        void getFront() {
            if (isEmpty())
                cout << "Queue is empty." << endl;
            else
                cout << "Front element: " << front->data << endl;
        }

        void display() {
            if (isEmpty()) {
                cout << "Queue is empty." << endl;
                return;
            }

            Node *temp = front;
            cout << "Queue elements: ";
            while (temp != NULL) {
                cout << temp->data << " ";
                temp = temp->next;
            }
            cout << endl;
        }
};

#endif