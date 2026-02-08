void main(List<String> args) {
  // Generics allow you to specify the type of data a collection can hold.
  // This helps catch type-related errors at compile time and improves code readability.
  // "<Type>" syntax is used to define the type of elements in collections like "List" and "Map".

  // Create a "List" that can only can hold integers
  List<int> intList = [1, 2, 3, 4, 5];
  
  // Create a "Map" that maps strings to integers
  Map<String, int> scoreMap = {"Alice": 90, "Bob": 85, "Charlie": 95};
}