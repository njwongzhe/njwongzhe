import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

/* Fetch Slider Items from Firebase */
Future<void> loadSliderItems(Function(List<String>) updateItems) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // Get a reference to the 'assets/slider' document.
    DocumentSnapshot doc = await firestore.collection("assets").doc("slider").get();

    if(doc.exists) {
      // Extract data from the document in firestore.
      String? baseUrl = doc.get("baseUrl");
      String? endpointsJson = doc.get("endpoint");
      
      if(baseUrl != null && endpointsJson != null) {
        // Convert string to List<String>.
        List<dynamic> endpointsList = jsonDecode(endpointsJson);
        List<String> endpoints = List<String>.from(endpointsList);

        // Construct full image URLs.
        List<String> fullImageUrls = endpoints.map((endpoint) => "$baseUrl$endpoint").toList();
        updateItems(fullImageUrls);
        return;
      } 
    }
    print("Document does not exist in Firestore!");
    updateItems([]); // Return an empty list if data is incomplete.
  } catch (e) {
    print("Error fetching slider items: $e");
    updateItems([]); // Handle errors by returning an empty list.
  }
}