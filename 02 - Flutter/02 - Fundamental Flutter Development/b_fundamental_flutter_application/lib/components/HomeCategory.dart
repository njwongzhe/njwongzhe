import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeCategory extends StatefulWidget {
  const HomeCategory({super.key});

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50, // "ListView" in horizontal direction cannot be displayed without a fixed height.
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          height: 50,
          width: 50,
          margin: EdgeInsets.only(right: 10),
          color: Colors.grey,
          child: Center(child: Text("${index + 1}"))
        )
      )
    );
  }
}