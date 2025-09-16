# 1.0 - HTML (.html)

<br />

## 1.1 - Tags 

```html
- HTML specifies a set of tags that identify structure of the document and the content type.
- Most tags come in pairs, marking a beginning and ending of a content.
- Example : <table> ... </table>.
```

<br />

## 1.2 - Attributes

```html
- Attributes provide additional information or styles to HTML elements (tag).
- Example : face="Arial" / color="#FF0000" / size="+3" in <font face="Arial" color="#FF0000" size="+3"> ... </font>.
- Attribute Names (e.g face) are not case-sensitive but the Attribute Values (e.g "Arial") are case-sensitive.
- Attribute Values must be enclosed in double quotes (""). 
- Use an equals sign (=) between the Attribute Name and its Attribute Value.
```

<br />

## 1.3 - Basic Structure

```html
<!DOCTYPE html> 
<html lang="en"> 

<head> 
    <title><!--Page Title--></title> 
</head> 

<body>
    <!--Page Content-->
</body> 

</html>
```

<br />

## 1.4 - Comments

```html
<!--I am a Comment-->
```

<br />

## 1.5 - Tags & Attributes Reference

<br />

### 1.5.1 - Document Structure

```html
<html> ... </html>   | HTML document put between it.

<head> ... </head>   | Head section of the HTML document.
<title> ... </title> | Put inside <head> ... </head>. Webpage Name (Title).
<style> ... </style> | Put inside <head> ... </head>. For CSS.

<link> | Defines the relationship between the current document and an external resource.
rel  | Attribute of <link>. Specifies the relationship between the current document and the linked document.
     | ="stylesheet" : Apply the .css document.
href | Attribute of <link>. Specifies the location of the linked document.

<body> ... </body> | Body section of the HTML document. 
                   | Put all the content such as Paragraphs, Tables, Lists, Images, JavaScript Code...

<script> ... </script> | Can put at anywhere. It contain JavaScript Code.
src | Attribute of <script> ... </script>. Specifies the location of the linked document (External JavaScript).
```

<br />

### 1.5.2 - Common Attribute

```html
class | Common Attribute for most of the Tags. (Used to define CSS styles.)
id    | Common Attribute for most of the Tags. (Used to define CSS styles.)

style | Common Attribute for most of the Tags. (CSS Inline Style)
```

<br />

### 1.5.3 - Text & Formating

<br />

#### 1.5.3.1 : Basic Text Tags

```html
<p> ... </p> | Paragraph block. All content in this tag will be in same line if not use <br>.
align | Attribute of <p> ... </p>. It can set the text alignment.
      | ="justify" : Justify the text alignment to left and right.
      | ="center"  : Justify the text alignment to center.
      | ="right"   : Justify the text alignment to right.

<br>   | Break Line.
<hr>   | Horizontal Rule. (Line)
&nbsp; | Non-Breaking Space (Whitespace).

<h1> ... </h1> | Heading Tag 1. (Largest Size)
<h2> ... </h2> | Heading Tag 2.
<h3> ... </h3> | Heading Tag 3.
<h4> ... </h4> | Heading Tag 4.
<h5> ... </h5> | Heading Tag 5.
<h6> ... </h6> | Heading Tag 6. (Smallest Size)
```

<br />

#### 1.5.3.2 : Inline Text Formatting 

