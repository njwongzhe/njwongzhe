// In child to parent communication, child widgets can send data back to parent widgets using callback functions that are passed down from the parent. 

import 'package:flutter/material.dart';

void main() {
  runApp(const Parent());
}

class Parent extends StatefulWidget {
  const Parent({super.key});

  @override
  ParentState createState() => ParentState();
}

class ParentState extends State<Parent> {
  final List<String> items = ["Food", "Drink", "Desert", "Snack", "Fruit", "Vegetable", "Meat"]; // Sample data to pass to child widget.

  // Function to handle deletion of item at given index.
  void handleDelete(int index) {
    setState(() => items.removeAt(index)); // Remove item from the list and update UI through "setState".
  }

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
            (index) => Child(                     // Passing data to child widget via constructor. (Parent to Child)
              itemName: items[index],             // Data to display.
              onDelete: () => handleDelete(index) // Callback function that is passed to child. (Child to Parent) 
            ) 
          )
        )
      )
    );
  }
}

class Child extends StatelessWidget {
  final String itemName;                                                    // Property to hold the data passed from the parent.
  final VoidCallback onDelete;                                              // Property to hold the callback function passed from the parent.
  const Child({super.key, required this.itemName, required this.onDelete}); // Constructor to receive data and callback function from parent.

  @override
  Widget build(BuildContext context) {
    return Stack( 
      children: [
        /* Item Box */
        Container(
          alignment: Alignment.center,
          color: Colors.blue[100],
          child: Text(itemName) // Using the passed data. (Parent to Child)
        ),
        
        /* Delete Icon */
        Positioned(
          top: 5,
          right: 5,
          child: GestureDetector(
            onTap: onDelete, // Call the callback function passed from parent to notify deletion. (Child to Parent) // Trigger the function when delete icon is tapped.
            child: Icon(Icons.delete, color: Colors.red)
          )
        )
      ]
    );
  }
}