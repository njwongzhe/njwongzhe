import java.util.Scanner;

public class TestEmployeeArray {
    public static void main (String[] args) {
        System.out.println("Test Employee class");
        System.out.println();

        EmployeeArray[] emp  = new EmployeeArray[3];
        emp[0] = new EmployeeArray();
        emp[1] = new EmployeeArray(456, "Alice");
        emp[2] = new EmployeeArray("Brady", 789);
        /* OR */
        // EmployeeArray[] emp  = {new EmployeeArray(), new EmployeeArray(456, "Alice"), new EmployeeArray("Brady", 789)};

        System.out.println();
        emp[0].setEmpNum(123);
        emp[0].setEmpName("Adam");
        System.out.println("Emp. Num  : " + emp[0].getEmpNum());
        System.out.println("Emp. Name : " + emp[0].getEmpName());

        System.out.println();
        emp[1].printInfo();

        System.out.println();
        emp[2].printInfo();

        System.out.println();
        Scanner keyIn = new Scanner(System.in);
        System.out.print("Set emp3 salary : ");
        double salary = keyIn.nextDouble();

        // Employee.MIN_SALARY = 900; // Error since it is constant.

        if (salary < EmployeeArray.MIN_SALARY) {
            System.out.println("--- Can't set salary below " + EmployeeArray.MIN_SALARY);
            System.out.println("--- Reset salary to " + EmployeeArray.MIN_SALARY);
            salary = EmployeeArray.MIN_SALARY;
        }

        System.out.println();
        emp[2].setSalary(salary);
        emp[2].printInfo();

        System.out.println();
        System.out.println("Total Employee : " + emp.length); // Length of Array

        keyIn.close();
    }
}