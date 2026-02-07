void main(List<String> args) {
  var person1 = Person("John", 30);       // Create an object (instance) of the "Person" class. (Unnamed Constructor)
  var person2 = Person.onlyName("Alice"); // Create an object using Named Constructor.
  var person3 = Person.onlyAge(25);       // Create an object using Named Constructor
  
  print("Name = ${person1.name}"); // Output: John
  print("Age  = ${person1.age}");   // Output: 30
  print("Name = ${person2.name}"); // Output: Alice
  print("Age  = ${person2.age}");   // Output: 0
  print("Name = ${person3.name}"); // Output: 
  print("Age  = ${person3.age}");   // Output: 25

  person1.greet(); // Output: Hello, my name is John.
  person2.greet(); // Output: Hello, my name is Alice.
  person3.greet(); // Output: Hello, my name is .
}

class Person {
  String name; 
  int age;      

  /* Constructor Shortcut */
  Person(this.name, this.age);          // Case 1: First parameter is assigned to "name", second to "age".
  Person.onlyName(this.name) : age = 0; // Case 2: Assign the only parameter to "name".
  Person.onlyAge(this.age) : name = ""; // Case 3: Assign the only parameter to "age".
  // If using shortcut method, a default value can be avoided. (Case 1)
  // However, some of the fields that not included in the parameter list must be initialized in the initializer list. (Case 2 & 3)

  void greet() {
    print("Hello, my name is $name.");
  }
}