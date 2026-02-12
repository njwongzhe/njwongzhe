// Widget Communication allow widgets to pass data between each other.
// There is several ways for widgets to communicate with each other:
// 1. Parent to Child        : Pass data from parent widget to child widget via constructor of child widget.
// 2. Child to Parent        : Pass data from child widget to parent widget via callback function passed by parent.
// 3. Ancestor to Descendant : Pass data from ancestor widget to descendant widget via "InheritedWidget".

import 'package:flutter/material.dart';

void main() {
  runApp(const Parent());
}

class Parent extends StatelessWidget {
  final List<String> items = const ["Food", "Drink", "Desert", "Snack", "Fruit", "Vegetable", "Meat"]; // Sample data to pass to child widget.

  const Parent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.extent(
          maxCrossAxisExtent: 200,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(
            items.length,
            (index) => Child(message: items[index]) // Passing data to child widget via constructor. (Parent to Child)
          )
        )
      )
    );
  }
}

class Child extends StatelessWidget {
  final String message;                            // Property to hold the data passed from the parent. // It must be "final" because we should not change data passed from parent.
  const Child({super.key, required this.message}); // Constructor to receive data from parent.          // "required" means this parameter must be provided.

  /*
  final String? message;                  // Property to hold the data passed from the parent. // "?" means this property can be null.
  const Child({super.key, this.message}); // Constructor to receive data from parent.          // Without "required", this parameter is optional and can be null.
  */

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue[100],
      child: Text(message) // Using the passed data. (Parent to Child)
    );
  }
}