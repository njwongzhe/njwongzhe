import 'package:b_fundamental_flutter_application/api/index.dart';
import 'package:b_fundamental_flutter_application/components/ItemBox.dart';
import 'package:b_fundamental_flutter_application/utils/FirebaseRequest.dart';
import 'package:flutter/material.dart';

class HomeFullList extends StatefulWidget {
  const HomeFullList({super.key});

  @override
  State<HomeFullList> createState() => _HomeFullListState();
}

class _HomeFullListState extends State<HomeFullList> {
  List<Map<String, dynamic>> _itemList = [];
  
  @override
  void initState() {
    super.initState();
    getitemList(); // Fetch item list from Firestore when the widget is initialized.
  }

  FirebaseRequest firebaseRequest = FirebaseRequest();
  CategoryList categoryList = CategoryList();

  /* Fetch Complete Item List from Firestore - Dynamically from CategoryList */
  void getitemList() async {
    try {
      // Dynamically create fetch futures from the CategoryList.
      final fetchFutures = categoryList.list.map((category) async {
        final itemListConfig = category["ItemList"];
        return await firebaseRequest.fetchData(
          itemListConfig["collection"],
          itemListConfig["document"],
          collection2: itemListConfig["collection2"],
        );
      }).toList();

      // Execute all fetch operations in parallel.
      final List<List<Map<String, dynamic>>> allCategoryLists = await Future.wait(fetchFutures);

      // Combine all items into a single list.
      List<Map<String, dynamic>> combinedList = [];
      for (var list in allCategoryLists) {
        combinedList.addAll(list);
      }

      setState(() => _itemList = combinedList);
    } catch (e) {
      print("Error fetching item list: $e");
    }
  }

  /* Instance of Helper Class */
  Itembox itembox = Itembox();

  /* Complete Full List */
  @override
  Widget build(BuildContext context) {
    return itembox.buildItemList(_itemList); // Build the item list using the fetched data.
  }
}