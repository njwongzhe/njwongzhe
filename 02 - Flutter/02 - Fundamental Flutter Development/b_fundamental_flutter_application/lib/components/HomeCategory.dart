import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeCategory extends StatefulWidget {
  const HomeCategory({super.key});

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  final List<Map<String, String>> _categoryList = [
    {
      "icon": "lib/assets/Category_Bakery.png",
      "text": "Bakery"
    },
    {
      "icon": "lib/assets/Category_Beverages.png",
      "text": "Beverages"
    },
    {
      "icon": "lib/assets/Category_Desserts.png",
      "text": "Desserts"
    },
    {
      "icon": "lib/assets/Category_FastFoods.png",
      "text": "Fast Foods"
    },
    {
      "icon": "lib/assets/Category_Noodles.png",
      "text": "Noodles"
    },
    {
      "icon": "lib/assets/Category_Rice.png",
      "text": "Rice"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // "ListView" in horizontal direction cannot be displayed without a fixed height.
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categoryList.length,
        itemBuilder: (context, index) => Container(
          width: 80,
          margin: EdgeInsets.only(right: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200]!,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 2), // Changes position of shadow.
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(_categoryList[index]["icon"]!, width: 24, height: 24,),
                SizedBox(height: 4),
                Text(_categoryList[index]["text"]!, style: TextStyle(fontSize: 10),),
              ],
            ),
          ),
        )
      )
    );
  }
}