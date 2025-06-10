import 'dart:ui';

class CategoryModel {
  final String imageUrl;
  final String title;
  final Color backgroundColor;
  final Color borderColor;

  CategoryModel({required this.imageUrl, required this.title, required this.backgroundColor, required this.borderColor});

  CategoryModel copyWith({String? imageUrl, String? title, Color? backgroundColor, Color? borderColor}) {
    return CategoryModel(
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
    );
  }
}