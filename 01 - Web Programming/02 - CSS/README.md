# CSS (Cascading Style Sheets / .css)
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
- It allow user to define a special state of an element without polluting the HTML with extra classes or ids.
- For example, you can add two line before and after the element without adding extra tags in the HTML.
- It is also useful for styling interactive elements such as links and buttons based on their state (e.g., hover, active, visited).

<br />

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
gap     | It can sets the gaps (gutters) between rows and columns in grid layout and flexbox layout.

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

## 7.0 - Unit

```css
Absolute Units | It is a fixed unit that always represents the same size, regardless of the context. (Example : "px", "cm", "mm", "in", "pt", "pc".)
               | : px - It stands for "pixels". It is a relative unit that is based on the resolution of the screen.

Relative Units | It is a unit that is relative to another value, such as the font size of the element or the size of the viewport. (Example : "em", "rem", "%", "vw", "vh".)
               | : em  - It is relative to the font size of the parent element. For example, if the font size of the parent element is 16px, then 2em, it will be 32px.
               | : rem - It is relative to the font size of the root element (<html>). For example, if the font size of the root element is 2rem, it will be 32px.
               | : %   - It is relative to the size of the parent element. For example, if the width of the parent element is 200px, then 50%, it will be 100px.
               | : vw  - It stands for "viewport width". It is relative to 1% of the width of the viewport. For example, if the width of the viewport is 1000px, then 50vw, it will be 500px.
               | : vh  - It stands for "viewport height". It is relative to 1% of the height of the viewport. For example, if the height of the viewport is 800px, then 50vh, it will be 400px.
```

<br />

## 8.0 - Box Model

<p align="center" width="100%">
    <img height="33%" src="https://github.com/njwongzhe/njwongzhe/blob/main/01%20-%20Web%20Programming/02%20-%20CSS/09%20-%20CSS%20Box%20Model.png">
</p>

<br />

## 9.0 - Flexbox
- Flexbox is a layout model that allows you to design flexible and responsive layout structure without using float or positioning.
- When a element become a flex container, its children become flexible items and can be laid out in any direction and can have their size adjusted to fill the available space.

