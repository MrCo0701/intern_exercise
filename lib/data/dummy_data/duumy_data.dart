import 'package:exercise_1/data/model/category_model.dart';
import 'package:exercise_1/data/model/product_model.dart';
import 'package:exercise_1/features/shop/categories/cubit/category_state.dart';
import 'package:exercise_1/features/shop/home/cubit/product_state.dart';
import 'package:flutter/material.dart';

class DummyData {
  List<ProductModel> ExclusiveOfferProducts = [
    ProductModel(
      assetImage: 'assets/images/apple.png',
      title: 'Red Apple',
      description: '1kg, Price',
      price: 4.99,
      type: 'exclusiveOffer',
      idCategory: '6',
    ),
    ProductModel(
      assetImage: 'assets/images/banana.png',
      title: 'Banana',
      description: '12kg, Price',
      price: 7.00,
      type: 'exclusiveOffer',
      idCategory: '6',
    ),
    ProductModel(
      assetImage: 'assets/images/orange.png',
      title: 'Orange',
      description: '2kg, Price',
      price: 3.50,
      type: 'exclusiveOffer',
      idCategory: '6',
    ),
  ];

  List<ProductModel> BestSellingProducts = [
    ProductModel(
      assetImage: 'assets/images/pepperRed.png',
      title: 'Tomato',
      description: '1kg, Price',
      price: 4.99,
      type: 'bestSelling',
      idCategory: '6',
    ),
    ProductModel(
      assetImage: 'assets/images/ginger.png',
      title: 'Ginger',
      description: '1kg, Price',
      price: 2.75,
      type: 'bestSelling',
      idCategory: '6',
    ),
    ProductModel(
      assetImage: 'assets/images/apple.png',
      title: 'Red Apple',
      description: '1kg, Price',
      price: 4.99,
      type: 'bestSelling',
      idCategory: '6',
    ),
  ];

  List<ProductModel> FishAndMeat = [
    ProductModel(
      assetImage: 'assets/images/beef.png',
      title: 'Beef Bone',
      description: '1kg, price',
      price: 10.03,
      type: 'fishAndMeat',
      idCategory: '4',
    ),
    ProductModel(
      assetImage: 'assets/images/chicken.png',
      title: 'Broiler Chicken',
      description: '1kg, price',
      price: 15.00,
      type: 'fishAndMeat',
      idCategory: '4',
    ),
    ProductModel(
      assetImage: 'assets/images/fish.png',
      title: 'Fish',
      description: '2kg, price',
      price: 5.7,
      type: 'fishAndMeat',
      idCategory: '4',
    ),
  ];

  List<CategoryModel> Categories = [
    CategoryModel(
      id: '1',
      imageUrl: 'assets/images/type_product/egg.png',
      title: 'Dairy & Eggs',
      backgroundColor: Colors.yellow.withOpacity(0.3),
      borderColor: Colors.yellow,
      description:
          'Fresh milk, cheese, and eggs – essential sources of protein and calcium for strong bones and overall health.',
    ),
    CategoryModel(
      id: '2',
      imageUrl: 'assets/images/type_product/bread.png',
      title: 'Bakery & Snack',
      backgroundColor: Colors.purple.withOpacity(0.3),
      borderColor: Colors.purple,
      description:
          'A wide range of breads, cookies, and snacks – perfect for quick breakfasts, light meals, or enjoyable breaks.',
    ),
    CategoryModel(
      id: '3',
      imageUrl: 'assets/images/type_product/oil.png',
      title: 'Cooking Oil & Ghee',
      backgroundColor: Colors.orange.withOpacity(0.3),
      borderColor: Colors.orange,
      description:
          'Quality cooking oils and ghee – essential for tasty meals and better absorption of vitamins and nutrients.',
    ),
    CategoryModel(
      id: '4',
      imageUrl: 'assets/images/type_product/meat.png',
      title: 'Meat & Fish',
      backgroundColor: Colors.red.withOpacity(0.3),
      borderColor: Colors.red,
      description:
          'Fresh meat and seafood – rich in protein, iron, and omega-3, supporting muscle growth, brain function, and overall nutrition.',
    ),
    CategoryModel(
      id: '5',
      imageUrl: 'assets/images/type_product/beverages.png',
      title: 'Beverages',
      backgroundColor: Colors.blue.withOpacity(0.3),
      borderColor: Colors.blue,
      description:
          'Refreshing drinks including water, juice, tea, and soft drinks – ideal for rehydration and energy boost anytime.',
    ),
    CategoryModel(
      id: '6',
      imageUrl: 'assets/images/type_product/vegestable.png',
      title: 'Frash Fruits & Vegetable',
      backgroundColor: Colors.greenAccent.withOpacity(0.3),
      borderColor: Colors.green,
      description:
          'Seasonal fruits and vegetables – full of fiber, vitamins, and antioxidants to support immunity and digestive health.',
    ),
  ];
}
