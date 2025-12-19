#ifndef QUEUELINKLISTCIRCULAR_H
#define QUEUELINKLISTCIRCULAR_H

struct Node {
    int data;
    Node *next;
};

class Queue {
    private:
        Node *rear;

    public:
        Queue() {
            rear = NULL;
        }

        ~Queue() {
            while (!isEmpty())
                dequeue();
        }

        bool isEmpty() {
            return (rear == NULL);
        }

        void enqueue(int value) {
            Node *newNode = new Node;
            newNode->data = value;

            if (isEmpty()) {
                rear = newNode;
                rear->next = rear;
            } 
            else {
                newNode->next = rear->next;
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

            Node *front = rear->next;

            if (front == rear) {
                cout << front->data << " dequeued successfully." << endl;
                delete front;
                rear = NULL;
            } 
            else {
                cout << front->data << " dequeued successfully." << endl;
                rear->next = front->next;
                delete front;
            }
        }

        void getFront() {
            if (isEmpty())
                cout << "Queue is empty." << endl;
            else
                cout << "Front element: " << rear->next->data << endl;
        }

        void display() {
            if (isEmpty()) {
                cout << "Queue is empty." << endl;
                return;
            }

            Node *temp = rear->next;
            cout << "Queue elements: ";

            do {
                cout << temp->data << " ";
                temp = temp->next;
            } while (temp != rear->next);

            cout << endl;
        }
};

#endif