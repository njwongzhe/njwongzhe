<span style="color:red"># 1.0 HTML (.html)</span>

<br />

## 1.1 Tags 

```html
- HTML specifies a set of tags that identify structure of the document and the content type.
- Most tags come in pairs, marking a beginning and ending of a content.
- Example : <table> ... </table>.
```

<br />

## 1.2 Attributes

```html
- Attributes provide additional information or styles to HTML elements (tag).
- Example : face="Arial" / color="#FF0000" / size="+3" in <font face="Arial" color="#FF0000" size="+3"> ... </font>.
- Attribute Names (e.g face) are not case-sensitive but the Attribute Values (e.g "Arial") are case-sensitive.
- Attribute Values must be enclosed in double quotes (""). 
- Use an equals sign (=) between the Attribute Name and its Attribute Value.
```

<br />

## 1.3 Basic Structure

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

## 1.4 Comments

```html
<!--I am a Comment-->
```

<br />

## 1.5 Tags & Attributes Reference

### 1.5.1 Document Structure

```html
<html> ... </html>   | HTML document put between it.

<head> ... </head>   | Head section of the HTML document.
<title> ... </title> | Put inside <head> ... </head>. Webpage Name (Title).
<style> ... </style> | Put inside <head> ... </head>. For CSS.

<link> | Defines the relationship between the current document and an external resource.
rel  | Attribute of <link>. Specifies the relationship between the current document and the linked document.
     | ="stylesheet" : Apply the .css document.
href | Attribute of <link>. Specifies the location of the linked document.

<body> ... </body>   | Body section of the HTML document. 
                     | Put all the content such as Paragraphs, Tables, Lists, Images, JavaScripts Code...
```

### 1.5.2 Common Attribute

```html
class | Common Attribute for most of the Tags. (Used to define CSS styles.)
id    | Common Attribute for most of the Tags. (Used to define CSS styles.)

style | Common Attribute for most of the Tags. (CSS Inline Style)
```

### 1.5.3 Text & Formating

#### 1.5.3.1 Basic Text Tags

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

#### 1.5.3.2 Inline Text Formatting 

```html
Block-Level Element : 
- A block-level element always starts on a newline.
- Example : <p> ... </p> and <div> ... </div>.

Inline Element :
- An inline element does not start on a newline.
- Example : <b> ... </b> and <span> ... </span>.

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

### 1.5.4 Grouping & Layout

```html
<div> ... </div>   | Block-level container.
<span> ... </span> | Inline container.
```

### 1.5.5 List

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

### 1.5.6 Font Style

```html
<font> ... </font> | Set the style of the text.
face  | Attribute of <font> ... </font>. It can set the face of the text such as ="Arial". 
color | Attribute of <font> ... </font>. It can set the color of the text such as ="#FF0000".
size  | Attribute of <font> ... </font>. It can set the size of the text.
      | ="+3" : Increase the size by 3.
      | ="-3" : Decrease the size by 3.
      | ="3"  : Set to size 3.
```

### 1.5.7 Table

```html
<table> ... </table> | Table Structure.
<tr> ... </tr>       | Put inside <table> ... </table>. Table Row.
<th> ... </th>       | Put inside <table> ... </table>. Table Header.
<td> ... </td>       | Put inside <table> ... </table>. Table Data.
border  | Attribute of <table> ... </table>. It can add box (border) to the table and set its width such as ="1".
colspan | Attribute of <table> ... </table>. It can make a cell span more than one column such as ="2".
rowspan | Attribute of <table> ... </table>. It can make a cell span more than one row such as ="2".
```

### 1.5.8 Hyperlink

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

### 1.5.9 Image

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

### 1.5.10 Form (Input)

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

# 2.0 CSS (Cascading Style Sheets / .css)
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

## 2.1 Style

```txt
- Style is a definition of fonts, colors and etc.
- Each style has a unique name : Selector (HTML Tag).
- The selectors and their styles are defined in one place.
- In your HTML contents you simply refer to the selectors whenever you want to activate a certain style.
```

<br />

## 2.2 Basic Structure
- When different types of CSS Structure is applied to a same selector (tag), only the structure with higher priority will be applied on it.
- External Stylesheet (Lower Priority)
- Internal Stylesheet (Middle Priority)
- Inline Style (Higher Priority)

### 2.2.1 Internal Stylesheet (Middle Priority)

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

### 2.2.2 External Stylesheet (Lowest Priority)

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

### 2.2.3 Inline Styles (Highest Priority)

```html
<body>
       <!--Example-->
       <h3 style="color: green; font-size: 16px;">Heading 3</h3>
