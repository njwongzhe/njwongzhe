// Variables, Operators & Arrays: Foundation of data storage and processing in Java.

class VariablesDemo {
    public static void main(String[] args) {
        /* 1. Primitive Data Types */
        // Integer types.
        byte byteVar = 127;             // 1 byte, range -128 to 127.
        short shortVar = 32767;         // 2 bytes, range -32768 to 32767.
        int intVar = 2147483647;        // 4 bytes, range -2^31 to 2^31-1.
        long longVar = 9223372036854775807L; // 8 bytes, range -2^63 to 2^63-1. Requires 'L' suffix.

        // Floating-point types.
        float floatVar = 3.14159f;      // 4 bytes. Requires 'f' or 'F' suffix.
        double doubleVar = 3.14159265;  // 8 bytes. Default for decimal numbers.

        // Character and Boolean types.
        char charVar = 'A';             // 2 bytes, stores a single Unicode character.
        boolean booleanVar = true;      // Stores true or false.

        /* 2. Constants */
        // Declared using the 'final' keyword. Once assigned, the value cannot be changed.
        final int MAX_SPEED = 120;
        // MAX_SPEED = 150; // Error: Cannot assign a value to a final variable.

        /* 3. Type Casting */
        // Widening (Implicit) Casting: Small type to larger type. Automatic and safe.
        int num = 100;
        double implicitDouble = num;

        // Narrowing (Explicit) Casting: Large type to smaller type. Manually specified.
        double fractionalNum = 9.78;
        int explicitInt = (int) fractionalNum; // Fractional part is truncated. Value is 9.

        /* 4. Operators */
        int a = 15;
        int b = 4;
        System.out.println("--- 1. Arithmetic & Relational ---");
        System.out.println("a + b = " + (a + b)); // Addition.
        System.out.println("a / b = " + (a / b)); // Integer Division. Result is 3.
        System.out.println("a % b = " + (a % b)); // Modulus. Result is 3.
        System.out.println("a > b : " + (a > b));  // Relational. Result is true.
        System.out.println();

        /* 5. One-Dimensional Arrays */
        System.out.println("--- 2. One-Dimensional Arrays ---");
        // Method 1: Declare and allocate memory, then assign values.
        int[] scores = new int[3];
        scores[0] = 90;
        scores[1] = 85;
        scores[2] = 95;

        // Method 2: Inline initialization.
        int[] ageList = {20, 21, 22};
        
        System.out.println("Scores Array Length: " + scores.length);
        System.out.println("First element in ageList: " + ageList[0]);
        System.out.println();

        /* 6. Two-Dimensional Arrays (Matrix) */
        System.out.println("--- 3. Two-Dimensional Arrays ---");
        // Method 1: Allocate memory for a 2x3 matrix.
        int[][] matrix = new int[2][3];
        matrix[0][0] = 1;
        matrix[0][1] = 2;
        matrix[0][2] = 3;
        matrix[1][0] = 4;
        matrix[1][1] = 5;
        matrix[1][2] = 6;

        // Method 2: Inline initialization.
        int[][] grid = {
            {10, 20},
            {30, 40}
        };

        System.out.println("Matrix Rows: " + matrix.length);       // Returns row count (2).
        System.out.println("Matrix Columns: " + matrix[0].length); // Returns column count in row 0 (3).
        System.out.println("Grid element at row 1, col 0: " + grid[1][0]);
    }
}
