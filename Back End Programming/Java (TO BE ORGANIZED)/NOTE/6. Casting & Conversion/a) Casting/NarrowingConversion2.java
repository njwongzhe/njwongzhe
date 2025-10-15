public class NarrowingConversion2 {
    public static void main(String[] args)
    {
        byte byte1 = 1, byte2;
        byte2 = byte1;             
        byte2 = (byte)(byte1 + 1);
        // byte2 = byte1 + 1; // Not Accepted

        short short1 = 1, short2;
        short2 = byte1;
        short2 = short1;            
        short2 = (short)(short1 + 1);
        // short2 = short1 + 1; // Not Accepted

        char char1 = 65, char2;
        char2 = char1;            
        char2 = (char)(char1 + 1);
        // char2 = char1 + 1; // Not Accepted

        System.out.print(byte2 + " / " + short2 + " / " + char2); // Output will be '2 / 2 / B'.
    }
}