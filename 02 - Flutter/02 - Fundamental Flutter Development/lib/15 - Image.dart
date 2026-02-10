// "Image" widget is used to display an image in Flutter. 
// It can display images from various sources such as assets, network, file and memory:
// 1. AssetImage   : Display image from assets folder. 
//                   (Location of the image must be specified in "assets" section of "pubspec.yaml" file in project root directory.)
//                   (Be careful with indentation (TAB) in "pubspec.yaml" file.)
// 2. NetworkImage : Display image from the internet.
// 3. FileImage    : Display image from the file system.
// 4. MemoryImage  : Display image from memory.

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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/Demo_Image.jpg", 
                width: 300, 
                height: 300,

                // "fit" property is used to specify how the image should be inscribed into the space allocated during layout.
                fit: BoxFit.cover        // Clipping the image if necessary to ensure it is completely based on "width" and "height" specified above.
                // fit: BoxFit.contain   // Contain the image within the space without clipping. // Default
                // fit: BoxFit.fill      // Fill the entire space by distorting the image if necessary
                // fit: BoxFit.fitWidth  // Fit the image to the width of the space.
                // fit: BoxFit.fitHeight // Fit the image to the height of the space.
                // fit: BoxFit.none      // Do not scale the image.
                // fit: BoxFit.scaleDown // Scale down the image to fit within the space if necessary.
              ),

              Image.network("https://docs.flutter.dev/assets/images/flutter-logo-sharing.png")  
              // Basically "Image.network()" is the same as "Image.asset()", we can set the style of the image in "Image.network()" same as "Image.asset()".
              // The only difference is the source of the image.
              // "Image.asset()" need to put the path of the image in the assets folder as parameter.
              // "Image.network()" need to put the link of the image in the internet as parameter.
            ]
          )
        )
      )
    );
  }
}