```html
Block-Level Element : 
- Block-Level Element always starts on a newline.
- It can include a Inline Element.
- Size (Height & Width) of Block-Level Element's container can be defined through CSS.
- Example : <p> ... </p> and <div> ... </div>.

Inline Element :
- Inline Element does not start on a newline.
- It cannot include a Block-Level Element.
- Size (Height & Width) of Inline Element's container cannot be defined through CSS.
- Example : <b> ... </b> and <span> ... </span>.

Inline-Block Element :
- Inline Element that can define the size of its container through CSS.
- It require CSS property "display: inline-block" to create.

<b> ... </b>   | Bold Text.
<i> ... </i>   | Italic Text. 
<u> ... </u>   | UnderScore Text.
<s> ... </s>   | Strike Text.
<tt> ... </tt> | Teletype Text. (Typewriter-Like)

<small> ... </small>   | Make this text appear smaller than the surrounding text (Side Comments / Legal Disclaimers). (Smaller Size in Default)
<em> ... </em>         | Emphasis the text. (Italic Style in Default)
<strong> ... </strong> | More emphasis the text. (Bold Style in Default)
                       | They didn't have any actual function in programming. They just act as a remark to mention that a certain text is important.
                       | They act important role in certain situation such as :
                       | - Screen Reader : Reads the word with emphasized tone (helps blind users catch the point).
                       | - Search Engine : Treats the word as a possible keyword or content highlight.

<sub> ... </sub> | Subscript.
<sup> ... </sup> | Superscript. 
<pre> ... </pre> | Displays text exactly as it is typed—including spaces, line breaks and indentation.
                 | Extra spaces, tabs and line breaks will not be display if not use <pre> ... </pre>.
```

<br />

### 1.5.4 - Grouping & Layout

```html
<div> ... </div>   | Block-level container.
<span> ... </span> | Inline container.
```

<br />

### 1.5.5 - List

```html
<ul> ... </ul> | Unordered List.
type | Attribute of <ul> ... </ul>. Change the style of bullet.
     | ="disc"   : Discs bullet style.
     | ="circle" : Circle bullet style.
     | ="square" : Square bullet style.

<ol> ... </ol> | Ordered List.
start | Attribute of <ol> ... </ol>. Set the start number or alphabet of list such as ="3".
type  | Attribute of <ol> ... </ol>. Change the style of marker.
      | ="1" : Normal numbers style.
      | ="A" : Capital letters style.
      | ="a" : Small letters style.
      | ="I" : Capital roman numbers style.
      | ="i" : Small roman numbers style. 

<li> ... </li> | List Item. Put inside <ul> ... </ul> or <ol> ... </ol>.

<dl> ... </dl> | Description List.
<dt> ... </dt> | Put inside <dl> ... </dl>. List Item.
<dd> ... </dd> | Put inside <dl> ... </dl>. Description List Item. 
```

<br />

### 1.5.6 - Font Style

```html
<font> ... </font> | Set the style of the text.
face  | Attribute of <font> ... </font>. It can set the face of the text such as ="Arial". 
color | Attribute of <font> ... </font>. It can set the color of the text such as ="#FF0000".
size  | Attribute of <font> ... </font>. It can set the size of the text.
      | ="+3" : Increase the size by 3.
      | ="-3" : Decrease the size by 3.
      | ="3"  : Set to size 3.
```

<br />

### 1.5.7 - Table

```html
<table> ... </table> | Table Structure.
<tr> ... </tr>       | Put inside <table> ... </table>. Table Row.
<th> ... </th>       | Put inside <table> ... </table>. Table Header.
<td> ... </td>       | Put inside <table> ... </table>. Table Data.
border  | Attribute of <table> ... </table>. It can add box (border) to the table and set its width such as ="1".
colspan | Attribute of <table> ... </table>. It can make a cell span more than one column such as ="2".
rowspan | Attribute of <table> ... </table>. It can make a cell span more than one row such as ="2".
```

<br />

### 1.5.8 - Hyperlink

```html
<a> ... </a> | Hyperlink.
href   | Attribute of <a> ... </a>. It can set the URL, phone number, email address and others of the hyperlink such as href="01-BasicStructure&Tag.html".
       | http   ：It can set the link to external website such as href="https://www.youtube.com/".
       | mailto ：It can set the link to email such as href="mailto:ngjaawei@graduate.utm.my".
       | file   ：It can set the link to document such as href="file:Demo_Image.jpg".
target | Attribute of <a> ... </a>. It can set how to open the Hyperlink. 
       | ="_blank"  : Opens the link in a new tab.
       | ="_parent" : Opens the link in the parent frame.
       | ="_self"   : Opens the link in the same frame.
       | ="_top"    : Opens the link in the full body of the window.
```

