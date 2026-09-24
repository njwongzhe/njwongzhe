# ------------------------------------------------------------> 
# Class & Instance
# ------------------------------------------------------------> 
# In Python, class names follow PascalCase by convention.

class Dog:
    # Class Attribute
    species = "Canine"

    # Constructor (__init__)
    # It must be the first parameter of any class method.
    def __init__(self, name, age):
        self.name = name 
        self.age = age   

    # Class Method
    def bark(self):
        return f"{self.name} says Woof!"

# ---> Objects
dog1 = Dog("Buddy", 3)
dog2 = Dog("Max", 5)

print(dog1.name)    # Output: Buddy
print(dog1.bark())  # Output: Buddy says Woof!
print(dog2.bark())  # Output: Max says Woof!
print(dog1.species) # Output: Canine

# ------------------------------------------------------------> 
# Encapsulation & Access Modifiers
# ------------------------------------------------------------> 
# In Python, all attributes and methods are public by default.
# Privacy is enforced by conventions and name mangling rather than keywords like public / private.
# Python doesn't enforce privacy but rather uses conventions and name mangling.

class BankAccount:
    # ---> Class Attributes with Type Hinting. 
    # Type hinting is optional and not strictly enforced at runtime.
    # However, if not applying type hinting at there, these part of code is redundant since __init__ is the method that will be called when creating an instance.
    owner: str         # Public Attribute    # Prefixed with No Underscore.
    _account_type: str # Protected Attribute # Prefixed with a single underscore '_'.
    __balance: int     # Private Attribute   # Prefixed with a double underscore '__'.

    def __init__(self, owner, balance):
        self.owner = owner
        self._account_type = "Savings"
        self.__balance = balance

    def get_balance(self): # Public Getter Method
        return self.__balance

    def deposit(self, amount): # Public Setter Method
        if amount > 0:
            self.__balance += amount

account = BankAccount("Bob", 1000)
print(account.owner)         # Output: Bob
print(account._account_type) # Output: Savings

# print(account.__balance) # Error: AttributeError: 'BankAccount' object has no attribute '__balance' 
                           # This is because when interpreter compiled the code, it will auto rename private attributes to _ClassName__attributeName.
                           # The actual private attribute name is '_BankAccount__balance'.
print(account._BankAccount__balance) # Output: 1000 # Allows bypass, but highly discouraged.

print(account.get_balance()) # Output: 1000 # Correct way to access.