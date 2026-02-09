#include <iostream>
using namespace std;

#include "15 - Tree.h"  

int main() {
    TreeType tree1;
    bool fnd;

    tree1.insertItem('C');
    tree1.insertItem('A');
    tree1.insertItem('E');
    tree1.insertItem('F');
    tree1.printTree();

    tree1.retrieveItem('B', fnd);

    if(fnd) 
        cout<<"Find B"<<endl;
    else 
        cout<<"Cannot Find"<<endl;

    tree1.deleteItem('C');
    cout << "Delete Item" << endl;
    tree1.printTree();
    return 0;
}