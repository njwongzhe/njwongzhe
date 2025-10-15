import javax.swing.JOptionPane;

public class JavaxSwingJOptionPane {
    public static void main(String[] args)
    {
        String name;
        int age;
        double height, weight, bmi;

        JOptionPane.showMessageDialog(null, "BMI Calculator");

        name = JOptionPane.showInputDialog("Name");
        age = Integer.parseInt(JOptionPane.showInputDialog("Age"));
        height = Double.parseDouble(JOptionPane.showInputDialog("Height (m)"));
        weight = Double.parseDouble(JOptionPane.showInputDialog("Weight (kg)"));

        bmi = weight / (height * height);

        JOptionPane.showMessageDialog(null, "BMI of " + name + " (" + age + " years old) is " + bmi);

        System.exit(0);
    }
}
