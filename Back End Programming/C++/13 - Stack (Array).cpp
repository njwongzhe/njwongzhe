#include <iostream>
using namespace std;

#include "13 - Stack (Array).h"

int main() {
    Stack test;

    test.createStack();

    test.push('A');
    test.push('B');
    cout << "Top Value: " << test.stackTop() << endl << endl;

    test.pop(); 
    cout << "Top Value: " << test.stackTop() << endl << endl;

    return 0;
}