<br />

### 1.5.9 - Image

```html
<img> | Image.
src    | Attribute of <img>. It can set the URL and file name (prefer in same path) of the image. 
alt    | Attribute of <img>. It can set the replace text if the image set in src cannot display.
width  | Attribute of <img>. It can set the width of the image. Display original image width if leave empty. 
height | Attribute of <img>. It can set the height of the image. Display original image height if leave empty.
       | If only one of the width or height set with a value and another leave empty, the empty attribute will assign by itself based on another attribute.
vspace | Attribute of <img>. It can set the size of the vertical space surrounding the image.
hspace | Attribute of <img>. It can set the size of the horizontal space surrounding the image.
title  | Attribute of <img>. It can set the text displayed when the mouse is point on the picture.
valign | Attribute of <img>. It can set how the text surrounding the image will be displayed. (Vertical Align)
       | ="top"    : Text display at the top side beside the image.
       | ="middle" : Text display at the middle side beside the image.
       | ="bottom" : Text display at the bottom side beside the image.
align  | Attribute of <img>. It can set how the text surrounding the image will be displayed.
       | ="left"  : All text will display at the right side of the image. (Picture at left side of the text.)
       | ="right" : All text will display at the left side of the image. (Picture at right side of the text.)
```

<br />

### 1.5.10 - Form (Input)

```html
<form> ... </form> | Contain input elements.
name   | Attribute of <form> ... </form>. It can give an identify to the form.
method | Attribute of <form> ... </form>. It can set the HTTP Method.
       | ="GET"  : Appends the data to the URL.
       | ="POST" : Sends the data separately.
       | ="LINK" :
action | Attribute of <form> ... </form>. It can set the address or the URL to send data to such as ="comments.php". (Usually point to CGI program.)

<input> ... </input> | Collect user input.
type        | Attribute of <input> ... </input>. It can set the types of input.
            | ="text"     : Text Box. (Single Line) 
            | ="radio"    : Radio Button.
            | ="checkbox" : Checkbox.
            | ="password" : Each character with an asterisk (*) instead of displaying the entered text.
            | ="hidden"   : Nothing appears on the screen.
            | ="button"   : Standard Button.
            | ="Submit"   : Submit Button. It will submit the input you provide. (Only submit the input field in its <form> ... </form>).
            | ="Reset"    : Reset Button. It will reset all the input field to the initial situation. (Only reset the input field in its <form> ... </form>).
            | ="number"   : Input Number.
            | ="file"     :
            | ="image"    : 
name        | Attribute of <input> ... </input>. It can gives an identifier to the input data such as ="Text Box.
size        | Attribute of <input> ... </input>. It can set the size of the box (Text Field) such as ="10". (Default text field is 20.)
value       | Attribute of <input> ... </input>. It can set an initial value for the text or actual data will be sent to the system when a certain option is selected.
placeholder | Attribute of <input> ... </input>. It can set a short hint that describes the expected value of an input field. 
maxlength   | Attribute of <input> ... </input>. It can set the maximum text can be accepted.
checked     | Attribute of <input> ... </input>. It can set the initial selection will be chosen by Radio Button or Checkbox (type="radio" / type="checkbox").
onclick     | Attribute of <input> ... </input>. It can set the pop up message when a certain button is clicked such as ="alert('Message')".
min         | Attribute of <input> ... </input>. It can set the smallest number can be input by type="number".
max         | Attribute of <input> ... </input>. It can set the largest number can be input by type="number".

<textarea> ... </textarea> | Text Box. (Multiple Line) Initial value can put between <textarea> ... </textarea>.
name      | Attribute of <textarea> ... </textarea>. It can gives an identifier to the input data such as ="Text Box.
rows      | Attribute of <textarea> ... </textarea>. It can set the vertical size of text box.
cols      | Attribute of <textarea> ... </textarea>. It can set the horizontal size of text box.
maxlength | Attribute of <textarea> ... </textarea>. It can set the maximum text can be accepted.

<select> ... </select> | List Box.
name     | Attribute of <select> ... </select>. It can gives an identifier to the input data such as ="Text Box.
multiple | Attribute of <select> ... </select>. It can allow multiple selection can be selected. (No ="" need to be placed.)

<option> | Option of List Box. Put inside <select> ... </select>.
value    | Attribute of <option>. It can set the actual data will be sent to the system when a certain option is selected.
         | It is different with the text displayed. The text displayed will put after the <option> tag.
selected | Attribute of <option>. It can set the initial selection will be chosen. Put before value="".
```

