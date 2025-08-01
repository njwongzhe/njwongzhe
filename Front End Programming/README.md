# HTML
```html

<---------- Tags ---------->

HTML specifies a set of tags that identify structure of the document and the content type.
Most tags come in pairs, marking a beginning and ending of a content.
Example : <table> ... </table>.

<------- Attributes ------->

Add styles to an element (tag). 
Example : face="Arial" / color="#FF0000" / size="+3" in <font face="Arial" color="#FF0000" size="+3"> ... </font>.
The Attribute Name (border) is not case sensitive but the Attribute Data ("1") is case sensitive.
The Attribute Data should place inside a "" and put a = between Attribute Name and Attribute Data.

<---------- Basic Structure ---------->

<!DOCTYPE html> 
<html lang="en"> 

<head> 
    <title><!--Title--></title> 
</head> 

<body>
    <!--Content-->
</body> 

</html> 

<----- List of Tags & Attributes ----->

<html> ... </html>   | HTML document put between it.

<head> ... </head>   | Head section of the HTML document.
<title> ... </title> | Webpage Name (Title).

<body> ... </body>   | Body section of the HTML document. (Put all the content such as Paragraphs, Tables, Lists, Images, JavaScripts Code...)

<h1> ... </h1> | Heading Tag 1. (Largest Size)
<h2> ... </h2> | Heading Tag 2.
<h3> ... </h3> | Heading Tag 3.
<h4> ... </h4> | Heading Tag 4.
<h5> ... </h5> | Heading Tag 5.
<h6> ... </h6> | Heading Tag 6. (Smallest Size)

class | Common Attribute for most of the Tags.
id    | Common Attribute for most of the Tags.
style | Common Attribute for most of the Tags.

<p> ... </p> | Paragraph. All text in this tag will be in same line if not use <br>.
align | Attribute of <p> ... </p>. It can set the text alignment.
      | ="justify" : Justify the text alignment to left and right.
      | ="center"  : Justify the text alignment to center.
      | ="right"   : Justify the text alignment to right.

<br>   | Break Line.
<hr>   | Horizontal Rule. (Line)
&nbsp; | Non-Breaking Space (Whitespace).

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

<font> ... </font> | Set the style of the text.
face  | Attribute of <font> ... </font>. It can set the face of the text such as ="Arial". 
color | Attribute of <font> ... </font>. It can set the color of the text such as ="#FF0000".
size  | Attribute of <font> ... </font>. It can set the size of the text.
      | ="+3" : Increase the size by 3.
      | ="-3" : Decrease the size by 3.
      | ="3"  : Set to size 3.

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
<dt> ... </dt> | List Item. Put inside <dl> ... </dl>.
<dd> ... </dd> | Description List Item. Put inside <dl> ... </dl>.

<table> ... </table> | Table Structure.
<tr> ... </tr>       | Table Row.    Put inside <table> ... </table>.
<th> ... </th>       | Table Header. Put inside <table> ... </table>.
<td> ... </td>       | Table Data.   Put inside <table> ... </table>.
border  | Attribute of <table> ... </table>. It can add box (border) to the table and set its width such as ="1".
colspan | Attribute of <table> ... </table>. It can make a cell span more than one column such as ="2".
rowspan | Attribute of <table> ... </table>. It can make a cell span more than one row such as ="2".

<a> ... </a> | Hyperlink.
href   | Attribute of <a> ... </a>. It can set the URL, phone number, email address and others of the hyperlink such as href="01-BasicStructure&Tag.html".
       | http   ：It can set the link to external website such as href="https://www.youtube.com/".
       | mailto ：It can set the link to email such as href="mailto:ngjaawei@graduate.utm.my".
       | file   ：It can set the link to document such as href="file:Demo_Image.jpg".
target | Attribute of <a> ... </a>. It can set how to open the Hyperlink. 
       | ="_blank"  : Opens the link in a new tab.
       | ="_parent" ：Opens the link in the parent frame.
       | ="_self"   : Opens the link in the same frame.
       | ="_top"    : Opens the link in the full body of the window.

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

<form> ... </form> | Contain input elements.
name   | Attribute of <form> ... </form>. It can give an identify to the form.
method | Attribute of <form> ... </form>. It can set the HTTP Method.
       | ="GET"  : Appends the data to the URL.
       | ="POST" : Sends the data separately.
       | ="LINK" :
action | Attribute of <form> ... </form>. It can set the address or the URL to send data to such as ="comments.php". (Usually point to CGI program.)

<input> ... </input> | Collect user input.
type      | Attribute of <input> ... </input>. It can set the types of input.
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
name      | Attribute of <input> ... </input>. It can gives an identifier to the input data such as ="Text Box.
size      | Attribute of <input> ... </input>. It can set the size of the box (Text Field) such as ="10". (Default text field is 20.)
value     | Attribute of <input> ... </input>. It can specifies an initial value for the text or actual data will be sent to the system when a certain option is selected.
maxlength | Attribute of <input> ... </input>. It can set the maximum text can be accepted.
checked   | Attribute of <input> ... </input>. It can set the initial selection will be chosen by Radio Button or Checkbox (type="radio" / type="checkbox").
onclick   | Attribute of <input> ... </input>. It can set the pop up message when a certain button is clicked such as ="alert('Message')".
min       | Attribute of <input> ... </input>. It can set the smallest number can be input by type="number".
max       | Attribute of <input> ... </input>. It can set the largest number can be input by type="number".

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
