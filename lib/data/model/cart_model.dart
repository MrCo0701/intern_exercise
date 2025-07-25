import 'package:exercise_1/data/model/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_model.freezed.dart';

@freezed
class CartModel with _$CartModel {
  const factory CartModel({required ProductModel product, required int quantity}) = _CartModel;
}
