import 'package:flutter/material.dart';

class HomeHot extends StatefulWidget {
  const HomeHot({super.key});

  @override
  State<HomeHot> createState() => _HomeHotState();
}

class _HomeHotState extends State<HomeHot> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.symmetric(horizontal: 10),
      shrinkWrap: true, // "GridView" cannot be displayed without "shrinkWrap: true" when it is used in a scrollable widget.
      physics: NeverScrollableScrollPhysics(), // "GridView" cannot be displayed without "physics: NeverScrollableScrollPhysics()" when it is used in a scrollable widget.
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        mainAxisExtent: 200,
      ),
      children: List.generate(2, (index) => Container(
        height: 200,
        color: Colors.grey,
        child: Center(child: Text("${index + 1}"))
      ))
    );
  }
}