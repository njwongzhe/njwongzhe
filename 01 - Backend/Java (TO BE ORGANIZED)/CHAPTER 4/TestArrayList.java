import java.util.ArrayList;

public class TestArrayList {
    public static void main(String[] args) {
        System.out.println("Test ArrayList");
        System.out.println();

        ArrayList <String> townList = new ArrayList<String>();

        townList.add("Skudai"); // Add townList[0]
        townList.add("JB");     // Add townList[1]
        townList.add("KL");     // Add townList[2]
        townList.add("Muar");   // Add townList[3]

        System.out.println("townList Size = " + townList.size());

        printTowns(townList);

        townList.remove(0); // Remove the first array item.
        printTowns(townList);

        townList.remove(1); // Remove the second array item.
        printTowns(townList);

        townList.remove("Muar"); // Remove the array item with value "Skudai".
        printTowns(townList);

        townList.add(0, "KL"); // Add townList[0]. Other array item at or after original townList[0] move behind.
        printTowns(townList);

        townList.set(0, "Skudai"); // Change townList[0];
        printTowns(townList);
    }

    public static void printTowns(ArrayList <String> tList) {
        System.out.println();
        for(int i = 0; i < tList.size(); i += 1) {
            System.out.print(tList.get(i) + " ");
        }
    }
}
