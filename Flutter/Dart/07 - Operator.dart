void main(List<String> args) {
  int a = 10, b = 3;

  print('Arithmetic Operators');
  print('a + b  = ${a + b}');  // Output: 13        // Addition
  print('a - b  = ${a - b}');  // Output: 7         // Subtraction
  print('a * b  = ${a * b}');  // Output: 30        // Multiplication
  print('a / b  = ${a / b}');  // Output: 3.3333... // Division         (Returns "Double".)
  print('a ~/ b = ${a ~/ b}'); // Output: 3         // Integer Division (Returns "int", truncates decimal.)
  print('a % b  = ${a % b}');  // Output: 1         // Modulo           (Remainder)
  print("");


  print('Assignment Operators');
  double d;
  a = 10;           print('a = 10  = a becomes $a'); // Output: 10  
  a = 10;  a += 5;  print('a += 5  = a becomes $a'); // Output: 15  // a = a + 5
  a = 10;  a -= 3;  print('a -= 3  = a becomes $a'); // Output: 7   // a = a - 3
  a = 10;  a *= 2;  print('a *= 2  = a becomes $a'); // Output: 20  // a = a * 2
  a = 10;  a ~/= 3; print('a ~/= 3 = a becomes $a'); // Output: 3   // a = a ~/ 3
  a = 10;  a %= 4;  print('a %= 4  = a becomes $a'); // Output: 2   // a = a % 4
  d = 5.0; d /= 2;  print('d /= 2  = d becomes $d'); // Output: 2.5 // d = d / 2
  print("");


  print('Increment and Decrement Operators');
  a = 5; print('++a         = ${++a}'); // Output: 6 // Prefix. Increments then returns.
  a = 5; print('a++         = ${a++}'); // Output: 5 // Postfix. Returns then increments.
         print('a after a++ = $a');     // Output: 6
  a = 5; print('--a         = ${--a}'); // Output: 4 // Prefix. Decrements then returns.
  a = 5; print('a--         = ${a--}'); // Output: 5 // Postfix. Returns then decrements.
         print('a After a-- = $a');     // Output: 4
  print("");


  print('Relational Operators');
  print('a == b = ${a == b}'); // Output: false // Equal to
  print('a != b = ${a != b}'); // Output: true  // Not Equal to
  print('a > b  = ${a > b}');  // Output: true  // Greater Than
  print('a < b  = ${a < b}');  // Output: false // Less Than
  print('a >= b = ${a >= b}'); // Output: true  // Greater Than or Equal to
  print('a <= b = ${a <= b}'); // Output: false // Less Than or Equal to
  print("");


  print('Logical Operators');
  bool x = true, y = false;
  print('x && y = ${x && y}'); // Output: false // AND 
  print('x || y = ${x || y}'); // Output: true  // OR  
  print('!x     = ${!x}');     // Output: false // NOT 
  print("");


  print('Conditional (Ternary) Operator');
  int age = 20;
  String status = age >= 18 ? 'Adult' : 'Minor';    // If age >= 18, status = "Adult", else "Minor".
  print('age >= 18 ? "Adult" : "Minor" = $status'); // Output: Adult
  print("");


  print('Type Operators');
  dynamic value = 10;
  print('value is int     = ${value is int}');     // Output: true // "is" is type check.
  print('value is! String = ${value is! String}'); // Output: true // "is!" is the negated type check.

  double newValue = 20.5;
  // int castValue = newValue;           // Error since "newValue" is "double", cannot assign to "int".
  int castValue = newValue as int;       // "as" is type cast. It tells the compiler to treat "newValue" as "int".
  print('value as int    : $castValue'); // The program still can be compiled successfully but will crash when execute this line.
}
