import 'package:flutter/material.dart';

class HomeSuggestion extends StatefulWidget {
  const HomeSuggestion({super.key});

  @override
  State<HomeSuggestion> createState() => _HomeSuggestionState();
}

class _HomeSuggestionState extends State<HomeSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 200,
      color: Colors.grey,
      child: Center(child: Text("Home Suggestion"))
    );
  }
}