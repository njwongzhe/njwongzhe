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
    SliderItem(id: "1", imgUrl: "https://down-my.img.susercontent.com/file/sg-11134201-7rblt-lntp3ww0t5v95b.webp"),
    SliderItem(id: "2", imgUrl: "https://via.placeholder.com/350x150"),
    SliderItem(id: "3", imgUrl: "https://via.placeholder.com/350x150"),
  ];

  Widget _getSlider() {
    return CarouselSlider(
      items: List.generate(sliderItems.length, (index) => Image.network(sliderItems[index].imgUrl)),
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey,
      child: Center(child: _getSlider())
    );
  }
}