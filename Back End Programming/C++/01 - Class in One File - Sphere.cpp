#include <iostream>
using namespace std;

class Sphere {
    public:
        Sphere() {
            this->radius = 0;
        };

        Sphere(double radius) {
            this->radius = radius;
        };

        void setRadius(double radius) {
            this->radius = radius;
        };

        double getRadius() const { // "const" method cannot be overwrite.
            return this->radius;
        };

        double getDiameter() const {
            return (this->radius) * 2;
        };

        double getCircumference() const {
            return 2 * (22 / 7) * (this->radius);
        }; 

        double getArea() const {
            return 4 * (22 / 7) * (this->radius) * (this->radius);
        };

        double getVolume() const {
            return (4 / 3) * (22 / 7) * (this->radius) * (this->radius) * (this->radius);
        };

        void displayStatistics() const {
            cout << "Data of Sphere" << endl;
            cout << "Radius        : " << getRadius()        << endl;
            cout << "Diameter      : " << getDiameter()      << endl;
            cout << "Circumference : " << getCircumference() << endl;
            cout << "Area          : " << getArea()          << endl;
            cout << "Volume        : " << getVolume()        << endl << endl;
        };

        // ~Sphere(); // Destructor (Optional). It will auto generate when compile.

    private:
        double radius;
};

int main() {
    Sphere sphere1;
    Sphere sphere2(10);

    sphere1.displayStatistics();
    sphere2.displayStatistics();

    return 0;
}