<br /><br />

# 2.0 - CSS (Cascading Style Sheets / .css)
- When tags like <font> and color attributes were added to the HTML 3.2 specification, it started a nightmare for web developers.
- Development of large web sites where fonts and color information were added to every single page became a long and expensive process.
- Thus, the CSS can apply to multiple sites were added to HTML 4.0.
- In HTML 4.0, all formatting could (and should) be removed from the HTML document and stored in a separate CSS file.
- CSS Styles define Define how to display HTML elements and normally stored in Style Sheets.
- External Style Sheets can save developer a lot of work since you can change the look of an entire Website by changing just one file.
- CSS separated content (HTML) and presentation (CSS).
- By using CSS, the same content can be presented in different appearances.
- You can write CSS once and then reuse same sheet in multiple HTML pages. 

<br />

## 2.1 - Style

```txt
- Style is a definition of fonts, colors and etc.
- Each style has a unique name : Selector (HTML Tag).
- The selectors and their styles are defined in one place.
- In your HTML contents you simply refer to the selectors whenever you want to activate a certain style.
```

<br />

## 2.2 - Basic Structure
- When different types of CSS Structure is applied to a same selector (tag), only the structure with higher priority will be applied on it.
- External Stylesheet (Lower Priority)
- Internal Stylesheet (Middle Priority)
- Inline Style (Higher Priority)

<br />

### 2.2.1 - Internal Stylesheet (Middle Priority)

```html
<head>
       <style>
              /* Selector */ {
                     /* Declaration_1; */
                     /* Declaration_2; */
                     /* ...           */
              }
       </style>
</head>

<head>
       <style>
              /* Selector */ {
                     /* Property_1: Value_1; */
                     /* Property_2: Value_2; */
                     /* ...                  */
              }
       </style>
</head>

<head>
       <style>
              /* Example */
              h1 { 
                     color: red;
                     font-size: 12px;
              }
       </style>
</head>
```

<br />

### 2.2.2 - External Stylesheet (Lowest Priority)

HTML Header :
```html
<head>
       <link rel="stylesheet" href="04 - CSS Basic Structure (External Stylesheet).css">
</head>
```

"04 - CSS Basic Structure (External Stylesheet).css" :
```css
/* Example */
h2 {
    color: blue;
    font-size: 14px;
}
```

<br />

### 2.2.3 - Inline Styles (Highest Priority)

```html
<body>
       <!--Example-->
       <h3 style="color: green; font-size: 16px;">Heading 3</h3>
</body>
```

<br />

## 2.3 - Comment

```css
/*Single Line Comment*/

/*Multi Line 
Comment*/
```

<br />

## 2.4 - Declaration

```txt
- Property : A type of attribute of HTML tag you want to change.
- Value    : Each properties are assigned to a Values.
- CSS declarations end with a semicolon (;) and declaration groups are surrounded by curly brackets ({}).
```

<br />

## 2.5 - Selector

```txt
- A selector is an HTML tag at which style will be applied.
- This could be any tag like <h1> or <table> etc. (HTML/Tag Selector)
- In the style definition you define how each selector should work (font and color etc.)
- CSS selectors are used to "find" (or select) HTML elements based on their element name, id, class, attribute and more.
```

<br />

### 2.5.1 - Generic Selector

<br />

#### 2.5.1.1 : Universal Selector (*) (Lowest Priority)
- Used to define styles for all tags. 

