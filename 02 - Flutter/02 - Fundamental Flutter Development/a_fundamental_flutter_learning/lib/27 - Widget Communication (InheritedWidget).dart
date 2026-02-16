// "InheritedWidget" is a Flutter concept that allows data to be passed down the widget tree efficiently. 
// It's particularly useful for sharing data across multiple widgets without having to pass it through each widget's constructor.

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
  final TextEditingController _nameController = TextEditingController(text: "MyInheritedWidget");
  final TextEditingController _dataController = TextEditingController(text: "Hello from InheritedWidget!");

  String _name = "MyInheritedWidget";
  String _data = "Hello from InheritedWidget!";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: MyInheritedWidget( // Wrapping the child widgets with MyInheritedWidget to provide them access to the shared data.
              name: _name, // Shared data that will be accessible to all descendant widgets of MyInheritedWidget. (Based on The Field of "Data that Descendant Widgets Can Access")
              data: _data, // Shared data that will be accessible to all descendant widgets of MyInheritedWidget. (Based on The Field of "Data that Descendant Widgets Can Access")
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _nameController, 
                    decoration: const InputDecoration(labelText: "Name"),
                    onChanged: (value) => setState(() => _name = value) // This will update the name in MyInheritedWidget whenever the text changes.,
                  ),
                  TextField(
                    controller: _dataController, 
                    decoration: const InputDecoration(labelText: "Data"),
                    onChanged: (value) => setState(() => _data = value) // This will update the data in MyInheritedWidget whenever the text changes.,
                  ),

                  const SizedBox(height: 20),
                  const Text("Child Widget:", style: TextStyle(fontWeight: FontWeight.bold)),
                  const ChildWidget(), // We no longer need to pass data to the child widget via constructor.

                  const SizedBox(height: 20),
                  const Text("Another Child Widget:", style: TextStyle(fontWeight: FontWeight.bold)),
                  const AnotherChildWidget() // We no longer need to pass data to the child widget via constructor.
                ]
              )
            )
          )
        )
      )
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  /* Data that Descendant Widgets Can Access */
  final String name;
  final String data;

  /* Constructor */ 
  const MyInheritedWidget({
    super.key,             // (Fixed Syntax)
    required this.name,    // (Based on The Field of "Data that Descendant Widgets Can Access")
    required this.data,    // (Based on The Field of "Data that Descendant Widgets Can Access")
    required Widget child} // The child widget that will be wrapped by this InheritedWidget and can access the shared data. (Fixed Syntax)
  ) : super(child: child); // (Fixed Syntax)
  // const MyInheritedWidget({super.key, required this.name, required this.data, required Widget child}) : super(child: child); // Situation write in one line.

  // This method is called when the inherited widget is rebuilt. 
  // It determines whether the dependent widgets should be notified of the change.
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return name != oldWidget.name || data != oldWidget.data; // Notify dependent widgets if data OR name has changed.
  }

  // Static method to access the inherited widget from the widget tree.
  // If not declare it, user will have to use "context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()" every time they want to access the inherited data.
  // It increases the readability and maintainability of the code by providing a convenient way to access the inherited widget.
  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final inheritedWidget = MyInheritedWidget.of(context);                                      // Accessing the inherited data using the "of" method. (Self Defined Method) (More Readable)
    // final inheritedWidget = context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>(); // Accessing the inherited data without using the "of" method. (Less Readable)

    return Text("${inheritedWidget?.name}: ${inheritedWidget?.data ?? "No data found"}"); // Displaying the inherited data and name. If no data is found, display a default message.
  }
}

class AnotherChildWidget extends StatelessWidget {
  const AnotherChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final inheritedWidget = MyInheritedWidget.of(context);                                      // Accessing the inherited data using the "of" method. (Self Defined Method) (More Readable)
    // final inheritedWidget = context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>(); // Accessing the inherited data without using the "of" method. (Less Readable)

    return Text("${inheritedWidget?.name}: ${inheritedWidget?.data ?? "No data found"}"); // Displaying the inherited data and name. If no data is found, display a default message.
  }
}