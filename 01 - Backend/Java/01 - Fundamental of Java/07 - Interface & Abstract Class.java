// Interface & Abstract Class: Abstraction mechanisms in Java.

// 1. Abstract Class: Cannot be instantiated, may contain both abstract and concrete methods.
abstract class Vehicle {
    protected String brand;

    public Vehicle(String brand) {
        this.brand = brand;
    };

    // Concrete method.
    public void startEngine() {
        System.out.println("Starting engine for " + brand);
    };

    // Abstract method: Has no implementation. Must be overridden by concrete subclasses.
    public abstract void drive();
}

// 2. Interface: Defines a contract of methods. Can contain abstract, default, and static methods.
interface Flyable {
    // Interface variables are implicitly public, static, and final.
    int MAX_ALTITUDE = 10000; 

    // Abstract method (implicitly public and abstract).
    void fly();

    // Default method (since Java 8): Allows providing a default implementation.
    default void checkAltitude() {
        System.out.println("Checking altitude. Maximum allowed is " + MAX_ALTITUDE + " meters.");
    };

    // Static method (since Java 8): Utility method belonging directly to the interface.
    static void flyWarning() {
        System.out.println("Warning: Avoid flying in bad weather!");
    };
}

// Subclass inheriting from Abstract Class and implementing Interface.
class FlyingCar extends Vehicle implements Flyable {
    public FlyingCar(String brand) {
        super(brand);
    };

    // Implement abstract method from Vehicle.
    @Override
    public void drive() {
        System.out.println(brand + " is driving on the road.");
    };

    // Implement abstract method from Flyable.
    @Override
    public void fly() {
        System.out.println(brand + " is flying in the sky.");
    };
}

class InterfaceAbstractDemo {
    public static void main(String[] args) {
        // Vehicle myVehicle = new Vehicle("Toyota"); // Error: Vehicle is abstract and cannot be instantiated.

        System.out.println("--- 1. Using Abstract Class Methods ---");
        FlyingCar myCar = new FlyingCar("AeroCar");
        myCar.startEngine(); // Inherited concrete method.
        myCar.drive();       // Implemented abstract method.
        System.out.println();

        System.out.println("--- 2. Using Interface Methods ---");
        myCar.fly();            // Implemented abstract method.
        myCar.checkAltitude();  // Default method.
        Flyable.flyWarning();   // Static interface method call.
    }
}
