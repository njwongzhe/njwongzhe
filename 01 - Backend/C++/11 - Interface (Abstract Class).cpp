#include <iostream>
using namespace std;

// Interface: A way to achieve abstraction. In C++, this is simulated using abstract classes with pure virtual functions.
// C++ has no "interface" keyword. It is simulated using a class with ONLY pure virtual functions.

/* Interface (Abstract Class) */
class IShape {
    public:
        /* Pure Virtual Functions */
        // "= 0" makes the function pure virtual. Any class inheriting from IShape MUST implement these.
        virtual double getArea() const = 0;
        virtual double getPerimeter() const = 0;

        /* Virtual Destructor */
        virtual ~IShape() {};
};

/* Class implementing Interface */
class Rectangle : public IShape {
    public:
        /* Constructor */
        Rectangle(double width, double height) {
            this->width = width;
            this->height = height;
        };

        /* Implementing Pure Virtual Functions */
        double getArea() const override {
            return this->width * this->height;
        };

        double getPerimeter() const override {
            return 2 * (this->width + this->height);
        };

        /* Destructor */
        ~Rectangle() override {
            cout << "Rectangle Destructor called." << endl;
        };

    private:
        double width;
        double height;
};

/* Class implementing Interface */
class Circle : public IShape {
    public:
        /* Constructor */
        Circle(double radius) {
            this->radius = radius;
        };

        /* Implementing Pure Virtual Functions */
        double getArea() const override {
            return 3.1415926535 * (this->radius) * (this->radius);
        };

        double getPerimeter() const override {
            return 2 * 3.1415926535 * (this->radius);
        };

        /* Destructor */
        ~Circle() override {
            cout << "Circle Destructor called." << endl;
        };

    private:
        double radius;
};

int main() {
    /* Demonstration of Interface (Abstract Class) */
    cout << "--- Interface (Abstract Class) Demo ---" << endl;
    // IShape shape; // Error: Cannot instantiate abstract class.
    
    IShape *shape1 = new Rectangle(5.0, 10.0);
    IShape *shape2 = new Circle(3.0);

    cout << "Rectangle Area     : " << shape1->getArea() << endl;
    cout << "Rectangle Perimeter: " << shape1->getPerimeter() << endl;
    cout << "Circle Area        : " << shape2->getArea() << endl;
    cout << "Circle Perimeter   : " << shape2->getPerimeter() << endl;

    delete shape1; // Calls Rectangle destructor.
    delete shape2; // Calls Circle destructor.

    return 0;
}
