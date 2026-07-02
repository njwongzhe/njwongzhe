# Object-Oriented Programming (OOP): Classes and Objects

# 1. Defining a Class
# In Python, class names follow PascalCase by convention.
class Dog:
    # A class attribute (shared by all instances of the class)
    species = "Canine"

    # Constructor method (__init__)
    # "self" represents the specific object instance we are creating/working with.
    # It must be the first parameter of any instance method.
    def __init__(self, name, age):
        self.name = name # Instance attribute
        self.age = age # Instance attribute

    # Instance method
    def bark(self):
        return f"{self.name} says Woof!"

# 2. Instantiating Objects
dog1 = Dog("Buddy", 3)
dog2 = Dog("Max", 5)

print(dog1.name) # Output: Buddy
print(dog1.bark()) # Output: Buddy says Woof!
print(dog2.bark()) # Output: Max says Woof!
print(dog1.species) # Output: Canine

# 3. Encapsulation & Access Modifiers
# In Python, all attributes and methods are public by default.
# Privacy is enforced by conventions and name mangling rather than keywords like public/private.

class BankAccount:
    def __init__(self, owner, balance):
        self.owner = owner # Public: Access and modify freely
        
        # Protected attribute (prefixed with a single underscore '_')
        # Tells developers: "This is internal; do not access it directly outside this class hierarchy."
        # Python does not enforce this restriction.
        self._account_type = "Savings"
        
        # Private attribute (prefixed with a double underscore '__')
        # Triggers "Name Mangling" - Python changes the internal name so it cannot be easily accessed.
        self.__balance = balance # Private: Cannot be accessed directly from outside

    def get_balance(self): # Public getter method
        return self.__balance

    def deposit(self, amount): # Public setter/modifier method
        if amount > 0:
            self.__balance += amount

account = BankAccount("Bob", 1000)
print(account.owner) # Output: Bob
print(account._account_type) # Output: Savings (Accessible, but breaks convention)

# print(account.__balance) # Error: AttributeError: 'BankAccount' object has no attribute '__balance'
print(account.get_balance()) # Output: 1000 (Correct way to access)

# How Name Mangling works internally:
# Python renames __balance to _BankAccount__balance.
print(account._BankAccount__balance) # Output: 1000 (Allows bypass, but highly discouraged)
