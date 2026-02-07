void main(List<String> args) {
  String data = "Hello World!"; // A variable that only can accept string.
  print(data);                  // Output: Hello World!

  String data2 = "Hello!";
  print("$data2 ${data}"); // Output: Hello! Hello World!
                           // Using $ for a single identifier.
                           // Using ${} for a single identifier or expressions.
}