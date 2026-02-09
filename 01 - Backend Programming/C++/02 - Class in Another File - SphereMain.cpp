#include <iostream>
#include "02 - Class in Another File - SphereClass.h" // Import class file.
using namespace std;

/* Constructor 1 */
Sphere::Sphere() {
    this->radius = 0;
};

/* Constructor 2 */
Sphere::Sphere(double radius) {
    this->radius = radius;
};

void Sphere::setRadius(double radius) {
    this->radius = radius;
};

double Sphere::getRadius() const {
    return this->radius;
};

double Sphere::getDiameter() const {
    return (this->radius) * 2;
};

double Sphere::getCircumference() const {
    return 2 * (22 / 7) * (this->radius);
}; 

double Sphere::getArea() const {
    return 4 * (22 / 7) * (this->radius) * (this->radius);
};

double Sphere::getVolume() const {
    return (4 / 3) * (22 / 7) * (this->radius) * (this->radius) * (this->radius);
};

void Sphere::displayStatistics() const {
    cout << "Data of Sphere" << endl;
    cout << "Radius        : " << getRadius()        << endl;
    cout << "Diameter      : " << getDiameter()      << endl;
    cout << "Circumference : " << getCircumference() << endl;
    cout << "Area          : " << getArea()          << endl;
    cout << "Volume        : " << getVolume()        << endl << endl;
};

int main() {
    Sphere sphere1;
    Sphere sphere2(10);

    sphere1.displayStatistics();
    sphere2.displayStatistics();

    return 0;
}