```css
display | It specifies the display behavior of an element.
        | : flex        - The element behaves like a block element and lays out its content according to the flexbox model.
        | : inline-flex - The element behaves like an inline element and lays out its content according to the flexbox model.

flex direction | It specifies the direction of the flexible items.
               | : row            - Default. The flexible items are displayed in a row, from left to right. (Main-axis is horizontal, cross-axis is vertical.)
               | : row-reverse    - The flexible items are displayed in a row, from right to left. 
               | : column         - The flexible items are displayed in a column, from top to bottom. (Main-axis is vertical, cross-axis is horizontal.)
               | : column-reverse - The flexible items are displayed in a column, from bottom to top.

flex wrap | It specifies whether the flexible items should wrap or not.
          | : nowrap       - Default. The flexible items will not wrap.
          | : wrap         - The flexible items will wrap to the next line if necessary. (Works like "float".)
          | : wrap-reverse - The flexible items will wrap to the previous line if necessary.

justify-content | It defines the alignment along the main-axis (flex-direction).
                | : flex-start    - Default. Items are packed toward the start of the flex-direction.
                | : flex-end      - Items are packed toward the end of the flex-direction.
                | : center        - Items are centered along the line.
                | : space-between - Items are evenly distributed in the line; first item is on the start line, last item on the end line.
                | : space-around  - Items are evenly distributed in the line with equal space around them.
                | : space-evenly  - Items are distributed so that the spacing between any two items and the space to the edges is equal.

align-content | It defines the alignment of the flexible container's lines within when there is extra space in the cross-axis.
              | It only works when height or width of the container is bigger than the total size of the items in the cross-axis.
              | : flex-start    - Default. Lines are packed toward the start of the cross-axis.
              | : flex-end      - Lines are packed toward the end of the cross-axis.
              | : center        - Lines are centered in the cross-axis.
              | : space-between - Lines are evenly distributed in the cross-axis; first line is on the start line, last line on the end line.
              | : space-around  - Lines are evenly distributed in the cross-axis with equal space around them.
              | : space-evenly  - Lines are distributed so that the spacing between any two lines and the space to the edges is equal.
              ! : stretch       - Lines stretch to take up the remaining space.

align-items | It defines the default behavior for how flex items are laid out along the cross-axis on the current line.
            | It is similar to "align-content" but it applies to all items (each line of items), not only when there is extra space in the cross-axis.
            | It also applies to single line flex containers, where "align-content" has no effect.
            | : flex-start - Default. Items are placed at the start of the cross-axis.
            | : flex-end   - Items are placed at the end of the cross-axis.
            | : center     - Items are centered in the cross-axis.
            | : stretch    - Items are stretched to fill the container (still respect min-width/max-width).
            | : baseline   - Items are aligned such as their baselines align.

order | It specifies the order of the flexible items.
      | The default value is 0 and items are laid out in the source order. 
      | However, you can change the order by assigning a positive or negative value to it. 
      | Items with smaller order values are displayed first. 
      | If two items have the same order value, they are displayed in the source order.

flex-shrink | It specifies how much a flex item will shrink relative to the rest of the flex items in the flex container when there isn't enough space on the main-axis.
            | The default value is 1, which means that the item will shrink at the same rate as other items. 
            | If you set it to 0, the item will not shrink at all. 
            | If you set it to a value greater than 1, the item will shrink faster than other items.
            | It is useful when you want to prevent an item from shrinking.
            
flex-grow   | It specifies how much a flex item will grow relative to the rest of the flex items in the flex container when there is extra space on the main-axis.
            | The default value is 0, which means that the item will not grow at all
            | If you set it to a value greater than 0, the item will grow at the same rate as other items with a positive flex-grow value.
            | It is useful when you want to allow an item to grow and fill the available space.

flex-basis  | It specifies the initial size of a flex item before any available space is distributed according to the flex-grow and flex-shrink properties.
            | The default value is "auto", which means that the size of the item will be based on its content. 
            | You can set it to a specific length (e.g., "200px") or a percentage (e.g., "50%") to define the initial size of the item.
            | It is useful when you want to set a specific size for an item before it starts growing or shrinking.

align-self | It allows the default alignment (or the one specified by align-items) to be overridden for individual flex items.
           | The default value is "auto", which means that the item will inherit the value of align-items from its parent container. 
           | You can set it to "flex-start", "flex-end", "center", "stretch", or "baseline" to override the alignment for that specific item.
           | : auto       - Default. The element inherits the value of align-items from its parent container.
           | : flex-start - The element is aligned to the start of the cross-axis.
           | : flex-end   - The element is aligned to the end of the cross-axis.
           | : center     - The element is centered in the cross-axis.
           | : stretch    - The element is stretched to fill the container (still respect min-width/max-width).
           | : baseline   - The element is aligned such as its baseline aligns with the baseline of the parent.
```

<br />

## 10.0 - Gridbox
- Gridbox is a layout model that allows you to design web pages using a grid system. 
- It will divide the page into major regions or define the relationship in terms of size, position, and layer between parts of a control built from HTML primitives.

```css
display | It specifies the display behavior of an element.
        | : grid        - The element behaves like a block element and lays out its content according to the grid model.
        | : inline-grid - The element behaves like an inline element and lays out its content according to the grid model.    

grid-template-columns | It defines the number of columns in the grid layout and the width of each column.
                      | You can use length units (e.g., "100px"), percentage (e.g. "50%"), or the "fr" unit to specify the width of columns.
                      | The "fr" unit is a fractional unit and represents a fraction of the available space in the grid container.

grid-template-rows    | It defines the number of rows in the grid layout and the height of each row.
                      | Same as "grid-template-columns" but for rows.

grid-template-areas   | It defines named grid areas which can be referenced by the grid items.
grid-area             | It specifies a grid item’s size and location within the grid by referring to the named grid areas defined by "grid-template-areas".

justify-content, justify-items, justify-self, align-content, align-items basically have the same function as in Flexbox.
The only difference is that they apply to the grid container and grid items respectively.
They will align the grid items in the horizontal and vertical direction respectively.
```