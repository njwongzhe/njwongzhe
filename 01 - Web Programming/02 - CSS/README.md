# 02 - CSS (Cascading Style Sheets / .css)
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

## 1.0 - Style

```txt
- Style is a definition of fonts, colors and etc.
- Each style has a unique name : Selector (HTML Tag).
- The selectors and their styles are defined in one place.
- In your HTML contents you simply refer to the selectors whenever you want to activate a certain style.
```

<br />

## 2.0 - Basic Structure
- When different types of CSS Structure is applied to a same selector (tag), only the structure with higher priority will be applied on it.
- External Stylesheet (Lower Priority)
- Internal Stylesheet (Middle Priority)
- Inline Style (Higher Priority)

<br />

### 2.1 - Internal Stylesheet (Middle Priority)

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

### 2.2 - External Stylesheet (Lowest Priority)

HTML Header :
```html
<head>
       <link rel="stylesheet" href="01 - CSS Basic Structure (External Stylesheet).css">
</head>
```

"01 - CSS Basic Structure (External Stylesheet).css" :
```css
/* Example */
h2 {
    color: blue;
    font-size: 14px;
}
```

<br />

### 2.3 - Inline Styles (Highest Priority)

```html
<body>
       <!--Example-->
       <h3 style="color: green; font-size: 16px;">Heading 3</h3>
</body>
```

<br />

## 3.0 - Comment

```css
/*Single Line Comment*/

/*Multi Line 
Comment*/
```

<br />

## 4.0 - Declaration

```txt
- Property : A type of attribute of HTML tag you want to change.
- Value    : Each properties are assigned to a Values.
- CSS declarations end with a semicolon (;) and declaration groups are surrounded by curly brackets ({}).
```

<br />

## 5.0 - Selector

```txt
- A selector is an HTML tag at which style will be applied.
- This could be any tag like <h1> or <table> etc. (HTML/Tag Selector)
- In the style definition you define how each selector should work (font and color etc.)
- CSS selectors are used to "find" (or select) HTML elements based on their element name, id, class, attribute and more.
```

<br />

### 5.1 - Generic Selector

<br />

#### 5.1.1 : Universal Selector (*) (Lowest Priority)
- Used to define styles for all tags. 

```css
* {color: red;} /* Apply to all tag. */
```

<br />

#### 5.1.2 : HTML/Tag Selector
- Used to define styles associated to HTML tags. 

```css
h1 {color: red;} /* Apply to all tag called "h1". */
```

<br />

#### 5.1.3 : Class Selector (.)
- Used to define styles that can be used without redefining plain HTML tags. (Class name cannot start with number.)

```css
h1.class-name {color: red;} /* Apply to all tag called "h1" with class name called "class-name". */
/* or */ 
.class-name {color: red;}   /* Apply to all tag with class name called "class-name". */
```

<br />

#### 5.1.4 : ID Selector (#) (Highest Priority) 
- Used to define styles relating to objects with a unique ID. 

```css
h1#id-name {color: red;} /* Apply to all tag called "h1" with id name called "id-name". */
/* or */ 
#id-name {color: red;}   /* Apply to all tag with id name called "id-name". */
```

<br />

### 5.2 - Grouping Selector (,)

```css
h1, h2, h3 {color: red;}       /* Apply to all tag called "h1", "h2" and "h3". */
.class1, .class2 {color: red;} /* Apply to all tag with class name called "class1" and "class2". */
#id1, #id2 {color: red;}       /* Apply to all tag with id name called "id1" and "id2". */
```

<br />

### 5.3 - Other Selector (Combinator)

<br />

#### 5.3.1 : Child Combinator (>)

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

#### 5.3.2 : Context Dependent Selector (Descendant Combinator)

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

#### 5.3.3 : Next Sibling Combinator (+)

```css
h2 + h1 {color: grey;} /* Selects the first <h1> element that is placed immediately after <h2> elements. */
```

<br />

#### 5.3.4 : Subsequent-sibling Combinator (~)

```css
h4 ~ h3 {color: grey;} /* Selects all <h3> element that is placed immediately after <h4> elements. */
```

<br />

#### 5.3.5 : Pseudo-class Selector (:)
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

## 6.0 - Property

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

### 6.1 - Property Reference
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

## 7.0 - Box Model

![Box Model](https://github.com/njwongzhe/njwongzhe/blob/main/01%20-%20Web%20Programming/02%20-%20CSS/08%20-%20CSS%20Box%20Model.png)

<br />

## 8.0 - Flexbox