// "SingleChildScrollView" is a widget that allows its child to be scrollable when the content exceeds the available space. It is useful when you have a single child that may overflow and you want to enable scrolling to access the hidden content.

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
  // "ScrollController" is a class that allows us to control and manage the scrolling behavior of a scrollable widget, such as "SingleChildScrollView".
  // It provides methods and properties to programmatically scroll to a specific position, listen to scroll events and access the current scroll position.
  ScrollController _scrollController = ScrollController();

  Container buildItem(int index) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text("Item ${index + 1}"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(                                                     // "SingleChildScrollView" is a widget that allows its child to be scrollable when the content exceeds the available space.
              controller: _scrollController,                                           // Connect the "SingleChildScrollView" to the "_scrollController" controller.
              scrollDirection: Axis.vertical,                                          // Set the scroll direction of the "SingleChildScrollView" to vertical (Default) or horizontal.
              padding: EdgeInsets.all(20),                                             // Add padding around the content of the "SingleChildScrollView".
              child: Column(children: List.generate(100, (index) => buildItem(index))) // Content of the "SingleChildScrollView" is a "Column" that generates 100 items using the "buildItem" method.
            ),

            Positioned(
              top: 20,
              right: 20,
              width: 75,
              height: 75,
              child: Container(
                decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                child: TextButton(
                  // onPressed: () => _scrollController.jumpTo(0), // "jumpTo" is a method of the "ScrollController" class that allows us to programmatically jump to a specific position in the scrollable widget without any animation.
                  onPressed: () => _scrollController.animateTo( // "animateTo" is a method of the "ScrollController" class that allows us to programmatically scroll to a specific position in the scrollable widget.
                    0,                                          // Scroll to the top of the "SingleChildScrollView" when the button is pressed. (0 represents the top position of the scrollable content.)
                    duration: Duration(milliseconds: 500),      // Set the duration of the scroll animation to 500 milliseconds.
                    curve: Curves.easeInOut,                    // Set the curve of the scroll animation to "easeInOut".
                  ), 
                  child: Text("Top", textAlign: TextAlign.center, style: TextStyle(color: Colors.white))
                )
              )
            ),

            Positioned(
              bottom: 20,
              right: 20,
              width: 75,
              height: 75,
              child: Container(
                decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                child: TextButton(
                  // onPressed: () => _scrollController.jumpTo(_scrollController.position.maxScrollExtent), // "jumpTo" is a method of the "ScrollController" class that allows us to programmatically jump to a specific position in the scrollable widget without any animation.
                  onPressed: () => _scrollController.animateTo( // "animateTo" is a method of the "ScrollController" class that allows us to programmatically scroll to a specific position in the scrollable widget.
                    _scrollController.position.maxScrollExtent, // Scroll to the bottom of the "SingleChildScrollView" when the button is pressed. (maxScrollExtent represents the maximum scrollable extent of the content.)
                    duration: Duration(milliseconds: 500),      // Set the duration of the scroll animation to 500 milliseconds.
                    curve: Curves.easeInOut,                    // Set the curve of the scroll animation to "easeInOut".
                  ),
                  child: Text("Bottom", textAlign: TextAlign.center, style: TextStyle(color: Colors.white))
                )
              )
            )
          ]
        )
      )
    );
  }
}