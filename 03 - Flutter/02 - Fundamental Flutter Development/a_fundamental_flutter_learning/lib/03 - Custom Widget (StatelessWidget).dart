// There is three types of widgets in Flutter:
// 1. StatelessWidget : A widget that cannot change its state unless rebuilt through external events. (Used for static content.)
// 2. StatefulWidget  : A widget that can change its state internally and rebuild itself. (Used for dynamic content.)
// 3. InheritedWidget : A widget that allows data to be shared across the widget tree efficiently. (Used for sharing data.)

/*
  Lifecycle of a StatelessWidget:
  1. build() : This method is called when the widget is built. It describes the part of the user interface represented by this widget.
*/

import 'package:flutter/material.dart'; 

void main() {
  runApp(const CustomWidget());
}

/* StatelessWidget */
// It is used to create static widgets that do not change their state.
class CustomWidget extends StatelessWidget { // The class of your static widget must extend "StatelessWidget".
  const CustomWidget({Key? key}) : super(key: key); // Constructor

  @override                            // It will be called when the widget is built.
  Widget build(BuildContext context) { // The build method must exist in a StatelessWidget.
    print("build Called"); // This line is just for demonstration purposes.
    return MaterialApp(    // It returns a MaterialApp widget that will display the UI.                              
      title: "Custom Widget (StatelessWidget)",                                            
      theme: ThemeData(scaffoldBackgroundColor: Colors.pink[50]), 
      home: Scaffold(
        appBar: AppBar(                                      
          title: Text("My App")                           
        ),
        
        body: Container(
          child: Center(
            child: Text("Body")
          )
        ),

        bottomNavigationBar: Container(
          height: 80,
          child: Center(
            child: Text("Bottom Tab Nav")
          )
        )                                                                                            
      )
    );
  }
}