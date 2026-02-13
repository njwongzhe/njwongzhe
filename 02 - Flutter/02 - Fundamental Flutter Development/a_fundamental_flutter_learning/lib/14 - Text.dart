import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              margin: EdgeInsets.only(bottom: 20),
              color: Colors.grey,
              alignment: Alignment.center,

              // "Text" widget allow to display a string of text which all text with same style.
              child: Text(
                /* Text to display. */
                "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,", 
                  
                /* Text alignment. */
                // textAlign: TextAlign.center, // Align the text to the center.
                // textAlign: TextAlign.left,   // Align the text to the left.
                // textAlign: TextAlign.right,  // Align the text to the right.
                textAlign: TextAlign.justify,   // Justify the text.

                /* Text style. */
                style: TextStyle(  // Define the style of the text.
                  color: Colors.white,                          // Color of the text.

                  fontSize: 25,                                 // Size of the text.
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,

                  letterSpacing: 5,                               // Space between each character.
                  wordSpacing: 10,                                // Space between each word.
                  height: 1.5,                                    // Line height (space between each line).
                    
                  decoration: TextDecoration.underline,           // Line on bottom of the text.
                  // decoration: TextDecoration.lineThrough,      // Line through the middle of the text.
                  // decoration: TextDecoration.overline,         // Line on top of the text.
                  decorationStyle: TextDecorationStyle.dashed,    // Style of line set in "decoration".
                  // decorationStyle: TextDecorationStyle.dotted,
                  // decorationStyle: TextDecorationStyle.double,
                  // decorationStyle: TextDecorationStyle.solid,
                  // decorationStyle: TextDecorationStyle.wavy,
                  decorationColor: Colors.black,                // Color of line set in "decoration".
                  decorationThickness: 2,                         // Thickness of line set in "decoration".
                ),

                /* Text overflow handling. */
                maxLines: 3,                       // Maximum number of lines to display.
                overflow: TextOverflow.ellipsis,   // Show "..." if the text exceed the maximum lines. 
                // overflow: TextOverflow.fade,    // Fade out the text if it exceed the maximum lines.
                // overflow: TextOverflow.visible, // Show the full text even it exceed the maximum lines.
                // overflow: TextOverflow.clip,    // Cut off the text if it exceed the maximum lines.
              )
            ),

            Container(
              width: double.infinity,
              height: 300,
              margin: EdgeInsets.only(bottom: 20),
              color: Colors.grey,
              alignment: Alignment.center,

              // "RichText" widget allow to display a string of text which each part of the text can have different style.
              child: RichText(
                text: TextSpan(
                  text: "This is ", // First part of the text.
                  style: TextStyle(color: Colors.white, fontSize: 30),

                  // Any "text" that other than the first part must be in "children".
                  children: [
                    TextSpan( // Second part of the text.
                      text: "RichText ", 
                      style: TextStyle(color: Colors.yellow, fontSize: 40, fontWeight: FontWeight.bold)
                    ),
                    TextSpan( // Third part of the text.
                      text: "widget ", 
                      style: TextStyle(color: Colors.cyan, fontSize: 35, fontStyle: FontStyle.italic)
                    ),
                    TextSpan( // Fourth part of the text.
                      text: "in Flutter.",
                      style: TextStyle(color: Colors.black, fontSize: 30, decoration: TextDecoration.underline)
                    )
                  ]
                )
              )
            )
          ]
        )
      )
    );
  }
}