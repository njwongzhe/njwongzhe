package my.utm.springthymeleaf;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/* ============================================================ */
/* Spring Boot Application Entry Point                          */
/* ============================================================ */

// @SpringBootApplication enables auto-configuration and component scanning across this root package and its subpackages.
@SpringBootApplication
public class SpringThymeleafApplication {

    // Bootstrap the Spring ApplicationContext and start the embedded Tomcat server.
    public static void main(String[] args) {
        SpringApplication.run(SpringThymeleafApplication.class, args);
    }
}
