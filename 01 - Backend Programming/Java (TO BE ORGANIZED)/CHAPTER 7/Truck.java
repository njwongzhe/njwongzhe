class Truck extends Vehicle implements SpeedConversion, CargoLimit {
    private String cargoBed;
    private int cargoSize;
    private int cargoLoad;

    public Truck() {
        super.setEngine("Diesel");
        System.out.println("Call Truck constructor #1");
    }

    public Truck(String brand) {
        super(brand); // Explicitly Invoke Vehicle Constructor
        System.out.println("Call Truck constructor #2");
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

    public int speedLimit() {
        return 80; // KMH
    }

    public double convertToMPH() {
        return this.speedLimit() / SpeedConversion.MPH_FACTOR; // KMH to MPH
    }

    public void setCargoLimit(int load) {
        if (load <= MAX_CARGO)
            this.cargoLoad = load;
        
        else {
            System.out.println("Error: Load Exceeds Cargo Limit");
            this.cargoLoad = MAX_CARGO;
        }
    }

    /* Override */
    public void printInfo() { // Method Overriding
        System.out.println("TRUCK");
        super.printInfo();
        System.out.printf("Speed Limit: %d KMH / %.2f MPH\n", this.speedLimit(), this.convertToMPH());
        System.out.println("Cargo Type: " + cargoBed);
        System.out.println("Cargo Size: " + cargoSize);
        System.out.println("Cargo Load: " + cargoLoad);
        System.out.println();
    }
}