// "#include" will copy all the code under certain file (Example: .h .cpp).
// "#ifndef", "#define" and "#endif" can work together as an “include guard” in C++ header files.

#ifndef SPHERECLASS_H // Means if not defined "SPHERECLASS_H", it checks whether a unique identifier (macro) named SPHERECLASS_H has already been defined before. If not defined, then the compiler will continue to read the following lines.
#define SPHERECLASS_H // Defines the identifier "SPHERECLASS_H". So, the next time this header file is included again through another file, "#ifndef SPHERECLASS_H" will fail because now it’s already defined.

// If required, we also can "#include" many different header file such as <iostream> and others at here.
// Thus, other file which include "SphereClass.h" are not required to include those <iostream> again to avoid redeclaration and cause error.
// That is because "#include" will directly copy all the statement from certain file to the file that "#include" it.

class Sphere {
    public:
        Sphere();              /* Constructor 1 */
        Sphere(double radius); /* Constructor 2 */
        void setRadius(double radius);
        double getRadius() const; // "const" method cannot be overwrite.
        double getDiameter() const;
        double getCircumference() const; 
        double getArea() const;
        double getVolume() const;
        void displayStatistics() const;
        // ~Sphere(); // Destructor (Optional). It will auto generate when compile.
    private:
        double radius;
};

#endif // Marks the end of the conditional section that began with "#ifndef". Everything between "#ifndef" and "#endif" will only be included once.





