import 'package:flutter/material.dart';
import 'package:payment_app/screens/tab/cart/cart_screen.dart';
import 'package:payment_app/screens/tab/history/history_screen.dart';
import 'package:payment_app/screens/tab/home/home_screen.dart';
import 'package:payment_app/screens/tab/profile/profile_screen.dart';
import 'package:payment_app/utils/size/login_screen_size.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabScreen> {
  List<Widget> screens = [];

  int activeIndex = 0;
  bool isSelected = false;

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    screens = [
      const HomeScreen(),
      const HistoryScreen(),
      const CardScreen(),
      const ProfileScreen(),
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    widthLogin = MediaQuery.of(context).size.width;
    heightLogin = MediaQuery.of(context).size.height;

    return Scaffold(
      body: screens[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black,
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        currentIndex: activeIndex,
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Card",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
