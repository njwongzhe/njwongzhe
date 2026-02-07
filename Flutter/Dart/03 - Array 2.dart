void main(List<String> args) {
  List withoutType      = ["John", 25, true, 3.14]; // Without data type.
  List<String> strings  = ["John", "Steve", "Tom"]; // With data type.
  List<int> numbers     = [1, 2, 3, 4, 5];
  List<double> decimals = [1.1, 2.2, 3.3];
  List<bool> booleans   = [true, false, true];

  print("WithoutType  = $withoutType"); // Output: [John, 25, true, 3.14]
  print("Strings      = $strings");     // Output: [John, Steve, Tom]
  print("Numbers      = $numbers");     // Output: [1, 2, 3, 4, 5]
  print("Decimals     = $decimals");    // Output: [1.1, 2.2, 3.3]
  print("Booleans     = $booleans");    // Output: [true, false, true]
}
