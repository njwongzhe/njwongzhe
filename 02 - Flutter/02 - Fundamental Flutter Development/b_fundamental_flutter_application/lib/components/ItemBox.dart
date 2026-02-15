import 'package:flutter/material.dart';

class Itembox {
  Container buildItemBox(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded( // Image
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                image: DecorationImage(image: NetworkImage(item["ImgURL"]), fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded( // Details
            flex: 2,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item["Name"],style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(height: 1),
                  Text("RM${item["Price"].toStringAsFixed(2)}")
                ],
              ),
            ),
          ),
        ],
      )
    );
  }

  GridView buildItemList(List<Map<String, dynamic>> itemList) {
    return GridView(
      padding: EdgeInsets.symmetric(horizontal: 10),
      shrinkWrap: true, // "GridView" cannot be displayed without "shrinkWrap: true" when it is used in a scrollable widget.
      physics: NeverScrollableScrollPhysics(), // "GridView" cannot be displayed without "physics: NeverScrollableScrollPhysics()" when it is used in a scrollable widget.
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: List.generate(itemList.length, (index) => buildItemBox(itemList[index])),
    );
  }

}