#include <iostream>
using namespace std;

#include "12 - Link List.h"

int main() {
    List test;

    test.insertNode(1);
    test.insertNode(2);
    test.insertNode(3);
    test.displayList();

    if(test.findNode(5) > 0) cout << "5 Found" << endl;
    else                     cout << "5 Not Found" << endl;

    if(test.findNode(3) > 0) cout << "5 Found" << endl;
    else                     cout << "5 Not Found" << endl;

    test.deleteNode(3);
    test.displayList();

    return 0;
}