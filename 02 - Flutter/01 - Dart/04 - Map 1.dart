void main(List<String> args) {
  Map withoutType = {
    "Name": "John", 
    1: 100, 
    true: "Yes"
  }; // Without data type.

  Map<String, String> strings = {
    "First": "John", 
    "Last": "Doe"
  }; // Key: String, Value: String.

  Map<String, int> numbers = {
    "John": 90, 
    "Steve": 80
  }; // Key: String, Value: int.

  Map<String, double> decimals = {
    "Pi": 3.14, 
    "Gravity": 9.81
  }; // Key: String, Value: double.

  Map<String, bool> booleans = {
    "Login": true, 
    "Logout": false
  }; // Key: String, Value: bool.

  print("WithoutType = $withoutType"); // Output: {Name: John, 1: 100, true: Yes}
  print("Strings     = $strings");     // Output: {First: John, Last: Doe}
  print("Numbers     = $numbers");     // Output: {John: 90, Steve: 80}
  print("Decimals    = $decimals");    // Output: {Pi: 3.14, Gravity: 9.81}
  print("Booleans    = $booleans");    // Output: {Login: true, Logout: false}


  /* Convert to String Operations */
  print("toString    = ${strings.toString()}"); 
  // Output: {First: John, Last: Doe} 
  // Output in string format.


  /* Modify Operations */
  withoutType["Name"] = "John Edited"; // Modify value for key "Name".
  withoutType[1] = 200;                // Modify value for key "1".
  withoutType[true] = "No";            // Modify value for key "true".
}