import 'package:exercise_1/data/model/cart_model.dart';
import 'package:exercise_1/data/model/product_model.dart';
import 'package:exercise_1/features/shop/cart/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/category_model.dart';
import '../../../../data/repository/product_repository.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit()
    : super(
        CartState(
          category: null,
          cartItems: [],
          products: [],
          isClickDropdownMenuCategory: false,
          isClickDropdownMenuProduct: false,
        ),
      );

  void selectedCategory(CategoryModel category) {
    emit(state.copyWith(category: category));
  }

  void isClickDropdownMenuCategory() {
    emit(state.copyWith(isClickDropdownMenuCategory: !state.isClickDropdownMenuCategory));
  }

  void isClickDropdownMenuProduct() {
    emit(state.copyWith(isClickDropdownMenuProduct: !state.isClickDropdownMenuProduct));
  }

  void getAllProductWithCategory(CategoryModel category) {
    final products = ProductRepository().getProductsWithCategory(category.id);
    emit(state.copyWith(products: products));
  }

  void addProductToCart(ProductModel product) {
    final updateCart = List<CartModel>.from(state.cartItems!);

    for (int i = 0; i < updateCart.length; i++) {
      if (updateCart[i].product.title == product.title) {
        final updateItem = updateCart[i].copyWith(quantity: updateCart[i].quantity + 1);
        updateCart[i] = updateItem;
        emit(state.copyWith(cartItems: updateCart));
        return;
      }
    }

    final newItem = CartModel(product: product, quantity: 1);
    updateCart.add(newItem);
    emit(state.copyWith(cartItems: updateCart));
  }

  List<CartModel> filterCartByCategory(CategoryModel category) {
    final List<CartModel> matching = state.cartItems!.where((item) => item.product.idCategory == category.id).toList();
    return matching;
  }

  void removeQuantityProduct(ProductModel product) {
    final updateCart = List<CartModel>.from(state.cartItems!);

    final index = updateCart.indexWhere((item) => item.product.title == product.title);
    if (index == -1) return;

    final currentItem = updateCart[index];
    final updateQuantity = currentItem.quantity - 1;

    if (updateQuantity == 0) {
      updateCart.removeAt(index);
    } else {
      updateCart[index] = CartModel(product: currentItem.product, quantity: updateQuantity);
    }
    emit(state.copyWith(cartItems: updateCart));
  }
}
