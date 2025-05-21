import 'package:exercise_1/features/shop/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'features/shop/screens/search.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  var _current = 0;
  final screens = [HomeScreen(), SearchScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _current,
        backgroundColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        onDestinationSelected: (index) => setState(() => _current = index),
        destinations: [
          NavigationDestination(
            icon: Icon(Iconsax.shop),
            label: 'Shop',
            selectedIcon: Icon(Iconsax.shop, color: Colors.green),
          ),
          NavigationDestination(
            icon: Icon(Iconsax.search_status),
            label: 'Explore',
            selectedIcon: Icon(Iconsax.search_status, color: Colors.green),
          ),
          NavigationDestination(icon: Icon(Icons.info), label: 'Information'),
          NavigationDestination(icon: Icon(Icons.info), label: 'Information'),
        ],
      ),
      body: screens[_current],
    );
  }
}
