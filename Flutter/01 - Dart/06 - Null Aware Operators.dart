void main(List<String> args) {
  /* ? (Nullable Type) */
  // String name = null;                     // Error since non-nullable variable can't be assigned null.
  String? name = null;                       // Make a variable can hold its allowed value or null.
  print("name            = $name");          // Output: null
  // print("name?.length = ${name.length}"); // Error since "name" is null and we are trying to access its property.


  /* ?. (Safe Navigation Operator) */
  // Access a property or method of an object only if it is not null. (Judge By Compiler)
  // If it is null, returns null.
  // If not null, returns the property or method return value.
  print("name?.length    = ${name?.length}"); // Output: null 
  name = "Alice";
  print("name?.length    = ${name?.length}"); // Output: 5    


  /* !. (Null-Aware Access Operator) */
  // Access a property or method of a nullable object by asserting that it is not null. (Judge By Programmer)
  // If it is null, throws a runtime error.
  // If not null, returns the property or method return value.
  name = null;
  // print("name!.length = ${name!.length}"); // The program still can be compiled successfully but will crash when execute this line if "name" is null.


  /* ?? (If-Null Operator) */
  String? username = null;                     
  String displayUsername = username ?? "Guest"; // Provide a default value if the object is null.
  print("displayUsername = $displayUsername");  // Output: Guest
  print("username        = $username");         // Output: null  // "username" is still null.


  /* ??= (Null-Aware Assignment Operator) */
  String? message = null;
  String displayMessage = message ??= "Default Message"; // Assign a default value to the object if it is null.
  print("displayMessage  = $displayMessage");            // Output: Default Message
  print("message         = $message");                   // Output: Default Message
}
