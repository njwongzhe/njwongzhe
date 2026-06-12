#include <iostream>
using namespace std;

class Box {
    public:
        Box(double width) {
            this->width = width;
        };

    private:
        double width;
};


int main() {
    cout << new Box(10) << endl; // "new" can create an object and return as address.

    Box *ptrBox = new Box(10); // Thus, pointer for object must use new to create.

    return 0;
}
