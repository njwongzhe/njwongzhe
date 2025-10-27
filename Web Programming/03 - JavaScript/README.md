# 03 - JavaScript (.js)

<br />

## 1.0 - Basic Structure
```html
- The <script> ... </script> tag can be placed anywhere inside an .html file.
- If multiple <script> ... </script> tags exist in an .html file, the JavaScript inside the ones at the top will be executed first.

- It is generally preferred to place <script> ... </script> at the end of the <body> ... </body> section since HTML is executed from top to bottom.
- When the browser encounters a <script> ... </script> tag during parsing, it will pause and execute the JavaScript code inside it first.
- This causes the HTML content below that <script> ... </script> to stop rendering until the script has finished executing.
- As a result, the page may not load completely while the script is running.
- During this process, users might see a blank (white) screen in long time until the script has finished.
```

<br />

### 1.1 - Internal JavaScript

```html
<script>
       /* JavaScript Code */
</script>
```

<br />

### 1.2 - External JavaScript

External JavaScript (.html) :
```html
<script src="01 - JS Basic Structure.js"></script>
```

"01 - JS Basic Structure.js" :
```js
/* JavaScript Code */
```

<br />

## 2.0 - Comments

```js
//Single Line Comment

/*Multi Line 
Comment*/

/**
 * Documentation Comment
 */
```

Documentation Comment :
![Documentation Comment](https://github.com/njwongzhe/njwongzhe/blob/main/Web%20Programming/28%20-%20JS%20Documentation%20Comment.png)

<br />

## 3.0 - REPL Environment (Read-Eval-Print Loop)
- Read: You type some JavaScript code into the terminal, and REPL reads what you typed.
- Eval: REPL runs (evaluates) your code.
- Print: REPL shows you the result of your code.
- Loop: REPL goes back to step 1, waiting for you to type more code.This loop continues until you quit REPL.

Chrome REPL Environment ("22 - JS REPL Environment.html") :
![Chrome REPL Environment](https://github.com/njwongzhe/njwongzhe/blob/main/Web%20Programming/22%20-%20JS%20REPL%20Environment.png)

- The REPL allows developers to quickly test small code snippets, experiment with JavaScript, CSS, and HTML, and see the immediate results.
- You can inspect variables, execute functions and pinpoint issues in your code directly within the context of the running application.

<br />

## 4.0 - Global Object, Method and Properties
- In JavaScript, there’s a special “top-level” object called the global object.
- It holds all built-in global properties and methods (things you can use anywhere without importing).
- Example: "window" in browsers / "global" in Node.js

Browsers - "window" :
![Global Object, Method and Properties](https://github.com/njwongzhe/njwongzhe/blob/main/Web%20Programming/32%20-%20JS%20Global%20Methods%20and%20Properties.png)

<br />

## 5.0 - Web API

<br />

### 5.1 - DOM ((Document Object Model))
```txt
- The DOM is a W3C (World Wide Web Consortium) standard.
- The DOM defines a standard for accessing documents.
- The W3C DOM standard is separated into 3 different parts:
  a) Core DOM - Standard model for all document types.
  b) XML DOM  - standard model for XML documents.
  c) HTML DOM - standard model for HTML documents.
```

<br />

#### 5.1.1 - Core DOM
---

<br />

#### 5.1.2 - XML DOM
---

<br />

#### 5.1.3 - HTML DOM
```txt
- HTML DOM model is constructed as a tree of Objects.
- With the HTML DOM, JavaScript can access and change all the elements of an HTML document.
- HTML DOM is a standard object model and programming interface for HTML. It defines:
  a) The HTML elements as objects.
  b) The properties of all HTML elements.
  c) The methods to access all HTML elements.
  d) The events for all HTML elements.
- HTML DOM is a standard for how to get, change, add or delete HTML elements.
```

HTML DOM :
<br />
![HTML DOM](https://github.com/njwongzhe/njwongzhe/blob/main/Web%20Programming/51%20-%20JS%20HTML%20DOM.png)

HTML DOM Node Relationship :
<br />
![HTML DOM Node](https://github.com/njwongzhe/njwongzhe/blob/main/Web%20Programming/53%20-%20JS%20HTML%20DOM%20Get%20Node.png)

