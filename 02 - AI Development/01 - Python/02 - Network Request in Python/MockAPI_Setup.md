# MockAPI Setup (Network Request in Python)

<br />

## 1.0 - What is MockAPI?

[MockAPI](https://mockapi.io) is a free online tool for quickly creating and testing mock RESTful APIs. It provides cloud-hosted endpoints with built-in data persistence and full CRUD support (`GET`, `POST`, `PUT`, `DELETE`).

- **Official Website**: [https://mockapi.io](https://mockapi.io)

<br />

## 2.0 - Quick Setup

### Step 1: Sign Up
- Go to [https://mockapi.io](https://mockapi.io) and log in using your GitHub or Google account.

### Step 2: Create a Project
- Click **`New Project`**.
- Set **Project Name** (e.g. `Restful API`).
- Set **API Prefix** to `api`. (Optional)
- Click **`Create`**.

### Step 3: Create a Resource (Endpoint)
- Inside the project, click **`New Resource`**.
- Set **Resource Name** to `itemList`.
- Add schema fields:
  - `id`: Auto-generated string.
  - `name`: String.
  - `info`: String.
- Click **`Create`**.

### Step 4: Generate Mock Data
- Click the **`Data`** button next to `itemList`.
- Choose the number of items (e.g. `10` or `20`) to auto-populate test data.

### Step 5: Copy Endpoint URL
- Copy your resource URL from the project dashboard:
  ```text
  https://<your_project_id>.mockapi.io/api/itemList
  ```

<br />

## 3.0 - How to Use in Network Request Scripts

This module demonstrates foundational client-side HTTP networking using Python's standard library (`urllib.request` and `json`). Each script executes direct CRUD operations against your remote MockAPI endpoint.

<br />

### 3.1 - Configuration
Scripts in this module do not use `.env` files. Simply set your MockAPI endpoint URL directly at the top of each script:

```python
API_URL = "https://<your_project_id>.mockapi.io/api/itemList"
```

<br />

### 3.2 - Script Execution & Endpoint Mapping

| Script | Operations Demonstrated | Target MockAPI URL | Execution Command |
| :--- | :--- | :--- | :--- |
| `02 - HTTP Response Attributes & Methods.py` | Inspect Response Metadata | `/itemList` | `python "02 - HTTP Response Attributes & Methods.py"` |
| `03 - GET Request.py` | Read All & Read Single | `/itemList`<br>`/itemList/{id}` | `python "03 - GET Request.py"` |
| `04 - POST Request.py` | Create Resource | `/itemList` | `python "04 - POST Request.py"` |
| `05 - PUT Request.py` | Update Resource | `/itemList/{id}` | `python "05 - PUT Request.py"` |
| `06 - DELETE Request.py` | Delete Resource | `/itemList/{id}` | `python "06 - DELETE Request.py"` |

> [NOTE]
> `01 - JSON Conversion.py` focuses purely on offline serialization (`json.dumps`), deserialization (`json.loads`), and UTF-8 byte encoding/decoding without sending network requests.

