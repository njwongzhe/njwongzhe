# OOP: Properties, Class Methods, and Static Methods

# 1. Properties (@property, getters and setters)
# The @property decorator allows a method to be accessed like an attribute.
# This makes it easy to add validation when reading or writing attribute values.

class Celsius:
    def __init__(self, temperature=0):
        self._temperature = temperature # Protected backing variable

    @property
    def temperature(self):
        """Getter: Called when accessing obj.temperature"""
        print("Getting value...")
        return self._temperature

    @temperature.setter
    def temperature(self, value):
        """Setter: Called when writing obj.temperature = value"""
        print("Setting value with validation...")
        if value < -273.15:
            raise ValueError("Temperature below Absolute Zero is not possible!")
        self._temperature = value

c = Celsius(25)
print(c.temperature) # Accesses getter -> Output: Getting value... \n 25

c.temperature = 37 # Accesses setter -> Output: Setting value with validation...
print(c.temperature) # Output: 37

# c.temperature = -300 # Setter validation fails -> Raises ValueError

# ---------------------------------------------------------

# 2. Instance vs Class vs Static Methods

class Employee:
    company_name = "GlobalCorp" # Class attribute

    def __init__(self, name, salary):
        self.name = name
        self.salary = salary

    # A. Instance Method
    # Receives "self" as the first argument. Can access/modify instance AND class state.
    def get_details(self):
        return f"{self.name} earns ${self.salary} at {self.company_name}"

    # B. Class Method (@classmethod)
    # Receives "cls" as the first argument instead of "self". Can access/modify class state only.
    # Often used as factory methods / alternative constructors.
    @classmethod
    def change_company(cls, new_name):
        cls.company_name = new_name

    @classmethod
    def from_string(cls, emp_str):
        """Alternative constructor: create Employee from string 'John-50000'"""
        name, salary = emp_str.split("-")
        return cls(name, int(salary))

    # C. Static Method (@staticmethod)
    # Does NOT receive "self" or "cls". Behaves like a normal function inside the class namespace.
    # Used for utility functions that don't need access to instance or class attributes.
    @staticmethod
    def is_workday(day):
        # 5 = Saturday, 6 = Sunday
        return day not in (5, 6)

# --- Verification ---

emp1 = Employee("Alice", 60000)
print(emp1.get_details()) # Output: Alice earns $60000 at GlobalCorp

# Call class method to change state for all objects
Employee.change_company("TechMega")
print(emp1.get_details()) # Output: Alice earns $60000 at TechMega

# Use alternative constructor class method
emp2 = Employee.from_string("Bob-80000")
print(emp2.name, emp2.salary) # Output: Bob 80000

# Call static method (can be called on class directly or instance)
print(Employee.is_workday(2)) # Tuesday -> Output: True
print(emp1.is_workday(5)) # Saturday -> Output: False
