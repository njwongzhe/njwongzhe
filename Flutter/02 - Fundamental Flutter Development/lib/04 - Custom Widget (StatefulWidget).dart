/*
  StatefulWidget Lifecycle:
  1. Widget Create:
    a) "StatefulWidget" has been created.
      - createState()           : This method is called when the "StatefulWidget" is created. It creates an instance of the associated "State" class.
    b) "State" object has been created.
      - initState()             : This method is called once when the "State" object is inserted into the widget tree. It is used for one-time initialization of widget.
      - didChangeDependencies() : This method is called when the dependencies of the "State" object change. It is often used to fetch data that depends on "InheritedWidget". 
      - build()                 : This method is called when the widget is built or rebuilt. It describes the part of the user interface represented by this widget.
  2. Widget Update:
      - didUpdateWidget()       : This method is called whenever the widget configuration changes. It provides an opportunity to respond to changes in the widget's properties.
      - build()                 : This method is called again to rebuild the widget with the updated state.
  3. Widget Dispose:
      - deactivate()            : This method is called when the "State" object is removed from the widget tree temporarily. It can be used for cleanup tasks.
      - dispose()               : This method is called when the "State" object is permanently removed from the widget tree. It is used to release resources held by the object.
*/

import 'package:flutter/material.dart'; 

void main() {
  runApp(const CustomWidget());
}

/* StatefulWidget */
// It is used to create dynamic widgets that can change their state over time or in response to user interactions.
class CustomWidget extends StatefulWidget { // The class of your dynamic widget must extend "StatefulWidget".
  const CustomWidget({Key? key}) : super(key: key); // Constructor

  @override                          // It will create the state for this widget.
  _CustomWidgetState createState() { // The "createState" method must exist in a StatefulWidget.
    print("createState Called"); // This line is just for demonstration purposes. However, we prefer not put any logic at "createState".
    return _CustomWidgetState(); // It creates an instance of the associated "State" class.
  } 
}

/* State Class */
// It holds the state of the StatefulWidget.
// It handle the changes and updates the UI accordingly.
// That why the "build" method of a "StatefulWidget" is inside the "State" class.
class _CustomWidgetState extends State<CustomWidget> { // The state class (Private) must extend "State<YourWidgetClass>".
  @override
  void initState() {
    print("initState Called"); // This line is just for demonstration purposes.
    super.initState();         // Always call the super method first.
    // Initialization code can be added here.
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies Called"); // This line is just for demonstration purposes.
    super.didChangeDependencies();         // Always call the super method first.
    // Code to handle changes in dependencies can be added here.
  }

  @override
  void didUpdateWidget(covariant CustomWidget oldWidget) {
    print("didUpdateWidget Called");  // This line is just for demonstration purposes.
    super.didUpdateWidget(oldWidget); // Always call the super method first.
    // Code to handle updates to the widget can be added here.
  }

  @override                            // It will be called when the widget is built.
  Widget build(BuildContext context) { // The "build" method must exist in a StatefulWidget.
    print("build Called"); // This line is just for demonstration purposes.
    return MaterialApp(    // It returns a MaterialApp widget that will display the UI.                              
      title: "04 - Custom Widget (StatefulWidget)",                                            
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

  @override
  void deactivate() {
    print("deactivate Called"); // This line is just for demonstration purposes.
    super.deactivate();         // Always call the super method first.
    // Cleanup code can be added here.
  }

  @override
  void dispose() {
    print("dispose Called"); // This line is just for demonstration purposes.
    super.dispose();         // Always call the super method first.
    // Resource release code can be added here.
  }
}

