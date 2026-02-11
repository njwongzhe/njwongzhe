import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Container buildBox(Color color) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Column Example',
      home: Scaffold(
        body: Container (
          width: double.infinity, 
          height: double.infinity,
          color: Colors.grey[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.start, // Default
            // mainAxisAlignment: MainAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,

            // crossAxisAlignment: CrossAxisAlignment.center, // Default
            // crossAxisAlignment: CrossAxisAlignment.start, 
            // crossAxisAlignment: CrossAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              buildBox(Colors.red),
              buildBox(Colors.green),
              buildBox(Colors.blue),
            ]
          )
        )
      )
    );
  }
}

/*
  mainAxisSize : Determines how much space the "Column" should occupy in the main axis (vertical).
    - MainAxisSize.max : The "Column" will take up all available vertical space. (Default)
    - MainAxisSize.min : The "Column" will only take up as much vertical space as needed by its "children".
*/