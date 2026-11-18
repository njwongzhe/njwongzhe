package my.utm.springthymeleaf.controller;

import my.utm.springthymeleaf.service.DemoItemService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/* ============================================================ */
/* Thymeleaf Standard Expressions Controller                    */
/* ============================================================ */

@Controller
@RequestMapping("/expressions")
public class C02_ExpressionDemoController {

    private final DemoItemService itemService;

    public C02_ExpressionDemoController(DemoItemService itemService) {
        this.itemService = itemService;
    }

    // Provide a string and list for ${...} variable expressions and #lists utility methods.
    @GetMapping("/variable")
    public String variableExpressions(Model model) {
        model.addAttribute("title", "Variable Expressions");
        model.addAttribute("items", itemService.getAllItems());
        return "02_thymeleaf_template/01_standard_expressions/01_variable_expressions";
    }

    // Provide a single DemoItem object for th:object and *{...} selection expressions.
    @GetMapping("/selection")
    public String selectionExpressions(Model model) {
        model.addAttribute("item", itemService.getSampleItem());
        return "02_thymeleaf_template/01_standard_expressions/02_selection_expressions";
    }

    // Provide an identifier parameter for @{...} link URL expressions.
    @GetMapping("/url")
    public String linkUrlExpressions(Model model) {
        model.addAttribute("sampleId", 1);
        return "02_thymeleaf_template/01_standard_expressions/03_link_url_expressions";
    }

    // Handle path variable and query parameter links from 03_link_url_expressions.html.
    @GetMapping("/url/{id}")
    public String linkUrlPathTarget(
        @PathVariable("id") long id,
        @RequestParam(name = "mode", required = false) String mode,
        Model model
    ) {
        model.addAttribute("sampleId", id);
        model.addAttribute("activeMode", mode);
        return "02_thymeleaf_template/01_standard_expressions/03_link_url_expressions";
    }

    // No Model attributes are required because #{...} reads directly from messages.properties.
    @GetMapping("/message")
    public String messageExpressions() {
        return "02_thymeleaf_template/01_standard_expressions/04_message_expressions";
    }

    // No Model attributes are required because ~{...} resolves fragments/sample.html at render time.
    @GetMapping("/fragment")
    public String fragmentExpressions() {
        return "02_thymeleaf_template/01_standard_expressions/05_fragment_expressions";
    }
}
