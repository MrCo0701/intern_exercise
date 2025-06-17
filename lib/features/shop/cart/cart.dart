import 'package:exercise_1/features/shop/cart/cubit/cart_cubit.dart';
import 'package:exercise_1/features/shop/cart/cubit/cart_state.dart';
import 'package:exercise_1/features/shop/cart/widgets/drop_down_item.dart';
import 'package:exercise_1/features/shop/cart/widgets/drop_down_title.dart';
import 'package:exercise_1/features/shop/cart/widgets/item_in_cart.dart';
import 'package:exercise_1/features/shop/cart/widgets/list_item_in_cart.dart';
import 'package:exercise_1/features/shop/categories/cubit/category_cubit.dart';
import 'package:exercise_1/features/shop/cart/widgets/information_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/line.dart';
import '../categories/cubit/category_state.dart';
import '../home/cubit/product_cubit.dart';
import '../home/cubit/product_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => CategoryCubit()..addCategoriesFromDummyData()),
        BlocProvider(create: (context) => ProductCubit()..addAllProducts()),
      ],
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text('My Cart', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 30),
              LineCustom(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, stateCart) {
                    return Column(
                      children: [
                        // * DropDown menu category and information
                        Column(
                          children: [
                            // * Category dropdown menu
                            Column(
                              children: [
                                DropDownTitle(
                                  title: 'Food Type',
                                  description:
                                      stateCart.category != null ? stateCart.category!.title : 'Select Food Type',
                                  onPress: () => context.read<CartCubit>().isClickDropdownMenuCategory(),
                                ),

                                stateCart.isClickDropdownMenuCategory
                                    ? BlocBuilder<CategoryCubit, CategoryState>(
                                      builder: (context, state) {
                                        return SizedBox(
                                          height: 320,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                for (int i = 0; i < state.categories.length; i++)
                                                  DropDownItem(
                                                    imageUrl: state.categories[i].imageUrl,
                                                    title: state.categories[i].title,
                                                    onPressButton: () {
                                                      context.read<CartCubit>().selectedCategory(state.categories[i]);
                                                      context.read<CartCubit>().getAllProductWithCategory(
                                                        state.categories[i],
                                                      );
                                                    },
                                                  ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                    : Container(),
                              ],
                            ),
                            SizedBox(height: 30),

                            // * Information of category
                            BlocBuilder<CartCubit, CartState>(
                              builder: (context, state) {
                                return state.category != null
                                    ? InformationCart(
                                      category: state.category!.title,
                                      information: state.category!.description,
                                    )
                                    : Column();
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        // * Dropdown menu product
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 250,
                                child: DropDownTitle(
                                  onPress: () => context.read<CartCubit>().isClickDropdownMenuProduct(),
                                  title: 'Select Product',
                                  description: '',
                                ),
                              ),

                              stateCart.products != null && stateCart.isClickDropdownMenuProduct
                                  ? SizedBox(
                                    height: 200,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          for (int i = 0; i < stateCart.products!.length; i++)
                                            DropDownItem(
                                              imageUrl: stateCart.products![i].assetImage,
                                              title: stateCart.products![i].title,
                                              onPressItem:
                                                  () => context.read<CartCubit>().addProductToCart(
                                                    stateCart.products![i],
                                                  ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  )
                                  : Container(),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),

                        // * List items is selected
                        ListItemInCart(listItems: stateCart.cartItems!),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
