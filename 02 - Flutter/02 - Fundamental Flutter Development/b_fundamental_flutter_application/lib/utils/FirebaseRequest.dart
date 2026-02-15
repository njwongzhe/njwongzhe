import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRequest {
  /* Firestore Instance */
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /* Fetch Data from Firestore with Flexible Parameters */
  // collection  : Main collection name. (Required)
  // document    : Document name within the main collection. (Required)
  // collection2 : Sub-collection name within the document. (Optional)
  // document2   : Document name within the sub-collection. (Optional)
  Future<List<Map<String, dynamic>>> fetchData(String collection, String document, {String? collection2, String? document2}) async {
    try {
      List<Map<String, dynamic>> getList = [];
      if(collection2 != null && document2 != null) { // If both collection2 and document2 are provided, fetch specific document.
        DocumentSnapshot docSnapshot = await _firestore.collection(collection).doc(document).collection(collection2).doc(document2).get();
        if(docSnapshot.exists)
          return [docSnapshot.data() as Map<String, dynamic>];
        else
          print("Document $document2 does not exist in collection $collection2.");
      }
      else if(collection2 != null) { // If only collection2 is provided, fetch all documents in that collection.
        QuerySnapshot querySnapshot = await _firestore.collection(collection).doc(document).collection(collection2).get();
        for(var doc in querySnapshot.docs) 
          getList.add(doc.data() as Map<String, dynamic>);
        return getList;
      }
      return []; // Return empty list if parameters are insufficient or no data found.
    } catch (e) {
      print("Error fetching data from Firestore: $e");
      return [];
    }
  }
}