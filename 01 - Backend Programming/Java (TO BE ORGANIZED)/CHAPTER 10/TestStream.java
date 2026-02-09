import java.util.Arrays;
import java.util.List;
import java.util.function.*;
import java.util.stream.DoubleStream;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class TestStream {
    public static void main(String[] args) {
        List <String> names = List.of("Alice", "Bob", "Adam", "Charlie");

        /* Using conventional loop to iterate array. */
        for(String name : names) // Syntax : For each name in names.
            if(name.startsWith("A")) System.out.println(name);
        System.out.println();

        /* Using stream to iterate array. */
        names.stream().forEach(System.out::println);   
        System.out.println();

        /* Using stream to iterate array. Print all names that start with "A". */
        names.stream()
        .filter(name -> name.startsWith("A"))
        .forEach(System.out::println); // OR // .forEach((name) -> {System.out.println(name);});
        System.out.println();     

        /* Different ways to generate stream for integer number from 1 to 5 and print them. */
        List <Integer> numMethod1 = List.of(1, 2, 3, 4, 5);       // Initial From a List
        List <Integer> numMethod2 = Arrays.asList(1, 2, 3, 4, 5); // Initial From an List (Array)
        int[] numMethod3 = {1, 2, 3, 4, 5};                       // Initial From an Array

        // Print Directly
        numMethod1.stream().forEach(System.out::println);       System.out.println(); 
        numMethod2.stream().forEach(System.out::println);       System.out.println(); 
        Arrays.stream(numMethod3).forEach(System.out::println); System.out.println(); 

        // Print By Objects
        Stream <Integer> streamMethod1 = numMethod1.stream();
        Stream <Integer> streamMethod2 = numMethod2.stream();
        IntStream streamMethod3 = Arrays.stream(numMethod3); // Permitive Specialization
        Stream <Integer> streamMethod4 = Stream.of(1, 2, 3, 4, 5);
        streamMethod1.forEach(System.out::println); System.out.println(); 
        streamMethod2.forEach(System.out::println); System.out.println(); 
        streamMethod3.forEach(System.out::println); System.out.println(); 
        streamMethod4.forEach(System.out::println); System.out.println();

        // Print and Initial Together
        List.of(1, 2, 3, 4, 5).stream().forEach(System.out::println);       System.out.println();
        Arrays.asList(1, 2, 3, 4, 5).stream().forEach(System.out::println); System.out.println();
        Stream.of(1, 2, 3, 4, 5).forEach(System.out::println);              System.out.println(); // Create a Stream of Integer Objects
        IntStream.of(1, 2, 3, 4, 5).forEach(System.out::println);           System.out.println(); // Create a Stream of Primitive int

        // Print By Range
        IntStream.range(1, 6).forEach(System.out::println);       System.out.println(); // 1, 2, 3, 4, 5 (Exclude 6)
        IntStream.rangeClosed(1, 5).forEach(System.out::println); System.out.println(); // 1, 2, 3, 4, 5 (Include 5)

        // Print Odd Numbers
        List.of(1, 2, 3, 4, 5).stream().filter(stream -> stream % 2 != 0).forEach(System.out::println); 
        System.out.println();
        
        IntStream.rangeClosed(1, 5).filter(stream -> stream % 2 != 0).forEach(System.out::println); 
        System.out.println();

        IntStream.iterate(1, n -> n + 2)        // Start From 1 and Increment by 2
                 .limit(5)                      // Limit to 5 Element
                 .forEach(System.out::println); // Print Each Element
        System.out.println();
    
        // Print Lowest, Middle and Highest Number
        double [] num = {1, 2, 3, 4, 5};
        System.out.println("Lowest: " + DoubleStream.of(num).min().getAsDouble());
        System.out.println("Average: " + DoubleStream.of(num).average().getAsDouble());   
        System.out.println("Highest: " + DoubleStream.of(num).max().getAsDouble());
    }   
}
