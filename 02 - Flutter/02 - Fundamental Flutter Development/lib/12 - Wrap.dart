// "Wrap" allow to display its "children" in multiple horizontal or vertical runs.
// When there is not enough space in the main axis, it will automatically wrap (move) to the next line.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Container buildBox(Color color, String text) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color
      ),
      alignment: Alignment.center,
      child: Text(text, style: TextStyle(color: Colors.white))
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey,
          child: Wrap(
            direction: Axis.horizontal,  // Set the main axis to horizontal. // Default
            // direction: Axis.vertical, // Set the main axis to vertical.

            spacing: 10,    // Horizontal spacing between boxes.
            runSpacing: 30, // Vertical spacing between lines.

            // The alignment will based on the "direction" property. 
            alignment: WrapAlignment.center,          // Align all lines to center horizontally.
            // alignment: WrapAlignment.start,        // Align all lines to left horizontally. // Default
            // alignment: WrapAlignment.end,          // Align all lines to right horizontally.
            // alignment: WrapAlignment.spaceEvenly,  // Distribute horizontal space evenly.       
            // alignment: WrapAlignment.spaceBetween, // Distribute horizontal space between boxes.
            // alignment: WrapAlignment.spaceAround,  // Distribute horizontal space around boxes.

            children: [
              buildBox(Colors.red, "Box 1"),
              buildBox(Colors.green, "Box 2"),
              buildBox(Colors.blue, "Box 3"),
              buildBox(Colors.orange, "Box 4"),
              buildBox(Colors.purple, "Box 5"),
              buildBox(Colors.brown, "Box 6"),
              buildBox(Colors.pink, "Box 7"),
              buildBox(Colors.cyan, "Box 8")
            ]
          )
        )
      )
    );
  }
}