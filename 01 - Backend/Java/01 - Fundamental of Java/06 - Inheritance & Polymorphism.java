// Inheritance & Polymorphism: Parent-child relationship and dynamic method dispatch.

// Base class / Superclass.
class Animal {
    protected String name;

    public Animal(String name) {
        this.name = name;
    };

    public void eat() {
        System.out.println(name + " is eating.");
    };

    // Virtual by default: In Java, all non-static, non-final methods are implicitly virtual.
    public void makeSound() {
        System.out.println(name + " makes a generic sound.");
    };

    // Overriding the toString() method inherited from java.lang.Object class.
    @Override
    public String toString() {
        return "Animal [Name: " + name + "]";
    };
}

// Derived class / Subclass.
class Dog extends Animal {
    private String breed;

    // Subclass constructor.
    public Dog(String name, String breed) {
        super(name); // Call base class constructor. Must be the first statement.
        this.breed = breed;
    };

    // Overriding virtual method.
    @Override
    public void makeSound() {
        System.out.println(name + " (a " + breed + ") barks: Woof! Woof!");
    };

    // Subclass-specific method.
    public void fetch() {
        System.out.println(name + " is fetching a ball.");
    };

    @Override
    public String toString() {
        return "Dog [Name: " + name + ", Breed: " + breed + "]";
    };
}

class InheritancePolymorphismDemo {
    public static void main(String[] args) {
        System.out.println("--- 1. Basic Inheritance ---");
        Dog myDog = new Dog("Buddy", "Golden Retriever");
        myDog.eat();        // Inherited method.
        myDog.makeSound();  // Overridden method.
        myDog.fetch();      // Subclass-specific method.
        System.out.println("toString() call: " + myDog.toString());
        System.out.println();

        System.out.println("--- 2. Dynamic Polymorphism ---");
        // Superclass reference variable pointing to a subclass object.
        Animal polymorphicAnimal = new Dog("Rex", "German Shepherd");
        
        polymorphicAnimal.eat(); // Inherited method works.
        
        // Polymorphism: JVM determines which method to call at runtime (Dynamic Binding).
        polymorphicAnimal.makeSound(); // Calls Dog's makeSound() even though the reference type is Animal.

        // polymorphicAnimal.fetch(); // Error: Reference type Animal does not define fetch().
        System.out.println();

        System.out.println("--- 3. Instance Checking & Downcasting ---");
        // Check actual type before casting to avoid ClassCastException.
        if (polymorphicAnimal instanceof Dog) {
            // Downcasting: Cast Animal reference back to Dog reference.
            Dog castedDog = (Dog) polymorphicAnimal;
            castedDog.fetch(); // Successful call.
        }
    }
}
