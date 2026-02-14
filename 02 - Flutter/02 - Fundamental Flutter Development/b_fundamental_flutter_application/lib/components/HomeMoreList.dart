import 'package:flutter/material.dart';

class HomeMoreList extends StatefulWidget {
  const HomeMoreList({super.key});

  @override
  State<HomeMoreList> createState() => _HomeMoreListState();
}

class _HomeMoreListState extends State<HomeMoreList> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.symmetric(horizontal: 10),
      shrinkWrap: true, // "GridView" cannot be displayed without "shrinkWrap: true" when it is used in a scrollable widget.
      physics: NeverScrollableScrollPhysics(), // "GridView" cannot be displayed without "physics: NeverScrollableScrollPhysics()" when it is used in a scrollable widget.
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: List.generate(10, (index) => Container(
        color: Colors.grey,
        child: Center(child: Text("${index + 1}"))
      ))
    );
  }
}