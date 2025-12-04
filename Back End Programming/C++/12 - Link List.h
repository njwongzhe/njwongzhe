#ifndef LINKLIST_H 
#define LINKLIST_H

struct Node {
    int data;
    Node *next;
};

class List {
    private:
        Node *head; // Pointer to the 1st node in the list.
        
    public:
        List() {
            head = NULL; // The 1st node is NULL since there is no data in the "Node" yet. 
        };

        Node * insertNode(double x) { // "x" is the data to insert. (Number)
            int currIndex = 0;     // The initial currect index is 0 since the initial current node is 1st node.
            Node *currNode = head; // Set the current node to 1st node. 
            Node *prevNode = NULL; // Set the previous node to NULL since the previous node of the 1st node is nothing. 
            
            while(currNode && (x > currNode->data)) { // While "currNode" is not a NULL && data insert is larger than the data in current node.
                prevNode = currNode;       // Previous node become current node.
                currNode = currNode->next; // Current node become next node.
                currIndex++;               
            }

            Node *newNode = new Node; // Create a new node.
            newNode->data = x;        // Set the data in "Node" to "x".
            
            if(currIndex == 0) {
                newNode->next = head;
                head = newNode;
            }
            else {
                newNode->next = prevNode->next;
                prevNode->next = newNode;
            }

            return newNode;
        };

        int findNode(double x) {
            int currIndex = 1;     
            Node *currNode = head; // Set the current node to 1st node. 
            
            while(currNode && (currNode->data != x)) { // While "currNode" is not a NULL && data find is not equal to the data in current node.
                currNode = currNode->next;
                currIndex++;
            }

            if(currNode) return currIndex; // Found
            else         return 0;         // Not Found
        };

        int deleteNode(double x) {
            int currIndex = 1;
            Node *currNode = head; // Set the current node to 1st node. 
            Node *prevNode = NULL;

            while(currNode && (currNode->data != x)) {
                prevNode = currNode;
                currNode = currNode->next;
                currIndex++;
            }

            if(currNode) {
                if(prevNode) {
                    prevNode->next = currNode->next;
                    delete currNode;
                }
                else {
                    head = currNode->next;
                    delete currNode;
                }
                
                return currIndex;
            }
        };

        void displayList() {
            int num = 0;
            Node *currNode = head; // Set the current node to 1st node. 

            while(currNode != NULL) {
                cout << currNode->data << " ";
                currNode = currNode->next;
                num++;
            }
            
            cout << endl << "Number of Nodes : " << num << endl;
        };

        ~List() {
            Node *currNode = head;
            Node *nextNode = NULL;

            while(currNode != NULL) {
                nextNode = currNode->next;
                delete currNode;
                currNode = nextNode;
            }

            head = NULL;
        }
};

#endif