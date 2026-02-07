void main(List<String> args) {
  List student = ["John", "Steve", "Tom"];
  print("initial      = $student");              // Output: [John, Steve, Tom]
  print("toString     = ${student.toString()}"); // Output: [John, Steve, Tom] // Output in string format.



  // Add Operations
  student.add("Jack");              // Add single element to the end of the list.
  print("add          = $student");  // Output: [John, Steve, Tom, Jack]

  student.addAll(["Anna", "Emma"]); // Add multiple elements to the end of the list.
  print("addAll       = $student");  // Output: [John, Steve, Tom, Jack, Anna, Emma]



  // Remove Operations
  student.remove("Steve");         // Remove element by value.
  print("remove       = $student"); // Output: [John, Tom, Jack, Anna, Emma]

  student.removeAt(1);             // Remove element at index 1.
  print("removeAt     = $student"); // Output: [John, Jack, Anna, Emma]

  student.removeLast();            // Remove the last element.
  print("removeLast   = $student"); // Output: [John, Jack, Anna]

  student.removeRange(1, 2);       // Remove elements from index 1 to 2 (Not Include 2).
  print("removeRange  = $student"); // Output: [John, Anna]



  // Insert Operations
  student.insert(1, "Steve");            // Insert element at index 1.
  print("insert       = $student");       // Output: [John, Steve, Anna]

  student.insertAll(2, ["Tom", "Jack"]); // Insert multiple elements starting at index 2.
  print("insertAll    = $student");       // Output: [John, Steve, Tom, Jack, Anna]



  // Access & Query Operations
  print("contains     = ${student.contains("Tom")}");    // Output: true
  print("indexOf      = ${student.indexOf("Tom")}");     // Output: 2
  print("lastIndexOf  = ${student.lastIndexOf("Tom")}"); // Output: 2
  print("first        = ${student.first}");              // Output: John
  print("last         = ${student.last}");               // Output: Anna
  print("length       = ${student.length}");             // Output: 5
  print("isEmpty      = ${student.isEmpty}");            // Output: false
  print("isNotEmpty   = ${student.isNotEmpty}");         // Output: true



  // Transform Operations
  print("reversed     = ${student.reversed.toList()}"); // Output: [Anna, Jack, Tom, Steve, John]
  print("sublist      = ${student.sublist(1, 3)}");     // Output: [Steve, Tom]
  print("join         = ${student.join(", ")}");        // Output: John, Steve, Tom, Jack, Anna

  List sortList = List.from(student);
  sortList.sort();                      // Sort the list alphabetically. // It will modify the original list.
  print("sort         = $sortList");    // Output: [Anna, Jack, John, Steve, Tom]

  List shuffleList = List.from(student);
  shuffleList.shuffle();                // Shuffle the list randomly. // It will modify the original list.
  print("shuffle      = $shuffleList"); // Output in Random Order.



  // Filter / Map Operations
  var filtered = student.where((s) {     // Filter elements.
    return s.toString().startsWith("J"); 
  }).toList();
  print("where        = $filtered");      // Output: [John, Jack]

  var mapped = student.map((s) {         // Transform each element.
    return s.toString().toUpperCase(); 
  }).toList();
  print("map          = $mapped");        // Output: [JOHN, STEVE, TOM, JACK, ANNA]

  var everyResult = student.every((s) {  // Check if every element satisfies the condition. (AND)
    return s.toString().length > 2;
  });
  print("every        = $everyResult");   // Output: true

  var anyResult = student.any((s) {      // Check if any element satisfies the condition. (OR)
    return s.toString().startsWith("A");
  });
  print("any          = $anyResult");     // Output: true
                
  student.forEach((s) {                  // Iterate over each element.
    print("forEach      = $s");           // Output: John, Steve, Tom, Jack, Anna // Each on newline.
  });



  // Modify Operations
  List modifyList = List.from(student);
  modifyList.replaceRange(1, 3, ["X", "Y"]); // Replace elements from index 1 to 3.
  print("replaceRange = $modifyList");       // Output: [John, X, Y, Jack, Anna]

  modifyList.fillRange(1, 3, "Z");           // Fill index 1 to 3 with "Z".
  print("fillRange    = $modifyList");        // Output: [John, Z, Z, Jack, Anna]

  modifyList.clear();                        // Clear all elements.
  print("clear        = $modifyList");        // Output: []
} 