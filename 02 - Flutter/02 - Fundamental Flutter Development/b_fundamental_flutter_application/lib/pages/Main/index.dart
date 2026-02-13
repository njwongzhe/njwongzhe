import 'package:b_fundamental_flutter_application/pages/Cart/index.dart';
import 'package:b_fundamental_flutter_application/pages/Category/index.dart';
import 'package:b_fundamental_flutter_application/pages/Home/index.dart';
import 'package:b_fundamental_flutter_application/pages/User/index.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, String>> _icon = [
    {
      "icon": "lib/assets/Navigation_Home_Inactive.png",
      "active": "lib/assets/Navigation_Home_Active.png",
      "text": "Home"
    },
    {
      "icon": "lib/assets/Navigation_Category_Inactive.png",
      "active": "lib/assets/Navigation_Category_Active.png",
      "text": "Category"
    },
    {
      "icon": "lib/assets/Navigation_Cart_Inactive.png",
      "active": "lib/assets/Navigation_Cart_Active.png",
      "text": "Cart"
    },
    {
      "icon": "lib/assets/Navigation_User_Inactive.png",
      "active": "lib/assets/Navigation_User_Active.png",
      "text": "User"
    },
  ];

  int _currentIndex = 0; // Track the currently selected index (page).

  List<BottomNavigationBarItem> _getNavigationBar() {
    return List.generate(_icon.length, (index) {
      return BottomNavigationBarItem(
        icon: Image.asset(
          _icon[index]["icon"]!,
          width: 24,
          height: 24,
        ),
        activeIcon: Image.asset(
          _icon[index]["active"]!,
          width: 24,
          height: 24,
        ),
        label: _icon[index]["text"],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Page"),),

      body: SafeArea( 
        // "SafeArea" ensure that the child widget is not obscured by system UI elements.
        // It helps to avoid content being hidden behind notches, status bars or navigation bars by adding appropriate padding automatically.
        child: IndexedStack(
          index: _currentIndex,
          children: const [
            Center(child: HomePage()),
            Center(child: CategoryPage()),
            Center(child: CartPage()),
            Center(child: UserPage()),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensures all items are displayed with equal width.
        items: _getNavigationBar(),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      )
    );
  }
}