public class Constructors {
    public static void main(String[] args) 
    {
        ObjectTest a = new ObjectTest(),
                   b = new ObjectTest(2, 'B');

        a.PrintData(); // Output will be '1 / A' and newline.
        b.PrintData(); // Output will be '2 / B' and newline.
    }
}

class ObjectTest {
    private int num;
    private char character;

    public ObjectTest()
    {
        this(1, 'A'); // Constructor call must be the first statement in a constructor.
        /* OR */
        // num = 1;
        // character = 'A';
    }

    public ObjectTest(int num, char character)
    {
        this.num = num; 
        this.character = character;
    }

    public void PrintData()
    {
        System.out.println(num + " / " + character);
    }
}