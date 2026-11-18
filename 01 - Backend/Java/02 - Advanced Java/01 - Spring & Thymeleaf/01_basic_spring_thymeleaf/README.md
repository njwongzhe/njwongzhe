# Basic Spring Boot & Thymeleaf (`01_basic_spring_thymeleaf`)

<br />

## 1.0 - Project Overview

This project is a beginner-friendly Spring Web MVC and Thymeleaf syntax reference. It pairs a simple layered Spring backend (**Controller → Service → Repository + Model**) with step-by-step Thymeleaf HTML examples covering basic routing flow, standard expressions, and template attributes.

<br />

## 2.0 - Project Structure (High-Level)

```text
01_basic_spring_thymeleaf/
├── pom.xml                                  # Maven build and starter dependencies.
├── mvnw / mvnw.cmd                          # Maven Wrapper scripts for zero-install builds.
└── src/
    ├── main/
    │   ├── java/my/utm/springthymeleaf/     # Spring Web MVC backend source code.
    │   └── resources/                       # Configuration, messages, and Thymeleaf templates.
    └── test/
        └── java/my/utm/springthymeleaf/     # Automated Spring Boot context tests.
```

For detailed file layouts and framework syntax, jump to the dedicated guides:
- **[Spring Web MVC Guide](./src/main/java/my/utm/springthymeleaf/README.md)**: Backend package structure (`controller/`, `service/`, `repository/`, `model/`) and Spring Web MVC syntax.
- **[Thymeleaf & Resources Guide](./src/main/resources/README.md)**: Detailed `resources/` structure (`01_routing_flow/`, `02_thymeleaf_template/`), configuration files, and Thymeleaf/HTML syntax.

<br />

## 3.0 - How Spring Web MVC & Thymeleaf Interact

Spring Web MVC handles incoming HTTP requests on the server, attaches data to `Model`, and delegates rendering to Thymeleaf:

```text
Browser Request (GET /routing/get)
        │
        ▼
[ Controller ]       ──► Calls model.addAttribute("message", "...") and returns view name.
        │
        ▼
[ ViewResolver ]     ──► Maps "01_routing_flow/01_get_routing" to templates/01_routing_flow/01_get_routing.html.
        │
        ▼
[ Thymeleaf Engine ] ──► Replaces th:* attributes with Model data and sends rendered HTML to browser.
```

### Example: Simple Request & Response Flow

1. **Backend Controller (`C01_RoutingDemoController.java`)**:
   ```java
   @GetMapping("/get")
   public String getRouting(Model model) {
       // Attach data to Model so Thymeleaf can read it.
       model.addAttribute("message", "Hello from Spring MVC Controller!");
       // Return the logical HTML template path under templates/.
       return "01_routing_flow/01_get_routing";
   }
   ```

2. **Frontend Template (`templates/01_routing_flow/01_get_routing.html`)**:
   ```html
   <!-- Read the "message" attribute added by the controller. -->
   <p>Message from Controller: <strong th:text="${message}">Default message</strong></p>
   ```

<br />

## 4.0 - Quickstart

Run the application from the `01_basic_spring_thymeleaf/` directory:

```bash
# On Linux / macOS
./mvnw spring-boot:run

# On Windows PowerShell / Command Prompt
.\mvnw.cmd spring-boot:run
```

Open [http://localhost:8080/](http://localhost:8080/) in your browser to explore all syntax pages.
