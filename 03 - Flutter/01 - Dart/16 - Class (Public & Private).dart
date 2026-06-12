void main(List<String> args) {
	var person = Person(age: 30, name: "John");

  person.greet();                             // Accessing public method.
  person._setSecretNote("This is a secret."); // Accessing private method. Still works since Privacy in Dart is library-based, not class-based.

  print("Name        = ${person.name}");        // Accessing public field.
  print("Age         = ${person.age}");         // Accessing public field.
  print("Secret Note = ${person._secretNote}"); // Accessing private field. Still works since Privacy in Dart is library-based, not class-based.
}

class Person {
  /* Public Field */
	String name; 
	int age;

  /* Private Field */
	String _secretNote; // Private (Added underscore prefix.)

  /* Constructor */
	Person({this.name = "", this.age = 0}) : _secretNote = ""; // Constructor that apply named parameters and initializer list.

	/* Public Method */
	void greet() {
		print("Hello, my name is $name.");
	}

	/* Private Method */
	void _setSecretNote(String note) { // Private (Added underscore prefix.)
		_secretNote = note;
	}
}
