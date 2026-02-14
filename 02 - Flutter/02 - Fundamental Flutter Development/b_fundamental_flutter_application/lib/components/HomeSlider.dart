import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
   @override
  void initState() {
    super.initState();
    _unboxFuture(); // Call the unboxed future to fetch slider items asynchronously.
  }

  /* Slider Item */
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Create a Firestore instance to fetch slider data from Firestore.
  List<String> sliderItems = []; 

  Future<List<String>> _getSliderItems() async {
    try {
      // Get a reference to the 'assets/slider' document.
      DocumentSnapshot doc = await _firestore.collection("assets").doc("slider").get();

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
          return fullImageUrls;
        } 
      }
      print("Document does not exist in Firestore!");
      return []; // Return an empty list if data is incomplete.
    } catch (e) {
      print("Error fetching slider items: $e");
      return []; // Handle errors by returning an empty list.
    }
  }

  void _unboxFuture() async {
    List<String> results = await _getSliderItems(); // 1. Program PAUSES here until data is ready.
    setState(() => sliderItems = results);          // 2. Once ready, tell Flutter to rebuild the UI with the new data.
  }

  /* Carousel Controller */
  final CarouselSliderController _controller = CarouselSliderController();

  /* Slider Interface */
  Widget _getSlider() {
    final double ScreenWidth = MediaQuery.of(context).size.width; // Get the screen width to set the width of the slider images.

    return CarouselSlider(
      carouselController: _controller,
      items: List.generate(sliderItems.length, (index) => Image.network(sliderItems[index], width: ScreenWidth, fit: BoxFit.cover,)),
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 2),
        enlargeCenterPage: true,
        onPageChanged: (index, reason) => setState(() => _currentIndex = index), // Update the current index for the page indicator when the page changes.
      ),
    );
  }

  /* Indicator */
  int _currentIndex = 0; // Track the currently active slider index.

  /* Indicator Bar Interface */
  Widget _getIndicator() {
    return Row (
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(sliderItems.length, (index) {
        int width = 8; // Default width for inactive indicators.
        Color color = Colors.grey; // Default width and color for inactive indicators.
        if(_currentIndex == index) { // Change the width and color of the active indicator.
          width = 16;
          color = Colors.red;
        }
        return GestureDetector(
          onTap: () => setState(() { // Update the current index and animate to the corresponding slider when tapping the corresponding indicator.
            _currentIndex = index;
            _controller.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          }),
          child: AnimatedContainer( // Use "AnimatedContainer" to animate the changes of the indicators.
            duration: Duration(milliseconds: 300), // Duration for the animation when the indicator changes.
            width: width.toDouble(), // Change the width of the active indicator.
            height: 8,
            margin: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: color, // Change the color of the active indicator.
              borderRadius: BorderRadius.circular(4),
            ),
          )
        );
      }),
    );
  }

  /* Complete Slider Interface */
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          color: Colors.transparent,
          child: Center(child: _getSlider())
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: _getIndicator(),
        )
      ],
    );
  }
}