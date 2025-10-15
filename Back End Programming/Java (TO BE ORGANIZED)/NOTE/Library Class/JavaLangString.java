import java.lang.String; // Not Compulsory

public class JavaLangString {
    public static void main(String[] args)
    {
        String name = "Zhang San";
        /* OR */
        // String name = new String("Zhang San");

        String upper = name.toUpperCase(), 
               lower = name.toLowerCase();  
        char letter = name.charAt(0);      
        int stringSize = name.length();   
        /* OR */
        // String upper = "Zhang San".toUpperCase(),
        //        lower = "Zhang San".toLowerCase();
        // char letter = "Zhang San".charAt(0);
        // int stringSize = "Zhang San".length();

        System.out.println("Original     : " + name);       // Output will be 'Original     : Zhang San' and newline.
        System.out.println("Uppercase    : " + upper);      // Output will be 'Uppercase    : ZHANG SAN' and newline.
        System.out.println("Lowercase    : " + lower);      // Output will be 'Lowercase    ：zhang san' and newline.
        System.out.println("First Letter : " + letter);     // Output will be 'First Letter : Z' and newline.
        System.out.println("Total Length : " + stringSize); // Output will be 'Total length : 9'.
    }
}