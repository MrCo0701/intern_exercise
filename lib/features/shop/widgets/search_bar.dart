import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search store',
        prefixIcon: Icon(Iconsax.search_normal4, color: Colors.black, size: 30),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.grey.withOpacity(0.1),
        filled: true
      ),
      style: TextStyle(fontWeight: FontWeight.w500),
    );
  }
}
