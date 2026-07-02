class SumLoop {
    private int num;
    private String id;
  
    public SumLoop(int num, String id) {
        this.num = num;
        this.id = id;
    }

    public int getSum() throws Exception {
        int sum = 0;
        for (int i = 1; i < num; i++) {
            sum += i;
            System.out.printf("%s iteration %d\n", id, i);
            Thread.sleep(1000); // simulate task delay
        }
        return sum;
    }
}
  
public class Async03 {
    public static void main(String[] args) throws Exception {
        long startTime = System.currentTimeMillis();

        SumLoop sumLoop1 = new SumLoop(5, "SL01");
        
        Thread task1 = new Thread(()->{
            try{
                int result1 = sumLoop1.getSum();
                System.out.printf("SL01 result = %d\n", result1);
            }catch (Exception e){
                e.printStackTrace();
            }
        });
        //Synchronous
        //int result1 = sumLoop1.getSum();
        //System.out.printf("SL01 result = %d\n", result1);

        task1.start();

        SumLoop sumLoop2 = new SumLoop(3, "SL02");
        int result2 = sumLoop2.getSum();
        System.out.printf("SL02 result = %d\n", result2);

        task1.join();

        long endTime = System.currentTimeMillis();
        System.out.printf("Time taken: %d ms\n", (endTime - startTime));
    }
}