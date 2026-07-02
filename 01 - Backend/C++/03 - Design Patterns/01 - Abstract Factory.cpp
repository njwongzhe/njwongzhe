#include <iostream>
using namespace std;

// ==========================================
// 1. Product Interfaces
// ==========================================

class Cpu {
    public: 
        Cpu() = default;
        virtual ~Cpu() = default;
        virtual void displayCpu() = 0;
};

class Keyboard {
    public: 
        Keyboard() = default;
        virtual ~Keyboard() = default;
        virtual void displayKeyboard() = 0;
};

class Monitor {
    public: 
        Monitor() = default;
        virtual ~Monitor() = default;
        virtual void displayMonitor() = 0;
};

// ==========================================
// 2. Concrete Product: Basic Family
// ==========================================

class BasicCpu : public Cpu {
    public: 
        BasicCpu() {}
        virtual ~BasicCpu() {}
        virtual void displayCpu() {
            cout << "I am a Basic Cpu." << endl;
        }
};

class BasicKeyboard : public Keyboard {
    public: 
        BasicKeyboard() {}
        virtual ~BasicKeyboard() {}
        virtual void displayKeyboard() {
            cout << "I am a Basic Keyboard." << endl;
        }
};

class BasicMonitor : public Monitor {
    public: 
        BasicMonitor() {}
        virtual ~BasicMonitor() {}
        virtual void displayMonitor() {
            cout << "I am a Basic Monitor." << endl;
        }
};

// ==========================================
// 3. Concrete Product: Advanced Family
// ==========================================

class AdvancedCpu : public Cpu {
    public: 
        AdvancedCpu() {}
        virtual ~AdvancedCpu() {}
        virtual void displayCpu() {
            cout << "I am a Advanced Cpu." << endl;
        }
};

class AdvancedKeyboard : public Keyboard {
    public: 
        AdvancedKeyboard() {}
        virtual ~AdvancedKeyboard() {}
        virtual void displayKeyboard() {
            cout << "I am a Advanced Keyboard." << endl;
        }
};

class AdvancedMonitor : public Monitor {
    public: 
        AdvancedMonitor() {}
        virtual ~AdvancedMonitor() {}
        virtual void displayMonitor() {
            cout << "I am a Advanced Monitor." << endl;
        }
};

// ==========================================
// 4. Factory Interface
// ==========================================

class ComputerFactory {
    public:
        ComputerFactory() = default;
        virtual ~ComputerFactory() = default;
        virtual Cpu* createCpu() = 0;
        virtual Keyboard* createKeyboard() = 0;
        virtual Monitor* createMonitor() = 0;
};

// ==========================================
// 5. Concrete Factory
// ==========================================

class BasicComputerFactory : public ComputerFactory {
    public: 
        BasicComputerFactory() {}
        virtual ~BasicComputerFactory() {}
        virtual Cpu* createCpu() { return new BasicCpu(); }
        virtual Keyboard* createKeyboard() { return new BasicKeyboard(); }
        virtual Monitor* createMonitor() { return new BasicMonitor(); }
};

class AdvancedComputerFactory : public ComputerFactory {
    public: 
        AdvancedComputerFactory() {}
        virtual ~AdvancedComputerFactory() {}
        virtual Cpu* createCpu() { return new AdvancedCpu(); }
        virtual Keyboard* createKeyboard() { return new AdvancedKeyboard(); }
        virtual Monitor* createMonitor() { return new AdvancedMonitor(); }
};

// ==========================================
// 6. Client
// ==========================================

class Computer {
    private:
        Cpu* _cpu;
        Keyboard* _keyboard;
        Monitor* _monitor;
    public: 
        Computer(ComputerFactory* factory) {
            _cpu = factory->createCpu();
            _keyboard = factory->createKeyboard();
            _monitor = factory->createMonitor();
        }
        ~Computer() {
            delete _cpu;
            delete _keyboard;
            delete _monitor;
        }
        void displayComputer() {
            _cpu->displayCpu();
            _keyboard->displayKeyboard();
            _monitor->displayMonitor();
        }
};

// ==========================================
// 7. Main
// ==========================================

int main() {
    BasicComputerFactory basicFac;
    AdvancedComputerFactory advancedFac;
    Computer* pComputer = 0;

    int answer;

    cout << "Create what computer?" << endl;
    cout << "1. Basic Computer" << endl;
    cout << "2. Advanced Computer" << endl;
    cout << "Answer: "; cin >> answer;

    if(answer == 1) 
        pComputer = new Computer(&basicFac);
    else if(answer == 2) 
        pComputer = new Computer(&advancedFac);
    else {
        cout << "Invalid input. Please try again." << endl;
        return 0;
    }
        
    pComputer->displayComputer();

    delete pComputer;

    return 0;
}