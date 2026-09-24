# ------------------------------------------------------------> 
# Importing Modules
# ------------------------------------------------------------> 

# ---> Standard Import
import math
print("Square root of 16:", math.sqrt(16)) # Output: 4.0

# ---> Selective Import
from math import pi, sin
print("Value of PI:", pi)
print("Sin of PI/2:", sin(pi / 2)) # Output: 1.0

# ---> Aliased Import
import datetime as dt
from math import cos as cosine

print("Current year:", dt.datetime.now().year)
print("Cosine of 0:", cosine(0)) # Output: 1.0