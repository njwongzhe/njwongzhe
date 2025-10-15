import java.util.ArrayList;

public class TestArrayList2 {
    public static void main(String [] args) {
		System.out.println("Test ArrayList");
        System.out.println();

		ArrayList anything = new ArrayList(); // Without <> can store any data.

		anything.add("JB");
		anything.add(new Employee(456, "Alice"));
		anything.add("Skudai");

        for (Object obj : anything) {
            if (obj instanceof Employee) // If anything from Employee Class.
                ((Employee)obj).printInfo(); // Casting
            else 
                System.out.println(obj);
		}
	}
}
