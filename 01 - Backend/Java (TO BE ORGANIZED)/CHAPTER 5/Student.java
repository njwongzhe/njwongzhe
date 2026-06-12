import java.util.ArrayList;

public class Student {
    private String name, matrix;
    private ArrayList <Course> courseList = new ArrayList<Course>();

    public Student(String name, String matrix) {
        this.name = name;
        this.matrix = matrix;
    }

    public String getName() {
        return name;
    }

    public String getMatrix() {
        return matrix;
    }

    public void registerCourse(Course cs) {
        courseList.add(cs);
        cs.registerStudent(this);
    }

    public void printStudentInfo() {
        System.out.println("Student Name : " + this.name);

		for (int i = 0; i < courseList.size(); i += 1) {
			System.out.print((i + 1) + ". ");
		    (courseList.get(i)).printCourseInfo();
            System.out.println();
        }

        System.out.println();
    }
}