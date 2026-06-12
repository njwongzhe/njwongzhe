public class FloatingPointTest {
    public static void main(String[] args)
    {
        float a = 1, b = 1.1F; // float b = 1.1; // Not Accepted
        double c = 1.11;
        
        System.out.println(a); // Output will be '1.0' and newline.
        System.out.println(b); // Output will be '1.1' and newline.
        System.out.print(c);   // Output will be '1.11'.
    }
}