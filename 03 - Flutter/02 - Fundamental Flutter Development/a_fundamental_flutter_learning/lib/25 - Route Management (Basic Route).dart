// Route Management in Flutter is important for navigating between different screens or pages within an application.
// This example demonstrates how to implement basic route management using "Navigator" and "MaterialPageRoute".
// There is two main operations: 
// 1. Navigator.push : This operation is used to navigate to a new page by pushing a new route onto the navigation stack.
// 2. Navigator.pop  : This operation is used to return to the previous page by popping the current route off the navigation stack.
// This method only suitable when the app has a small number of routes and one "MaterialApp" instance.

import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push( // Navigate to a new page.
                  context,                                                           // Current context.
                  MaterialPageRoute(builder: (context) => DetailPage(index: index)), // Define the route to the new page.
                );
              },
              child: Container(
                margin: EdgeInsets.all(5),
                height: 50,
                alignment: Alignment.center,
                color: Colors.blue[100],
                child: Text('Item ${index + 1}')
              )
            );
          }
        )
      )
    );
  }
}

class DetailPage extends StatelessWidget {
  final int index;

  const DetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context); // Return to the previous page.
        },
        child: Center(
          child: Text('Click me to go back from detail of Item ${index + 1}.', style: TextStyle(fontSize: 24)),
        ),
      )
    );
  }
}