@FunctionalInterface
interface Math {
    int operate(int x, int y);
}

public class TestFunctional {
    public static void main(String [] args) {
        System.out.println("Test Functional Programming:\n");

        // int a = 5 + 10;
        Math calc = (a, b) -> a + b;
        System.out.println("2 + 3 = " + calc.operate(2, 3));

        // a = 100;
        calc = (a, b) -> { 
            int result = a - b;
            if(result < 0) result = result * -1;
            return result; 
        };

        System.out.println("2 - 3 = " + calc.operate(2, 3));
        System.out.println("5 - 3 = " + calc.operate(5, 3));
        System.out.println("3 - 5 = " + calc.operate(3, 5));
        System.out.println();

        Math add = (a, b) -> a + b;
        Math minusAbs = calc;
        System.out.println("     add.operate(3, 5) = " + add.operate(3, 5));
        System.out.println("minusAbs.operate(3, 5) = " + minusAbs.operate(3, 5));
    }
}
