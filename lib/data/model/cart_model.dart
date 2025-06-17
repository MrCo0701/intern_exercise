import 'package:exercise_1/data/model/product_model.dart';

class CartModel {
  final ProductModel product;
  late final int quantity;

  CartModel({required this.product, required this.quantity});

    CartModel copyWith({ProductModel? product, int? quantity}) {
    return CartModel(product: product ?? this.product, quantity: quantity ?? this.quantity);
  }
}
