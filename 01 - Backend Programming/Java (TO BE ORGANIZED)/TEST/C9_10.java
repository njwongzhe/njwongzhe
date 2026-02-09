import java.util.Arrays; // Arrays
import java.util.Comparator;
import java.util.List;   // List
import java.util.OptionalDouble; // OptionalDouble
import java.util.OptionalInt;    // OptionalInt
import java.util.stream.Collectors;
import java.util.stream.DoubleStream; // DoubleStream
import java.util.stream.IntStream;    // IntStream
import java.util.stream.LongStream;   // LongStream
import java.util.stream.Stream;       // Stream

class Employee {
    public String name;
    public String department;
    public int age;

    public Employee(String name, String department, int age) {
        this.name = name;
        this.department = department;
        this.age = age;
    }

    public String toString() {
        return (name + ", " + department + ", " + age);
    }
}

@FunctionalInterface
interface BiFunction {
    int sum(int a, int b, int c);
}

@FunctionalInterface
interface Supplier {
    int num();
}

public class C9_10 {
    public static void main(String[] args)
    {   
        BiFunction numA = (num1, num2, num3) -> {return num1 + num2 + num3;}; // Multiple Input, 1 Output
        Supplier numB = () -> {return 1;};                                    // No Input, 1 Output.

        List<Integer> list1 = List.of(1, 2, 3, 4, 5);       // Data inside cannot add, remove or modify.
        List<Integer> list2 = Arrays.asList(1, 2, 3, 4, 5); // Array.asList() is fixed format which cannot be modified. // Data inside cannot add or remove but can modify.
        Stream s1 = list1.stream();
        Stream s2 = list2.stream();

        IntStream s3_0 = IntStream.of(1, 2, 3, 4, 5);                 // Primitive Stream
        LongStream s3_1 = LongStream.of(1, 2, 3, 4, 5);               // Primitive Stream
        DoubleStream s3_2 = DoubleStream.of(1.1, 2.1, 3.1, 4.1, 5.1); // Primitive Stream

        IntStream s4_0 = IntStream.range(1, 6);       // 1, 2, 3, 4, 5 (Exclude 6)
        IntStream s4_1 = IntStream.rangeClosed(1, 5); // 1, 2, 3, 4, 5 (Include 5)
        LongStream s4_2 = LongStream.range(1L, 6L);       // 1, 2, 3, 4, 5 (Exclude 6)
        LongStream s4_3 = LongStream.rangeClosed(1L, 5L); // 1, 2, 3, 4, 5 (Include 5)
        // range() and rangeClosed() are only can be used by IntStream and LongStream.

        IntStream s5_0 = IntStream.iterate(1, n -> n + 1);          // Start From 1 and Increment by 1. (Infinite Stream)
        IntStream s5_1 = IntStream.iterate(1, n -> n + 1).limit(5); // Start From 1 and Increment by 1. (Limit to 5)
        IntStream s5_2 = IntStream.generate(() -> 1);               // Generate Infinite Stream of 1. (Infinite Stream)
        IntStream s5_3 = IntStream.generate(() -> 1).limit(5);      // Generate Infinite Stream of 1. (Limit to 5)
        IntStream s5_4 = IntStream.generate(() -> (int)(Math.random() * 100)).limit(5); // Generate Infinite Stream of Random Number. (Limit to 5)
                                                                                        // * 100 is to make it between 0 and 100 since Math.random() returns a value between 0.0 and 1.0.

        int s6_1 = IntStream.of(1, 2, 3, 4, 5).sum(); 
        long s6_2 = IntStream.of(1, 2, 3, 4, 5).count(); // long or double is used to count the number of elements in the stream.

        int s6_3 = IntStream.of(1, 2, 3, 4, 5).max().orElse(0); // Get the maximum value in the stream, or return 0 if the stream is empty.
        int s6_4 = IntStream.of(1, 2, 3, 4, 5).min().orElse(0); // Get the minimum value in the stream, or return 0 if the stream is empty.
        int s6_5 = IntStream.of(1, 2, 3, 4, 5).max().getAsInt(); // Get the maximum value in the stream, or throw an exception if the stream is empty.
        int s6_6 = IntStream.of(1, 2, 3, 4, 5).min().getAsInt(); // Get the minimum value in the stream, or throw an exception if the stream is empty.
        // max() and min() return an OptionalInt, so we need to use orElse() or getAsInt() to get the int value. (getAsDouble() for double stream, getAsLong() for long stream)
        OptionalInt s6_7 = IntStream.of(1, 2, 3, 4, 5).max(); // Get the average value in the stream, or return an empty OptionalInt if the stream is empty.
        OptionalInt s6_8 = IntStream.of(1, 2, 3, 4, 5).min(); // Get the minimum value in the stream, or return an empty OptionalInt if the stream is empty.
        // OptionalInt is a container object which may or may not contain a value such as max() or min().
        OptionalDouble s6_9 = IntStream.of(1, 2, 3, 4, 5).average(); // Get the average value in the stream, or return 0.0 if the stream is empty. (double only)
        // OptionalDouble is a container object which may or may not contain a value such as average().
        // average() returns an OptionalDouble, so we need to use orElse() or getAsDouble() to get the double value.
        
        Stream<Integer> s7 = Stream.of(1, 2, 3, 4, 5);// Object Stream
        s7.forEach(System.out::println); System.out.println();
        // s7.forEach(System.out::println); // Error : A stream only can use one times.



        Stream.of(1, 2, 3, 4, 5).forEach(System.out::println);                System.out.println(); // Print each element in the stream.
        Stream.of(1, 2, 3, 4, 5).forEach(num -> System.out.print(num + " ")); System.out.println("\n"); // Print each element in the stream using lambda expression.
        // forEach() is a terminal operation that consumes the stream and performs an action for each element in the stream.

        List.of(1, 2, 3, 4, 5).stream().filter(n -> n < 3).forEach(System.out::println);                                                             System.out.println(); 
        Arrays.asList("AliA", "BliB", "CliC", "DliD", "EliE").stream().filter(c -> c.startsWith("A")).forEach(System.out::println);                  System.out.println(); 
        Arrays.asList("AliA", "BliB", "CliC", "DliD", "EliE").stream().filter(c -> c.endsWith("A") || c.endsWith("C")).forEach(System.out::println); System.out.println(); 
        Arrays.asList("AliA", "BliB", "CliC", "DliD", "EliE").stream().filter(c -> c.contains("A")).forEach(System.out::println);                    System.out.println();
        // filter() is used to filter the elements in the stream based on a condition. It returns a new stream with only the elements that match the condition.
        
        List.of(1, 2, 3, 4, 5).stream().map(n -> n * n).forEach(System.out::println); System.out.println(); 
        List.of(1, 2, 3, 4, 5).stream().map(n -> 1).forEach(System.out::println); System.out.println(); 
        Arrays.asList("AliA", "BliB", "CliC", "DliD", "EliE").stream().map(c -> c.toUpperCase()).forEach(System.out::println); System.out.println();
        Arrays.asList("AliA", "BliB", "CliC", "DliD", "EliE").stream().map(c -> c.toLowerCase()).forEach(System.out::println); System.out.println();
        // map() is used to transform each element in the stream to a new value. It can be used to apply a function to each element in the stream.

        Employee emp1 = new Employee("John", "IT", 27);
        Employee emp2 = new Employee("Alice", "HR", 35);
        Employee emp3 = new Employee("Bob", "HR", 44);
        Employee emp4 = new Employee("Adam", "IT", 52);
        Employee emp5 = new Employee("Adam", "IT", 50);

        List.of(3, 2, 1, 4, 5).stream().sorted().forEach(System.out::println);                                                                           System.out.println(); 
        List.of(3, 2, 1, 4, 5).stream().sorted(Comparator.reverseOrder()).forEach(System.out::println);                                                  System.out.println();
        List.of(emp1, emp2, emp3, emp4, emp5).stream().sorted(Comparator.comparing((Employee emp) -> emp.name)).forEach(System.out::println);            System.out.println();// Sort by name in ascending order.
        List.of(emp1, emp2, emp3, emp4, emp5).stream().sorted(Comparator.comparing((Employee emp) -> emp.name).reversed()).forEach(System.out::println); System.out.println();// Sort by name in reverse order.
        List.of(emp1, emp2, emp3, emp4, emp5).stream().sorted(Comparator.comparing((Employee emp) -> emp.name).reversed().thenComparing((Employee emp) -> emp.age).reversed()).forEach(System.out::println); System.out.println();
                                                                                 // Prefer put the data type (class name) to avoid error. 


        List<Integer> list3 = list2.stream().collect(Collectors.toList());
        int[] ary = (list2.stream().toArray()).intValue();
    }
}