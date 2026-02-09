public class ArrayAnonymous {
    public static void main(String[] args) {
        System.out.println(getMax(1, 2, 3, 4, 5, 6, 7, 8)); // Output is '8.0'.
        System.out.println(getMax(1, 2, 3, 4, 5, 6, 7));    // Output is '7.0'.

        double[] ary = {1, 2, 3, 4}; // OR // double[] ary = new double[] {1, 2, 3, 4};
        System.out.println(getMax(ary)); // Output is '4.0'.

        System.out.println(getMax(new double[] {5, 6, 7, 8})); // Output is '8.0'.
    }

    public static double getMax(double ... value) { // value will be treat as a array.
        double largest = 0;

        for(int i = 0; i < value.length; i += 1) 
            if (value[i] > largest) largest = value[i];

        return largest;
    }
}