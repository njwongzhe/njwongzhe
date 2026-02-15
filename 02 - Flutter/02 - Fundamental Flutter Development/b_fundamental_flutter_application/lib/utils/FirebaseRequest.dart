import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRequest {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> fetchData(String collection, String document, {String? collection2}) async {
    try {
      List<Map<String, dynamic>> getList = [];
      if(collection2 != null) {
        // If a second collection and document are provided, fetch data from the nested document.
        QuerySnapshot querySnapshot = await _firestore.collection(collection).doc(document).collection(collection2).get();
        for(var doc in querySnapshot.docs) {
          getList.add(doc.data() as Map<String, dynamic>);
        }
        return getList;
      }
      return []; // Return empty list when collection2 is null.
    } catch (e) {
      print("Error fetching data from Firestore: $e");
      return [];
    }
  }
}