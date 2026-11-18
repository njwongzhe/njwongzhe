# Java

<br />

## 1.0 - What Is Java & Installation

- Java is a class-based, object-oriented programming language designed for cross-platform portability ("Write Once, Run Anywhere").
- Java source code (`.java`) is compiled into platform-independent bytecode (`.class`), which is executed by the **Java Virtual Machine (JVM)**.
- Key Components:
  - **JVM (Java Virtual Machine)**: The runtime engine that executes compiled Java bytecode on the host operating system.
  - **JRE (Java Runtime Environment)**: Includes the JVM and core libraries required to run Java applications.
  - **JDK (Java Development Kit)**: Complete development kit containing the JRE, compiler (`javac`), debugger, and development tools. (Install this for development).
- Popular JDK Distributions:
  - Eclipse Temurin (Adoptium / OpenJDK): https://adoptium.net/
  - Oracle JDK: https://www.oracle.com/java/technologies/downloads/
  - Amazon Corretto: https://aws.amazon.com/corretto/
- Popular Java Frameworks & Build Tools:
  - Build Tools: Maven, Gradle
  - Frameworks: Spring Boot, Jakarta EE, Quarkus, Micronaut

<br />

## 2.0 - Environment Variables Setup

Setting up environment variables allows command-line tools, build tools (Maven, Gradle), and IDEs to locate Java binaries globally.

<br />

### 2.1 - Required Variables

| System Variable | Description | Example Path (Windows) |
| :--- | :--- | :--- |
| **`JAVA_HOME`** | Points to the root directory where the JDK is installed. | `D:\Java\jdk-21` |
| **`Path`** | Appends the `bin` directory of Java so executable tools can run anywhere. | `%JAVA_HOME%\bin` |

- **Managing Multiple Java Versions**:
  - Multiple JDK versions can be stored in the same parent directory under distinct folder names:
    ```text
    D:\Java\
    ├── jdk-17\
    ├── jdk-21\ <-- JAVA_HOME points here (e.g. D:\Java\jdk-21)
    └── jdk-25\
    ```
  - To switch between active versions, only update the directory path assigned to `JAVA_HOME`.
  - Because `Path` references `%JAVA_HOME%\bin`, it will automatically point to the selected JDK without modifying any other variables.

- **Note on Default Path Interference**:
  - Installers like Eclipse Temurin or Oracle JDK may automatically add default installation paths to the top of `Path`:
    - `C:\Program Files\Eclipse Adoptium\jdk-<version>\bin`
    - `C:\Program Files\Java\jdk-<version>\bin` (or `C:\Program Files\Common Files\Oracle\Java\javapath`)
  - Because Windows evaluates `Path` from top to bottom, these hardcoded paths take precedence over `%JAVA_HOME%\bin`.
  - If these entries exist, modifying `JAVA_HOME` will fail to switch Java versions because the system still executes the hardcoded runtime.
  - Remove these default installer entries from `Path`, or move `%JAVA_HOME%\bin` above them so switching `JAVA_HOME` functions properly.

<br />

### 2.2 - Verify Configuration

Open a terminal and verify the environment setup:

```bash
# Check Java Runtime Version
java -version

# Check Java Compiler Version
javac -version
```

<br />

## 3.0 - Commands

```html
java -version  | Check version of installed Java runtime (JRE/JVM).
javac -version | Check version of installed Java compiler (JDK).

javac <FileName.java> | Compile Java source file into bytecode (.class).
java <FileName.java>  | Compile and execute single-file source code directly (Java 11+).
```
