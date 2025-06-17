import 'dart:ui';

import 'package:exercise_1/data/model/category_model.dart';

class CategoryState {
  final List<CategoryModel> categories;
  final bool onClickItem;

  CategoryState({required this.categories, required this.onClickItem});

  CategoryState copyWith({List<CategoryModel>? categories, bool? onClickItem}) {
    return CategoryState(categories: categories ?? this.categories, onClickItem: onClickItem ?? this.onClickItem);
  }
}
