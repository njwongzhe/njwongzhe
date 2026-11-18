# Thymeleaf & Resources Guide (`src/main/resources`)

<br />

## 1.0 - Resources Directory Structure

```text
src/main/resources/
├── application.properties                   # Spring Boot config (port, Thymeleaf cache, message encoding).
├── messages.properties                      # Externalized text strings read via #{...} expressions.
└── templates/                               # Thymeleaf server-side HTML templates resolved by ViewResolver.
    ├── index.html                           # Default root welcome page (mapped to GET /).
    ├── fragments/                           # Reusable UI template fragments shared via ~{...}.
    │   └── sample.html
    ├── 01_routing_flow/
    │   ├── 01_get_routing.html
    │   └── 02_post_routing.html
    └── 02_thymeleaf_template/
        ├── 01_standard_expressions/
        │   ├── 01_variable_expressions.html
        │   ├── 02_selection_expressions.html
        │   ├── 03_link_url_expressions.html
        │   ├── 04_message_expressions.html
        │   └── 05_fragment_expressions.html
        └── 02_template_attributes/
            ├── 01_html_attributes.html
            ├── 02_text_attributes.html
            ├── 03_attr_manipulation.html
            ├── 04_local_variables.html
            ├── 05_conditional_attributes.html
            ├── 06_iteration_attribute.html
            ├── 07_form_attributes.html
            └── 08_fragment_attributes.html
```

<br />

## 2.0 - Standard Expressions

- `${...}` : Reads Spring `Model` attributes, invokes built-in utility objects (`#lists`, `#strings`), or interpolates text inside `|...|`.
```html
<p th:text="${title}"></p>
<p th:text="${#lists.size(items)}"></p>
<p th:text="|Count: ${#lists.size(items)}|"></p>
```

- `*{...}` : Evaluates properties relative to the nearest enclosing `th:object="${...}"` (`th:object` must use `${...}` in Spring).
```html
<div th:object="${item}">
    <p th:text="*{name}"></p>
</div>
```

- `@{...}` : Generates context-aware URLs with optional query parameters `(k=v)` or `{path}` variables.
```html
<a th:href="@{/routing/get(userName='Alice')}">Query Link</a>
<a th:href="@{/expressions/url/{id}(id=${sampleId})}">Path Link</a>
```

- `#{...}` : Resolves externalized text keys and `{0}` placeholders from `messages.properties`.
```html
<p th:text="#{msg.welcome}"></p>
<p th:text="#{msg.greeting('Alice', 'Spring')}"></p>
```

- `~{...}` : References a `th:fragment` block in another template or `this` file.
```html
<div th:replace="~{fragments/sample :: greetingBox('Hi')}"></div>
```

<br />

## 3.0 - Template Attributes

### 3.1 - Standard HTML Attribute Overrides

- `th:href` / `th:value` / `th:style` : Keeps static attributes for offline preview and overwrites them at runtime.
```html
<a href="/fallback" th:href="${targetUrl}">Link</a>
<input type="text" value="Static" th:value="${inputValue}"/>
<p style="color: gray;" th:style="${textColor}">Styled</p>
```

- `th:disabled` / `th:checked` : Renders boolean HTML attributes when `true`, or omits them completely when `false`.
```html
<button th:disabled="${isDisabled}">Button</button>
<input type="checkbox" th:checked="${isChecked}"/>
```

<br />

### 3.2 - Content, Attributes & Local Variables

- `th:text` : Replaces inner tag text and escapes HTML characters (`<`, `>`) to prevent XSS.
```html
<p th:text="${safeText}">Placeholder</p>
```

- `th:utext` : Replaces inner tag content with unescaped raw HTML markup.
```html
<p th:utext="${rawHtml}">Placeholder</p>
```

- `th:attr` : Sets one or more arbitrary or custom `data-*` attributes at once.
```html
<p th:attr="title=${tooltipText}, data-demo='active'">Hover</p>
```

- `th:attrprepend` / `th:attrappend` : Inserts a dynamic value before or after an existing static attribute value.
```html
<p class="base" th:attrprepend="class=${extraClass + ' '}">Prepended</p>
<p class="base" th:attrappend="class=${' ' + extraClass}">Appended</p>
```

- `th:classappend` : Appends a CSS class with an automatic separating space.
```html
<p class="base" th:classappend="${extraClass}">Auto-spaced class</p>
```

- `th:with` : Declares scoped local variables visible only inside the host tag and its children.
```html
<div th:with="itemName=${sampleItem.name}">
    <p th:text="${itemName}"></p>
</div>
```

<br />

### 3.3 - Control Flow & Iteration

- `th:if` / `th:unless` : Includes the element when `true` (`th:if`) or `false` (`th:unless`), otherwise removes it from the DOM.
```html
<p th:if="${isVisible}">Shown when true</p>
<p th:unless="${isHidden}">Shown when false</p>
```

- `th:switch` / `th:case` : Renders only the first matching `th:case` branch (`*` is the default fallback).
```html
<div th:switch="${role}">
    <p th:case="'ADMIN'">Admin</p>
    <p th:case="*">Guest</p>
</div>
```

- `th:each` : Repeats the host tag for each collection element; optional `stat` provides `index`, `count`, `size`, `first`, and `last`.
```html
<ul>
    <li th:each="item, stat : ${items}" th:text="|${stat.count}. ${item.name}|">Item</li>
</ul>
```

<br />

### 3.4 - Forms & Validation

- `th:action` & `th:object` : Sets the form submission URL and binds the form to a `Model` command object.
```html
<form th:action="@{/attributes/form}" th:object="${item}" method="post">
    ...
</form>
```

- `th:field` : Generates `id`, `name`, and `value` from `th:object`, preserving user input on validation errors.
```html
<input type="text" th:field="*{name}"/>
```

- `th:errors` & `#fields.hasErrors` : Renders Jakarta Bean Validation error messages for the bound field.
```html
<span th:if="${#fields.hasErrors('name')}" th:errors="*{name}"></span>
```

<br />

### 3.5 - Fragments & Prototype Cleanup

- `th:fragment` : Marks an HTML block as a reusable fragment with optional parameters.
```html
<div th:fragment="banner(label)">
    <p th:text="${label}"></p>
</div>
```

- `th:insert` : Keeps the outer host tag and inserts the fragment markup inside it.
```html
<div th:insert="~{this :: banner('Inserted')}"></div>
```

- `th:replace` : Deletes the outer host tag and replaces it with the fragment markup itself.
```html
<div th:replace="~{this :: banner('Replaced')}"></div>
```

- `th:remove` : Removes static prototype markup at runtime (`all`, `tag`, `body`, or `all-but-first`).
```html
<div th:remove="all"><p>Removed completely</p></div>
<div th:remove="tag"><p>Wrapper removed, child kept</p></div>
<div th:remove="body"><p>Child removed, wrapper kept</p></div>
<ul th:remove="all-but-first">
    <li>Kept</li>
    <li>Removed</li>
</ul>
```
