import 'package:exercise_1/data/model/cart_model.dart';
import 'package:exercise_1/features/shop/cart/cubit/cart_cubit.dart';
import 'package:exercise_1/features/shop/cart/widgets/item_in_cart.dart';
import 'package:exercise_1/features/shop/categories/cubit/category_cubit.dart';
import 'package:exercise_1/features/shop/categories/cubit/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListItemInCart extends StatelessWidget {
  const ListItemInCart({super.key, required this.listItems});

  final List<CartModel> listItems;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return Column(
          children: [
            for (var category in state.categories) ...[
              Builder(
                builder: (context) {
                  final filteredItems = context.read<CartCubit>().filterCartByCategory(category);
                  if (filteredItems.isEmpty) return SizedBox.shrink();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(category.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ...filteredItems.map((item) => ItemInCart(item: item)),
                    ],
                  );
                },
              ),
            ],
          ],
        );
      },
    );
  }
}
