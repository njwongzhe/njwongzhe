import 'package:b_fundamental_flutter_application/api/index.dart';
import 'package:b_fundamental_flutter_application/utils/FirebaseRequest.dart';

/* Fetch Items from a Specific Category */
Future<void> loadCategoryItems(String categoryName, Function(List<Map<String, dynamic>>) updateItems) async {
  try {
    final firebaseRequest = FirebaseRequest();
    final categoryList = CategoryList();

    // Find the category by name.
    final category = categoryList.list.firstWhere(
      (cat) => cat["Name"] == categoryName,
      orElse: () => {},
    );

    if (category.isEmpty) {
      print("Category $categoryName not found");
      updateItems([]);
      return;
    }

    // Fetch items from the specific category.
    final itemListConfig = category["ItemList"];
    final List<Map<String, dynamic>> items = await firebaseRequest.fetchData(
      itemListConfig["collection"],
      itemListConfig["document"],
      collection2: itemListConfig["collection2"],
    );

    updateItems(items);
  } catch (e) {
    print("Error fetching item list: $e");
  }
}