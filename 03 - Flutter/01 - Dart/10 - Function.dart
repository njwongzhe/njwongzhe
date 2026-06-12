void main(List<String> args) {
  greet();                              // Output: Hello, World!
  print('Sum     = ${add(5, 7)}');      // Output: 12
  print('Product = ${multiply(4, 6)}'); // Output: 24
}

/* Function without Parameters and Return Value */
void greet() {
  print('Hello, World!');
}

/* Function with Parameters and Return Value */
int add(int x, int y) { 
  return x + y; // Return type is "int".
}

/* Dynamic Function */
multiply(int x, int y) { 
  return x * y; // Return type is "dynamic" by default.
}