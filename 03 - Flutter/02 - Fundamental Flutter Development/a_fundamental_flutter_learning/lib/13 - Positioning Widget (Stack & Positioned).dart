// "Stack" allow to place multiple widgets on top of each other.
// The first "child" will be at the bottom and the last "child" will be on the top.
// "Positioned" allow to position its "child" widget based on the distance from each side of the "Stack". (It must be a direct "child" of the "Stack".)

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
          width: 700,
          height: 700,
          color: Colors.grey,
          child: Stack(
            alignment: Alignment.center, // Control the alignment of all "children" in the "Stack". It will based on the size of the largest "child". (Include the "Container" it stays in.)
            children: [
              Container(width: 300, height: 300, color: Colors.red),   
              Container(width: 200, height: 200, color: Colors.green), 
              Container(width: 100, height: 100, color: Colors.blue),  

              // "Positioned" allow to position the "child" widget based on the distance from each side of the "Stack". (Follow the "Container" if the "Stack" inside a "Container".)
              // Value assigned to "top", "bottom", "left" and "right" is the distance from that side to the "child" widget.
              Positioned(
                top: 10,  // 10 pixels from the top of the "Stack".
                left: 10, // 10 pixels from the left of the "Stack".
                child: Container(width: 100, height: 100, alignment: Alignment.center, color: Colors.yellow, child: Text("Positioned 1"))
              ),
              Positioned(
                bottom: 10, // 10 pixels from the bottom of the "Stack".
                right: 10,  // 10 pixels from the right of the "Stack".
                child: Container(width: 100, height: 100, alignment: Alignment.center, color: Colors.purple, child: Text("Positioned 2"))
              ),
              Positioned(
                top: 230,   // 50 pixels from the top of the "Stack".
                right: 230, // 50 pixels from the right of the "Stack".
                child: Container(width: 100, height: 100, alignment: Alignment.center, color: Colors.white, child: Text("Positioned 3"))
              ),
              Positioned(
                bottom: 50, // 50 pixels from the bottom of the "Stack".
                left: 50,   // 50 pixels from the left of the "Stack".
                child: Container(width: 100, height: 100, alignment: Alignment.center, color: Colors.cyan, child: Text("Positioned 4"))
              )
            ]
          )
        )
      )
    );
  }
}