</body>
```

<br />

## 2.3 Comment

```css
/*Single Line Comment*/

/*Multi Line 
  Comment*/
```

<br />

## 2.4 Declaration

```txt
- Property : A type of attribute of HTML tag you want to change.
- Value    : Each properties are assigned to a Values.
- CSS declarations end with a semicolon (;) and declaration groups are surrounded by curly brackets ({}).
```

<br />

## 2.5 Selector

```txt
- A selector is an HTML tag at which style will be applied.
- This could be any tag like <h1> or <table> etc. (HTML/Tag Selector)
- In the style definition you define how each selector should work (font and color etc.)
- CSS selectors are used to "find" (or select) HTML elements based on their element name, id, class, attribute and more.
```

### 2.5.1 Generic Selector
- Universal Selector (*) (Lowest Priority)  : Used to define styles for all tags. 
-  HTML/Tag Selector                        : Used to define styles associated to HTML tags. 
-     Class Selector (.)                    : Used to define styles that can be used without redefining plain HTML tags. (Class name cannot start with number.)
-        ID Selector (#) (Highest Priority) : Used to define styles relating to objects with a unique ID. 

#### 2.5.1.1 Universal Selector (*) (Lowest Priority)
```css
* { color: red; } /* Apply to all tag. */
```

#### 2.5.1.2 HTML/Tag Selector
```css
h1 { color: red; } /* Apply to all tag called "h1". */
```

#### 2.5.1.3 Class Selector (.)
```css
h1.class-name { color: red; } /* Apply to all tag called "h1" with class name called "class-name". */
/* or */ 
.class-name { color: red; }   /* Apply to all tag with class name called "class-name". */
```

#### 2.5.1.4 ID Selector (#) (Highest Priority) 
```css
h1#id-name { color: red; } /* Apply to all tag called "h1" with id name called "id-name". */
/* or */ 
#id-name { color: red; }   /* Apply to all tag with id name called "id-name". */
```

### 2.5.2 Grouping Selector (,)
```css
h1, h2, h3 { color: red; } /* Apply to all tag called "h1", "h2" and "h3". */
.class1, .class2 { color: red; } /* Apply to all tag with class name called "class1" and "class2". */
#id1, #id2 { color: red; } /* Apply to all tag with id name called "id1" and "id2". */
```

3. Other Selector (Combinator)
-
-
-
```

### 2.5.1 Universal Selector (Lowest Priority)
```html

```

### 2.5.2 HTML/Tag Selector
```html
<!DOCTYPE html> 
<html lang="en"> 

<head> 
    <title>CSS Selector</title> 

    <style> 
        h1 { /* Tag Selector */
            color: red;
        }
    </style>
</head> 

<body> 
    <!--Tag Selector-->
    <h1>Tag Selector</h1>
</body> 

</html>
```

### 2.5.3 Class Selector 
```html
<!DOCTYPE html> 
<html lang="en"> 

<head> 
    <title>CSS Selector</title> 

    <style> 
        .class-selector { /* Class Selector */
            color: green;
        }
    </style>
</head> 

<body> 
    <!--Class Selector-->
    <h2 class="class-selector">Class Selector</h2>
</html>
```

### 2.5.4 ID Selector (Highest Priority)
```html
<!DOCTYPE html> 
<html lang="en"> 

<head> 
    <title>CSS Selector</title> 

    <style> 
        #id-selector { /* ID Selector */
            color: blue;
        }
    </style>
</head> 

<body> 
    <!--ID Selector-->
    <h3 id="id-selector">ID Selector</h3>
</body> 

</html>
```

<br />

## 2.6 Property

```css
color
background-color
font-size
```