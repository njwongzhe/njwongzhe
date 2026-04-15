<?php
    class Person {
        private $name;
        private $age;

        // Constructor method is called when a new object is created.
        public function __construct($name, $age) {
            $this->name = $name;
            $this->age = $age;
        }

        // Destructor method is called when the object is destroyed.
        public function __destruct() {
            echo "Person object is being destroyed.\n";
        }

        // Magic method to handle getting properties.
        // If the property does not exist or is not accessible (e.g., private), it will be called automatically.
        public function __get($property) {
            echo "Getting Property: " . $property . "\n";
            return $this->$property;
        }

        // Magic method to handle setting properties.
        // If the property does not exist or is not accessible (e.g., private), it will be called automatically.
        public function __set($property, $value) {
            echo "Setting Property: " . $property . " to " . $value . "\n";
            $this->$property = $value;
        }

        // Magic method to handle calls to undefined methods.
        // If a method is called that does not exist or is not accessible (e.g., private), this method will be called automatically.
        public function __call($name, $arguments) {
            echo "Function \"" . $name . "\" does not exist. Arguments: " . implode(", ", $arguments) . "\n";
        }

        // Magic method to convert the object to a string.
        // This method is called when the object is treated as a string.
        public function __toString() {
            return "Person: " . $this->name . ", Age: " . $this->age;
        }
    }

    $person = new Person("Alice", 30);

    echo $person; // This will call the __toString() method.
    echo "<hr>";

    echo $person->name; // This will call the __get() method.
    echo "<hr>";

    $person->age = 31; // This will call the __set() method.
    echo "<br>";
    echo $person->age; // This will call the __get() method again.
    echo "<hr>";
    
    $person->greet("Hello"); // This will call the __call() method.
    echo "<hr>";
?>