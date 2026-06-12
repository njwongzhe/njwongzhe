#include <iostream>
#include <string>
using namespace std;

#include "13 - Stack Implementation.h"

int main() {
    string paren = "(a+b)";

    Stack s; // Temparory Stack (Store Operator)
    create(s);

    int i = 0;
    bool continueTest = true;

    while(i < paren.length() && continueTest) {
        char ch = paren[i];

        if(ch == '(' || ch == ')') {
            if(ch == '(')
                push(s, '(');
            else if(isEmpty(s)) 
                continueTest = false;
            else // ch == ')'
                pop(s);
        }

        i++;
    }

    if(isEmpty(s) && continueTest)
        cout << "Balance";
    else
        cout << "Not Balance";

    return 0;
}