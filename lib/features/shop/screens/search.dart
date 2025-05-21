import 'package:exercise_1/features/shop/widgets/search_bar.dart';
import 'package:exercise_1/features/shop/widgets/type_product_vertical.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Find Products',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 30),

            SearchBarCustom(),
            SizedBox(height: 20),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2.5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  TypeProductVertical(
                    image: Image.asset(
                      'assets/images/type_product/vegestable.png',
                    ),
                    title: 'Frash Fruits & Vegetable',
                    backgroundColor: Colors.greenAccent.withOpacity(0.3),
                    borderColor: Colors.green,
                  ),
                  TypeProductVertical(
                    image: Image.asset('assets/images/type_product/bread.png'),
                    title: 'Bakery & Snack',
                    backgroundColor: Colors.purple.withOpacity(0.3),
                    borderColor: Colors.purple,
                  ),
                  TypeProductVertical(
                    image: Image.asset(
                      'assets/images/type_product/egg.png',
                    ),
                    title: 'Dairy & Eggs',
                    backgroundColor: Colors.yellow.withOpacity(0.3),
                    borderColor: Colors.yellow,
                  ),
                  TypeProductVertical(
                    image: Image.asset(
                      'assets/images/type_product/oil.png',
                    ),
                    title: 'Cooking Oid & Ghee',
                    backgroundColor: Colors.orange.withOpacity(0.3),
                    borderColor: Colors.orange,
                  ),
                  TypeProductVertical(
                    image: Image.asset(
                      'assets/images/type_product/meat.png',
                    ),
                    title: 'Meat & Fish',
                    backgroundColor: Colors.red.withOpacity(0.3),
                    borderColor: Colors.red,
                  ),
                  TypeProductVertical(
                    image: Image.asset(
                      'assets/images/type_product/beverages.png',
                    ),
                    title: 'Beverages',
                    backgroundColor: Colors.blue.withOpacity(0.3),
                    borderColor: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
