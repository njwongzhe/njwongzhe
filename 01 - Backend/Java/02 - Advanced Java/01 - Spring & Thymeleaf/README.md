# Spring & Thymeleaf

<br />

## 1.0 - What Is Spring & Thymeleaf & Installation

- **Spring Framework** is an enterprise-grade, open-source Java application framework designed to simplify application development through **Inversion of Control (IoC)** and **Dependency Injection (DI)**.
- **Spring Boot** is an opinionated, convention-over-configuration extension of Spring that packages an embedded servlet container (Apache Tomcat), eliminates boilerplate XML configuration, and produces standalone executable JARs.
- **Spring Web MVC** is the servlet-based web framework in Spring that handles HTTP request routing, controller execution, form binding, and view resolution.
- **Thymeleaf** is a modern server-side Java template engine that processes standard HTML5 files with **Natural Templating**, allowing templates to be opened as static prototypes in a browser while rendering live server data at runtime.
- Spring Initializr: https://start.spring.io/
- Spring Boot Official Documentation: https://spring.io/projects/spring-boot
- Thymeleaf Official Documentation: https://www.thymeleaf.org/

<br />

- **Installation & Setup Summary**:
  1. Ensure a modern LTS Java Development Kit (JDK 17 or JDK 21+) and Apache Maven (3.9+) are installed on your computer.
  2. Visit **Spring Initializr** (https://start.spring.io/) or use the VS Code **Spring Boot Extension Pack** to generate a starter project.
  3. Configure the project metadata and select the required starter dependencies.
  4. Download and extract the generated archive, then open the project folder in your IDE.

<br />

- **Included Prompts (Spring Initializr Configuration)**:

| Prompt | Description |
| :--- | :--- |
| **`Project`** | Choose the build automation tool for your project (`Maven` or `Gradle`). (Prefer `Maven`.) |
| **`Language`** | Choose the programming language (`Java`, `Kotlin`, or `Groovy`). (Choose `Java`.) |
| **`Spring Boot`** | Choose the Spring Boot framework version. (Select the latest stable release.) |
| **`Project Metadata`** | Define `Group` (e.g. `my.utm`), `Artifact` (e.g. `campus-mvc`), and packaging type (`Jar`). |
| **`Java Version`** | Choose the target Java LTS version (`17` or `21`). |
| **`Dependencies`** | Select starter modules to include in `pom.xml` (`Spring Web`, `Thymeleaf`, `Validation`, `Spring Boot DevTools`). |

<br />

- **Recommended Starter Dependencies**:

| Starter Dependency | Artifact ID | Description |
| :--- | :--- | :--- |
| **`Spring Web`** | `spring-boot-starter-webmvc` | Provides Spring Web MVC, request routing, and an embedded Apache Tomcat server. |
| **`Thymeleaf`** | `spring-boot-starter-thymeleaf` | Provides the Thymeleaf template engine and Spring `ViewResolver` integration. |
| **`Validation`** | `spring-boot-starter-validation` | Provides Jakarta Bean Validation (`@Valid`, `@NotNull`) and Hibernate Validator. |
| **`Spring Boot DevTools`** | `spring-boot-devtools` | Enables automatic application restart and template live-reload during development. |

<br />

## 2.0 - Enabling Hot Reload (Development Mode)

To enable automatic restart for Java changes and instant browser refresh for Thymeleaf HTML changes during local development:

1. **Add `spring-boot-devtools` to `pom.xml`**:
   Add the following dependency inside the `<dependencies>` section of `pom.xml`:
   ```xml
   <!-- Enable Automatic Restart And Live Reload During Development -->
   <dependency>
       <groupId>org.springframework.boot</groupId>
       <artifactId>spring-boot-devtools</artifactId>
       <scope>runtime</scope>
       <optional>true</optional>
   </dependency>
   ```

2. **Disable Thymeleaf Template Caching**:
   Add the following line to `src/main/resources/application.properties` so HTML changes appear immediately without restarting:
   ```properties
   # Disable Template Caching For Instant HTML Reloads
   spring.thymeleaf.cache=false
   ```

<br />

## 3.0 - Commands

```html
./mvnw spring-boot:run
  | Start the Spring Boot application using the embedded Tomcat server via Maven Wrapper.
  | Run ".\mvnw.cmd spring-boot:run" on Windows PowerShell or Command Prompt.
  | By default, the application is hosted at http://localhost:8080.
  | Your current directory must be the project root folder (where pom.xml is located).

./mvnw clean
  | Delete the target directory and remove all previously compiled build artifacts.
  | Run ".\mvnw.cmd clean" on Windows.

./mvnw compile
  | Compile Java source files located in src/main/java into target/classes.
  | Run ".\mvnw.cmd compile" on Windows.

./mvnw test
  | Execute automated unit and integration tests located in src/test/java.
  | Run ".\mvnw.cmd test" on Windows.

./mvnw clean package
  | Clean previous builds, compile code, run tests, and package the app into an executable .jar file.
  | The generated executable JAR will be placed inside the target/ directory.
  | Run ".\mvnw.cmd clean package" on Windows.

./mvnw dependency:tree
  | Display the full Maven dependency hierarchy including transitive dependencies.
  | Run ".\mvnw.cmd dependency:tree" on Windows.

java -jar target/<filename>.jar
  | Run the standalone packaged Spring Boot JAR application directly using the Java runtime.
  | Does not require Maven or an external Tomcat installation.
```

<br />

## 4.0 - Projects in This Directory

- **[01_basic_spring_thymeleaf](./01_basic_spring_thymeleaf/README.md)**: A complete, runnable Spring Web MVC and Thymeleaf campus booking system (`campus-mvc`) demonstrating layered architecture, form validation, Post/Redirect/Get (PRG), reusable fragments, and externalized messages.
