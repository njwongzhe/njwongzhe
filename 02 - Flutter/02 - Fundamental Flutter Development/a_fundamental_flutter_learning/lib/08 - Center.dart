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
        body: Center( // Centering the "Container" widget in the middle of the "body".
          child: Container(
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
          )
        )
      ) 
    );
  }
}