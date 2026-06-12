public class WideningConversion {
    public static void main(String[] args)
    {
        byte a = 1; // a (8 Bits)  =                               0000 0001 in Binary = 1 in Decimal
        int b = a;  // b (32 Bits) = 0000 0000 0000 0000 0000 0000 0000 0001 in Binary = 1 in Decimal
    
        System.out.print(a + " and " + b); // Output will be '1 and 1'.
    }
}