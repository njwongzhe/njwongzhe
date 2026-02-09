public class TestRelationships {
    public static void main(String[] args) {
        Course cs1 = new Course("Software Engineering Principles", "SCP3103"), 
               cs2 = new Course("Advanced Programming", "SCJ1013");

        Student st1 = new Student("ALI", "AC0001");
        st1.registerCourse(cs1); // Print all the Course register by certain Student.
        st1.registerCourse(cs2);
        st1.printStudentInfo();

        Student st2 = new Student("AHMAD", "AC0002");
        st2.registerCourse(cs1);
        st2.printStudentInfo();

        cs1.printCourseStudent(); // Print all the Student register in certain Course.
        cs2.printCourseStudent();
    }
}