package my.utm.springthymeleaf.repository;

import my.utm.springthymeleaf.model.DemoItem;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;

/* ============================================================ */
/* In-Memory Persistence Implementation                         */
/* ============================================================ */

// @Repository registers this class as a singleton persistence bean.
@Repository
public class InMemoryDemoItemRepository implements DemoItemRepository {

    // ConcurrentHashMap and AtomicLong keep in-memory reads and ID generation thread-safe across requests.
    private final Map<Long, DemoItem> storage = new ConcurrentHashMap<>();
    private final AtomicLong idGenerator = new AtomicLong(1);

    // Seed initial records so every demonstration page has data on startup.
    public InMemoryDemoItemRepository() {
        save(new DemoItem(null, "Spring MVC", "BACKEND", true));
        save(new DemoItem(null, "Thymeleaf", "FRONTEND", true));
        save(new DemoItem(null, "Validation", "SECURITY", false));
    }

    @Override
    public List<DemoItem> findAll() {
        return new ArrayList<>(storage.values());
    }

    @Override
    public synchronized DemoItem save(DemoItem item) {
        if (item.getId() == null) {
            item.setId(idGenerator.getAndIncrement());
        }
        storage.put(item.getId(), item);
        return item;
    }
}
