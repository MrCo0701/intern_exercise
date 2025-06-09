import 'package:exercise_1/data/model/product_model.dart';
import 'package:exercise_1/features/shop/cubit/product_state.dart';

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
}
