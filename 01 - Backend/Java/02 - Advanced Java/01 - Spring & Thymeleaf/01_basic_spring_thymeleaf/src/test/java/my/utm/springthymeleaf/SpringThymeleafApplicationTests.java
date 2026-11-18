package my.utm.springthymeleaf;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/* ============================================================ */
/* Application Context And Route Integration Tests              */
/* ============================================================ */

@SpringBootTest
class SpringThymeleafApplicationTests {

    @Autowired
    private WebApplicationContext context;

    // Verify that all GET routes render with HTTP 200 OK.
    @Test
    void allGetRoutesRenderSuccessfully() throws Exception {
        MockMvc mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
        String[] routes = {
            "/",
            "/routing/get",
            "/routing/post",
            "/expressions/variable",
            "/expressions/selection",
            "/expressions/url",
            "/expressions/url/1",
            "/expressions/url/1?mode=quick",
            "/expressions/message",
            "/expressions/fragment",
            "/attributes/html",
            "/attributes/text",
            "/attributes/attr",
            "/attributes/with",
            "/attributes/conditional",
            "/attributes/each",
            "/attributes/form",
            "/attributes/fragment"
        };
        for (String route : routes) {
            mockMvc.perform(get(route)).andExpect(status().isOk());
        }
    }
}
