public class NarrowingConversion1 {
    public static void main(String[] args)
    {
        int a = 1000;       // a (32 Bits) = 0000 0000 0000 0000 0000 0011 1110 1000 in Binary = 1000 in Decimal
        byte b = (byte)(a); // b (8 Bits)  =                               1110 1000 in Binary = -24 in Decimal
                            // (Data Loss During Conversion)

                            // 2's Complement b to Decimal = 1110 1000
                            //                             = 1110 1000 - 1 
                            //                             = 1110 0111
                            //                             = -(0001 1000)
                            //                             = -24 

        System.out.print(a + " and " + b); // Output will be '1000 and -24'.
    }
}