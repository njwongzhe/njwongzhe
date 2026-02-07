void main(List<String> args) {
  dynamic variable = "I am a String"; // A variable that can hold any data type.
  print("Initial Value : $variable"); // Output: I am a String

  variable = 42;
  print("Changed Value : $variable"); // Output: 42

  variable = true;
  print("Changed Value : $variable"); // Output: true

  variable = [1, 2, 3];
  print("Changed Value : $variable"); // Output: [1, 2, 3]

  variable = {"key": "value"};
  print("Changed Value : $variable"); // Output: {key: value}
}