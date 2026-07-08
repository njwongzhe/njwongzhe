#include <iostream>
using namespace std;

class Cpu {
    public:
        Cpu() = default;
        virtual ~Cpu() = default;
        virtual void displayCpu() = 0;
};

class Gpu {
    public:
        Gpu() = default;
        virtual ~Gpu() = default;
        virtual void displayGpu() = 0;
};

class BasicCpu : public Cpu {
    public:
        BasicCpu() = default;
        virtual ~BasicCpu() = default;
        virtual void displayCpu() { cout << "Basic Cpu" << endl; }
};  

class BasicGpu : public Gpu {
    public:
        BasicGpu() = default;
        virtual ~BasicGpu() = default;
        virtual void displayGpu() { cout << "Basic Gpu" << endl; }
}; 

class AdvancedCpu : public Cpu {
    public:
        AdvancedCpu() = default;
        virtual ~AdvancedCpu() = default;
        virtual void displayCpu() { cout << "Advanced Cpu" << endl; }
};  

class AdvancedGpu : public Gpu {
    public:
        AdvancedGpu() = default;
        virtual ~AdvancedGpu() = default;
        virtual void displayGpu() { cout << "Advanced Gpu" << endl; }
}; 

class ComputerFactory {
    public: 
        ComputerFactory() = default;
        virtual ~ComputerFactory() = default;
        virtual Cpu* createCpu() = 0;
        virtual Gpu* createGpu() = 0;
};

class BasicComputerFactory : public ComputerFactory {
    public:
        BasicComputerFactory() = default;
        virtual ~BasicComputerFactory() = default;
        virtual Cpu* createCpu() { return new BasicCpu; };
        virtual Gpu* createGpu() { return new BasicGpu; } ;
};

class AdvancedComputerFactory : public ComputerFactory {
    public:
        AdvancedComputerFactory() = default;
        virtual ~AdvancedComputerFactory() = default;
        virtual Cpu* createCpu() { return new AdvancedCpu; };
        virtual Gpu* createGpu() { return new AdvancedGpu; } ;
};

class Computer {
    private: 
        Cpu* _cpu;
        Gpu* _gpu;
    public:
        Computer(ComputerFactory* factory) {
            _cpu = factory->createCpu();
            _gpu = factory->createGpu();
        }
        ~Computer() {
            delete _cpu;
            delete _gpu;
        }
        void displayComputer() {
            _cpu->displayCpu();
            _gpu->displayGpu();
        }
};

int main () {
    BasicComputerFactory basicFac;
    AdvancedComputerFactory advancedFac;
    Computer* comp = 0;

    int option = 1;

    if (option == 1) {
        comp = new Computer(&basicFac);
    } else {
        comp = new Computer(&advancedFac);
    }

    comp->displayComputer();

    delete comp;
    
    return 0;
}