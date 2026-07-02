public class TestVehicle3 {
    public static void main(String [] args) {
        System.out.println("Test Vehicle class\n");

        //Car x50 = new Car();
        Car x50 = new Car("Proton-x50");
        x50.printInfo();

        System.out.println("--------------------");

        Truck ranger = new Truck("Ford-Ranger");
        //ranger.engine = "Diesel";
        ranger.setEngine("Diesel");

        ranger.setCargoBed("flatbed", 1233);
        ranger.setCargoLimit(1300);
        ranger.printInfo();
    }
}