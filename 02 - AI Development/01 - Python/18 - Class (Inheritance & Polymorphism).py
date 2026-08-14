# OOP: Inheritance & Polymorphism

# 1. Inheritance
# Allows a class (child/subclass) to inherit attributes and methods from another class (parent/superclass).

class Animal:
    def __init__(self, name):
        self.name = name

    def speak(self):
        return "Some generic sound"

# Cat inherits from Animal
class Cat(Animal):
    # Overriding: Customizing the behavior of a parent method
    def speak(self):
        return "Meow!"

my_cat = Cat("Whiskers")
print(my_cat.name) # Inherited attribute -> Output: Whiskers
print(my_cat.speak()) # Overridden method -> Output: Meow!

# 2. Using super()
# super() allows child classes to call methods (including the constructor) from parent classes.

class Dog(Animal):
    def __init__(self, name, breed):
        # Call the parent class constructor to initialize the 'name' attribute
        super().__init__(name)
        self.breed = breed

    def speak(self):
        # We can combine parent method behavior with new behavior
        parent_speak = super().speak()
        return f"{parent_speak}, but {self.name} barks Woof!"

my_dog = Dog("Rex", "German Shepherd")
print(my_dog.name) # Output: Rex
print(my_dog.breed) # Output: German Shepherd
print(my_dog.speak()) # Output: Some generic sound, but Rex barks Woof!

# ---------------------------------------------------------

# 3. Polymorphism
# Polymorphism means "many forms". It allows different classes to have methods with 
# the same name but different implementations.

# A helper function that accepts any object with a .speak() method:
def make_animal_speak(animal_obj):
    print(animal_obj.speak())

make_animal_speak(my_cat) # Output: Meow!
make_animal_speak(my_dog) # Output: Some generic sound, but Rex barks Woof!

# ---------------------------------------------------------

# 4. Multiple Inheritance & MRO (Method Resolution Order)
# Python supports inheriting from multiple parent classes.
# The MRO defines the order in which Python searches for inherited attributes/methods.

class Mother:
    def greet(self):
        return "Mother greeting"

class Father:
    def greet(self):
        return "Father greeting"

# Child inherits from Mother first, then Father
class Child(Mother, Father):
    pass

c = Child()
print(c.greet()) # Output: Mother greeting (searches Mother first because it was listed first)

# View Method Resolution Order:
print(Child.__mro__) # Output: (<class '__main__.Child'>, <class '__main__.Mother'>, <class '__main__.Father'>, <class 'object'>)
