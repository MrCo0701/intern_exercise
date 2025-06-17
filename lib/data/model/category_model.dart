import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String imageUrl;
  final String title;
  final Color backgroundColor;
  final Color borderColor;
  final String description;

  CategoryModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.backgroundColor,
    required this.borderColor,
    required this.description,
  });

  CategoryModel copyWith({
    String? id,
    String? imageUrl,
    String? title,
    Color? backgroundColor,
    Color? borderColor,
    String? description,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      description: description ?? this.description,
    );
  }

  CategoryModel isEmpty() {
    return CategoryModel(
      id: '',
      imageUrl: '',
      title: '',
      backgroundColor: Colors.grey,
      borderColor: Colors.grey,
      description: '',
    );
  }
}
