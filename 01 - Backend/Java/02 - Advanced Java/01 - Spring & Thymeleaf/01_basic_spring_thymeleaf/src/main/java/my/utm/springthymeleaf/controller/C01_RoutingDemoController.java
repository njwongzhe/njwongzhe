package my.utm.springthymeleaf.controller;

import my.utm.springthymeleaf.service.DemoItemService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/* ============================================================ */
/* Frontend-Backend Routing Controller                          */
/* ============================================================ */

// @RequestMapping sets the shared "/routing" URL prefix for every handler method in this class.
@Controller
@RequestMapping("/routing")
public class C01_RoutingDemoController {

    private final DemoItemService itemService;

    // Spring injects DemoItemService automatically via constructor injection without @Autowired.
    public C01_RoutingDemoController(DemoItemService itemService) {
        this.itemService = itemService;
    }

    /* ------------------------------------------------------------ */
    /* Basic GET Request Flow                                       */
    /* ------------------------------------------------------------ */

    // @GetMapping maps HTTP GET /routing/get to this method.
    @GetMapping("/get")
    public String getRouting(
        // @RequestParam extracts the "userName" query parameter from the URL.
        @RequestParam(name = "userName", defaultValue = "World") String userName,
        Model model
    ) {
        // Model.addAttribute() passes server data to the Thymeleaf template.
        model.addAttribute("message", "Hello " + userName + " from Spring MVC Controller!");
        model.addAttribute("itemCount", itemService.getAllItems().size());

        // Returning "01_routing_flow/01_get_routing" tells ViewResolver to render templates/01_routing_flow/01_get_routing.html.
        return "01_routing_flow/01_get_routing";
    }

    /* ------------------------------------------------------------ */
    /* Basic POST Request Flow                                      */
    /* ------------------------------------------------------------ */

    // Display the POST form view when the user navigates to GET /routing/post.
    @GetMapping("/post")
    public String showPostForm() {
        // Returning "01_routing_flow/02_post_routing" tells ViewResolver to render templates/01_routing_flow/02_post_routing.html.
        return "01_routing_flow/02_post_routing";
    }

    // @PostMapping handles form submissions sent to POST /routing/post.
    // Returning a view name directly (no "redirect:") renders the template in the same request and keeps Model attributes.
    // Use "return \"redirect:/target\";" instead when you want the browser to issue a new GET request (e.g. to prevent duplicate form resubmission on refresh).
    @PostMapping("/post")
    public String handlePostRouting(
        // @RequestParam extracts the "userName" query parameter from the URL.
        @RequestParam(name = "userName", defaultValue = "Guest") String userName,
        Model model
    ) {
        // Model.addAttribute() passes server data to the Thymeleaf template.
        model.addAttribute("result", "Backend received POST input: " + userName);

        // Redirect to GET /routing/post to avoid resubmitting form on refresh (PRG pattern).
        return "01_routing_flow/02_post_routing";
    }
}
