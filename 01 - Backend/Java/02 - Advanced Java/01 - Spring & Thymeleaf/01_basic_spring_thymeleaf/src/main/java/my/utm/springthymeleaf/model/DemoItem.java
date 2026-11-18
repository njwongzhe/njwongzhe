package my.utm.springthymeleaf.model;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

/* ============================================================ */
/* Shared Domain And Form Model                                 */
/* ============================================================ */

// Models are plain Java objects (POJOs) instantiated per request rather than singleton Spring Beans.
public class DemoItem {

    private Long id;

    // Jakarta Bean Validation rules checked automatically when @Valid is applied in a controller.
    @NotBlank(message = "Name is required.")
    @Size(min = 2, max = 50, message = "Name must be between 2 and 50 characters.")
    private String name;

    private String category;
    private boolean active = true;

    // A public no-arg constructor is required for Spring MVC to instantiate and bind form fields.
    public DemoItem() {
    }

    public DemoItem(Long id, String name, String category, boolean active) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.active = active;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}
