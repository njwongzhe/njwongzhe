// Class & Object: Blueprint and instance of object-oriented programming.

// Demarcates package location. In real use, package declarations must be the first line of the file.
// package 01 - Fundamental of Java;

// Demonstrating imports. Java.lang.* classes (like String or System) are automatically imported.
import java.util.Date; // Explicitly import classes from Java Standard Library.

// A helper class representing a Student.
class Student {
    // 1. Access Modifiers:
    // private: accessible only within this class.
    // public: accessible from any class.
    // protected: accessible within same package and subclasses.
    // package-private (no modifier): accessible only within same package.
    private String name;
    private int age;

    // 2. Static Variables: Shared among all instances of this class.
    public static String school = "UTM";
    public static int studentCount = 0;

    // 3. Constructor Chaining: calling one constructor from another using this().
    /* Constructor 1: Default Constructor */
    public Student() {
        this("Unknown", 18); // Calls Constructor 2.
    };

    /* Constructor 2: Parameterized Constructor */
    public Student(String name, int age) {
        this.name = name; // 'this' resolves ambiguity between member variable and parameter.
        this.age = age;
        studentCount++; // Increment total student count.
    };

    // 4. Instance Methods: Belong to an instance, can access instance and static variables.
    public void displayInfo() {
        System.out.println("Name: " + this.name + ", Age: " + this.age + ", School: " + school);
    };

    // 5. Static Methods: Belong to the class, can only access static members. Cannot use 'this'.
    public static void displayStudentCount() {
        System.out.println("Total Students Registered: " + studentCount);
        // System.out.println(name); // Error: Cannot access instance variable from static context.
    };
}

class ClassObjectDemo {
    public static void main(String[] args) {
        System.out.println("--- 1. Accessing Static Member Directly ---");
        System.out.println("School Name: " + Student.school);
        Student.displayStudentCount();
        System.out.println();

        System.out.println("--- 2. Instantiating Objects ---");
        // Creating student1 using default constructor.
        Student student1 = new Student();
        student1.displayInfo();

        // Creating student2 using parameterized constructor.
        Student student2 = new Student("Alice", 21);
        student2.displayInfo();
        System.out.println();

        System.out.println("--- 3. Updated Static Count ---");
        Student.displayStudentCount();
        System.out.println();

        System.out.println("--- 4. Imports Demo ---");
        Date currentDate = new Date(); // Creates a Date object from the imported java.util.Date package.
        System.out.println("Current Date & Time: " + currentDate.toString());
    }
}
