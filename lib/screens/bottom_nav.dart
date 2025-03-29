import 'package:carvizio/screens/Home%20Screen/home_screen.dart';
import 'package:carvizio/screens/Notification%20Screen/notification_screen.dart';
import 'package:carvizio/screens/Search%20Screen/search_screen.dart';
import 'package:carvizio/screens/SettingScreen/setting_screen.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    NotificationScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth * 0.07;
    double fontSize = screenWidth * 0.035;

    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: iconSize),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: iconSize),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications, size: iconSize),
              label: "Notification",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded, size: iconSize),
              label: "Settings",
            ),
          ],
          selectedLabelStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(fontSize: fontSize),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
