import java.util.Scanner;

public class TestRectangle {
    public static void main(String[] args) {
        System.out.println("Test Rectangle class");

        Rectangle rect1 = new Rectangle();
        rect1.setName("Rectangle 1");
        rect1.setWidth(4);
        rect1.setLength(3);

        Rectangle rect2 = new Rectangle("Rectangle 2", 3, 4);
        Rectangle rect3 = new Rectangle("Rectangle 3", 5, 6);

        rect1.printInfo();
        rect2.printInfo();
        rect3.printInfo();

        System.out.println();
        System.out.println(rect1.equalSize(rect2)); // true
        System.out.println(rect2.equalSize(rect1)); // true
        System.out.println(rect1.equalSize(rect3)); // false

        System.out.println();
        System.out.println(rect1.equalLayout(rect1)); // true
        System.out.println(rect1.equalLayout(rect2)); // false

        /* Java's Object Default Equals Method (Compare the Address) */
        System.out.println();
        System.out.println(rect1.equals(rect1)); // true 
        // System.out.println((rect1 == rect1)); // Same as equals() method but not prefer.
        System.out.println(rect1.equals(rect2)); // false 
        // System.out.println((rect1 == rect2)); // Same as equals() method but not prefer.

        /* Copy Object to Object */
        // Rectangle rect4 = rect3; // This is just copy the address of rect3 to rect4.

        Rectangle rect4 = rect3.copy(); // Copy content of rect3 to rect4.
        rect4.setName("Rectangle 4");
        rect3.printInfo();
        rect4.printInfo();

        Rectangle rect5 = new Rectangle(rect3); // Copy content of rect3 to rect5.
        rect5.printInfo();

        /* Interactively (Ask Input) Create New Object (Rectangle) */
        Rectangle rect6 = Rectangle.create();
        rect6.printInfo();

    }
}

class Rectangle {
    private String name;
    private int width;
    private int length;

    /* 1st Constructor (new Object) */
    public Rectangle() {
    }

    /* 2nd Constructor (Passing Value) */
    public Rectangle(String n, int w, int l) {
        this.name = n;
        this.width = w;
        this.length = l;
    }

    /* 3rd Constructor (Passing Object) */
    public Rectangle(Rectangle rect) {
        this.name = rect.getName();
        this.width = rect.getWidth();
        this.length = rect.getLength();
    }

    /* Set & Get Methods */
    public void setName(String n) {
        this.name = n;
    }

    public String getName() { 
        return this.name; 
    }

    public void setWidth(int w) {
        this.width = w;
    }

    public int getWidth() { 
        return width; 
    }

    public void setLength(int l) {
        this.length = l;
    }

    public int getLength()  { 
        return length; 
    }

    /* Calculation Method */ 
    public int calcArea() {
        return width * length;
    }

    /* Print Method */
    public void printInfo() {
        System.out.println();
        System.out.println("Name: " + this.name);
        System.out.println("Length: " + this.length);
        System.out.println("Width: " + this.width);
        System.out.println("Area: " + this.calcArea());
    }

    /* Equal Method (Self Defined) */
    public boolean equalSize(Rectangle otherRect) {
        return (this.calcArea() == otherRect.calcArea());
    }

    public boolean equalLayout(Rectangle otherRect) {
        return (this.width == otherRect.width && this.length == otherRect.length);
    }
        
    /* Copy Method */
    public Rectangle copy() {
        return new Rectangle(this.name, this.width, this.length);
    }

    /* Interative Create Method */
    public static Rectangle create() {
        Scanner scn = new Scanner(System.in);
        Rectangle rect = new Rectangle();

        System.out.println();
        System.out.println("Enter Rectangle's Attributes");
        System.out.println("----------------------------");
        System.out.print("Name : "); rect.name = scn.nextLine();
        System.out.print("Width : "); rect.width = scn.nextInt();
        System.out.print("Length : "); rect.length = scn.nextInt();

        scn.close();

        return new Rectangle(rect);
    }


}