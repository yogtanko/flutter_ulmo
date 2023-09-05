import 'package:flutter/material.dart';
import 'package:flutter_ulmo/config/constants.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: giratina[400],
      selectedItemColor: black,
      type: BottomNavigationBarType.fixed,
      enableFeedback: false,
      iconSize: 24,
      items: const [
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/img/u.png')), label: 'U'),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/img/b.png')), label: 'bag'),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/img/h.png')), label: 'favorite'),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/img/p.png')), label: 'user'),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
