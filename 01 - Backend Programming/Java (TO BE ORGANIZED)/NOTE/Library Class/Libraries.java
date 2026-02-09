// import java.util.*; // Import all Class from util Package.
import java.util.Scanner; // Import Scanner Class from util Package.

public class Libraries {
    public static void main(String[] args)
    {
        int num1, num2;
        Scanner scn = new Scanner(System.in);

        System.out.println("This program will calculate the total of both integer.");
        System.out.print("First Number  : "); num1 = scn.nextInt();
        System.out.print("Second Number : "); num2 = scn.nextInt();
        System.out.print("Total = " + (num1 + num2));

        scn.close();
    }
}