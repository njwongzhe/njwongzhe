import java.util.Scanner;

public class TestEmployee {
    public static void main (String[] args) {
        System.out.println("Test Employee class");
        System.out.println();

        Employee emp1 = new Employee();
        emp1.setEmpNum(123);
        emp1.setEmpName("Adam");
        System.out.println("Emp. Num  : " + emp1.getEmpNum());
        System.out.println("Emp. Name : " + emp1.getEmpName());

        System.out.println();
        Employee emp2 = new Employee(456, "Alice");
        emp2.printInfo();

        System.out.println();
        Employee emp3 = new Employee("Brady", 789);
        emp3.printInfo();

        System.out.println();
        Scanner keyIn = new Scanner(System.in);
        System.out.print("Set emp3 salary : ");
        double salary = keyIn.nextDouble();

        // Employee.MIN_SALARY = 900; // Error since it is constant.

        if (salary < Employee.MIN_SALARY) {
            System.out.println("--- Can't set salary below " + Employee.MIN_SALARY);
            System.out.println("--- Reset salary to " + Employee.MIN_SALARY);
            salary = Employee.MIN_SALARY;
        }

        System.out.println();
        emp3.setSalary(salary);
        emp3.printInfo();

        keyIn.close();
    }
}