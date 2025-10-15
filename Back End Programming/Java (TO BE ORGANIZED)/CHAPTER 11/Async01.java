import java.util.Scanner;

public class Async01 {
    public static void main(String[] args) throws Exception {
        long startTime = System.currentTimeMillis();

        Thread myThread = new Thread(() -> {
            System.out.println("Start Task 1");
            try {
                Thread.sleep(3000);
            } 
            catch(Exception e) {
                e.printStackTrace();
            }
            System.out.println("End Task 1");
        });

        myThread.start();

        Scanner keyin = new Scanner(System.in);
        System.out.printf("Enter name: ");
        String name = keyin.nextLine();
        System.out.println("Hello " + name);

        long endTime = System.currentTimeMillis();
        System.out.printf("Time taken: %d ms\n", (endTime - startTime));
  }
}
