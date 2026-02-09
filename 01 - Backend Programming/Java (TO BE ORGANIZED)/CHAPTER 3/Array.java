import java.util.Scanner;

public class Array {
    public static void main(String[] args) {
        System.out.println("Test Java Array");
        System.out.println();

        // Practice #1
        // Create array to store integer numbers 1-5 and total up the numbers.
        int[] ary1 = {1, 2, 3, 4, 5};
        System.out.println("Total 1 until 5 = " + (ary1[0] + ary1[1] + ary1[2] + ary1[3] + ary1[4]));
        System.out.println();
    
        // Practice #2
        // Interactively get input of 3 double values from user and store it in an array. 
        // Find the highest / lowest values and calculate the average.
        double[] ary2 = new double[3];
        Scanner scn = new Scanner(System.in);
        System.out.println("Average of 3 Floating Point");
        System.out.println("---------------------------");
          System.out.print("Value 1 : "); ary2[0] = scn.nextDouble();
          System.out.print("Value 2 : "); ary2[1] = scn.nextDouble();
          System.out.print("Value 3 : "); ary2[2] = scn.nextDouble();
        System.out.println("---------------------------");
        System.out.println("Highest : " + ArrayTools.highest(ary2));
        System.out.println("Lowest  : " + ArrayTools.lowest(ary2));
        System.out.println("Average : " + String.format(" %.2f", ArrayTools.average(ary2))); // Average show in 2 decimal place.
        /* OR */ // System.out.printf("Average : %.2f", tool.average(ary2));
        scn.close();
    }
}

class ArrayTools {
    public static double highest(double[] ary) {
        double high = ary[0];
        for(int i = 0; i < ary.length; i += 1) if (ary[i] > high) high = ary[i];
        return high;
    }

    public static double lowest(double[] ary) {
        double low = ary[0];
        for(int i = 0; i < ary.length; i += 1) if (ary[i] < low) low = ary[i];
        return low;
    }

    public static double average(double[] ary) {
        double avg = 0,  total = 0;
        for(int i = 0; i < ary.length; i += 1) total += ary[i]; 
        avg = total / ary.length;
        return avg;
    }
}