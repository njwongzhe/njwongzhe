import java.util.ArrayList;

public class Course {
    private String name, code;
    private ArrayList <Student> studentList = new ArrayList<Student>();

    public Course(String name, String code) { 
        this.name = name;
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public String getCode() {
        return code;
    }

    public void registerStudent(Student st) {
        studentList.add(st);
    }

    public void printCourseInfo() {
        System.out.print(this.code + " " + this.name);
    }

    public void printCourseStudent() {
        System.out.println("Course Name : " + this.name);

        for(int i = 0; i < studentList.size(); i += 1) 
            System.out.println((i + 1) + ". " + (studentList.get(i)).getMatrix() + " " + (studentList.get(i)).getName());

        System.out.println();
    }
}
