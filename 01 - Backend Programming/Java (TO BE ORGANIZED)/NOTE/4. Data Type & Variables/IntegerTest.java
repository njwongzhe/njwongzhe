public class IntegerTest {
    public static void main(String[] args)
    {
        byte a = 1;
        short b = 2;
        int c = -3;
        long d = 2147483647, e = 2147483648L; 
        // long e = 2147483648; // Not Accepted

        System.out.println(a); // Output will be '1' and newline.
        System.out.println(b); // Output will be '2' and newline.
        System.out.println(c); // Output will be '-3' and newline.
        System.out.println(d); // Output will be '2147483647' and newline.
        System.out.print(e);   // Output will be '2147483648'.
    }
}