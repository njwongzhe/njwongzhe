import 'package:b_fundamental_flutter_application/utils/FirebaseRequest.dart';

class CategoryList {
  FirebaseRequest firebaseRequest = FirebaseRequest();
  final List<Map<String, dynamic>> list = [
    {
      "Name": "Bakery",
      "Icon": {"collection": "assets", "document": "category", "collection2": "bakery"},
      "ItemList": {"collection": "assets", "document": "menu", "collection2": "bakery"},
    },
    {
      "Name": "Beverages",
      "Icon": {"collection": "assets", "document": "category", "collection2": "beverages"},
      "ItemList": {"collection": "assets", "document": "menu", "collection2": "beverages"},
    },
    {
      "Name": "Desserts",
      "Icon": {"collection": "assets", "document": "category", "collection2": "desserts"},
      "ItemList": {"collection": "assets", "document": "menu", "collection2": "desserts"},
    },
    {
      "Name": "Fast Foods",
      "Icon": {"collection": "assets", "document": "category", "collection2": "fast_foods"},
      "ItemList": {"collection": "assets", "document": "menu", "collection2": "fast_foods"},
    },
    {
      "Name": "Noodles",
      "Icon": {"collection": "assets", "document": "category", "collection2": "noodles"},
      "ItemList": {"collection": "assets", "document": "menu", "collection2": "noodles"},
    },
    {
      "Name": "Rices",
      "Icon": {"collection": "assets", "document": "category", "collection2": "rices"},
      "ItemList": {"collection": "assets", "document": "menu", "collection2": "rices"},
    },
  ];
}