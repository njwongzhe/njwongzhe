import java.util.Scanner;

public class JavaUtilScanner {
    public static void main(String[] args)
    {
        String name;
        int age;
        double height, weight;

        Scanner input = new Scanner(System.in);

        System.out.println("BMI Calculator");

        System.out.print("Name : "); name = input.nextLine();
        System.out.print("Age  : "); age = input.nextInt();
        System.out.print("Height (m)  : "); height = input.nextDouble();
        System.out.print("Weight (kg) : "); weight = input.nextDouble();

        System.out.print("BMI of " + name + " (" + age + " years old) is " + (weight / (height * height)));
        
        input.close();
    }
}
