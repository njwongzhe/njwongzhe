#include <iostream>
#include <string>
using namespace std;

// Inheritance: Allows a class (derived class) to inherit attributes and methods from another class (base class).

/* Base Class */
class Animal {
    public:
        /* Constructor */
        Animal(string name) {
            this->name = name;
        };

        /* Regular Member Function */
        void eat() {
            cout << this->name << " is eating." << endl;
        };

        /* Virtual Function */
        // Allows derived classes to override it. Enables Polymorphism.
        virtual void makeSound() {
            cout << this->name << " makes a sound." << endl;
        };

        /* Virtual Destructor */
        // Necessary to ensure the derived class destructor is called when deleting via a base pointer.
        virtual ~Animal() {
            cout << "Animal Destructor called for " << this->name << endl;
        };

    protected:
        string name; // Accessible to derived classes.
};

/* Derived Class */
class Dog : public Animal {
    public:
        /* Constructor calling Base Class Constructor */
        Dog(string name, string breed) : Animal(name) {
            this->breed = breed;
        };

        /* Overriding Virtual Function */
        void makeSound() override {
            cout << this->name << " (a " << this->breed << ") barks: Woof! Woof!" << endl;
        };

        /* Destructor */
        ~Dog() override {
            cout << "Dog Destructor called for " << this->name << endl;
        };

    private:
        string breed;
};

int main() {
    /* Demonstration of Inheritance & Polymorphism */
    cout << "--- Inheritance & Polymorphism Demo ---" << endl;
    
    // Using Base Class pointer to point to Derived Class object (Polymorphism).
    Animal *myDog = new Dog("Buddy", "Golden Retriever");
    myDog->eat();         // Inherited function.
    myDog->makeSound();   // Overridden function called via Polymorphism.
    delete myDog;         // Calls Dog destructor, then Animal destructor (due to virtual destructor).

    return 0;
}
