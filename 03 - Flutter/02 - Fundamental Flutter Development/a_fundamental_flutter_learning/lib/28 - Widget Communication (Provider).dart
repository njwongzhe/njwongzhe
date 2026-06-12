// "Provider" is a wrapper around InheritedWidget that makes state management easier.
// It simplifies the process of sharing data and automatically handles UI updates when data changes.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Run "flutter pub add provider" in terminal to add "Provider" package before using this code.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( // "ChangeNotifierProvider" is a specific type of provider that listens to a "ChangeNotifier" and rebuilds dependent widgets when the notifier calls "notifyListeners()".
      create: (context) => MyDataProvider(), // The "create" function is used to create an instance of the provider.
      /*
        return MultipleProvider( // If you have multiple providers, you can use "MultiProvider" to provide them all at once.
          providers: [
            ChangeNotifierProvider(create: (context) => MyDataProvider()),
            ChangeNotifierProvider(create: (context) => MyDataProvider2()),
            // You can add more providers here if needed.
          ],
          child: MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text("Hello, Provider!"),
              )
            )
          )
        );
      */

      child: HomePage()    
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController(text: "MyProvider");
  final TextEditingController _dataController = TextEditingController(text: "Hello from Provider!");

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() => context.read<MyDataProvider>().updateName(_nameController.text));
    _dataController.addListener(() => context.read<MyDataProvider>().updateData(_dataController.text));
    // "context.read<T>()" is used to access the provider instance without listening for changes.
    // It will not trigger rebuilds when data changes since it only reads the current value. (Snapshot of the data at the moment of access.)
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(controller: _nameController, decoration: const InputDecoration(labelText: "Name")),
                TextField(controller: _dataController, decoration: const InputDecoration(labelText: "Data")),

                const SizedBox(height: 20),
                const Text("Child Widget:", style: TextStyle(fontWeight: FontWeight.bold)),
                const ChildWidget(), // Accessing data via Provider.

                const SizedBox(height: 20),
                const Text("Another Child Widget:", style: TextStyle(fontWeight: FontWeight.bold)),
                const AnotherChildWidget() // Accessing data via Provider.
              ]
            )
          )
        )
      )
    );
  }
}

/* Data Model that extends ChangeNotifier */
class MyDataProvider extends ChangeNotifier {
  String _name = "MyProvider";
  String _data = "Hello from Provider!";

  String get name => _name;
  String get data => _data;

  // In Provider, we need to declare methods to update the data and call "notifyListeners()" to trigger UI updates.
  void updateName(String newName) {
    if (_name != newName) { // Only update and notify if the value actually changes to avoid unnecessary rebuilds.
      _name = newName;   // Update the name and notify listeners to rebuild dependent widgets.
      notifyListeners(); // This replaces the "updateShouldNotify" logic in "inheritedWidget".
    }
  }

  void updateData(String newData) {
    if (_data != newData) { // Only update and notify if the value actually changes to avoid unnecessary rebuilds.
      _data = newData;   // Update the data and notify listeners to rebuild dependent widgets.
      notifyListeners(); // This replaces the "updateShouldNotify" logic in "inheritedWidget".
    }
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Method Update Data 1 : context.watch<T>(). 
    // It will listens for changes. 
    // If the data changes, it will trigger the "notifyListeners()" in MyDataProvider. 
    // Then, the "notifyListeners()" will cause this widget to rebuild and reflect the updated data.
    final myData = context.watch<MyDataProvider>();

    return Text("${myData.name}: ${myData.data}");
  }
}

class AnotherChildWidget extends StatelessWidget {
  const AnotherChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Method Update Data 2: Provider.of<T>(context)
    // Another way to access data.
    // It also listens for changes and triggers rebuilds when data changes, just like "context.watch<T>()".
    // The difference is that "Provider.of<T>(context)" is a more traditional way to access the provider. (Such as the self-defined "of" method in "InheritedWidget")
    // The "context.watch<T>()" is a more concise and readable syntax provided by the "Provider" package.
    final myData = Provider.of<MyDataProvider>(context);

    return Text("${myData.name}: ${myData.data}");
  }
}