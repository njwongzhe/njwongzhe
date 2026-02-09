void main(List<String> args) {
  // Generics allow you to specify the type of data a collection can hold.
  // This helps catch type-related errors at compile time and improves code readability.
  // "<Type>" syntax is used to define the type of elements in collections like "List" and "Map".

  List<int> intList = [1, 2, 3, 4, 5]; // Create a "List" that can only can hold integers
  print("intList  = $intList");        // Output: [1, 2, 3, 4, 5]
  
  Map<String, int> scoreMap = {"Alice": 90, "Bob": 85, "Charlie": 95}; // Create a "Map" that maps strings to integers
  print("scoreMap = $scoreMap");                                       // Output: {Alice: 90, Bob: 85, Charlie: 95}
}