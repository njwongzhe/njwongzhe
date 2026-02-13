// "Named Route" is a way to manage navigation in Flutter applications using string identifiers for routes.
// This approach allows for a more organized and scalable way to handle navigation, especially in larger applications with multiple screens.
// Similar with basic route management, it will push and pop routes from the navigation stack but we can directly refer to routes by their names instead of creating new route instances each time.
// Operations:
// 1. Navigator.pushNamed            : This operation is used to navigate to a new page by pushing a named route onto the navigation stack.
// 2. Navigator.popNamed             : This operation is used to return to the previous page by popping the current named route off the navigation stack.
// 3. Navigator.pushReplacementNamed : This operation is used to replace the current route with a new named route. (Cannot go back to the previous route)
// 4. Navigator.popAndPushNamed      : This operation is used to pop the current route off the navigation stack and push a new named route in a single operation.
// 5. Navigator.popUntil             : This operation is used to pop routes off the navigation stack until a specified named route is reached.
// etc.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home", // The initial route that the app will display when it starts.
      routes: {              // List of named routes in the application.
        "/home": (context) => HomePage(),                                                               // Set the home page route.
        "/detail": (context) => DetailPage(indexGet: ModalRoute.of(context)?.settings.arguments as int) // Set the detail page route with argument passing.
      },
      onGenerateRoute: (settings) { // "settings" contains the information about the route being requested.
        // An operation will enter here if the target named route is not found in the routes table.
        // Then, we can handle the route generation dynamically here.
        print("onGenerateRoute called for route: ${settings.name}"); 
      },
      onUnknownRoute: (settings) { // "settings" contains the information about the route being requested.
        // If both the routes table and onGenerateRoute cannot handle the named route, this operation will be called as a last resort.
        // Usually, we can redirect the user to a "404 Not Found" page or a default page here.
        print("onUnknownRoute called for route: ${settings.name}");
      },
      home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/detail", arguments: index), // Navigate to a new page using named route, passing the index as an argument.
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
    );
  }
}

class DetailPage extends StatefulWidget {
  final int indexGet;

  const DetailPage({super.key, required this.indexGet});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: GestureDetector(
        onTap: () => Navigator.pop(context), // Pop the current route to go back to the previous page.
        child: Center(
          child: Text('Click me to go back from detail of Item ${widget.indexGet + 1}.', style: TextStyle(fontSize: 24)),
        ),
      )
    );
  }
}