```css
* {color: red;} /* Apply to all tag. */
```

<br />

#### 2.5.1.2 : HTML/Tag Selector
- Used to define styles associated to HTML tags. 

```css
h1 {color: red;} /* Apply to all tag called "h1". */
```

<br />

#### 2.5.1.3 : Class Selector (.)
- Used to define styles that can be used without redefining plain HTML tags. (Class name cannot start with number.)

```css
h1.class-name {color: red;} /* Apply to all tag called "h1" with class name called "class-name". */
/* or */ 
.class-name {color: red;}   /* Apply to all tag with class name called "class-name". */
```

<br />

#### 2.5.1.4 : ID Selector (#) (Highest Priority) 
- Used to define styles relating to objects with a unique ID. 

```css
h1#id-name {color: red;} /* Apply to all tag called "h1" with id name called "id-name". */
/* or */ 
#id-name {color: red;}   /* Apply to all tag with id name called "id-name". */
```

<br />

### 2.5.2 - Grouping Selector (,)

```css
h1, h2, h3 {color: red;}       /* Apply to all tag called "h1", "h2" and "h3". */
.class1, .class2 {color: red;} /* Apply to all tag with class name called "class1" and "class2". */
#id1, #id2 {color: red;}       /* Apply to all tag with id name called "id1" and "id2". */
```

<br />

### 2.5.3 - Other Selector (Combinator)

<br />

#### 2.5.3.1 : Child Combinator (>)

```html
<div> 
    <!--Include-->
    <div> 
        <!--Not Include-->
    </div>
</div>
```

```css
.father1 > .son1 {color: red;} /* Selects every "son1" element that are direct children of a "father1" element。 */
.father2 > h1 {color: green;}  /* Selects every <h1> element that are direct children of a "father2" element。 */
```

<br />

#### 2.5.3.2 : Context Dependent Selector (Descendant Combinator)

```html
<div> 
    <!--Include-->
    <div> 
        <!--Include-->
    </div>
</div>
```

```css
.father3 h1 {color: blue;} /* Selects all <h1> elements inside "father3" elements. */
```

<br />

#### 2.5.3.3 : Next Sibling Combinator (+)

```css
h2 + h1 {color: grey;} /* Selects the first <h1> element that is placed immediately after <h2> elements. */
```

<br />

#### 2.5.3.4 : Subsequent-sibling Combinator (~)

```css
h4 ~ h3 {color: grey;} /* Selects all <h3> element that is placed immediately after <h4> elements. */
```

<br />

#### 2.5.3.5 : Pseudo-class Selector (:)
- Sequence of Pseudo-class Selector is important.
- Pseudo-class Selector put in front will be shown on top when active.
- Example : The color of Pseudo-class Selector put in front will block the color of Pseudo-class Selector put behind.

```css
a:link { ... }    /* Apply on unvisited link <a>. */ 
a:active { ... }  /* Apply on clicked link <a>. */
a:hover { ... }   /* Apply on touched element <a>. */
a:visited { ... } /* Apply on visited link <a>.*/
```

<br />

## 2.6 - Property

```txt
- Shorthand Properties : Shorthand properties allow us to write multiple properties in a single line. (Example : font)
- Longhand Properties  : Individual properties that can be included in a shorthand property. (Example : font-style, font-size)
- Example : We can assign a value for "border-width", "border-style" and "border-color" using the "border" property alone.

- Both Shorthand Properties and Longhand Properties can be equivalent.
- Shorthand is more concise and easier to read and write. (But must take care the format and sequence of value assigned.)
- Longhand is more flexible when we only want to change a specific side or property.
```

```html
<!--Example-->
<style>
       /* Sequence Problem */
       .box1 {margin: 20px 10px 30px 5px;}
       .box2 {margin: 20px 30px 10px 5px;} /* Both result are different. */

       /* Format and Sequence Problem */
       .text1 {font: italic 16px Arial;} /* Correct Order */
       .text2 {font: italic Arial;}      /* Wrong Order (Invalid) - The size is missing. */
       .text3 {font: Arial italic 16px;} /* Wrong Order (Invalid) - The size is not in the third position. */
</style>
```

