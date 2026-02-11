// "CustomScrollView" allows us to create a scrollable area with multiple slivers which are scrollable areas that can have different behaviors and layouts.
// It provides more flexibility and control over the scrolling behavior and appearance of the content within the scroll view.

/*
  /* Structure of "CustomScrollView" */
  CustomScrollView(
    slivers: [
      // List of slivers (scrollable areas).
    ]
  )

  /* List of Common Slivers */
  1. SliverAppBar           : A sliver that displays a header that can expand, collapse and stick to the top of the scroll view. ("AppBar" inside "CustomScrollView")
  2. SliverList             : A sliver that displays a linear list of items.                                                     ("ListView" inside "CustomScrollView")
  3. SliverGrid             : A sliver that displays a grid of items.                                                            ("GridView" inside "CustomScrollView")
  4. SliverToBoxAdapter     : A sliver that allows us to insert a normal widget into the sliver list.                            ("slivers" cannot directly contain normal widgets such as "Container".)
  5. SliverPersistentHeader : A sliver that displays a header that can stick to the top of the scroll view when scrolling.
  etc.
*/

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
  SliverAppBar appBar() {
    return SliverAppBar(
      pinned: true,                    // Stick to the top when scrolling.
      expandedHeight: 10,              // Height when expanded. (Similar to "height" in normal "AppBar".)
      flexibleSpace: FlexibleSpaceBar( // Content of the "SliverAppBar".
        title: const Text("App"),
        background: Container(color: Colors.blue[100]),
        centerTitle: true
      )
    );
  }

  SliverToBoxAdapter sliverToBoxAdapter() {
    return SliverToBoxAdapter( 
      child: Container( // Normal widget inside "SliverToBoxAdapter".
        height: 200,
        margin: EdgeInsets.all(10),
        color: Colors.grey,
        child: Center(child: Text("SliverToBoxAdapter"))
      ),
    );
  }

  SliverGrid sliverGrid() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate( // Similar to "itemBuilder" in "GridView.builder".
        (context, index) {
          return Container(
            color: Colors.grey,
            child: Center(child: Text("Grid ${index + 1}"))
          );
        },
        childCount: 20 // Similar to "itemCount" in "GridView.builder".
      ),

      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent( // Similar to "gridDelegate" in "GridView".builder".
        maxCrossAxisExtent: 250,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10
      )
    );
  }

  SliverList sliverList() {
    return SliverList( 
      delegate: SliverChildBuilderDelegate( // Similar to "itemBuilder" in "ListView.builder".
        (context, index) {
          return Container(
            height: 100,
            margin: EdgeInsets.only(left: 10, right: 10,bottom: 10),
            color: Colors.grey,
            child: Center(child: Text("Item ${index + 1}"))
          );
        },
        childCount: 20 // Similar to "itemCount" in "ListView.builder".
      )
    );
  }

  // Toggle between Grid and List
  bool _option = true;                                           // true: Grid, false: List 
  dynamic gridOrList() => _option ? sliverGrid() : sliverList(); // Lambda function to return either "SliverGrid" or "SliverList" based on the "_option" value.
  SliverToBoxAdapter buttonSwitch() {                            // Button to toggle between Grid and List.
    return SliverToBoxAdapter(
      child: Container(
        width: 200, // Not working since it will force to full width in SliverToBoxAdapter.
        height: 50,
        color: Colors.black,
        child: TextButton(
          onPressed: () => (setState(() => _option = !_option)), // Toggle between Grid and List. // "setState" can call the "build"method to update the UI.
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(_option ? "Switch to List " : "Switch to Grid "),
              Icon(Icons.swap_horiz)
            ]
          )
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView( // Scrollable area with multiple "slivers".
          slivers: [            // List of "slivers".
            appBar(),                                        // "SliverAppBar" at the top.
            sliverToBoxAdapter(),                            // "SliverToBoxAdapter" with normal widget.

            SliverPersistentHeader(                          // Sticky row of items.
              delegate: PersistentHeader(),                  // Class that extends "SliverPersistentHeaderDelegate".
              pinned: true,                                  // Stick to the top when scrolling. 
            ),

            SliverToBoxAdapter(child: SizedBox(height: 10)), // "SliverToBoxAdapter" for spacing.
            buttonSwitch(),                                  // "SliverToBoxAdapter" with toggle button.
            SliverToBoxAdapter(child: SizedBox(height: 10)), // "SliverToBoxAdapter" for spacing.
            gridOrList()                                     // Toggle between "SliverGrid" and "SliverList". 
          ]
        )
      )
    );   
  }
}

// "SliverPersistentHeader" must have a delegate that extends "SliverPersistentHeaderDelegate".
class PersistentHeader extends SliverPersistentHeaderDelegate { 
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) { // Build the content of the persistent header.
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          width: 100,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(child: Text("Sticky ${index + 1}"))
        );
      },
    );
  }

  @override
  double get maxExtent => 80; // Maximum height of the persistent header. // Change when expanding. (When scrolling up until reaching this height.)

  @override
  double get minExtent => 50; // Minimum height of the persistent header. // Change when collapsing. (When scrolling down until reaching this height.)

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false; // Determine whether the header should be rebuilt when the delegate changes.
}