public class TestStatic1 {
    static int test1 = 0; // Static member exist independently before any instances create for the class.
    int test2 = 0;

    public TestStatic1() {
        test1++;
        test2++;
    }

    public static void main(String[] args) { // main is always static and it cannot access any non static variable directly.
        TestValue obj1 = new TestValue();
        obj1.printTest(); // Output will be '1 and 1'.

        TestValue obj2 = new TestValue();
        obj2.printTest(); // Output will be '2 and 1'.

        TestValue obj3 = new TestValue();
        obj3.printTest(); // Output will be '3 and 1'.

        new TestStatic1();
        new TestStatic1();
        new TestStatic1();
        System.out.println(test1); // Output will be '3'.
        // System.out.println(test2); // Error : Non static variable cannot be referenced from a static context.
                                      // This concept will also be apply to a static class or method.
    }

    public int getTest2() {
        return test2;
    }
}

class TestValue {
    private static int test1 = 0; // Static member exist independently before any instances create for the class.
                                  // Any object do the modification on a static variable, it also will effect to other object.
    private int test2 = 0; // Non static member only exist when a object is create.
                           // Any object do the modification on a non static variable will not bring to the other object.

    public TestValue() {
        test1++;
        test2++;
    }

    public void printTest() {
        System.out.println(test1 + " and " + test2);
    }
}

// As a result, static can be apply to any variable, class, method or blocks that we want a modification on any object for same class
// can effect to every other object for same class.