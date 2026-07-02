// Control Flow: Controlling the execution order of program instructions.

class ControlFlowDemo {
    public static void main(String[] args) {
        /* 1. Selection (if-else) */
        int score = 85;
        System.out.println("--- 1. if-else Statement ---");
        if (score >= 90) {
            System.out.println("Grade: A");
        } else if (score >= 80) {
            System.out.println("Grade: B"); // This will execute.
        } else {
            System.out.println("Grade: C");
        }
        System.out.println();

        /* 2. Selection (switch) */
        int day = 3;
        System.out.println("--- 2. switch Statement ---");
        switch (day) {
            case 1:
                System.out.println("Monday");
                break;
            case 2:
                System.out.println("Tuesday");
                break;
            case 3:
                System.out.println("Wednesday"); // This will execute.
                break;
            default:
                System.out.println("Other day");
                break;
        }
        System.out.println();

        /* 3. Loops (while & do-while) */
        System.out.println("--- 3. while & do-while Loops ---");
        int count = 1;
        while (count <= 3) {
            System.out.print(count + " ");
            count++;
        }
        System.out.println("(while end)");

        int number = 10;
        do {
            System.out.println("do-while executes at least once even if condition is false. Number: " + number);
        } while (number < 5);
        System.out.println();

        /* 4. Loops (for & enhanced-for / for-each) */
        System.out.println("--- 4. for & for-each Loops ---");
        // Standard for loop.
        for (int i = 0; i < 3; i++) {
            System.out.print(i + " ");
        }
        System.out.println("(for end)");

        // Array and enhanced for loop.
        int[] numbers = {10, 20, 30};
        for (int num : numbers) {
            System.out.print(num + " ");
        }
        System.out.println("(for-each end)");
        System.out.println();

        /* 5. break & continue */
        System.out.println("--- 5. break & continue ---");
        for (int i = 1; i <= 5; i++) {
            if (i == 2) {
                continue; // Skip the rest of loop body for i = 2.
            }
            if (i == 4) {
                break; // Terminate loop when i reaches 4.
            }
            System.out.print(i + " ");
        }
        System.out.println("(break/continue end)");
    }
}
