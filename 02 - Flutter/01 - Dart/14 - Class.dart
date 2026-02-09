void main(List<String> args) {
  var person1 = Person("John", 30);       // Create an object (instance) of the "Person" class. (Unnamed Constructor)
  var person2 = Person.onlyName("Alice"); // Create an object using Named Constructor.
  var person3 = Person.onlyAge(25);       // Create an object using Named Constructor
  
  /* Object Properties */
  print("Name = ${person1.name}"); // Output: John
  print("Age  = ${person1.age}");   // Output: 30
  print("Name = ${person2.name}"); // Output: Alice
  print("Age  = ${person2.age}");   // Output: 0
  print("Name = ${person3.name}"); // Output: 
  print("Age  = ${person3.age}");   // Output: 25

  /* Object Method */
  person1.greet(); // Output: Hello, my name is John.
  person2.greet(); // Output: Hello, my name is Alice.
  person3.greet(); // Output: Hello, my name is .
}

/* Define a Class */
class Person {
  /* Class Properties */
  String name = ""; // Default value must be assigned. If not, it will cause an error.
  int age = 0;      // Or you may use Null Aware Operators (e.g., String? name;) to allow null values.

  /* Unnamed Constructor */
  Person(String name, int age) { // If needed, concept of Positional and Named Parameters also can be applied here.
    this.name = name;
    this.age = age;
  }

  /* Unnamed Constructor (Initializer List) */
  // Person(String name, int age) : this.name = name, this.age = age; // Alternative syntax using Initializer List.

  /* Named Constructor */
  Person.onlyName(String name) { // Give a name to the constructor.
    this.name = name;
  }

  /* Named Constructor */ 
  Person.onlyAge(int age) {
    this.age = age;
  }

  /* Class Method */
  void greet() {
    print("Hello, my name is $name.");
  }
}