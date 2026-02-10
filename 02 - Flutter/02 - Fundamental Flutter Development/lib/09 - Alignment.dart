import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container( 
          color: Colors.blue, // Background color of the "Container" widget.
          child: Align(
            alignment: Alignment.center,                              // Aligning the "child" widget to the center of the "Align" widget.
            heightFactor: 2.0,                                        // Expands the height of the "Align" widget to twice the height of its child.
            widthFactor: 1.0,                                         // Expands the width of the "Align" widget to twice the width of its child.
            // If not using "heightFactor" and "widthFactor", the "Align" widget will take up all the available space in the parent widget which is the "Container" widget in this case.
            child: Icon(Icons.star, color: Colors.amber, size: 150) // A star icon as the "child" of the "Align" widget.
          )
        )
      )
    );
  }
}