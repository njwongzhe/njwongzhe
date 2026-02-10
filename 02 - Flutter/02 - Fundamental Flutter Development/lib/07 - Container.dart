import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // A shortcut for defining a constructor that takes a key parameter and passes it to the superclass constructor

  @override
  Widget build(BuildContext context) { 
    return MaterialApp( 
      home: Scaffold( 
        body: Container( // "Container" widget allow us to customize its appearance and layout in a fix area.
          transform: Matrix4.rotationZ(0.05), // "transform" widget applies a 2D or 3D transformation to its child widget. ("rotationZ" accepts a double value in radians to rotate the widget around the Z-axis)
          margin: EdgeInsets.all(20),         // "margin" widget adds empty space around the container.
          padding: EdgeInsets.all(15),        // "padding" widget adds empty space inside the container.
          width: 200,                         // "width" widget sets the width of the container.
          height: 200,                        // "height" widget sets the height of the container.
          decoration: BoxDecoration(                              // "decoration" widget allows us to customize the appearance of the container.
            color: Colors.blue,                                 // "color" widget sets the background color of the container.
            border: Border.all(width: 3, color: Colors.yellow), // "border" widget adds a border around the container with specified width and color. (Between "margin" and "padding".)
            borderRadius: BorderRadius.circular(15)               // "borderRadius" widget rounds the corners of the container with specified radius.
          ),
          alignment: Alignment.center,                                                          // "alignment" widget aligns the child widget within the container.
          child: Text("Hello, Container", style: TextStyle(color: Colors.white, fontSize:20)) // "Text" widget displays a string of text with specified "style".
        )
      ) 
    );
  }
}

/*
  There is a lot of widget can be used inside a "Container", such as:
  - width       : Sets the exact width of the container.
  - height      : Sets the exact height of the container.
  - constraints : Sets min/max width and height limits.

  - padding : Space inside the border, between the border and the child.
    - EdgeInsets.all(double value)                                              : Apply same spacing on all 4 sides.
    - EdgeInsets.symmetric({double vertical, double horizontal})                : Apply spacing only to vertical (top/bottom) or horizontal (left/right) sides.
    - EdgeInsets.only({double left, double top, double right, double bottom})   : Apply spacing to specific sides.
    - EdgeInsets.fromLTRB(double left, double top, double right, double bottom) : Hardcode all 4 sides in order.

  - margin : Space outside the border, between the border and other widgets.
    - EdgeInsets.all(double value)                                              : Apply same spacing on all 4 sides.
    - EdgeInsets.symmetric({double vertical, double horizontal})                : Apply spacing only to vertical (top/bottom) or horizontal (left/right) sides.
    - EdgeInsets.only({double left, double top, double right, double bottom})   : Apply spacing to specific sides.
    - EdgeInsets.fromLTRB(double left, double top, double right, double bottom) : Hardcode all 4 sides in order.

  - alignment : Where to place the child inside the Container.
    - Alignment.topLeft    | Alignment.topCenter    | Alignment.topRight
    - Alignment.centerLeft | Alignment.center       | Alignment.centerRight
    - Alignment.bottomLeft | Alignment.bottomCenter | Alignment.bottomRight
      - Alignment(double x, double y) : Range is from -1.0 to 1.0.

  - color : The color to paint behind the child. (Cannot be used with decoration.)
    - Colors.red, Colors.green, Colors.blue, Colors.yellow...
    - Colors.red[100], Colors.green[200], Colors.blue[300]... (Shades of colors with different intensity.)
    - Color.fromARGB(int a, int r, int g, int b)          : Create a color from ARGB values (Alpha, Red, Green, Blue).
    - Color.fromRGBO(int r, int g, int b, double opacity) : Create a color from RGB values and an opacity value (0.0 to 1.0).

  - decoration : A decoration to paint behind the child. (Cannot be used with color.)
    - color               : The background color of the container.
    - border              : A border to draw around the container.
    - borderRadius        : The radius for rounding the corners of the container.
    - boxShadow           : A list of shadows to cast behind the container.
    - gradient            : A gradient to use when filling the container.
    - image               : An image to use as a background for the container.
    - shape               : The shape of the container (rectangle or circle).
    - backgroundBlendMode : The blend mode to apply when painting the background.

  - foregroundDecoration : A decoration to paint in front of the child.
  - transform            : Rotates, scales or skews the container.
  - transformAlignment   : The origin of the coordinate system for the transform property.
  - clipBehavior         : How to clip the content when it overflows the container.

  - child : The widget below this widget in the tree. (The content of the container.)
            The "child" widget can be any widget such as Text, Image, Icon, Row, Column, etc.
            The "child" widget can accept another widget as its child which allowing for nested structures and complex layouts.
*/