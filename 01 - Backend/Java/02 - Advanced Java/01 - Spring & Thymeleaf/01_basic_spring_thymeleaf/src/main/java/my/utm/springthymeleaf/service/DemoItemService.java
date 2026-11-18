package my.utm.springthymeleaf.service;

import my.utm.springthymeleaf.model.DemoItem;
import my.utm.springthymeleaf.repository.DemoItemRepository;
import org.springframework.stereotype.Service;

import java.util.List;

/* ============================================================ */
/* Business Logic Layer                                         */
/* ============================================================ */

// @Service marks this singleton bean as the mediator between controllers and repositories.
@Service
public class DemoItemService {

    private final DemoItemRepository repository;

    public DemoItemService(DemoItemRepository repository) {
        this.repository = repository;
    }

    public List<DemoItem> getAllItems() {
        return repository.findAll();
    }

    public DemoItem getSampleItem() {
        return repository.findAll().getFirst();
    }

    public DemoItem addItem(DemoItem item) {
        return repository.save(item);
    }
}
