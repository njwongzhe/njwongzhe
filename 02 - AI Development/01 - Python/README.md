# Python (.py)

<br />

## 1.0 - What Is Python & Installation

- It is a high-level, interpreted, and dynamically typed programming language.
- Python is known for its readability, clean syntax, and versatility.
- Python Download: https://www.python.org/downloads/

<br />

## 2.0 - Comments

```python
# Single Line Comment

"""
Multi Line 
Comment
"""

'''
Multi Line 
Comment
'''
```

<br />

## 3.0 - Command

```html
python --version 
  | Check version of Python. Use this to verify Python is installed and recognized by your computer.

python <filename.py> 
  | Run the Python script.

python 
  | Enter the Python REPL Environment (interactive shell). Type exit() or press Ctrl+Z to exit.
```

<br />

## 4.0 - Package Manager & Virtual Environment

```html
pip --version 
  | Check version of Pip (Python Package Index package manager).

pip install <packageName> 
  | Install a specific package/library.
  | Example: "pip install requests" will download and install the "requests" library.

pip uninstall <packageName> 
  | Uninstall a specific package.

pip list 
  | List all packages installed in the current environment.

python -m venv <envName> 
  | Create a virtual environment to manage dependencies locally for a project.
  | Example: "python -m venv myenv" will create a virtual environment named "myenv".

myenv\Scripts\activate.bat 
  | Activate the virtual environment (Windows Command Prompt).
  | Use "deactivate" to turn off the virtual environment.
```
