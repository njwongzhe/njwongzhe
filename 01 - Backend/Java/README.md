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

<br />

## 4.0 - Apache Maven

- Apache Maven is a build automation and project management tool primarily used for Java applications.
- Manages project dependencies, compilation, testing, packaging, and deployments through an XML configuration file named `pom.xml` (Project Object Model).
- Apache Maven Download: https://maven.apache.org/download.cgi

<br />

### 4.1 - Environment Variables Setup (Maven)

| Variable | Description | Example Path (Windows) |
| :--- | :--- | :--- |
| **`MAVEN_HOME`** | Points to the extracted root directory of Apache Maven. | `C:\Program Files\Apache\apache-maven-3.9.6` |
| **`Path`** | Appends the `bin` directory of Maven to run `mvn` globally. | `%MAVEN_HOME%\bin` |

- Add `%MAVEN_HOME%\bin` to the system `Path` variable in Windows Environment Variables.
- Verify installation in terminal: `mvn -version`.

<br />

### 4.2 - Commands

```html
mvn -v                  | Check version of installed Apache Maven and active Java runtime.
mvn clean               | Remove the target directory and all previously compiled build files.
mvn compile             | Compile source code located in src/main/java into target/classes.
mvn test                | Run automated unit tests located in src/test/java.
mvn package             | Compile code and package into distribution format (.jar or .war).
mvn install             | Package and deploy the artifact to local repository (~/.m2/repository).
mvn clean package       | Clean previous builds and create a fresh package in a single step.
```

<br />

### 4.3 - Creating a Webapp Project (Archetype)

- Run the following command in terminal to generate a standard Java Webapp project structure without interactive prompts:

```bash
# Generate Standard Java Webapp Project
mvn -B archetype:generate \
  -DarchetypeGroupId=org.apache.maven.archetypes \
  -DarchetypeArtifactId=maven-archetype-webapp \
  -DarchetypeVersion=1.4 \
  -DgroupId=com.example \
  -DartifactId=helloworld101 \
  -Dpackage=com.example.helloworld \
  -DinteractiveMode=false
```

- Parameter Explanations:

| Parameter | Description |
| :--- | :--- |
| **`-B` / `-DinteractiveMode=false`** | Runs Maven in batch mode without waiting for interactive user inputs. |
| **`-DarchetypeGroupId`** | Group ID of the archetype template (`org.apache.maven.archetypes`). |
| **`-DarchetypeArtifactId`** | Artifact ID of the template (`maven-archetype-webapp` for Java web applications). |
| **`-DarchetypeVersion`** | Version of the webapp archetype template (`1.4`). |
| **`-DgroupId`** | Package or organizational namespace (e.g. `com.example`). |
| **`-DartifactId`** | Project name and root folder name (e.g. `helloworld101`). |
| **`-Dpackage`** | Default base package for Java source files (e.g. `com.example.helloworld`). |

<br />

### 4.4 - Maven Webapp Directory Structure

| File / Directory | Description |
| :--- | :--- |
| **`pom.xml`** | Project Object Model configuration file defining dependencies, plugins, and build profiles. |
| **`src/main/webapp/`** | Root directory containing public web assets (HTML, JSP, CSS, JS, images). |
| └ **`index.jsp`** | Default starter JSP home page created by the webapp archetype. |
| └ **`WEB-INF/`** | Protected directory containing web application configuration and private resources. |
| --└ **`web.xml`** | Deployment descriptor file defining servlet mappings, filters, and welcome files. |
| **`src/main/java/`** | Directory for Java source files and servlets (create manually if absent). |
| **`target/`** | Output directory for compiled class files and the packaged `.war` archive. |

<br />

## 5.0 - Apache Tomcat

- Apache Tomcat is an open-source web server and Java Servlet container developed by the Apache Software Foundation.
- Executes Java Servlets, renders JavaServer Pages (JSP), and powers Java EE / Jakarta EE web applications.
- Apache Tomcat Download: https://tomcat.apache.org/

<br />

### 5.1 - Tomcat Directory Structure

| Directory | Description |
| :--- | :--- |
| **`bin/`** | Executable scripts for starting and stopping the server (`startup.bat`/`shutdown.bat` on Windows). |
| **`conf/`** | Server configuration files, including `server.xml` and `web.xml`. |
| **`webapps/`** | Deployment folder where application `.war` files or exploded directories are placed. |
| **`logs/`** | Server runtime and access logs (`catalina.out`, `localhost.log`). |
| **`work/`** | Temporary cache and generated servlet code from compiled JSP files. |

<br />

### 5.2 - Configuration & Port Modification

- Tomcat uses port `8080` by default.
- If port `8080` is in use or a custom port is preferred (e.g. `8585`), modify `conf/server.xml`:

```xml
<!-- Locate Connector element inside conf/server.xml and update port attribute -->
<Connector port="8585" protocol="HTTP/1.1"
           connectionTimeout="20000"
           redirectPort="8443" />
```

<br />

### 5.3 - Starting & Stopping Tomcat (CLI)

- **Start Tomcat**:
  - Windows: Run `bin\startup.bat`.
  - Linux / macOS: Run `./bin/startup.sh`.
- **Stop Tomcat**:
  - Windows: Run `bin\shutdown.bat`.
  - Linux / macOS: Run `./bin/shutdown.sh`.
- **Access Server**:
  - Navigate to `http://localhost:8585` (or `http://localhost:8080`) in your browser to verify the Tomcat landing page.

<br />

## 6.0 - Community Server Connector (VS Code)

- **Community Server Connectors** is a Visual Studio Code extension developed to run, configure, and debug application servers (Apache Tomcat, WildFly, Jetty) directly inside VS Code.
- Extension Marketplace Name: **Community Server Connectors** (`redhat.vscode-community-server-connector`).

<br />

### 6.1 - Setup Tomcat Server in VS Code

1. **Install Extension**:
   - Open VS Code Extensions view (<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>X</kbd>) and install **Community Server Connectors**.
2. **Add Server**:
   - Open the **Servers** panel in the Side Bar.
   - Click the **Create New Server** (`+`) icon.
   - Choose **Apache Tomcat** and select the matching version (e.g., **Tomcat 9.x**).
3. **Configure Server Home Directory**:
   - Select your extracted Tomcat root folder (e.g., `D:\Java\apache-tomcat-9.0.123`).
4. **Configure Server Properties**:
   - Adjust server properties (e.g. set `"server.http.port": "8585"` if customizing the HTTP port).
   - Confirm server creation.

<br />

### 6.2 - Deploying and Running Maven Web Applications

1. **Package the Project**:
   - In terminal, build your project to generate the `.war` file:
   ```bash
   mvn clean package
   ```
2. **Add Deployment**:
   - In the **Servers** panel, right-click your configured Tomcat server.
   - Select **Add Deployment**.
   - Choose the generated `.war` file from `target/` (e.g., `target/helloworld101.war`) or the project workspace folder.
3. **Run or Debug Server**:
   - Right-click the server and choose **Start Server** or **Restart Server in Debug Mode**.
4. **Access Deployed Application**:
   - Open browser and navigate to:
   ```html
   http://localhost:8585/<artifactId>/
   Example: http://localhost:8585/helloworld101/
   ```