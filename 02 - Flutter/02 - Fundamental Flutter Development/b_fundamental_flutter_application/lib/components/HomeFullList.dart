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

  /* Fetch Complete Item List from Firestore */
  void getitemList() async {
    try {
      final List<List<Map<String, dynamic>>> allCategoryLists = await Future.wait([
        firebaseRequest.fetchData("assets", "menu", collection2: "bakery"),
        firebaseRequest.fetchData("assets", "menu", collection2: "beverages"),
        firebaseRequest.fetchData("assets", "menu", collection2: "desserts"),
        firebaseRequest.fetchData("assets", "menu", collection2: "fast_foods"),
        firebaseRequest.fetchData("assets", "menu", collection2: "noodles"),
        firebaseRequest.fetchData("assets", "menu", collection2: "rices"),
      ]);

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