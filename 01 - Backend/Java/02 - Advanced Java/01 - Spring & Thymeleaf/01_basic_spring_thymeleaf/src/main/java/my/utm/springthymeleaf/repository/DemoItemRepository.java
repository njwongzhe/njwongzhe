package my.utm.springthymeleaf.repository;

import my.utm.springthymeleaf.model.DemoItem;

import java.util.List;

/* ============================================================ */
/* Persistence Contract Interface                               */
/* ============================================================ */

// Decouples business services from concrete storage implementations (in-memory or database).
public interface DemoItemRepository {

    List<DemoItem> findAll();

    DemoItem save(DemoItem item);
}
