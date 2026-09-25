# FastAPI

<br />

## 1.0 - What Is FastAPI & Installation

- It is a modern, high-performance web framework for building RESTful APIs in Python.
- Built on top of **Starlette** (for ASGI web routing and async capabilities) and **Pydantic** (for data validation and serialization).
- FastAPI Official Website & Documentation: https://fastapi.tiangolo.com/

- Installation & Setup Summary:
   1. Ensure Python 3.8+ is installed on your computer.
   2. Create and activate a virtual environment for your project (recommended).
   3. Run `pip install "fastapi[standard]"` to install FastAPI and all standard tools (including Uvicorn ASGI server).
   4. Start your application server using `uvicorn main:app --reload` or `fastapi dev main.py`.

<br />

## 2.0 - Commands

```html
python --version 
   | Check version of Python. Use this to verify Python is installed and recognized by your computer.

pip --version 
   | Check version of pip. Use this to verify Python package manager is installed and recognized.

python -m venv .venv 
   | Create an isolated virtual environment named ".venv" in the current directory.
   | Recommended to run before installing packages to avoid polluting the global Python environment.

.\.venv\Scripts\activate 
   | Activate the virtual environment on Windows (PowerShell/CMD).
   | Once activated, "(venv)" will appear at the start of your terminal prompt.
   | On macOS/Linux, run: "source .venv/bin/activate".

deactivate 
   | Deactivate the currently active virtual environment and return to the system global Python.

pip install "fastapi[standard]" 
   | Install FastAPI with all recommended standard tools and dependencies.
   | Includes Uvicorn (ASGI server), Pydantic (data validation), email-validator, and the FastAPI CLI.

pip install fastapi uvicorn 
   | Install minimal core FastAPI and Uvicorn server without extra optional tools.

pip install -r requirements.txt 
   | Install all dependencies listed in the requirements.txt file of a project.
   | Run it when you first clone/download a project or if you switch to a new environment.
   | Your current directory must be the project folder (where requirements.txt is located).

pip freeze > requirements.txt 
   | Export all installed packages and their exact versions into requirements.txt.
   | Run this when you install new packages so other team members can install the same dependencies.

pip list 
   | Display all installed Python packages and their versions in the current environment.

uvicorn main:app --reload 
   | Start the FastAPI application in development mode with hot-reloading.
   | "main" refers to the file "main.py".
   | "app" refers to the FastAPI() object instance created inside main.py (e.g. app = FastAPI()).
   | "--reload" tells Uvicorn to monitor files and restart automatically when code changes.
   | Your current working directory must be the folder containing main.py.

uvicorn main:app --host 0.0.0.0 --port 8000 
   | Start the server on a custom IP address and port number.
   | "0.0.0.0" makes the server accessible across the local network (LAN), not just localhost.
   | Default port is 8000.

uvicorn main:app --workers 4 
   | Start the server with multiple worker processes (typically used for production deployments).
   | Note: "--reload" cannot be used together with "--workers".

fastapi dev main.py 
   | Modern FastAPI CLI command to launch a development server with auto-reload and rich terminal output.
   | Available when "fastapi[standard]" is installed.

fastapi run main.py 
   | Modern FastAPI CLI command to run the application in production mode (auto-reload disabled).
```

<br />

## 3.0 - Standard Project Structure

A typical production-ready, modular FastAPI project follows this layered architecture:

| File / Directory | Description |
| :--- | :--- |
| **`.gitignore`** | Specifies files and folders Git should ignore (e.g. `.venv/`, `__pycache__/`, `.env`). |
| **`.env`** | Stores local environment variables (e.g. database credentials, API keys) safely outside version control. |
| **`.env.example`** | Example template showing required environment variables without sensitive secrets. |
| **`requirements.txt`** | Lists all Python package dependencies and versions needed to run the project. |
| **`main.py`** | Application entry point: initializes `FastAPI()`, configures middleware, mounts routers, and runs Uvicorn. |
| **`routers\`** | Directory containing API route definitions and endpoint handlers grouped by domain or resource. |
| └ **`__init__.py`** | Centralizes and exports routers, simplifying imports into `main.py`. |
| └ **`items.py`** | Defines URL paths and HTTP verbs (`@router.get`, `@router.post`, etc.) for items. |
| **`schemas\`** | Directory containing Pydantic data validation models (`BaseModel`). |
| └ **`__init__.py`** | Centralizes and exports public schemas. |
| └ **`item.py`** | Defines request bodies (`ItemCreate`) and response models (`ItemResponse`). |
| **`services\`** | Directory containing business logic, external API calls, and database operations. |
| └ **`__init__.py`** | Centralizes and exports service modules. |
| └ **`item_service.py`** | Implements CRUD business logic, isolating network/database logic from route handlers. |

<br />

## 4.0 - Interactive Documentation

FastAPI automatically generates interactive documentation out of the box with zero extra configuration.

<br />

### 4.1 - How to Access Default Documentation

1. Start your FastAPI application:
   ```bash
   uvicorn main:app --reload
   ```
2. Open your browser and navigate to either of the built-in documentation interfaces:
   - **Swagger UI**: [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)  
     *(Interactive testing UI where you can inspect endpoints and execute live requests)*.
   - **ReDoc**: [http://127.0.0.1:8000/redoc](http://127.0.0.1:8000/redoc)  
     *(Clean, responsive documentation layout)*.
   - **OpenAPI JSON**: [http://127.0.0.1:8000/openapi.json](http://127.0.0.1:8000/openapi.json)  
     *(Raw machine-readable OpenAPI schema)*.

<br />

### 4.2 - Customizing or Disabling Documentation URLs

You can customize the URL paths or disable the documentation entirely inside `main.py`:

```python
from fastapi import FastAPI

# Customizing documentation URLs:
app = FastAPI(
    docs_url="/documentation", # Changes Swagger UI to http://127.0.0.1:8000/documentation
    redoc_url="/redoc-api",    # Changes ReDoc to http://127.0.0.1:8000/redoc-api
    openapi_url="/api/v1/openapi.json"
)

# Disabling documentation entirely (useful in production):
app = FastAPI(
    docs_url=None,   # Disables Swagger UI
    redoc_url=None,  # Disables ReDoc
    openapi_url=None # Disables raw OpenAPI schema
)
```