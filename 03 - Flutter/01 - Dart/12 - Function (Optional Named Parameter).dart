void main(List<String> args) {
  displayPerson('Alice');                       // Output: Name: Alice, Age: 0, Height: 0
  displayPerson('Bob', age: 25);                // Output: Name: Bob, Age: 25, Height: 0
  displayPerson('Charlie', height: 180);        // Output: Name: Charlie, Age: 0, Height: 180
  displayPerson('Diana', age: 30, height: 165); // Output: Name: Diana, Age: 30, Height: 165
  displayPerson('Eve', height: 170, age: 28);   // Output: Name: Eve, Age: 28, Height: 170
}

/* Function with Optional Named Parameters */
void displayPerson(String name, {int age = 0, int height = 0}) { // "age" and "height" are optional named parameters with default values.
  print('Name: $name, Age: $age, Height: $height');              // Same as Optional Positional Parameter, but parameters can be specified by name in any order when calling the function.
}