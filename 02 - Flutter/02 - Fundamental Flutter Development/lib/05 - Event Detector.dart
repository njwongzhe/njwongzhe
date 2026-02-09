import 'package:flutter/material.dart'; 

void main() {
  runApp(const CustomWidget());
}

class CustomWidget extends StatefulWidget { 
  const CustomWidget({Key? key}) : super(key: key); 

  @override                         
  _CustomWidgetState createState() { 
    print("createState Called"); 
    return _CustomWidgetState(); 
  } 
}

class _CustomWidgetState extends State<CustomWidget> { 
  @override
  void initState() {
    print("initState Called");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies Called");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CustomWidget oldWidget) {
    print("didUpdateWidget Called");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) { 
    print("build Called"); 
    return MaterialApp(                                
      title: "05 - Event Detector",                                            
      theme: ThemeData(scaffoldBackgroundColor: Colors.pink[50]), 
      home: Scaffold(
        appBar: AppBar(                                      
          title: Text("My App")                      
        ),
        
        body: Container(
          child: Center(
            child: GestureDetector(              // "GestureDetector" widget to detect gestures. (Example: "onTap", "onDoubleTap", "onLongPress", etc.)
              onTap: () {                        // Parameter 1 : "onTap" event handler.
                print("Body was Tapped");        // Action to perform when tapped.
              },
              onDoubleTap: () {                  // Parameter 2 : "onDoubleTap" event handler. 
                print("Body was Double Tapped"); // Action to perform when double tapped.
              },
              child: Text("Click Me")            // Parameter 3 : Text inside the "GestureDetector".
              // We had set two behaviors here which is "onTap" and "onDoubleTap".
            )
          )
        ),

        bottomNavigationBar: Container(
          height: 80,
          child: Center(
            child: TextButton(                          // "TextButton" widget to detect button press. (Different from "GestureDetector", it is a button with its own style.)
              onPressed: () {                           // Parameter 1 : "onPressed" event handler.
                print("Bottom Tab Nav Button Pressed"); // Action to perform when button is pressed.
              }, 
              child: Text("Click Me")                   // Parameter 2 : Text inside the button.
            )
          )
        )                                                                                              
      )
    );
  }

  @override
  void deactivate() {
    print("deactivate Called");
    super.deactivate();
  }

  @override
  void dispose() {
    print("dispose Called");
    super.dispose();
  }
}

/* 
  There is a lot more gestures available in "GestureDetector" widget such as: 
  "onLongPress", "onPanUpdate", "onScaleStart", "onVerticalDragEnd", "onHorizontalDragUpdate", "onTapDown", "onTapUp" and etc.

  Other than "GestureDetector", Flutter also provides other widgets to detect events such as:
  1. InkWell              : A material design ripple effect widget that responds to touch events.
  2. TextButton           : A button widget that responds to press events.
  3. ElevatedButton       : A button widget with elevation that responds to press events.
  4. IconButton           : A button widget that displays an icon and responds to press events.
  5. FloatingActionButton : A circular button that floats above the content and responds to press events.
  6. Switch               : A toggle switch widget that responds to on/off events.
  7. Slider               : A widget that allows users to select a value from a range by sliding a thumb along a track.
  8. Checkbox             : A widget that allows users to select or deselect an option
  9. Radio                : A widget that allows users to select one option from a set of mutually exclusive options.
  10. TextField           : A widget that allows users to input text and responds to text change events.
  11. Form                : A container widget that groups multiple form fields and responds to form submission events.
  12. Draggable           : A widget that can be dragged across the screen and responds to drag events.
  etc.
*/