#include <iostream>
using namespace std;

class Box {
    public:
        Box(double width) {
            this->width = width;
        };

    private:
        double width;

        friend void printWidth(Box b); 
        // "friend" allow a function not belong to certain class can access the private data inside that class directly.
};

void printWidth(Box b) {
    cout << b.width; // "width" can be accessed although it is private.
}

int main() {
    Box b1(10);

    printWidth(b1);

    return 0;
}
