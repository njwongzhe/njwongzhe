class Truck extends Vehicle {
    private String cargoBed;
    private int cargoSize;

    public Truck() {
        super.setEngine("Diesel");
        System.out.println("Call Truck Constructor #1");
    }

    public Truck(String brand) {
        super(brand); // Explicitly Invoke Vehicle Constructor
        System.out.println("Call Truck Constructor #2");
    }

    public void setCargoBed(String cargoBed) {
      this.cargoBed = cargoBed;
    }

    public void setCargoBed(int cargoSize) {
      this.cargoSize = cargoSize;
    }

    public void setCargoBed(String cargoBed, int cargoSize) {
      this.cargoBed = cargoBed;
      this.cargoSize = cargoSize;
    }

    /* Override */
    public void printInfo() { // Method Overriding
        System.out.println("TRUCK");
        super.printInfo();
        System.out.println("Cargo Type: " + cargoBed);
        System.out.println("Cargo Size: " + cargoSize);
        System.out.println();
    }
}
