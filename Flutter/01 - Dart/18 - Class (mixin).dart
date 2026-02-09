/* Parent Class */
class Animal {
  String name;
  Animal(this.name);

  void eat() {
    print("$name is eating.");
  }
}

/* mixin Class */ 
mixin Swimmer { 
  void swim() {
    print("Swimming...");
  }
}

/* mixin Class */
mixin Flyer {
  void fly() {
    print("Flying...");
  }
}

/* Single Mixin */
class Dog extends Animal with Swimmer { // Using "with" keyword to apply mixin.
  Dog(String name) : super(name);
}

/* Multiple Mixins */
class Duck extends Animal with Swimmer, Flyer { // Using "with" keyword can apply multiple mixins.
  Duck(String name) : super(name);
}

void main(List<String> args) {
  var dog = Dog("Buddy");
  dog.eat();
  dog.swim();

  var duck = Duck("Donald");
  duck.eat();
  duck.swim();
  duck.fly();
}
