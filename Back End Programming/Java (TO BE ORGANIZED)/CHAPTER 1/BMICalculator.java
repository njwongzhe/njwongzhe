import java.util.Scanner; // Import Scanner Class from util Package.

class BMICalculator {
    public static void main(String[] args) {
        String name;
        int weight;
        double height;

        Scanner scn = new Scanner(System.in);

        
        weight = scn.nextInt();
        height = scn.nextDouble();
        scn.nextLine(); // Deal with 1BUFFER
        name = scn.nextLine();

        System.out.println("\nName: " + name); 
        System.out.println("Weight: " + weight); 
        System.out.println("Height: " + height); 

        System.out.println("Your BMI: " + (weight / (height * height))); 

        scn.close();
    }
}
