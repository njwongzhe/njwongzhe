// "TextField" allows users to input text data in a Flutter application.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // “TextEditingController” is a class that allows us to control and manage the text being edited in a "TextField".
  // It provides methods and properties to read, modify and listen to changes in the text input.
  TextEditingController _userName = TextEditingController(); // Collect username.
  TextEditingController _password = TextEditingController(); // Collect password.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Login Page")),
        
        body: Center( 
          child: Container(
            /* "Container" Decoration */
            width: 800,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 0.1),
              borderRadius: BorderRadius.circular(20)
            ),

            /* Username "TextField" */
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _userName,           // Connect the "TextField" to the "_userName" controller.
                  decoration: InputDecoration(
                    hintText: "Username",          // Set the placeholder text for the "TextField" to "Username".
                    fillColor: Colors.amber[50], // Set the background color of the "TextField" to a light amber color.
                    filled: true,                  // Enable the background color for the "TextField".
                    border: OutlineInputBorder(    // Set the border of the "TextField" to an outline style with no visible border and rounded corners.
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)
                    )
                  )
                ),

                SizedBox(height: 10),

                /* Password "TextField" */
                TextField(
                  controller: _password,           // Connect the "TextField" to the "_password" controller.
                  obscureText: true,               // Hide the input text and making it suitable for password entry.
                  decoration: InputDecoration( 
                    hintText: "Password",          // Set the placeholder text for the "TextField" to "Password".
                    fillColor: Colors.amber[50], // Set the background color of the "TextField" to a light amber color.
                    filled: true,                  // Enable the background color for the "TextField".
                    border: OutlineInputBorder(    // Set the border of the "TextField" to an outline style with no visible border and rounded corners.
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)
                    )
                  )
                ),

                SizedBox(height: 10),

                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextButton(
                    // To extract the text from the "TextField", we can use the "text" property of the "TextEditingController" associated with that "TextField".
                    // For example, if we have a "TextField" with a controller named "_userName", we can access the text entered by the user using "_userName.text".
                    onPressed: () => print("Login Success - Username: ${_userName.text} - Password: ${_password.text}"), 
                    child: Text("Login", style: TextStyle(color: Colors.white))
                  )
                )
              ]
            )
          )
        )
      )
    );
  }
}