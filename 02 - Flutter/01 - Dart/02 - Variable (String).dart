void main(List<String> args) {
  String data = "Hello World!"; // A variable that only can accept string.
  print(data);                  // Output: Hello World!

  String data2 = "Hello!";

  // Using $ for a single identifier.
  // Using ${} for a single identifier or expressions.
  String data3 = "$data2 ${data}"; 
  print(data3);                    // Output: Hello! Hello World!


  /* Access & Query Operations */
  print("length       = ${data3.length}");               // Output: 19
  print("indexOf      = ${data3.indexOf("Hello")}");     // Output: 0
  print("indexOf      = ${data3.indexOf('o', 5)}");      // Output: 11 // Start searching from index 5
  print("lastIndexOf  = ${data3.lastIndexOf("Hello")}"); // Output: 7
  print("startsWith   = ${data3.startsWith("Hello")}");  // Output: true
  print("endsWith     = ${data3.endsWith("!")}");        // Output: true
  print("contains     = ${data3.contains("World")}");    // Output: true
  print("isEmpty      = ${data3.isEmpty}");              // Output: false
  print("isNotEmpty   = ${data3.isNotEmpty}");           // Output: true


  /* Substring Operations */
  print("substring    = ${data3.substring(7)}");    // Output: Hello World! // From index 7 to the end.
  print("substring    = ${data3.substring(0, 5)}"); // Output: Hello        // From index 0 to 5 (Not Include 5).


  /* Case Conversion Operations */
  print("toUpperCase  = ${data.toUpperCase()}"); // Output: HELLO WORLD!
  print("toLowerCase  = ${data.toLowerCase()}"); // Output: hello world!
  

  /* Modify Operations */
  print("replaceAll   = ${data3.replaceAll("World", "Dart")}"); // Output: Hello! Hello Dart!
  print("replaceFirst = ${data3.replaceFirst("l", "L")}");      // Output: HeLlo! Hello World!


  /* Split Operation */
  List words = data3.split(" ");  // Split the string into a "List" of substrings based on the delimiter " ". // It will modify the original list.
  print("split        = $words"); // Output: [Hello!, Hello, World!] 
  

  /* Trim Operation */
  String paddedString = "  Trim Me!  ";           // String with leading and trailing spaces.
  print("trim         = ${paddedString.trim()}"); // Output: 'Trim Me!' // Remove leading and trailing spaces.
}