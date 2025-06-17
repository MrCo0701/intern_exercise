class ProductModel {
  final String assetImage;
  final String title;
  final String description;
  final double price;
  final String type;
  final String idCategory;

  ProductModel({
    required this.assetImage,
    required this.title,
    required this.description,
    required this.price,
    required this.type,
    required this.idCategory,
  });

  ProductModel copyWith({
    String? title,
    String? description,
    double? price,
    String? image,
    String? type,
    String? idCategory,
  }) {
    return ProductModel(
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      assetImage: image ?? this.assetImage,
      type: type ?? this.type,
      idCategory: idCategory ?? this.idCategory,
    );
  }

  ProductModel isEmpty() {
    return ProductModel(title: '', description: '', price: 0, assetImage: '', type: '', idCategory: '');
  }
}
