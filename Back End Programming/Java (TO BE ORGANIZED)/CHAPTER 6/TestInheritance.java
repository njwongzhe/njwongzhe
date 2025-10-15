public class TestInheritance {
    public static void main(String[] args) {
        SubClass test1 = new SubClass(); // Run SuperClass Constructor 1 & SubClass Constructor 1.
        SubClass test2 = new SubClass(1); // Run SuperClass Constructor 1 & SubClass Constructor 2.
    }
}

class SuperClass {
    public SuperClass() {
        System.out.println("Run SuperClass Constructor 1");
    }

    public SuperClass(int a) {
        System.out.println("Run SuperClass Constructor 2");
    }
}

class SubClass extends SuperClass {
    public SubClass() {
        System.out.println("Run SubClass Constructor 1");
    }

    public SubClass(int a) {
        System.out.println("Run SubClass Constructor 2");
   }
}
