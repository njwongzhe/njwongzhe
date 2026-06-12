// "setState" method is used to notify the framework that the internal state of this object has changed.
// Inside the "setState" method, we update the field of the state object.
// Then, it will automatically call the "build" method again to rebuild the widget with the updated state.

import 'package:flutter/material.dart'; 

void main() {
  runApp(const CustomWidget());
}

class CustomWidget extends StatefulWidget { 
  const CustomWidget({Key? key}) : super(key: key); 

  @override                         
  _CustomWidgetState createState() {  
    return _CustomWidgetState(); 
  } 
}

class _CustomWidgetState extends State<CustomWidget> { 
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Widget Rebuild (setState)",
      theme: ThemeData(scaffoldBackgroundColor: Colors.pink[50]),
      home: Scaffold(
        body: Center(
          child: Row(                                       // "Row" allow multiple "child" widgets in horizontal direction.
            mainAxisAlignment: MainAxisAlignment.center,    // Center the "child" widgets horizontally.
            children: [
              TextButton(
                onPressed: () {setState(() => counter++);}, // "setState" method increment the counter when the "+" button is pressed. 
                child: Text("+"),
              ),
              
              Text(counter.toString()),                     // Display the current value of "counter".

              TextButton(
                onPressed: () {setState(() => counter--);}, // "setState" method decrement the counter when the "-" button is pressed. 
                child: Text("-"),
              )
            ]
          )
        )
      )
    );
  }
}