// File Operation: Reading and writing text files.

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

class FileOperationDemo {
    public static void main(String[] args) {
        String filename = "sample.txt";

        /* 1. Writing to a Text File */
        System.out.println("--- 1. Writing File ---");
        // Using BufferedWriter with FileWriter inside try-with-resources to ensure auto-close.
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filename))) {
            writer.write("Hello, World!");
            writer.newLine(); // Writes platform-dependent newline character.
            writer.write("Java File IO is easy to use.");
            writer.newLine();
            writer.write("End of sample text file.");
            
            System.out.println("Successfully wrote to " + filename);
        } catch (IOException e) {
            System.out.println("An error occurred during file writing: " + e.getMessage());
        }
        System.out.println();

        /* 2. Reading from a Text File */
        System.out.println("--- 2. Reading File ---");
        // Using BufferedReader with FileReader to read lines efficiently.
        try (BufferedReader reader = new BufferedReader(new FileReader(filename))) {
            String line;
            // readLine() returns null when the end of the stream is reached.
            while ((line = reader.readLine()) != null) {
                System.out.println("Read line: " + line);
            }
        } catch (IOException e) {
            System.out.println("An error occurred during file reading: " + e.getMessage());
        }
    }
}
