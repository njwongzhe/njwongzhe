#ifndef STACKIMPLEMENT_H
#define STACKIMPLEMENT_H

const int SIZE = 100;

struct Stack {
    int top;         
    char data[SIZE];
};

void create(Stack &s) {
    s.top = -1;
}

void push(Stack &s, char ch) {
    s.top = s.top + 1;
    s.data[s.top] = ch;
}

char pop(Stack &s) {
    char temp = s.data[s.top];
    s.top = s.top - 1;

    return temp;
}

bool isEmpty(Stack &s) {
    return (s.top == -1);
}

char stacktop(Stack &s) {
    return s.data[s.top];
}

#endif