# ------------------------------------------------------------> 
# Inheritance
# ------------------------------------------------------------> 
# Allows a class (child / subclass) to inherit attributes and methods from another class (parent/superclass).

class Animal:
    def __init__(self, name):
        self.name = name

    def speak(self):
        return "Some generic sound."

# Cat inherits from Animal.
class Cat(Animal):
    def __init__(self, name, breed):
        # Call the parent class constructor to initialize the 'name' attribute
        super().__init__(name)
        self.breed = breed

    # Overriding: Customizing/extending parent method behavior using super().
    def speak(self):
        # super() calls the parent's speak() method.
        parent_speak = super().speak()
        return f"{parent_speak}, but {self.name} meows Meow!"

my_cat = Cat("Whiskers", "Persian")
print(my_cat.name)    # Inherited Attribute              # Output: Whiskers
print(my_cat.breed)   # Child Attribute                  # Output: Persian
print(my_cat.speak()) # Overridden Method using super(). # Output: Some generic sound, but Whiskers meows Meow!

# ------------------------------------------------------------> 
# Multiple Inheritance & MRO (Method Resolution Order)
# ------------------------------------------------------------> 
# Python supports inheriting from multiple parent classes.
# The MRO defines the order in which Python searches for inherited attributes / methods.

class Mother:
    def greet(self):
        return "Mother greeting."

class Father:
    def greet(self):
        return "Father greeting."

# Child inherits from Mother first, then Father.
class Child(Mother, Father):
    pass # "pass" means do nothing. Just to prevent syntax error.

c = Child()
print(c.greet()) # Output: Mother greeting. # It searches Mother first because it was listed first.