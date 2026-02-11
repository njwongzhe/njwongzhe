// "GridView" is a scrollable grid of widgets arranged in a 2D array.
// It similar to the combination of "ListView" and "Wrap" widgets.
// The widgets in the grid are created on demand (Like "ListView.builder") and can automatically adjust their location and size based on the available space (Like "Wrap").

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
  // There is no need to use "ScrollController" with "GridView" unless you want to control the scrolling behavior.

  Container buildItem(int index) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
      // width: double.infinity, // The width will be determined by the grid layout since it will auto adjust based on the available space.
      // height: 50,             // The height will be determined by the grid layout since it will auto adjust based on the available space.
      decoration: BoxDecoration(
        color: Colors.blue[100],
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text("Item ${index + 1}"),
    );
  }

  // "GridView.count" ensure that a row or column will have a fixed number of items by specifying the "crossAxisCount".
  // Then, it will automatically determine the size of each item based on the available space.
  GridView buildGridViewCountVertical() {
    return GridView.count( 
      crossAxisCount: 3,   // Number of items to display in each row. (Number of Columns)
      mainAxisSpacing: 5,  // Spacing between items along the main axis. (Horizontal Spacing)
      crossAxisSpacing: 5, // Spacing between items along the cross axis. (Vertical Spacing)

      scrollDirection: Axis.vertical,                           // Set the scroll direction of the "GridView" to vertical (Default).
      padding: EdgeInsets.all(20),                              // Add padding around the content of the "GridView".
      children: List.generate(100, (index) => buildItem(index)) // Content of the "GridView" is a list that generates 100 items using the "buildItem" method.
    );
  }

  // "GridView.count" ensure that a row or column will have a fixed number of items by specifying the "crossAxisCount".
  // Then, it will automatically determine the size of each item based on the available space.
  GridView buildGridViewCountHorizontal() {
    return GridView.count( 
      crossAxisCount: 5,   // Number of items to display in each column. (Number of Rows)
      mainAxisSpacing: 5,  // Spacing between items along the main axis. (Vertical Spacing)
      crossAxisSpacing: 5, // Spacing between items along the cross axis. (Horizontal Spacing)

      scrollDirection: Axis.horizontal,                         // Set the scroll direction of the "GridView" to horizontal.
      padding: EdgeInsets.all(20),                              // Add padding around the content of the "GridView".
      children: List.generate(100, (index) => buildItem(index)) // Content of the "GridView" is a list that generates 100 items using the "buildItem" method.
    );
  }

  // "GridView.extent" ensure that every item will have same height and width by specifying the "maxCrossAxisExtent" of each item along the cross axis.
  // Then, it will automatically determine how many items can fit in each row or column based on the available space.
  GridView buildGridViewExtend() {
    return GridView.extent( 
      maxCrossAxisExtent: 150, // Maximum extent of each item along the cross axis. (Width for vertical scrolling. / Height for horizontal scrolling.)
      mainAxisSpacing: 5,      // Spacing between items along the main axis. (Horizontal Spacing)
      crossAxisSpacing: 5,     // Spacing between items along the cross axis. (Vertical Spacing)

      scrollDirection: Axis.vertical,                           // Set the scroll direction of the "GridView" to vertical (Default) or horizontal.
      padding: EdgeInsets.all(20),                              // Add padding around the content of the "GridView".
      children: List.generate(100, (index) => buildItem(index)) // Content of the "GridView" is a list that generates 100 items using the "buildItem" method.
    );
  }

  // "GridView.builder" is a constructor of the "GridView" widget that creates a scrollable grid of widgets on demand. (Similar to "ListView.builder")
  // It is more efficient than the default "GridView" constructor for large grids because it only builds the widgets that are currently visible on the screen.
  // The different between "ListView.builder" and "GridView.builder" is that "GridView.builder" requires a "gridDelegate" to define the layout of the grid.
  GridView buildGridViewBuilderVertical() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( // "GridView.builder" but in "GridView.count" style.
        crossAxisCount: 3,   // Number of items to display in each row. (Number of Columns)
        mainAxisSpacing: 5,  // Spacing between items along the main axis. (Horizontal Spacing)
        crossAxisSpacing: 5, // Spacing between items along the cross axis. (Vertical Spacing)
      ),

      /*
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent( // "GridView.builder" but in "GridView.extent" style.
        maxCrossAxisExtent: 150, // Maximum extent of each item along the cross axis. (Width for vertical scrolling. / Height for horizontal scrolling.)
        mainAxisSpacing: 5,      // Spacing between items along the main axis. (Horizontal Spacing)
        crossAxisSpacing: 5,     // Spacing between items along the cross axis. (Vertical Spacing)
      ),
      */

      itemCount: 100,                                    // Specify the total number of items in the grid. (Must Exist)
      itemBuilder: (context, index) => buildItem(index), // Define how each item in the grid should be built using the "buildItem" method. (Must Exist)

      scrollDirection: Axis.vertical,                           // Set the scroll direction of the "GridView" to vertical (Default).
      padding: EdgeInsets.all(20),                              // Add padding around the content of the "GridView".
    );
  }

  // "GridView.builder" is a constructor of the "GridView" widget that creates a scrollable grid of widgets on demand. (Similar to "ListView.builder")
  // It is more efficient than the default "GridView" constructor for large grids because it only builds the widgets that are currently visible on the screen.
  // The different between "ListView.builder" and "GridView.builder" is that "GridView.builder" requires a "gridDelegate" to define the layout of the grid.
  GridView buildGridViewBuilderHorizontal() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( // "GridView.builder" but in "GridView.count" style.
        crossAxisCount: 5,   // Number of items to display in each column. (Number of Rows)
        mainAxisSpacing: 5,  // Spacing between items along the main axis. (Vertical Spacing)
        crossAxisSpacing: 5, // Spacing between items along the cross axis. (Horizontal Spacing)
      ),
      /*
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent( // "GridView.builder" but in "GridView.extent" style.
        maxCrossAxisExtent: 150, // Maximum extent of each item along the cross axis. (Width for vertical scrolling. / Height for horizontal scrolling.)
        mainAxisSpacing: 5,      // Spacing between items along the main axis. (Vertical Spacing)
        crossAxisSpacing: 5,     // Spacing between items along the cross axis. (Horizontal Spacing)
      ),
      */
      itemCount: 100,                                    // Specify the total number of items in the grid. (Must Exist)
      itemBuilder: (context, index) => buildItem(index), // Define how each item in the grid should be built using the "buildItem" method. (Must Exist)

      scrollDirection: Axis.horizontal,                         // Set the scroll direction of the "GridView" to horizontal.
      padding: EdgeInsets.all(20),                              // Add padding around the content of the "GridView".
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: buildGridViewCountVertical()        // Scrollable grid by using "GridView.count". (Vertical)
          // child: buildGridViewCountHorizontal()   // Scrollable grid by using "GridView.count". (Horizontal)
          // child: buildGridViewExtend()            // Scrollable grid by using "GridView.extent".
          // child: buildGridViewBuilderVertical()   // Scrollable grid by using "GridView.builder". (Vertical)
          // child: buildGridViewBuilderHorizontal() // Scrollable grid by using "GridView.builder". (Horizontal)
        )
      )
    );
  }
}

/*
  Summary:
  1. GridView.count
    - Use when you want a fixed number of items in each row or column.
    - Automatically adjusts item size based on available space.
  2. GridView.extent
    - Use when you want items to have a maximum size.
    - Automatically determines how many items fit in each row or column.
  3. GridView.builder
    - Use for large grids where performance is a concern. 
    - It will only build items that are visible on the screen. (Like "ListView.builder")
    - Requires a gridDelegate to define the layout.
      i.  SliverGridDelegateWithFixedCrossAxisCount (like "GridView.count")
      ii. SliverGridDelegateWithMaxCrossAxisExtent (like "GridView.extent")
*/