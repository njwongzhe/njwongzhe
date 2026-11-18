package my.utm.springthymeleaf.controller;

import jakarta.validation.Valid;
import my.utm.springthymeleaf.model.DemoItem;
import my.utm.springthymeleaf.service.DemoItemService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/* ============================================================ */
/* Template Attributes Controller                               */
/* ============================================================ */

@Controller
@RequestMapping("/attributes")
public class C03_AttributeDemoController {

    private final DemoItemService itemService;

    public C03_AttributeDemoController(DemoItemService itemService) {
        this.itemService = itemService;
    }

    // Supply dynamic attribute values for standard HTML attribute overrides.
    @GetMapping("/html")
    public String htmlAttributes(Model model) {
        model.addAttribute("targetUrl", "/routing/get");
        model.addAttribute("inputValue", "Spring Boot");
        model.addAttribute("textColor", "color: #1d4ed8; font-weight: bold;");
        model.addAttribute("isDisabled", true);
        model.addAttribute("isChecked", true);
        return "02_thymeleaf_template/02_template_attributes/01_html_attributes";
    }

    // Supply strings containing HTML tags to contrast th:text escaping against th:utext parsing.
    @GetMapping("/text")
    public String textAttributes(Model model) {
        model.addAttribute("safeText", "Escaped text: <b>bold tags stay literal</b>");
        model.addAttribute("rawHtml", "Unescaped HTML: <strong>bold tags are rendered</strong>");
        return "02_thymeleaf_template/02_template_attributes/02_text_attributes";
    }

    // Supply values for th:attr, th:attrprepend, and th:attrappend attribute manipulation.
    @GetMapping("/attr")
    public String attrManipulation(Model model) {
        model.addAttribute("tooltipText", "Dynamic tooltip from Model");
        model.addAttribute("extraClass", "highlight");
        return "02_thymeleaf_template/02_template_attributes/03_attr_manipulation";
    }

    // Supply a sample item to demonstrate scoped th:with local variables.
    @GetMapping("/with")
    public String localVariables(Model model) {
        model.addAttribute("sampleItem", itemService.getSampleItem());
        return "02_thymeleaf_template/02_template_attributes/04_local_variables";
    }

    // Supply boolean and string values for th:if, th:unless, th:switch, and th:case.
    @GetMapping("/conditional")
    public String conditionalAttributes(Model model) {
        model.addAttribute("isVisible", true);
        model.addAttribute("role", "ADMIN");
        return "02_thymeleaf_template/02_template_attributes/05_conditional_attributes";
    }

    // Supply a collection for th:each list iteration.
    @GetMapping("/each")
    public String iterationAttribute(Model model) {
        model.addAttribute("items", itemService.getAllItems());
        return "02_thymeleaf_template/02_template_attributes/06_iteration_attribute";
    }

    /* ------------------------------------------------------------ */
    /* Form Binding And Validation Flow                             */
    /* ------------------------------------------------------------ */

    // Supply an empty DemoItem command object for th:object and th:field form binding.
    @GetMapping("/form")
    public String showFormAttributes(Model model) {
        model.addAttribute("item", new DemoItem());
        return "02_thymeleaf_template/02_template_attributes/07_form_attributes";
    }

    // @ModelAttribute instantiates DemoItem via its no-arg constructor and matches each HTML input "name" (e.g. name="name") to the Java setter (setName()).
    // It also stores the bound object back into Model under "item" so th:object="${item}" can re-display user inputs on error.
    // @Valid triggers Jakarta Bean Validation annotations on DemoItem.
    // BindingResult captures validation errors and must immediately follow the @Valid parameter.
    @PostMapping("/form")
    public String submitFormAttributes(
        @Valid @ModelAttribute("item") DemoItem item,
        BindingResult result,
        Model model
    ) {
        if (result.hasErrors()) {
            return "02_thymeleaf_template/02_template_attributes/07_form_attributes";
        }
        itemService.addItem(item);
        model.addAttribute("savedName", item.getName());
        return "02_thymeleaf_template/02_template_attributes/07_form_attributes";
    }

    // Render the self-contained fragment attributes demonstration page.
    @GetMapping("/fragment")
    public String fragmentAttributes() {
        return "02_thymeleaf_template/02_template_attributes/08_fragment_attributes";
    }
}
