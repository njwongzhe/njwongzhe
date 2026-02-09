/* Parent Class */
class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void eat() {
    print("$name is eating.");
  }

  void makeSound() {
    print("$name makes a sound.");
  }
}

/* Child Class */
class Dog extends Animal {
  String breed;

  // Constructor must call parent constructor using "super()".
  Dog(String name, int age, this.breed) : super(name, age);

  // Method overriding with super keyword.
  @override
  void makeSound() {
    super.makeSound(); // Call parent's makeSound method.
    print("$name is barking! Woof!");
  }

  void fetch() {
    print("$name is fetching the ball.");
  }
}

void main(List<String> args) {
  var dog = Dog("Buddy", 3, "Labrador"); // Create a "Dog" object using child class.
  
  // Display properties
  print("Name: ${dog.name}");
  print("Age: ${dog.age}");
  print("Breed: ${dog.breed}");
  
  print("\n--- Inherited Methods ---");
  dog.eat(); // Inherited from "Animal".
  
  print("\n--- Overridden Method ---");
  dog.makeSound(); // Calls super.makeSound() then adds own behavior.
  
  print("\n--- Own Method ---");
  dog.fetch(); // "Dog" own unique method.
}
