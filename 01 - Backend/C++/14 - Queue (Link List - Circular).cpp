#include <iostream>
using namespace std;

#include "14 - Queue (Link List - Circular).h"

int main() {
    Queue test;

    test.enqueue(10);
    test.enqueue(20);
    test.enqueue(30);
    test.display();
    cout << endl;

    test.dequeue();
    test.getFront();
    test.display();
    cout << endl;

    return 0;
}

