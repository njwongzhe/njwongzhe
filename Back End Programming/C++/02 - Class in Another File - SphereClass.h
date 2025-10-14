class Sphere {
    public:
        Sphere();
        Sphere(double radius);
        void setRadius(double radius);
        const double getRadius();
        const double getDiameter();
        const double getCircumference(); 
        const double getArea();
        const double getVolume();
        const void displayStatistics();
        // ~Sphere(); // Destructor (Optional). It will auto generate when compile.
    private:
        double radius;
};
