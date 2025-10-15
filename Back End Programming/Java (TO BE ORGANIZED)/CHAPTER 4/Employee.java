public class Employee {
    private int empNum;
    private String empName;
    private double salary;

    public static final double MIN_SALARY = 1700.00;

    /* 1st Constructor (new Object) */
    public Employee() {
        System.out.println("Call Employee's Default Constructor");
    }

    /* 2nd Constructor (Passing Value) */
    public Employee(int eN, String n) {
        System.out.println("Call Employee's 2nd Constructor");
        this.empNum = eN;
        this.empName = n;
    }

    /* 3rd Constructor (Passing Value) */
    public Employee(String n, int eN) {
        this(eN, n); // Can directly use back the 2nd constructor
        /* OR */
        //this.empNum = eN;
        //this.empName = n;
        System.out.println("Call Employee's 3rd Constructor");
    }

    public void setEmpNum(int en) {
        this.empNum = en;
    }

    public int getEmpNum() {
        return this.empNum;
    }

    public void setEmpName(String n) {
        this.empName = n;
    }

    public String getEmpName() {
        return this.empName;
    }

    public void setSalary(double  s) {
        this.salary = s;
    }

    public double getSalary() {
        return this.salary;
    }

    public void printInfo() {
        System.out.println("Emp. Num  : " + this.empNum);
        System.out.println("Emp. Name : " + this.empName);
        System.out.println("Salary : " + this.salary);
    }
}