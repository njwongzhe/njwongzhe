class CategoryList {
  final List<Map<String, dynamic>> list = [
    /*
      Each category contains:
      - Name: The name of the category.
      - Icon: A reference to the Firestore document that contains the icon for the category.
      - ItemList: A reference to the Firestore collection that contains the items for the category.
    */
    {
      "Name": "Bakery",
      "Icon": {"collection": "assets", "document": "menu", "collection2": "category", "document2": "bakery"},
      "ItemList": {"collection": "assets", "document": "menu", "collection2": "bakery"},
    },
    {
      "Name": "Beverages",
      "Icon": {"collection": "assets", "document": "menu", "collection2": "category", "document2": "beverages"},
      "ItemList": {"collection": "assets", "document": "menu", "collection2": "beverages"},
    },
    {
      "Name": "Desserts",
      "Icon": {"collection": "assets", "document": "menu", "collection2": "category", "document2": "desserts"},
      "ItemList": {"collection": "assets", "document": "menu", "collection2": "desserts"},
    },
    {
      "Name": "Fast Foods",
      "Icon": {"collection": "assets", "document": "menu", "collection2": "category", "document2": "fast_foods"},
      "ItemList": {"collection": "assets", "document": "menu", "collection2": "fast_foods"},
    },
    {
      "Name": "Noodles",
      "Icon": {"collection": "assets", "document": "menu", "collection2": "category", "document2": "noodles"},
      "ItemList": {"collection": "assets", "document": "menu", "collection2": "noodles"},
    },
    {
      "Name": "Rices",
      "Icon": {"collection": "assets", "document": "menu", "collection2": "category", "document2": "rices"},
      "ItemList": {"collection": "assets", "document": "menu", "collection2": "rices"},
    },
  ];
}