import 'package:b_fundamental_flutter_application/viewmodels/home.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  List<SliderItem> sliderItems = [
    SliderItem(id: "1", imgUrl: "https://raw.githubusercontent.com/njwongzhe/njwongzhe/refs/heads/main/02%20-%20Flutter/02%20-%20Fundamental%20Flutter%20Development/b_fundamental_flutter_application_demo_network_request_image/SliderItem%20(1).jpg"),
    SliderItem(id: "2", imgUrl: "https://raw.githubusercontent.com/njwongzhe/njwongzhe/refs/heads/main/02%20-%20Flutter/02%20-%20Fundamental%20Flutter%20Development/b_fundamental_flutter_application_demo_network_request_image/SliderItem%20(2).jpg"),
    SliderItem(id: "3", imgUrl: "https://raw.githubusercontent.com/njwongzhe/njwongzhe/refs/heads/main/02%20-%20Flutter/02%20-%20Fundamental%20Flutter%20Development/b_fundamental_flutter_application_demo_network_request_image/SliderItem%20(3).jpg"),
  ];

  Widget _getSlider() {
    final double ScreenWidth = MediaQuery.of(context).size.width;

    return CarouselSlider(
      items: List.generate(sliderItems.length, (index) => Image.network(sliderItems[index].imgUrl, width: ScreenWidth, fit: BoxFit.cover,)),
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 2),
        enlargeCenterPage: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.transparent,
      child: Center(child: _getSlider())
    );
  }
}