#include <iostream>
using namespace std;

#include "14 - Queue (Array - Linear).h"
#include "14 - Queue (Array - Circular).h"

int main() {
    Queue test;

    test.enQueue('A');
    test.enQueue('B');
    test.enQueue('C');
    cout << test.getFront() << endl;
    cout << test.getBack() << endl << endl;

    cout << test.deQueue() << endl;
    cout << test.deQueue() << endl;
    cout << test.deQueue() << endl;
    cout << test.deQueue();

    CircularQueue test2;

    test2.enQueue('A');
    test2.enQueue('B');
    test2.enQueue('C');
    cout << test2.getFront() << endl;
    cout << test2.getBack() << endl << endl;

    cout << test2.deQueue() << endl;
    cout << test2.deQueue() << endl;
    cout << test2.deQueue() << endl;
    cout << test2.deQueue();

    return 0;
}