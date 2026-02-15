import 'package:b_fundamental_flutter_application/pages/Cart/index.dart';
import 'package:b_fundamental_flutter_application/pages/Category/CategoryDetailsPage.dart';
import 'package:b_fundamental_flutter_application/pages/Category/index.dart';
import 'package:b_fundamental_flutter_application/pages/Login/index.dart';
import 'package:b_fundamental_flutter_application/pages/Main/index.dart';
import 'package:flutter/material.dart';

// Define the root widget of the application.
Widget getRootWidget() {
  return MaterialApp(
    initialRoute: "/",
    routes: getAppRoutes(),
    onGenerateRoute: generateRoute,
    theme: ThemeData(scaffoldBackgroundColor: Colors.white),
  );
}

// List of application routes.
Map<String, Widget Function(BuildContext)> getAppRoutes() {
  return {
    "/": (context) => MainPage(),
    "/category": (context) => CategoryPage(),
    "/cart": (context) => CartPage(),
    "/login": (context) => LoginPage(),
  };
}

// Handle routes that require arguments.
Route<dynamic>? generateRoute(RouteSettings settings) {
  switch(settings.name) {
    case '/category/details':
      final args = settings.arguments as Map<String, dynamic>; // Get 
      return MaterialPageRoute(builder: (context) => CategoryDetailsPage(categoryName: args['categoryName']),);

    default:
      return null; // 404 Not Found - Return null to let Flutter handle it.
  }
}