import 'package:b_fundamental_flutter_application/utils/loadSliderItems.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
    loadSliderItems((items) => setState(() => sliderItems = items)); // Load slider items from Firestore when the widget is initialized.
  }

  /* Slider Item */
  List<String> sliderItems = [];

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
        Container( // Image of Slider
          height: 200,
          color: Colors.transparent,
          child: Center(child: _getSlider())
        ),
        Positioned( // Indicator of Slider
          bottom: 10,
          left: 0,
          right: 0,
          child: _getIndicator(),
        )
      ],
    );
  }
}