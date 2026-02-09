void main(List<String> args) {
  print('Sum     = ${add(5)}');       // Output: 5
  print('Sum     = ${add(5, 7)}');    // Output: 12
  print('Sum     = ${add(5, 7, 9)}'); // Output: 21

  print('Product = ${multiply(4)}');       // Output: 4
  print('Product = ${multiply(4, 6)}');    // Output: 24
  print('Product = ${multiply(4, 6, 8)}'); // Output: 192
}

/* Function with Optional Positional Parameters (With Default Values) */
int add(int x, [int y = 0, int z = 0]) { // y and z are optional positional parameters with default values.
  return x + y + z;
}

/* Function with Optional Positional Parameters (Without Default Values) */
int multiply(int x, [int? y, int? z]) { // If y and z are not provided, they will be null.
  return x * (y ?? 1) * (z ?? 1);       // Then, null aware operator must be used to avoid error.
}