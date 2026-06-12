import 'package:flutter/material.dart'; // Importing the material design library from Flutter SDK.
                                        // Material design is a design language developed by Google. 
                                        // It is used to create visually appealing and consistent user interfaces across different platforms and devices.

void main() {
  // runApp() is a built-in Flutter function that takes the given Widget and makes it the root of the widget tree.
  // In Flutter, everything is a widget. Widgets are the basic building blocks of a Flutter app's user interface. (Like <div> in HTML) 
  runApp(
    MaterialApp(                                         
      title: "MaterialApp",                                            
      theme: ThemeData(scaffoldBackgroundColor: Colors.pink[50]), 
      home: Scaffold()
    )
  );                  
  // "MaterialApp" is a class from 'package:flutter/material.dart' that ensures the app follows material design principles.                      
  // "title" of the application. (Optional)
  // "theme" sets the overall look and feel of the app. Here, we set the scaffold background color to blue.
  // "home" sets the default structure of the app's main screen.
  // "Scaffold" is a type of widget design pattern that provides by Material Design. (Refer "02 - MaterialApp (Scaffold Widget)")
}
