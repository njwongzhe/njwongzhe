// Collections Framework: Standard classes for grouping and manipulating objects.

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

class CollectionsDemo {
    public static void main(String[] args) {
        /* 1. ArrayList (Ordered, allows duplicates, index-based) */
        System.out.println("--- 1. ArrayList ---");
        ArrayList<String> names = new ArrayList<>();
        names.add("Alice");
        names.add("Bob");
        names.add("Alice"); // Duplicate element.

        // Loop through List using standard for-each loop.
        for (String name : names) {
            System.out.println("Name: " + name);
        }
        System.out.println("Element at index 1: " + names.get(1));
        System.out.println();

        /* 2. HashSet (Unordered, no duplicates allowed) */
        System.out.println("--- 2. HashSet ---");
        HashSet<Integer> uniqueNumbers = new HashSet<>();
        uniqueNumbers.add(10);
        uniqueNumbers.add(20);
        uniqueNumbers.add(10); // Will be ignored because it is a duplicate.

        for (int num : uniqueNumbers) {
            System.out.println("Number: " + num);
        }
        System.out.println("Contains 20? " + uniqueNumbers.contains(20));
        System.out.println();

        /* 3. HashMap (Key-Value pairs, unique keys) */
        System.out.println("--- 3. HashMap ---");
        HashMap<String, Integer> itemPrices = new HashMap<>();
        itemPrices.put("Apple", 5);
        itemPrices.put("Banana", 3);
        itemPrices.put("Apple", 6); // Overwrites the old value for key "Apple".

        // Iterating over Map entries.
        for (Map.Entry<String, Integer> entry : itemPrices.entrySet()) {
            System.out.println("Item: " + entry.getKey() + ", Price: " + entry.getValue());
        }
        System.out.println("Price of Banana: " + itemPrices.get("Banana"));
        System.out.println();

        /* 4. Basic Lambda & Streams Demo */
        System.out.println("--- 4. Lambda & Streams ---");
        // Using Lambda and Streams to filter and print elements.
        names.stream()
             .filter(name -> name.startsWith("A"))
             .forEach(name -> System.out.println("Filtered Name (starts with A): " + name));
    }
}
