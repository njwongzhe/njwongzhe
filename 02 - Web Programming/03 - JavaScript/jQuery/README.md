# jQuery

<br />

## 1.0 - What Is jQuery & Setup

- It is a fast, small and feature-rich JavaScript library.
- It makes things like HTML document traversal and manipulation, event handling, animation and AJAX much simpler with an easy-to-use API that works across a multitude of browsers.
- Philosophy: **"Write Less, Do More"**.
- Official jQuery Website: https://jquery.com/

- **Installation & Setup Summary**:
  You can integrate jQuery into your project using one of two standard methods:
  
  1. **Local Setup**: Download the jQuery library (e.g., `jquery-3.6.0.min.js`) from the official website, store it in your project folder and reference it via a `<script>` tag:
     ```html
     <script src="jquery-3.6.0.min.js"></script>
     ```
     
  2. **CDN Setup**: Reference the jQuery library directly from a CDN (Content Delivery Network) like Google CDN:
     ```html
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
     ```

<br />

## 2.0 - Basic Syntax Structure

- The basic syntax structure of jQuery is: `$(selector).action(value);`
- The **`$`** sign defines or accesses jQuery.
- The **`(selector)`** is used to query or find HTML elements (using CSS selectors format).
- The **`action(value)`** is a jQuery action/method to be performed on the selected elements, with optional parameters.

```html
<script>
    $(document).ready(function () { // $(selector).action(value);
        $("button").click(function () {
            $("p").text("Hello World!");
        });
    });
</script>

<button>Click me</button>
<p>Hello World!</p>
```