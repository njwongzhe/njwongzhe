class Car extends Vehicle {
    private int boot;

    public Car() {
        super.setEngine("Petrol");
        System.out.println("Call Car Constructor #1");
    }

    public Car(String brand) {
		/* Access base/super/parent class instance variable. */
		// this.brand = brand; // Can't Do This Since --> private

        /* The Approach Below Not Work (Conflict of Superclass & Subclass) */
        // this();        // Constructor Chaining - Call public "Car()" at line 4.
        // super.(brand); // Call "public Vehicle(String brand)" constructor.

        /* The Alternative Solution (Work) */
        this(); // Constructor Chaining - Call "public Car()" at line 4.
        super.setBrand(brand);

		this.type = "compact"; // type
		super.color = "white"; // Use 'super' Keyword is Better

        System.out.println("Call Car constructor #2");
	}

    /* Overriding Java's Object toString() Method */
    public String toString() {
        return (this.getBrand() + ", " + super.getEngine() + " (" + super.toString() + ")");
        // this.getBrand() will call the method from current class : Car.
        // super.getBrand() will call the method from superclass : Vehicle.
    }

    // Unknown(WAII edit)
    public void printInfo() { // Override
        System.out.println("CAR");
        super.printInfo();
        System.out.println("Boot Size: " + boot);
        System.out.println();
    }
}