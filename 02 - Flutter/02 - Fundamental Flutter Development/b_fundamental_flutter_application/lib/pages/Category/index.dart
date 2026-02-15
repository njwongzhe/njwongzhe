import 'package:b_fundamental_flutter_application/utils/loadCategoryIcons.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    loadCategoryIcons((icons) => setState(() => _categoryIcons = icons)); // Load category icons from Firestore when the widget is initialized.
  }
  
  /* Category Icons List */
  List<Map<String, dynamic>> _categoryIcons = [];

  /* Build Category Box Widget */
  GestureDetector buildCategoryBox(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () { // Navigate to the category details page when tapped.
        Navigator.pushNamed(context, "/category/details", arguments: {"categoryName": item["Name"]});
      },
      child: Container( // Shape of Container
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center( // Details of Container
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(item["ImgURL"], width: 150, height: 150,),
              SizedBox(height: 10),
              Text(item["Name"], style: TextStyle(fontSize: 25),),
            ],
          ),
        ),
      ),
    );
  }

  /* Complete Category List (Category Page) */
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: List.generate(_categoryIcons.length, (index) => buildCategoryBox(_categoryIcons[index])),
    );
  }
}