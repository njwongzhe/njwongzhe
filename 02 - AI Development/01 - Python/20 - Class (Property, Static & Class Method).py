# ------------------------------------------------------------> 
# Getters & Setters (@property & @<property_name>.setter)
# ------------------------------------------------------------> 

class Celsius:
    def __init__(self, temperature=0):
        self._temperature = temperature

    # The @property decorator allows a method to be accessed like an attribute.
    # It is used to add validation or custom logic when reading or writing attribute values.
    @property
    def temperature(self):
        return self._temperature

    # The @<property_name>.setter decorator is used to define a setter method for the <property_name> attribute.
    # It is used to add validation or custom logic when writing attribute values.
    @temperature.setter
    def temperature(self, value):
        if value < -273.15:
            raise ValueError("Temperature below Absolute Zero (-273.15°C) is not possible!")
        self._temperature = value

c = Celsius(25)
print(c.temperature)  # Accesses getter. # Output: 25

c.temperature = 37    # Accesses setter.
print(c.temperature)  # Output: 37

# c.temperature = -300 # Setter validation fails -> Raises ValueError

# ------------------------------------------------------------> 
# Class Methods (@classmethod)
# ------------------------------------------------------------> 
# The @classmethod decorator is used to define a class method.
# It receives 'cls' (the class itself) as the first parameter.
# They can modify class-level state or serve as alternative constructors (factory methods).

class Employee:
    company_name = "GlobalCorp"

    def __init__(self, name, salary):
        self.name = name
        self.salary = salary

    def get_info(self):
        return f"{self.name} earns ${self.salary} at {self.company_name}."

    @classmethod
    def set_company_name(cls, new_name):
        cls.company_name = new_name

    @classmethod
    def from_string(cls, emp_str):
        name, salary = emp_str.split("-")
        return cls(name, int(salary))

emp1 = Employee("Alice", 60000)
print(emp1.get_info())  # Output: Alice earns $60000 at GlobalCorp.

# Set company name for all instance.
Employee.set_company_name("TechCorp")
print(emp1.get_info()) # Output: Alice earns $60000 at TechCorp.

# Alternative constructor classmethod.
emp2 = Employee.from_string("Bob-80000")
print(emp2.get_info()) # Output: Bob earns $80000 at TechCorp.

# ------------------------------------------------------------> 
# Static Methods (@staticmethod)
# ------------------------------------------------------------> 
# The @staticmethod decorator is used to define a static method.
# They behave like regular functions, but belong to the class namespace for utility grouping.

class MathUtils:
    @staticmethod
    def is_even(number):
        return number % 2 == 0

    @staticmethod
    def is_workday(day):
        # 5 = Saturday, 6 = Sunday
        return day not in (5, 6)

print(MathUtils.is_even(10))   # Output: True
print(MathUtils.is_workday(5)) # Output: False
