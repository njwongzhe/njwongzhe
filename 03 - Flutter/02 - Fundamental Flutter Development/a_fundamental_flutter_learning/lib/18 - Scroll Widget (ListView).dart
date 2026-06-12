// "ListView" is a scrollable list of widgets arranged linearly.
// It is similar to "SingleChildScrollView" but is optimized for handling large lists of items efficiently by reusing widgets that are no longer visible on the screen.

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
  // "ScrollController" is a class that allows us to control and manage the scrolling behavior of a scrollable widget, such as "ListView".
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

  // Same as "SingleChildScrollView" but using "ListView".
  ListView buildListView() {
    return ListView(                                            
      controller: _scrollController,                            // Connect the "ListView" to the "_scrollController" controller.
      scrollDirection: Axis.vertical,                           // Set the scroll direction of the "ListView" to vertical (Default) or horizontal.
      padding: EdgeInsets.all(20),                              // Add padding around the content of the "ListView".
      children: List.generate(100, (index) => buildItem(index)) // Content of the "ListView" is a list that generates 100 items using the "buildItem" method.
    );
  }

  // "ListView.builder" is a constructor of the "ListView" widget that creates a scrollable list of widgets on demand.
  // It is more efficient than the default "ListView" constructor for large lists because it only builds the widgets that are currently visible on the screen.
  ListView buildListViewBuilder() {
    return ListView.builder(
      itemCount: 100,                                    // Specify the total number of items in the list. (Must Exist)
      itemBuilder: (context, index) => buildItem(index), // Define how each item in the list should be built using the "buildItem" method. (Must Exist)

      controller: _scrollController,  // Connect the "ListView" to the "_scrollController" controller.
      scrollDirection: Axis.vertical, // Set the scroll direction of the "ListView" to vertical (Default) or horizontal.
      padding: EdgeInsets.all(20)     // Add padding around the content of the "ListView".
    );
  }

  // "ListView.separated" is a constructor of the "ListView" widget that creates a scrollable list of widgets with separators between each item.
  // It is useful when you want to visually separate the items in the list with a divider or any other widget.
  ListView buildListViewSeparated() {
    return ListView.separated(
      itemCount: 100,                                    // Specify the total number of items in the list. (Must Exist)
      itemBuilder: (context, index) => buildItem(index), // Define how each item in the list should be built using the "buildItem" method. (Must Exist)
      
      // Define a separator widget to be placed between each item in the list. (Must Exist)
      separatorBuilder: (context, index) => Divider(),                                   // Using a simple divider as the separator.
      // separatorBuilder: (context, index) => Container(height: 5, color: Colors.grey), // You can also use a custom separator widget.

      controller: _scrollController,  // Connect the "ListView" to the "_scrollController" controller.
      scrollDirection: Axis.vertical, // Set the scroll direction of the "ListView" to vertical (Default) or horizontal.
      padding: EdgeInsets.all(20)     // Add padding around the content of the "ListView". 
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // buildListView(),        // Scrollable list by using "ListView".
            // buildListViewBuilder(), // Scrollable list by using "ListView.builder".
            buildListViewSeparated(),  // Scrollable list by using "ListView.separated".

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
                    0,                                          // Scroll to the top of the "ListView" when the button is pressed. (0 represents the top position of the scrollable content.)
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
                    _scrollController.position.maxScrollExtent, // Scroll to the bottom of the "ListView" when the button is pressed. (maxScrollExtent represents the maximum scrollable extent of the content.)
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