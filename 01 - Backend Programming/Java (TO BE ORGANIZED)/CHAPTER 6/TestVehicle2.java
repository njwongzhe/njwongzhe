public class TestVehicle2 {
    public static void main(String[] args) {
        System.out.println("Test Vehicle class");

        //Car x50 = new Car();
        Car x50 = new Car("Proton x50");
        printVehicle(x50);

        System.out.println("--------------------");

        // x50.engine = "Petrol";
        x50.type = "SUV"; // protected Member (ok)
        // x50.boot = 500;
        x50.color = "black"; // public Member (ok)

        printVehicle(x50);

        System.out.println("--------------------");

        Truck ranger = new Truck("Ford Ranger");
        //ranger.engine = "Diesel";
        ranger.setEngine("Diesel");

        //ranger.type = "Pick-Up";
        //ranger.cargoBed = "Flatbed";
        ranger.printInfo();

        System.out.println("--------------------");
        System.out.println("Test toString() method");
        System.out.println(x50.toString());
        System.out.println(ranger.toString());

        System.out.println("-------------------- OVERLOADING");
        /* Method Overloading */
        ranger.setCargoBed("transport", 3000);
        ranger.printInfo();
        ranger.setCargoBed("flatbed");
        ranger.printInfo();
        ranger.setCargoBed(1233);
        ranger.printInfo();

        System.out.println("-------------------- POLYMORPHISM");
        /* Polymorphism */
        //Vehicle hilux = new Truck("Toyota Hilux"); // Case #1
        Object hilux = new Truck("Toyota Hilux");    // Case #2
        ((Truck)hilux).printInfo(); // The compiler is not clever to know the hilux is belong to Car.
                                  // Thus, the casting is required.                        
    }

    /* Polymorphism - printVehicle function can accept both the Car and Truck objects. */
    public static void printVehicle(Vehicle v) {
        v.printInfo();
    }
}