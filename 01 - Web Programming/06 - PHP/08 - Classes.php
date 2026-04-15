<?php
    class Person {
        // Properties (attributes) of the class.
        private $name;
        private $age;

        // Constructor must be named "__construct".
        // It is called automatically when a new object is created.
        public function __construct($name, $age) {
            $this->name = $name;
            $this->age = $age;
        }

        // Methods (functions) of the class.
        // Getters are used to access private properties.
        public function getName() {
            return $this->name;
        }
        public function getAge() {
            return $this->age;
        }

        // Methods (functions) of the class.
        // Setters are used to modify private properties.
        public function setName($name) {
            $this->name = $name;
        }
        public function setAge($age) {
            $this->age = $age;
        }

        // Destructor must be named "__destruct".
        // It is called automatically when an object is destroyed or goes out of scope.
        public function __destruct() {
            // Cleanup code can go here if needed.
        }
    }

    // Create an instance of the Person class.
    $person1 = new Person("Alice", 30);
    echo $person1->getName() . " is " . $person1->getAge() . " years old."; // Output: Alice is 30 years old.
?>