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
      "icon": "lib/assets/Category_Dessert.png",
      "text": "Dessert"
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
      height: 50, // "ListView" in horizontal direction cannot be displayed without a fixed height.
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categoryList.length,
        itemBuilder: (context, index) => Container(
          height: 50,
          width: 50,
          margin: EdgeInsets.only(right: 10),
          color: Colors.grey,
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