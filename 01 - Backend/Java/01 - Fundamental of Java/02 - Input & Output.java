// Input & Output: Reading from console, showing dialog boxes, and manipulating String objects.

import java.util.Scanner;             // Required for reading console input.
import javax.swing.JOptionPane;       // Required for GUI message/input dialogs.

class InputOutputDemo {
    public static void main(String[] args) {
        /* 1. String Library Class Operations */
        System.out.println("--- 1. String Operations ---");
        String name = "Zhang San";
        
        // Basic methods.
        int length = name.length();         // Returns the total number of characters. Value is 9.
        char firstLetter = name.charAt(0);  // Returns character at index 0. Value is 'Z'.
        String upper = name.toUpperCase();  // Converts String to uppercase.
        String lower = name.toLowerCase();  // Converts String to lowercase.
        boolean isEqual = name.equals("Zhang San"); // Compares values. Always use equals() for String value comparison.

        System.out.println("Original String : " + name);
        System.out.println("Length of String: " + length);
        System.out.println("First Character : " + firstLetter);
        System.out.println("Uppercase       : " + upper);
        System.out.println("Lowercase       : " + lower);
        System.out.println("Is Equal        : " + isEqual);
        System.out.println();

        /* 2. Console Input (java.util.Scanner) */
        System.out.println("--- 2. Console Input ---");
        Scanner scn = new Scanner("User\n21\n1.75\n70.5\n"); // Using predefined String inside Scanner for automated execution.
        // In real use, construct Scanner using System.in: Scanner scn = new Scanner(System.in);
        
        System.out.print("Enter Name: ");
        String consoleName = scn.nextLine(); // Reads a full line of text.
        
        System.out.print("Enter Age: ");
        int consoleAge = scn.nextInt();     // Reads an integer.
        
        System.out.print("Enter Height (m): ");
        double consoleHeight = scn.nextDouble(); // Reads a double.
        
        System.out.print("Enter Weight (kg): ");
        double consoleWeight = scn.nextDouble(); // Reads another double.

        double bmi = consoleWeight / (consoleHeight * consoleHeight);
        System.out.println("Console Output - " + consoleName + " (Age " + consoleAge + ") BMI: " + bmi);
        
        scn.close(); // Close the scanner to release resources.
        System.out.println();

        /* 3. GUI Input & Dialogs (javax.swing.JOptionPane) */
        System.out.println("--- 3. GUI Dialog Input (Documentation Only) ---");
        // Below is the syntax demonstrating JOptionPane inputs. 
        // Note: Running JOptionPane inside automated tests might hang if not running in a graphical environment.
        // We comment them out or demonstrate with mock values, but show the exact syntax.
        
        /*
        // Displaying a message dialog.
        JOptionPane.showMessageDialog(null, "BMI Calculator Start.");

        // Reading string inputs from dialogs.
        String inputName = JOptionPane.showInputDialog("Enter your name:");

        // Parsing String input into primitive data types.
        int inputAge = Integer.parseInt(JOptionPane.showInputDialog("Enter your age:"));
        double inputHeight = Double.parseDouble(JOptionPane.showInputDialog("Enter your height (m):"));
        double inputWeight = Double.parseDouble(JOptionPane.showInputDialog("Enter your weight (kg):"));

        double calculatedBmi = inputWeight / (inputHeight * inputHeight);
        
        // Displaying the final result in a dialog.
        JOptionPane.showMessageDialog(null, "BMI of " + inputName + " (" + inputAge + " years old) is " + calculatedBmi);
        
        // Explicitly terminate GUI threads.
        System.exit(0);
        */
        
        // Example of parsing methods in action.
        String ageString = "25";
        int parsedAge = Integer.parseInt(ageString); // Converts String to int.
        System.out.println("Parsed Age: " + parsedAge);
    }
}
