import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String assetImage,
    required String title,
    required String description,
    required double price,
    required String type,
    required String idCategory,
  }) = _ProductModel;
}
