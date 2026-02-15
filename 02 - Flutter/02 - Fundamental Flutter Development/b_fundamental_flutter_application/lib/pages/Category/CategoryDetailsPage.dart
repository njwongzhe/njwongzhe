import 'package:b_fundamental_flutter_application/components/ItemBox.dart';
import 'package:b_fundamental_flutter_application/utils/loadCategoryItems.dart';
import 'package:flutter/material.dart';

class CategoryDetailsPage extends StatefulWidget {
  final String categoryName;

  const CategoryDetailsPage({super.key, required this.categoryName});

  @override
  State<CategoryDetailsPage> createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  /* Instance of Helper Class */
  Itembox itembox = Itembox();

  /* Item List of Current Category */
  List<Map<String, dynamic>> _itemList = [];

  @override
  void initState() {
    super.initState();
    loadCategoryItems(widget.categoryName, (items) => setState(() => _itemList = items)); // Load items of the specific category from Firestore when the widget is initialized.
  }

  /* Complete Category Details Page */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: itembox.buildItemList(_itemList) 
      ),
    );
  }
}