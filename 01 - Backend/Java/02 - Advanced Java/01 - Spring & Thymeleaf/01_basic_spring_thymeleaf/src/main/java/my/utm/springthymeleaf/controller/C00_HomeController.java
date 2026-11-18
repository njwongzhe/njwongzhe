package my.utm.springthymeleaf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/* ============================================================ */
/* Root Navigation Controller                                   */
/* ============================================================ */

// @Controller registers this class as a Spring Web MVC request handler bean.
@Controller
public class C00_HomeController {

    // Map the root URL (GET /) to templates/index.html.
    @GetMapping("/")
    public String index() {
        return "index";
    }
}
