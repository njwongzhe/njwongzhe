class Student {
    private String name;
    private String course;
    public int cw; // Coursework Mark
    public int fe; // Final Exam Mark
    public int total; // Total Mark (cw + fe)
    public String status; // "PASS" (total >= 50) Otherwise "FAIL"

    public Student(String name, String course, int cw, int fe) {
        this.name = name;
        this.course = course;
        this.cw = cw;
        this.fe = fe;
    }

    @Override
    public String toString() {
        return name + " (" + course + ") - " + total + " (" + status + ")";
    }
}

@FunctionalInterface
interface Mark { // A Functional Interface only will have 1 method inside it.
    public Student[] processTotalMark(Student [] studArray);
}

@FunctionalInterface
interface Status { // A Functional Interface only will have 1 method inside it.
    public Student[] setStatus(Student [] studArray);
}

public class StudentMarkStatus {
    public static void main(String [] args) {
        Student [] students = {
            new Student("Eve", "SCSE", 30, 10),
            new Student("Bob", "SCSR", 47, 20),
            new Student("Charlie", "SCSE", 65, 25),
            new Student("David", "SCSE", 20, 18),
            new Student("Adam", "SCSR", 53, 23)
        };

        Mark mark = studArray -> { // studArray is just a variable name. It can be any other names.
            for(int i = 0; i < studArray.length; i++) 
                studArray[i].total = studArray[i].cw + studArray[i].fe;
            return studArray; // Return array of Student object.
        };

        Status status = studArray -> { // studArray is just a variable name. It can be any other names.
            for(int i = 0; i < studArray.length; i++) {
                if(studArray[i].total >= 50) studArray[i].status = "PASS";
                else studArray[i].status = "FAIL"; 
            }
            return studArray; // Return array of Student object.
         };

        students = status.setStatus(mark.processTotalMark(students)); 
 
        for (Student stud : students) {
            System.out.println(stud.toString());
        }
    }
}
