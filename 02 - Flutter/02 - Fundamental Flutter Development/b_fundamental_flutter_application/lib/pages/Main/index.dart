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

  /* Index of Current Page */
  int _currentIndex = 0;

  /* Navigation Bar Widget */
  List<BottomNavigationBarItem> _getNavigationBar() {
    return List.generate(_icon.length, (index) {
      return BottomNavigationBarItem(
        icon: Image.asset( // Icon of Inactive State
          _icon[index]["icon"]!,
          width: 24,
          height: 24,
        ),
        activeIcon: Image.asset( // Icon of Active State
          _icon[index]["active"]!,
          width: 24,
          height: 24,
        ),
        label: _icon[index]["text"], // Text Label
      );
    });
  }

  /* Complete Navigation Bar */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset("lib/assets/Appbar_Logo.png", height: 30,), centerTitle: true, backgroundColor: Colors.white,),

      body: SafeArea( 
        // "SafeArea" ensure that the child widget is not obscured by system UI elements.
        // It helps to avoid content being hidden behind notches, status bars or navigation bars by adding appropriate padding automatically.
        child: IndexedStack(    // "IndexedStack" is used to maintain the state of each page while navigating between them. 
          index: _currentIndex, // It keeps all the child widgets alive and only shows the one at the specified index.
          children: const [
            Center(child: HomePage()),     // Index 0: Home Page
            Center(child: CategoryPage()), // Index 1: Category Page
            Center(child: CartPage()),     // Index 2: Cart Page
            Center(child: UserPage()),     // Index 3: User Page
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
        onTap: (index) => setState(() => _currentIndex = index), // Update the current index when a navigation item is tapped, triggering a rebuild to display the corresponding page.
      )
    );
  }
}