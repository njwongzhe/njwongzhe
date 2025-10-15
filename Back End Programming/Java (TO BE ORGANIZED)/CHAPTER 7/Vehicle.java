abstract class Vehicle extends Object {
    private String brand;
    private String engine;
    protected String type;
    public String color;

    public Vehicle() {
        System.out.println("Call Vehicle constructor #1");
    }

    public Vehicle(String brand) {
        System.out.println("Call Vehicle constructor #2");
        this.brand = brand;
    }

    public void setEngine(String engine) {
        this.engine = engine;
    }

    public String getEngine() {
        return this.engine;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getBrand() {
        return this.brand;
    }

    public abstract int speedLimit();

    public void printInfo() {
        System.out.println("Brand: " + this.brand);
        System.out.println("Engine: " + this.engine);
        System.out.println("Type: " + this.type);
        System.out.println("Color: " + this.color);
    }
}
