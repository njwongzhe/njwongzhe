#include <iostream>
using namespace std;

class nodeStack {
    public:      
        char data;
        nodeStack *next;
};

class stack {
    private:
        nodeStack *top;

    public:
        void createStack() {
            top = NULL;
        };

        bool isEmpty() {
            return (top == NULL);
        };

        char stackTop() {
            if(isEmpty()) return '\0';
            return top->data;
        };

        void push(char data) {
            nodeStack *temp = top;
            top = new nodeStack();
            top->data = data;
            top->next = temp;
        };

        char pop() {
            if(isEmpty()) return '\0';

            char temp = top->data;

            nodeStack *delNode = top;
            top = delNode->next;
            delete delNode;

            return temp;
        };
};

bool isOperator(char data) {
    if(data == '+' || data == '-' || data == '*' || data == '/' || data == '^')
        return true;
    return false;
}

int precedence(char data) {
    if(data == '^') return 3;
    if(data == '+' || data == '-') return 1;
    if(data == '*' || data == '/') return 2;
    return 0;
}

int main() {
    string inFix = "8*(3+4)/2-3*5", postFix = "";

    stack s;
    s.createStack();
    s.push('#');

    for(int i = 0; i < inFix.length(); i++) {
        char ch = inFix[i];

        // Task 1
        if(ch == '(')
            s.push(ch);

        // Task 2
        else if(isOperator(ch)) {
            while (!s.isEmpty() && precedence(s.stackTop()) >= precedence(ch))
                postFix += s.pop();
            s.push(ch);
        }

        // Task 3
        else if(ch == ')') {
            while(s.stackTop() != '(')
                postFix += s.pop();
            s.pop();
        }

        else
            postFix += ch;
    }

    while(s.stackTop() != '#')
        postFix += s.pop();

    // Task 4
    for(int i = 0; i < postFix.length(); i++) {
        if(isOperator(postFix[i])) {
            int b = s.pop() - '0', 
                a = s.pop() - '0';
            
            switch(postFix[i]) {
                case '+': s.push((a + b) + '0'); break;
                case '-': s.push((a - b) + '0'); break;
                case '*': s.push((a * b) + '0'); break;
                case '/': s.push((a / b) + '0'); break;
                case '^': int result = a; 
                          for(; b > 0; b--) { result *= a; } 
                          s.push(result + '0'); 
                          break;
            }
        }
        else 
            s.push(postFix[i]);
    }

    cout << "Convert infix to postfix"        << endl
         << "Infix: "   << inFix              << endl
         << "Postfix: " << postFix            << endl << endl
         << "Evaluating postfix expression"   << endl
         << "Postfix expression: " << postFix << endl
         << "Result = " << (s.pop() - '0');

    return 0;
}