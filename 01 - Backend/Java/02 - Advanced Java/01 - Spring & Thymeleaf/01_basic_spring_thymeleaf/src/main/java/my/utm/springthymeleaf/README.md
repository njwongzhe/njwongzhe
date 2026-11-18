# Spring Web MVC Guide (`my.utm.springthymeleaf`)

<br />

## 1.0 - Package Structure

```text
src/main/java/my/utm/springthymeleaf/
├── SpringThymeleafApplication.java          # Main @SpringBootApplication entry point & component scan root.
├── controller/                              # Web layer handling HTTP requests, Model, and view routing (@Controller).
│   ├── C00_HomeController.java
│   ├── C01_RoutingDemoController.java
│   ├── C02_ExpressionDemoController.java
│   └── C03_AttributeDemoController.java
├── service/                                 # Business logic layer (@Service).
│   └── DemoItemService.java
├── repository/                              # Data access contracts and storage implementations (@Repository).
│   ├── DemoItemRepository.java
│   └── InMemoryDemoItemRepository.java
└── model/                                   # Plain domain and form command objects (POJOs).
    └── DemoItem.java
```

<br />

## 2.0 - Core Architectural Rules

1. **Spring Beans vs. Plain Objects**:
   - `@Controller`, `@Service`, and `@Repository` classes are singleton **Spring Beans** managed by `ApplicationContext`.
   - `DemoItem` in `model/` is a **plain Java object (POJO)** instantiated per request and must never carry `@Component`.
2. **Constructor Injection**:
   - Declare dependencies as `private final` fields and inject them via the class constructor instead of field `@Autowired`.
3. **Stateless Controllers**:
   - Never store request-specific mutable data in controller fields, because singleton controllers are shared across concurrent requests.
4. **`BindingResult` Ordering Rule**:
   - `BindingResult` must immediately follow the `@Valid @ModelAttribute(...)` parameter in the handler method signature.

<br />

## 3.0 - Spring Web MVC Syntax Reference

### 3.1 - Controller & Constructor Injection

- `@Controller` : Marks a class as a Spring Web MVC request handler bean.
```java
@Controller
public class C00_HomeController {
    ...
}
```

- `@RequestMapping` : Sets a shared base URL prefix for every handler method inside the controller.
```java
@Controller
@RequestMapping("/routing")
public class C01_RoutingDemoController {
    ...
}
```

- Constructor Injection : Injects required service or repository beans via the single public constructor without `@Autowired`.
```java
private final DemoItemService itemService;

public C01_RoutingDemoController(DemoItemService itemService) {
    this.itemService = itemService;
}
```

<br />

### 3.2 - GET Routing, Query & Path Parameters

- `@GetMapping` & `Model.addAttribute()` : Maps HTTP `GET` requests and passes server data to the Thymeleaf template.
```java
@GetMapping("/get")
public String getRouting(Model model) {
    model.addAttribute("message", "Hello from Spring MVC Controller!");
    return "01_routing_flow/01_get_routing";
}
```

- `@RequestParam` : Extracts query parameters (`?userName=Alice`) or form inputs from the HTTP request.
```java
@GetMapping("/get")
public String getRouting(
    @RequestParam(name = "userName", defaultValue = "World") String userName,
    Model model
) {
    model.addAttribute("message", "Hello " + userName);
    return "01_routing_flow/01_get_routing";
}
```

- `@PathVariable` : Extracts dynamic segments directly from the URI path (e.g. `/expressions/url/1`).
```java
@GetMapping("/url/{id}")
public String linkUrlPathTarget(
    @PathVariable("id") long id,
    Model model
) {
    model.addAttribute("sampleId", id);
    return "02_thymeleaf_template/01_standard_expressions/03_link_url_expressions";
}
```

<br />

### 3.3 - POST Routing (Direct View vs. Redirect)

- `@PostMapping` + Direct View Return : Handles HTTP `POST` and renders the template in the same request, keeping `Model` attributes.
```java
@PostMapping("/post")
public String handlePostRouting(
    @RequestParam(name = "userName", defaultValue = "Guest") String userName,
    Model model
) {
    model.addAttribute("result", "Backend received POST input: " + userName);
    return "01_routing_flow/02_post_routing";
}
```

- `redirect:/...` : Sends an HTTP 302 redirect so the browser issues a fresh `GET` request (prevents duplicate POST on refresh; requires `RedirectAttributes` to pass flash data).
```java
@PostMapping("/post")
public String handlePostRedirect() {
    return "redirect:/routing/get";
}
```

<br />

### 3.4 - Form Binding & Validation

- `@ModelAttribute` : Instantiates the POJO via its no-arg constructor, matches each HTTP form input `name` (e.g. `name="name"`, `name="category"`) to the matching Java setter (`setName()`, `setCategory()`), and places the object into `Model` under `"item"` for `th:object="${item}"`.
```java
@PostMapping("/form")
public String bindForm(@ModelAttribute("item") DemoItem item) {
    // HTML <input name="name"> -> item.setName(...)
    // HTML <input name="category"> -> item.setCategory(...)
    return "02_thymeleaf_template/02_template_attributes/07_form_attributes";
}
```

- `@Valid` & `BindingResult` (Paired With Model Constraints) : `@Valid` triggers Jakarta Bean Validation annotations (`@NotBlank`, `@Size`) declared on the `DemoItem` model, while `BindingResult` (must immediately follow `@Valid`) captures any rule failures without throwing a `400 Bad Request`.
```java
// 1. Validation constraints declared on the Model (DemoItem.java):
public class DemoItem {
    @NotBlank(message = "Name is required.")
    @Size(min = 2, max = 50, message = "Name must be between 2 and 50 characters.")
    private String name;
}

// 2. Controller triggers @Valid and checks BindingResult:
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
```
