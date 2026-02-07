void main(List<String> args) {
  // An anonymous function is a function without a name.
  // It can be assigned to a variable and the benefit is that it can be passed as an argument to another function.

  /* Anonymous Function with Multiple Statements */
  var fruits = ['Apple', 'Banana', 'Orange'];
  fruits.forEach((fruit) { // Anonymous function passed as an argument to "forEach" ("List" Function).
    print('Processing $fruit...');
    print('Length: ${fruit.length}');
  });
  print("");

  var multiply = (int a, int b) { // Anonymous function assigned to variable "multiply".
    return a * b;
  };
  print('Result of multiply(5, 6) = ${multiply(5, 6)}'); // Output: 30
  print("");


  /* Anonymous Function with Single Expression (Fat Arrow / Lambda Expression) */
  fruits.forEach((fruit) => print('Hello $fruit')); // Anonymous function passed as an argument to "forEach" ("List" Function).
  print("");

  var add = (int a, int b) => a + b;           // Anonymous function assigned to variable "add".
  print('Result of add(5, 6) = ${add(5, 6)}'); // Output: 11
}