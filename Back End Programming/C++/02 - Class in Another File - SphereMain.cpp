#include <iostream>
#include "02 - Class in Another File - SphereClass.h" // Import class file.
using namespace std;

Sphere::Sphere() {
    this->radius = 0;
};

Sphere::Sphere(double radius) {
    this->radius = radius;
};

void Sphere::setRadius(double radius) {
    this->radius = radius;
};

const double Sphere::getRadius() {
    return this->radius;
};

const double Sphere::getDiameter() {
    return (this->radius) * 2;
};

const double Sphere::getCircumference() {
    return 2 * (22 / 7) * (this->radius);
}; 

const double Sphere::getArea() {
    return 4 * (22 / 7) * (this->radius) * (this->radius);
};

const double Sphere::getVolume() {
    return (4 / 3) * (22 / 7) * (this->radius) * (this->radius) * (this->radius);
};

const void Sphere::displayStatistics() {
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