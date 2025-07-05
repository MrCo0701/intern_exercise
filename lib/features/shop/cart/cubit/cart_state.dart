import 'package:exercise_1/data/model/cart_model.dart';
import 'package:exercise_1/data/model/category_model.dart';
import 'package:exercise_1/data/model/product_model.dart';

class CartState {
  final CategoryModel? category;
  final List<CartModel>? cartItems;
  final List<ProductModel>? products;
  final bool isClickDropdownMenuCategory;
  final bool isClickDropdownMenuProduct;

  CartState({
    this.category,
    this.cartItems,
    this.products,
    this.isClickDropdownMenuCategory = false,
    this.isClickDropdownMenuProduct = false,
  });

  CartState copyWith({
    CategoryModel? category,
    List<CartModel>? cartItems,
    List<ProductModel>? products,
    bool? isClickDropdownMenuCategory,
    bool? isClickDropdownMenuProduct,
  }) {
    return CartState(
      category: category ?? this.category,
      products: products ?? this.products,
      cartItems: cartItems ?? this.cartItems,
      isClickDropdownMenuCategory: isClickDropdownMenuCategory ?? this.isClickDropdownMenuCategory,
      isClickDropdownMenuProduct: isClickDropdownMenuProduct ?? this.isClickDropdownMenuProduct,
    );
  }
}
