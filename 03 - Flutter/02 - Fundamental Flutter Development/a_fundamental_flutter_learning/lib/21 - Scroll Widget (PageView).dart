// "PageView" is a scrollable widget that allows us to create a scrollable list of pages. 
// It is commonly used for creating onboarding screens, image carousels and other types of paginated content. 
// The whole page will be scrolled when the user swipes and it can be used to create a smooth and interactive user experience.

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
  int _currentPageIndex = 0;                     // Current page index for the page indicator.
  PageController _controller = PageController(); // Controller for the "PageView" to control the page programmatically.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [  
            SliverToBoxAdapter( 
              child: Stack(
                children: [
                  /* Content */
                  Container( 
                    height: 300,
                    margin: EdgeInsets.all(10),
                    color: Colors.grey,
                    child: PageView(           // "PageView" for horizontal scrolling between pages.
                      controller: _controller, // Assign the controller to the "PageView".
                      children: List.generate(5, (index) => Center(child: Text("Page ${index + 1}")))
                    )
                  ),

                  /* Page Indicator Bar */
                  Positioned( 
                    left: 0, right: 0, // Center horizontally since both "left" and "right" are set to 0.
                    bottom: 20,        
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Center the page indicators.
                      children: List.generate(5, (index) => 
                        GestureDetector( 
                          onTap: () {                           // Jump to the corresponding page when tapping the corresponding page indicator.
                            setState(() {                       // "setState" can call the "build"method to update the UI.
                              _currentPageIndex = index;        // Update the current page index for the page indicator.

                              // _controller.jumpToPage(index); // Jump to the corresponding page programmatically using the controller.
                              _controller.animateToPage(        // Animate to the corresponding page programmatically using the controller.
                                index, 
                                duration: Duration(milliseconds: 300), 
                                curve: Curves.easeInOut
                              );
                            });
                          },

                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (_currentPageIndex == index) ? Colors.red : Colors.white // Highlight the current page indicator.
                            )
                          )
                        )
                      )
                    )
                  )
                ]
              )
            )
          ]
        )
      )
    );   
  }
}