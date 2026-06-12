import java.util.Vector;

public class TestVector {
    public static void main(String [] args) {
		System.out.println("Test Vector");
        System.out.println();

		Vector townList = new Vector(3); // If not net capacity to 3, the system will automatically assign the capacity to 10.

		townList.addElement("Skudai"); // Add townList[0]
        System.out.println("townList Size = " + townList.size());         // Output will be 'townList Size = 1'.
		System.out.println("townList Capacity = " + townList.capacity()); // Output will be 'townList Capacity = 3'.
        System.out.println();

        townList.addElement("JB");     // Add townList[1]
        System.out.println("townList Size = " + townList.size());         // Output will be 'townList Size = 2'.
		System.out.println("townList Capacity = " + townList.capacity()); // Output will be 'townList Capacity = 3'.
        System.out.println();

        townList.addElement("KL");     // Add townList[2]
        System.out.println("townList Size = " + townList.size());         // Output will be 'townList Size = 3'.
		System.out.println("townList Capacity = " + townList.capacity()); // Output will be 'townList Capacity = 3'.
        System.out.println();

        townList.addElement("Muar");   // Add townList[3]
		System.out.println("townList Size = " + townList.size());         // Output will be 'townList Size = 4'.
		System.out.println("townList Capacity = " + townList.capacity()); // Output will be 'townList Capacity = 6'. 
                                                                          // When it exceed the maximum capacity, the system will automatically double up the capacity.

		printTowns(townList);

        townList.removeElement(0); // Remove the first array item.
        printTowns(townList);

        townList.removeElement(1); // Remove the second array item.
        printTowns(townList);

        townList.removeElement("Muar"); // Remove the array item with value "Skudai".
        printTowns(townList);

        townList.insertElementAt("KL", 0); // Add townList[0]. Other array item at or after original townList[0] move behind.
        printTowns(townList);

        townList.setElementAt("Skudai", 0); // Change townList[0];
        printTowns(townList);
	}

	public static void printTowns(Vector tList) {
        System.out.println();
		for (int i = 0; i < tList.size(); i++) {
			System.out.print(tList.elementAt(i) + " ");
		}
	}
}
