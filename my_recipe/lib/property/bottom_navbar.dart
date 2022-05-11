import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe/screen/my_recipe/favorites_screen.dart';
import 'package:my_recipe/screen/my_recipe/home_creen.dart';
import 'package:my_recipe/screen/my_recipe/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final screen = [
    const HomeScreen(),
    const FavoritesScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: screen),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  Widget bottomNavBar() {
    return BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        itemCornerRadius: 24,
        onItemSelected: (index) => setState(() => _selectedIndex = index),
        items: [
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              activeColor: Colors.grey,
              icon: const Icon(
                Icons.home_rounded,
                color: Colors.orangeAccent,
              ),
              title: const Text(
                'Home',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600),
              )),
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              activeColor: Colors.grey,
              icon: const Icon(
                Icons.favorite_rounded,
                color: Colors.orangeAccent,
              ),
              title: const Text(
                'Favorites',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600),
              )),
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              activeColor: Colors.grey,
              icon: const Icon(
                Icons.account_circle,
                color: Colors.orangeAccent,
              ),
              title: const Text(
                'Profile',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600),
              )),
        ]);
  }
}
