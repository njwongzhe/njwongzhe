import 'package:b_fundamental_flutter_application/api/index.dart';
import 'package:b_fundamental_flutter_application/utils/FirebaseRequest.dart';

/* Fetch Category Icons from Firebase */
Future<void> loadCategoryIcons(Function(List<Map<String, dynamic>>) updateIcons) async {
  try {
    final FirebaseRequest firebaseRequest = FirebaseRequest();
    final CategoryList categoryList = CategoryList();

    // Dynamically create fetch futures from the CategoryList.
    final fetchFutures = categoryList.list.map((category) {
      final iconConfig = category["Icon"];
      return firebaseRequest.fetchData(
        iconConfig["collection"],
        iconConfig["document"],
        collection2: iconConfig["collection2"],
        document2: iconConfig["document2"],
      );
    }).toList();

    // Execute all fetch operations in parallel.
    final List<List<Map<String, dynamic>>> allCategoryIcons = await Future.wait(fetchFutures);

    // Combine all items into a single list.
    List<Map<String, dynamic>> combinedList = [];
    for (var list in allCategoryIcons) {
      combinedList.addAll(list);
    }

    updateIcons(combinedList);
  } catch (e) {
    print("Error fetching category icons: $e");
  }
}