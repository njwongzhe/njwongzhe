import 'package:b_fundamental_flutter_application/pages/Login/index.dart';
import 'package:b_fundamental_flutter_application/pages/Main/index.dart';
import 'package:flutter/material.dart';

// Define the root widget of the application.
Widget getRootWidget() {
  return MaterialApp(
    initialRoute: "/",
    routes: getAppRoutes(),
  );
}

// List of application routes.
Map<String, Widget Function(BuildContext)> getAppRoutes() {
  return {
    "/": (context) => MainPage(),
    "/login": (context) => LoginPage(),
  };
}