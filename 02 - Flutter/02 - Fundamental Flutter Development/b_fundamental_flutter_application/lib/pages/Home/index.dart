import 'package:b_fundamental_flutter_application/components/HomeCategory.dart';
import 'package:b_fundamental_flutter_application/components/HomeMoreList.dart';
import 'package:b_fundamental_flutter_application/components/HomeSearch.dart';
import 'package:b_fundamental_flutter_application/components/HomeSlider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers:[
        SliverToBoxAdapter(child: HomeSearch(),),
        SliverToBoxAdapter(child: SizedBox(height: 10),),
        SliverToBoxAdapter(child: HomeSlider(),),
        SliverToBoxAdapter(child: SizedBox(height: 10),),
        SliverToBoxAdapter(child: HomeCategory(),),
        SliverToBoxAdapter(child: SizedBox(height: 10),),
        SliverToBoxAdapter(child: HomeMoreList(),),
      ]
    );
  }
}