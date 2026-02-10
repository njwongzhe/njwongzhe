import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // A helper method to build the "Container" widget.
  Container buildContainer() {
    return Container(
      transform: Matrix4.rotationZ(0.05),
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(width: 3, color: Colors.yellow),
        borderRadius: BorderRadius.circular(15)
      ),
      alignment: Alignment.center,
      child: Text("Hello, Container", style: TextStyle(color: Colors.white, fontSize:20)) 
    );
  }

  @override
  Widget build(BuildContext context) { 
    return MaterialApp( 
      home: Scaffold( 
        body: Column(
          children: [
            Row(
              children: [
                Align(alignment: Alignment.topLeft, child: buildContainer()),   // Aligning the "Container" widget to the top-left corner.
                Align(alignment: Alignment.topCenter, child: buildContainer()), // Aligning the "Container" widget to the top-center.
                Align(alignment: Alignment.topRight, child: buildContainer())   // Aligning the "Container" widget to the top-right corner.
              ]
            ),
            Row(
              children: [
                Align(alignment: Alignment.centerLeft, child: buildContainer()), // Aligning the "Container" widget to the center-left.
                Align(alignment: Alignment.center, child: buildContainer()),     // Aligning the "Container" widget to the center.
                Align(alignment: Alignment.centerRight, child: buildContainer()) // Aligning the "Container" widget to the center-right.
              ]
            ),
            Row(
              children: [
                Align(alignment: Alignment.bottomLeft, child: buildContainer()),   // Aligning the "Container" widget to the bottom-left corner.
                Align(alignment: Alignment.bottomCenter, child: buildContainer()), // Aligning the "Container" widget to the bottom-center.
                Align(alignment: Alignment.bottomRight, child: buildContainer())   // Aligning the "Container" widget to the bottom-right corner.
              ] 
            )
          ]
        )
      ) 
    );
  }
}