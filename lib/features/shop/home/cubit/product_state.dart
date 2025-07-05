import 'package:exercise_1/data/model/product_model.dart';

class ProductState {
  final List<ProductModel> bestSelling;
  final List<ProductModel> exclusiveOffer;
  final List<ProductModel> fishAndMeat;

  ProductState({required this.bestSelling, required this.exclusiveOffer, required this.fishAndMeat});

  ProductState copyWith({
    List<ProductModel>? bestSelling,
    List<ProductModel>? exclusiveOffer,
    List<ProductModel>? fishAndMeat,
  }) {
    return ProductState(
      bestSelling: bestSelling ?? this.bestSelling,
      exclusiveOffer: exclusiveOffer ?? this.exclusiveOffer,
      fishAndMeat: fishAndMeat ?? this.fishAndMeat
    );
  }
}
