#include <iostream>
#include <string>
#include <regex>
using namespace std;

#include "13 - Stack Implementation.h"

int precedence(char op) {
    if (op == '^') return 3;
    if (op == '*' || op == '/') return 2;
    if (op == '+' || op == '-') return 1;
    return 0; // '(' or '#'
}

int main() {
    string stackIn = "(A+(B*C)-(D/E))", // Infix Expression   (As-Is)
           stackPost = "";              // Postfix Expression (To-Be)

    Stack s; // Temparory Stack (Store Operator)
    create(s);
    push(s, '#'); // "#" as terminate symbol.
    
    int i = 0; // Infix Counter
    
    while(i < stackIn.length()) { // When not at the end of infix.
        char ch = stackIn[i]; // Certain character in Infix stack.

        // Operand
        if(regex_match(string(1, ch), regex("[A-Z]"))) // Character
            stackPost.push_back(ch);
        
        // Start Bracket
        else if(ch == '(')
            push(s, ch);
        
        // End Bracket
        else if(ch == ')') {
            char temp = pop(s);
            while(temp != '(') {
                stackPost.push_back(temp);
                temp = pop(s);
            }
        }

        // Operator
        else if(ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '^') {
            while (!isEmpty(s) && precedence(stacktop(s)) >= precedence(ch)) {
                char chpop = pop(s);
                stackPost += chpop;
            }
            push(s, ch);
        }

        i++;
    }

    // Pop Until "#" Encountered
    while (stacktop(s) != '#') {
        char ch = pop(s);
        stackPost += ch;
    }

    cout << "Postfix: " << stackPost << endl;
    
    return 0;
}