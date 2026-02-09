public class Vehicle {
    public static void main(String[] args) {
        Car x50 = new Car();
        x50.name = "X50";
        x50.engine = "Petrol";
        x50.type = "SUV";
        x50.boot = 500;

        x50.printInfo();
        // printVehicle(x50);    // Print information about X50.
        System.out.println();

        Truck ranger = new Truck();
        ranger.name = "Ranger";
        ranger.engine = "Diesel";
        ranger.type = "Pick-Up";
        ranger.cargo = "Flatbed";

        ranger.printInfo();
        // printVehicle(ranger); // Print information about Ranger.
        System.out.println();
    }

    public static void printVehicle(VehicleInfo v) {
        v.printInfo();
    }
}

//----------------------------------------------------------------------

// Version 2 (With extends) :

class VehicleInfo {
    public String name;   // Instance Variable
    public String engine; // Instance Variable
    public String type;   // Instance Variable

    public void printInfo() {
        System.out.println("Engine : " + engine);
        System.out.println("Type : " + type);
    }
}

class Car extends VehicleInfo {
    public int boot;
    
    public void printInfo() {
        System.out.println("Truck Information for " + name);
        super.printInfo();
        System.out.println("Boot Size : " + boot);
    }
}

class Truck extends VehicleInfo {
    public String cargo;

    public void printInfo() {
        System.out.println("Truck Information for " + name);
        super.printInfo();
        System.out.println("Cargo : " + cargo);
    }
}

//----------------------------------------------------------------------



/*----------------------------------------------------------------------

Version 1 (Without extends) :

class Car {
    public String name;
    public String engine;
    public String type;
    public int boot;

    public void printInfo() {
        System.out.println("Car Information for " + name);
        System.out.println("Engine : " + engine);
        System.out.println("Type : " + type);
        System.out.println("Boot Size : " + boot);
    }
}

class Truck {
    public String name;
    public String engine;
    public String type;
    public String cargo;

    public void printInfo() {
        System.out.println("Truck Information for " + name);
        System.out.println("Engine : " + engine);
        System.out.println("Type : " + type);
        System.out.println("Cargo : " + cargo);
    }
}

----------------------------------------------------------------------*/