#include <iostream>
using namespace std;

class Computer {
    public:
        Computer() = default;
        virtual ~Computer() = default;
        virtual void displayComputer() = 0;
};

class BasicComputer : public Computer {
    public:
        BasicComputer() = default;
        virtual ~BasicComputer() = default;
        virtual void displayComputer() { cout << "Basic Computer" << endl; }
};  

class AdvancedComputer : public Computer {
    public:
        AdvancedComputer() = default;
        virtual ~AdvancedComputer() = default;
        virtual void displayComputer() { cout << "Advanced Computer" << endl; }
};  

class ComputerFactory {
    public: 
        ComputerFactory() = default;
        virtual ~ComputerFactory() = default;
        virtual Computer* createComputer() = 0;
};

class BasicComputerFactory : public ComputerFactory {
    public:
        BasicComputerFactory() = default;
        virtual ~BasicComputerFactory() = default;
        virtual Computer* createComputer() { return new BasicComputer; };
};

class AdvancedComputerFactory : public ComputerFactory {
    public:
        AdvancedComputerFactory() = default;
        virtual ~AdvancedComputerFactory() = default;
        virtual Computer* createComputer() { return new AdvancedComputer; };
};

int main () {
    ComputerFactory* factory = 0;

    int option = 1;

    if (option == 1) {
        factory = new BasicComputerFactory();
    } else {
        factory = new AdvancedComputerFactory();
    }

    delete factory;
    
    return 0;
}