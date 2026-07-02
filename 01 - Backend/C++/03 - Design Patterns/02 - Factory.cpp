#include <iostream>
using namespace std;

// ==========================================
// 1. Product Interfaces
// ==========================================

class Computer {
    public:
        Computer() = default;
        virtual ~Computer() = default;
        virtual void displayComputer() = 0;
};

// ==========================================
// 2. Concrete Product: Basic Family
// ==========================================

class BasicComputer : public Computer {
    public:
        virtual void displayComputer() {
            cout << "--- Basic Computer Configuration ---" << endl;
            cout << "I am a Basic Cpu." << endl;
            cout << "I am a Basic Keyboard." << endl;
            cout << "I am a Basic Monitor." << endl;
        }
};

// ==========================================
// 3. Concrete Product: Advanced Family
// ==========================================

class AdvancedComputer : public Computer {
    public:
        virtual void displayComputer() {
            cout << "--- Advanced Computer Configuration ---" << endl;
            cout << "I am a Advanced Cpu." << endl;
            cout << "I am a Advanced Keyboard." << endl;
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
        
        // Factory Method responsible only for instantiation
        virtual Computer* createComputer() = 0;

        // Core business operation method encapsulating product management and execution.
        void displayComputer() {
            Computer* pComputer = createComputer();
            pComputer->displayComputer();
            delete pComputer;
        }
};

// ==========================================
// 5. Concrete Factory
// ==========================================

class BasicComputerFactory : public ComputerFactory {
    public: 
        BasicComputerFactory() {}
        virtual ~BasicComputerFactory() {}
        virtual Computer* createComputer() { return new BasicComputer(); }
};

class AdvancedComputerFactory : public ComputerFactory {
    public: 
        AdvancedComputerFactory() {}
        virtual ~AdvancedComputerFactory() {}
        virtual Computer* createComputer() { return new AdvancedComputer(); }
};

// ==========================================
// 7. Main
// ==========================================

int main() {
    ComputerFactory* factory = 0; // Create factory instance pointer matching the abstract base.

    int answer;

    cout << "Create what computer?" << endl;
    cout << "1. Basic Computer" << endl;
    cout << "2. Advanced Computer" << endl;
    cout << "Answer: "; cin >> answer;

    // Allocate and pass in the specific concrete factory into the factory variable.
    if(answer == 1) 
        factory = new BasicComputerFactory();
    else if(answer == 2) 
        factory = new AdvancedComputerFactory();
    else {
        cout << "Invalid input. Please try again." << endl;
        return 0;
    }
        
    // Execute the operations inside the instantiated factory uniformly.
    factory->displayComputer();

    // Clean up factory allocation memory.
    delete factory;

    return 0;
}