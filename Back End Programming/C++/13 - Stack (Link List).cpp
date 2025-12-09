#include <iostream>
using namespace std;

#include "13 - Stack (Link List).h"

int main() {
    Stack test;

    test.createStack();

    test.push(1);
    test.push(2);
    cout << "Top Value: " << test.stackTop() << endl << endl;

    test.pop(); 
    cout << "Top Value: " << test.stackTop() << endl << endl;

    return 0;
}