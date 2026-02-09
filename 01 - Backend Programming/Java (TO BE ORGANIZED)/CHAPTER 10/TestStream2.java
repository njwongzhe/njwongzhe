import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.*;

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
        return name + ", " + department + ", " + age;
    }
}

public class TestStream2 {

    public static void main(String[] args) {
        Employee emp1 = new Employee("John", "IT", 27);
        Employee emp2 = new Employee("Alice", "HR", 35);
        Employee emp3 = new Employee("Bob", "HR", 44);
        Employee emp4 = new Employee("Adam", "IT", 52);
        Employee emp5 = new Employee("Marry", "HR", 22);

        // No Sort
        System.out.println("List of Employee: ");
        Arrays.asList(emp1, emp2, emp3, emp4, emp5).stream().forEach(System.out::println); // toString() replace the output pattern.
        System.out.println();

        // Sort By Name
        System.out.println("Sort By Name (With Number): ");
        List<Employee> sortedByName = Arrays.asList(emp1, emp2, emp3, emp4, emp5).stream()                 /* stream can change to any other variable. */    // Step 1 : Create Stream 
                                                                                 .sorted(Comparator.comparing(stream -> stream.name))                        // Step 2 : Perform Intermediate Operation
                                                                                 .collect(Collectors.toList());                                              // Step 3 : Stop (collect / forEach / count)
        IntStream.range(0, sortedByName.size()).forEach(stream -> System.out.println((stream + 1) + ". " + sortedByName.get(stream))); 
        System.out.println();

        System.out.println("Sort By Name (Without Number): ");
        Arrays.asList(emp1, emp2, emp3, emp4, emp5).stream().sorted(Comparator.comparing(stream1 -> stream1.name)).forEach(System.out::println); // print Method 1
        System.out.println();
        Arrays.asList(emp1, emp2, emp3, emp4, emp5).stream().sorted(Comparator.comparing(stream1 -> stream1.name)).forEach(n -> System.out.println(n)); // print Method 2
        System.out.println();

        // Sort By Department
        System.out.println("Sort By Department (Without Number): ");
        Arrays.asList(emp1, emp2, emp3, emp4, emp5).stream().sorted(Comparator.comparing((Employee stream2) -> stream2.department)).forEach(stream -> System.out.println(stream)); // Ascending
        System.out.println();
        Arrays.asList(emp1, emp2, emp3, emp4, emp5).stream().sorted(Comparator.comparing((Employee stream2) -> stream2.department).reversed()).forEach(stream -> System.out.println(stream)); // Descending
        System.out.println();                                                            // Prefer put the data type (class name) to avoid error. 

        // Sort By Age
        System.out.println("Sort By Age (Without Number): ");
        Arrays.asList(emp1, emp2, emp3, emp4, emp5).stream().sorted(Comparator.comparing(stream3 -> stream3.age)).forEach(stream -> System.out.println(stream));
        System.out.println();

        // Sort By Name & From IT Department
        System.out.println("Sort By Name & From IT Department (Without Number): ");
        Arrays.asList(emp1, emp2, emp3, emp4, emp5).stream().filter(s -> s.department == "IT").sorted(Comparator.comparing(s -> s.name)).forEach(System.out::println);
        System.out.println();
    }
}   