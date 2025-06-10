import 'package:exercise_1/data/model/category_model.dart';
import 'package:exercise_1/data/model/product_model.dart';
import 'package:exercise_1/features/shop/cubit/category/category_state.dart';
import 'package:exercise_1/features/shop/cubit/home/product_state.dart';
import 'package:flutter/material.dart';

class DummyData {
  List<ProductModel> ExclusiveOfferProducts = [
    ProductModel(
      assetImage: 'assets/images/apple.png',
      title: 'Red Apple',
      description: '1kg, Price',
      price: 4.99,
      type: 'exclusiveOffer',
    ),
    ProductModel(
      assetImage: 'assets/images/banana.png',
      title: 'Banana',
      description: '12kg, Price',
      price: 7.00,
      type: 'exclusiveOffer',
    ),
    ProductModel(
      assetImage: 'assets/images/orange.png',
      title: 'Orange',
      description: '2kg, Price',
      price: 3.50,
      type: 'exclusiveOffer',
    ),
  ];

  List<ProductModel> BestSellingProducts = [
    ProductModel(
      assetImage: 'assets/images/pepperRed.png',
      title: 'Red Apple',
      description: '1kg, Price',
      price: 4.99,
      type: 'bestSelling',
    ),
    ProductModel(
      assetImage: 'assets/images/ginger.png',
      title: 'Ginger',
      description: '1kg, Price',
      price: 2.75,
      type: 'bestSelling',
    ),
    ProductModel(
      assetImage: 'assets/images/apple.png',
      title: 'Red Apple',
      description: '1kg, Price',
      price: 4.99,
      type: 'bestSelling',
    ),
  ];

  List<ProductModel> FishAndMeat = [
    ProductModel(
      assetImage: 'assets/images/beef.png',
      title: 'Beef Bone',
      description: '1kg, price',
      price: 10.03,
      type: 'fishAndMeat',
    ),
    ProductModel(
      assetImage: 'assets/images/chicken.png',
      title: 'Broiler Chicken',
      description: '1kg, price',
      price: 15.00,
      type: 'fishAndMeat',
    ),
    ProductModel(
      assetImage: 'assets/images/fish.png',
      title: 'Fish',
      description: '2kg, price',
      price: 5.7,
      type: 'fishAndMeat',
    ),
  ];

  List<CategoryModel> Categories = [
    CategoryModel(
      imageUrl: 'assets/images/type_product/egg.png',
      title: 'Dairy & Eggs',
      backgroundColor: Colors.yellow.withOpacity(0.3),
      borderColor: Colors.yellow,
    ),
    CategoryModel(
      imageUrl: 'assets/images/type_product/bread.png',
      title: 'Bakery & Snack',
      backgroundColor: Colors.purple.withOpacity(0.3),
      borderColor: Colors.purple,
    ),
    CategoryModel(
      imageUrl: 'assets/images/type_product/oil.png',
      title: 'Cooking Oil & Ghee',
      backgroundColor: Colors.orange.withOpacity(0.3),
      borderColor: Colors.orange,
    ),
    CategoryModel(
      imageUrl: 'assets/images/type_product/meat.png',
      title: 'Meat & Fish',
      backgroundColor: Colors.red.withOpacity(0.3),
      borderColor: Colors.red,
    ),
    CategoryModel(
      imageUrl: 'assets/images/type_product/beverages.png',
      title: 'Beverages',
      backgroundColor: Colors.blue.withOpacity(0.3),
      borderColor: Colors.blue,
    ),
    CategoryModel(
      imageUrl: 'assets/images/type_product/vegestable.png',
      title: 'Frash Fruits & Vegetable',
      backgroundColor: Colors.greenAccent.withOpacity(0.3),
      borderColor: Colors.green,
    ),
  ];
}
