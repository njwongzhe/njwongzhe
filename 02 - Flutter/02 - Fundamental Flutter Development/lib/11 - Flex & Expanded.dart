// Flexbox layout model in Flutter is implemented using the "Flex" widget along with "Expanded" widgets to create flexible and responsive layouts.
// The "Flex" widget allows you to arrange its "children" in a horizontal or vertical direction。
// The "Expanded" widget is used to indicate that a "child" of a "Flex" should expand to fill the available space along the main axis of the "Flex".
// The available space is divided among the "Expanded" "children" according to their "flex" factor which is an integer that determines how much of the available space each "child" should take relative to the others.

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

  // Three non-Expanded boxes. They will take only the space they need.
  Flex nonExpandedBox() {
    return Flex(
      direction: Axis.horizontal, // Similar to "Row". // Can set to "Axis.vertical" to work like "Column".
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // It can works like "Column" and "Row" with "mainAxisAlignment" and "crossAxisAlignment".
                                                        // However, it will be not work if there is an "Expanded" widget in the "children".
      children: [
        buildBox(Colors.red, "Non Expanded"),
        buildBox(Colors.green, "Non Expanded"),
        buildBox(Colors.blue, "Non Expanded")
      ]
    );
  }

  // One "Expanded" box among non-"Expanded" boxes.
  Flex singleExpandedBox() {
    return Flex(
      direction: Axis.horizontal, // Similar to "Row". // Can set to "Axis.vertical" to work like "Column".
      children: [
        buildBox(Colors.red, "Non Expanded"),
        Expanded(
          flex: 1, // If there is only one "Expanded" box, the "flex" value is meaningless since it will take all the remaining space.
          child: buildBox(Colors.green, "flex = 1")
        ),
        buildBox(Colors.blue, "Non Expanded")
      ]
    );
  }

  // Three "Expanded" boxes with different "flex" values.
  Flex multipleExpandedBox(int flex1, int flex2, int flex3) {
    return Flex(
      direction: Axis.horizontal, // Similar to "Row". // Can set to "Axis.vertical" to work like "Column".
      children: [
        Expanded(
            flex: flex1, // The "flex" value determines the proportion of space this box will take relative to the other "Expanded" boxes.
            child: buildBox(Colors.red, "flex = $flex1")
        ),
        Expanded(
          flex: flex2,
          child: buildBox(Colors.green, "flex = $flex2")
        ),
        Expanded(
          flex: flex3,
          child: buildBox(Colors.blue, "flex = $flex3")
        ),
      ]
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              nonExpandedBox(),             // All boxes take only the space they need.
              singleExpandedBox(),          // There is only one "Expanded" box. Thus, it takes all the remaining space.
              multipleExpandedBox(1, 1, 1), // Ratio: 1 : 1 : 1 // They all take equal space.
              multipleExpandedBox(1, 3, 2)  // Ratio: 1 : 3 : 2 // They take space based on the "flex" value ratio.
            ],
          )
        )
      )
    );
  }
}