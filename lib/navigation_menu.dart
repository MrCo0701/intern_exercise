import 'package:exercise_1/features/shop/cubit/home/product_cubit.dart';
import 'package:exercise_1/features/shop/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'features/shop/screens/account.dart';
import 'features/shop/screens/cart.dart';
import 'features/shop/screens/favourites.dart';
import 'features/shop/screens/search.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  var _current = 0;
  final screens = [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    FavouritesScreen(),
    AccountScreen(),
  ];

  @override
  void initState() {
    super.initState(); //
  }

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
            NavigationDestination(
              icon: Icon(Icons.shopping_cart_checkout),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.heart_tick),
              label: 'Favourites',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user),
              label: 'Account',
              selectedIcon: Icon(Iconsax.user, color: Colors.green),
            ),
          ],
        ),
        body: screens[_current],
      );
  }
}
