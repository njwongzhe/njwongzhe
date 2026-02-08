void main(List<String> args) {
  // Generics can also be applied to methods to make them more flexible and reusable.
  // You can create functions that with same features but different data types without needing to write multiple versions.

  printItem<int>(42);                    // Output: Item = 42               // "item" is type of "int" here since "T" is "int".
  printItem<String>("Hello, Generics!"); // Output: Item = Hello, Generics! // "item" is type of "String" here since "T" is "String".

  int number = getItem<int>(100);                          // getItem returns an "int" here since "T" is "int".         
  print(number);                                           // Output: 100                 
  String message = getItem<String>("Generics in Methods"); // getItem returns a "String" here since "T" is "String".
  print(message);                                          // Output: Generics in Methods 
}

void printItem<T>(T item) { // "<T>" is a generic type parameter that accepts any data type.
  print("Item = $item");
}

// Without generics, we would need separate functions for each data type.
/*
void printIntItem(int item) {
  print("Item = $item");
}

void printStringItem(String item) {
  print("Item = $item");
}
*/

T getItem<T>(T item) { // "<T>" is a generic type parameter that accepts any data type.
  return item; 
}

// Without generics, we would need separate functions for each data type.
/*
int getIntItem(int item) {
  return item;
}

String getStringItem(String item) {
  return item;
}
*/