<br />

### 2.6.1 - Property Reference
- More Property : https://www.w3schools.com/CSSref/index.php

```css
color | It can sets the color of text such as ": red".
font  | It can sets the font of text.

height | It can sets the height of an element such as ": 10px".
width  | It can sets the width of an element such as ": 10px".

display | It specifies the display behavior (the type of rendering box) of an element.
        | : none         - Not display.
        | : block        - Block-Level Element.
        | : inline       - Inline Element.
        | : inline-block - Inline-Block Element.

padding | A shorthand property for all the padding-* properties.
border  | A shorthand property for all the border-* properties.
margin  | A shorthand property for all the margin-* properties.

float | It specifies how an element should float within its container. (Floated elements are taken out of the normal document flow.)
      | : none    - Default. The element does not float and is displayed just where it occurs in the text.
      | : left    - The element floats to the left of its container.
      | : right   - The element floats to the right of its container.
      | : inherit -

position | It specifies the positioning type for an element and override the normal document flow.
         | : static   - Default. The element always positioned according to the normal flow of the page.
         | : relative - The element is positioned relative to its normal position in the document flow.
         | : absolute - The element is positioned relative to the nearest positioned ancestor.
         | : fixed    - The element is positioned relative to the viewport which means it always stays in the same place even if the page is scrolled.
         | : sticky   - 
top    | The distance from the top edge of the containing element. (Used with position: relative, absolute, fixed, or sticky.)
right  | The distance from the right edge of the containing element. (Used with position: relative, absolute, fixed, or sticky.)
bottom | The distance from the bottom edge of the containing element. (Used with position: relative, absolute, fixed, or sticky.)
left   | The distance from the left edge of the containing element. (Used with position: relative, absolute, fixed, or sticky.)
```

<br />

## 2.7 - Box Model

![Box Model](https://github.com/njwongzhe/njwongzhe/blob/main/Front%20End%20Programming/11%20-%20CSS%20Box%20Model.png)

<br />

## 2.8 - Flexbox

<br />

# 3.0 - JavaScript (.js)

<br />

## 3.1 - Basic Structure
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

### 3.1.1 - Internal JavaScript

```html
<script>
       /* JavaScript Code */
</script>
```

<br />

### 3.1.2 - External JavaScript

External JavaScript (.html) :
```html
<script src="13 - JS Basic Structure.js"></script>
```

"13 - JS Basic Structure.js" :
```js
/* JavaScript Code */
```

<br />

## 3.2 - Comments

```js
//Single Line Comment

/*Multi Line 
Comment*/

/**
 * Documentation Comment
 */
```

Documentation Comment :
![Documentation Comment](https://github.com/njwongzhe/njwongzhe/blob/main/Front%20End%20Programming/27%20-%20JS%20Documentation%20Comment.png)

<br />

## 3.3 - REPL Environment (Read-Eval-Print Loop)
- Read: You type some JavaScript code into the terminal, and REPL reads what you typed.
- Eval: REPL runs (evaluates) your code.
- Print: REPL shows you the result of your code.
- Loop: REPL goes back to step 1, waiting for you to type more code.This loop continues until you quit REPL.

Chrome REPL Environment ("24 - JS REPL Environment.html") :
![Chrome REPL Environment](https://github.com/njwongzhe/njwongzhe/blob/main/Front%20End%20Programming/24%20-%20JS%20REPL%20Environment.png)

- The REPL allows developers to quickly test small code snippets, experiment with JavaScript, CSS, and HTML, and see the immediate results.
- You can inspect variables, execute functions and pinpoint issues in your code directly within the context of the running application.

<br />

## 3.3 - Output

```js
document.write(); | Writing into the HTML output.
alert();          | Writing into an alert box.
console.log();    | Writing into the browser console.

innerHTML | Writing into an HTML element.
innerText | Writing into an HTML element.
```
