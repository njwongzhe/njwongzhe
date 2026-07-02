public class Parse {
    public static void main(String[] args)
    {
        String test = "1";
        byte a = Byte.parseByte(test);
        short b = Short.parseShort(test);
        int c = Integer.parseInt(test);
        long d = Long.parseLong(test);
        float e = Float.parseFloat(test);
        double f = Double.parseDouble(test);

        System.out.println(a); // Output will be '1' and newline.
        System.out.println(b); // Output will be '1' and newline.
        System.out.println(c); // Output will be '1' and newline.
        System.out.println(d); // Output will be '1' and newline.
        System.out.println(e); // Output will be '1.0' and newline.
        System.out.println(f); // Output will be '1.0' and newline.
    }
}