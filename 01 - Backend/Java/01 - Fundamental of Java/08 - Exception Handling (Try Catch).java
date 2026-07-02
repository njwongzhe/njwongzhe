// Exception Handling: Robust handling of runtime errors.

import java.io.FileReader;
import java.io.IOException;

// 1. Custom Checked Exception.
class InvalidAgeException extends Exception {
    public InvalidAgeException(String message) {
        super(message);
    };
}

class ExceptionDemo {
    // Declaring a method that throws a checked exception using 'throws'.
    public static void checkAge(int age) throws InvalidAgeException {
        if (age < 0) {
            // Throw exception explicitly using 'throw'.
            throw new InvalidAgeException("Age cannot be negative.");
        }
        System.out.println("Age validated: " + age);
    };

    public static void main(String[] args) {
        /* 2. Basic try-catch-finally Block */
        System.out.println("--- 1. Basic try-catch-finally ---");
        try {
            int result = 10 / 0; // Throws ArithmeticException.
            System.out.println("Result: " + result); // Will not execute.
        } catch (ArithmeticException e) {
            System.out.println("Caught exception: " + e.getMessage());
        } finally {
            System.out.println("Finally block always executes.");
        }
        System.out.println();

        /* 3. Multi-catch Block */
        System.out.println("--- 2. Multi-catch ---");
        try {
            int[] numbers = new int[3];
            numbers[5] = 100; // Throws ArrayIndexOutOfBoundsException.
        } catch (NullPointerException | ArrayIndexOutOfBoundsException e) {
            System.out.println("Caught reference or bounds exception: " + e.getMessage());
        }
        System.out.println();

        /* 4. Custom Exception & Throws Handling */
        System.out.println("--- 3. Custom Exception ---");
        try {
            checkAge(-5);
        } catch (InvalidAgeException e) {
            System.out.println("Custom Exception caught: " + e.getMessage());
        }
        System.out.println();

        /* 5. Try-with-resources */
        // Automatically closes resources that implement AutoCloseable (such as file streams) when exiting try block.
        System.out.println("--- 4. Try-with-resources ---");
        try (FileReader reader = new FileReader("nonexistent.txt")) {
            int data = reader.read();
            System.out.println("File data: " + data);
        } catch (IOException e) {
            System.out.println("Automatically handled resource exception: " + e.getMessage());
        }
    }
}
