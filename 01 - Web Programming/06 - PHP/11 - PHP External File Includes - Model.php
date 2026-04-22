<?php
  class Fruit {
    private $name;
    private $calories;

    public function __construct($name, $calories) {
      $this->name = $name;
      $this->calories = $calories;
    }

    public function getName() {
      return $this->name;
    }
    public function getCalories() {
      return $this->calories;
    }
    public function printRow() {
      echo "<tr><td>" . $this->getName() . "</td><td>" . $this->getCalories() . "</td></tr>";
    }
  }
  
  $fruits = array(new Fruit("Apple", 52), new Fruit("Banana", 89));
?>
