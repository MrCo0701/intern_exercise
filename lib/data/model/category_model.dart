import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String id,
    required String imageUrl,
    required String title,
    required Color backgroundColor,
    required Color borderColor,
    required String description,
  }) = _CategoryModel;
}
