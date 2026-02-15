import 'package:b_fundamental_flutter_application/utils/loadCategoryIcons.dart';
import 'package:flutter/material.dart';

class HomeCategory extends StatefulWidget {
  const HomeCategory({super.key});

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  @override
  void initState() {
    super.initState();
    loadCategoryIcons((icons) => setState(() => _categoryIcons = icons)); // Load category icons from Firestore when the widget is initialized.
  }
  
  /* Category Icons List */
  List<Map<String, dynamic>> _categoryIcons = [];

  /* Build Category Box Widget */
  GestureDetector _buildCategoryBox(Map<String, dynamic> category) {
    return GestureDetector(
      onTap: () { // Navigate to the category details page when tapped.
        Navigator.pushNamed(context, "/category/details", arguments: {"categoryName": category["Name"]});
      },
      child: Container( // Shape of Container
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
        child: Center( // Details of Container
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(category["ImgURL"], width: 24, height: 24,),
              SizedBox(height: 4),
              Text(category["Name"], style: TextStyle(fontSize: 10),),
            ],
          ),
        ),
      ),
    );
  }

  /* Complete Category List (Home) */
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // "ListView" in horizontal direction cannot be displayed without a fixed height.
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categoryIcons.length,
        itemBuilder: (context, index) => _buildCategoryBox(_categoryIcons[index]) 
      ),
    );
  }
}