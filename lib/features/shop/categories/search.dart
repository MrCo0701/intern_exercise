import 'dart:ui';

import 'package:exercise_1/features/shop/categories/cubit/category_cubit.dart';
import 'package:exercise_1/features/shop/categories/cubit/category_state.dart';
import 'package:exercise_1/widgets/search_bar.dart';
import 'package:exercise_1/features/shop/categories/widgets/type_product_vertical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..addCategoriesFromDummyData(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          return SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text('Find Products', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(height: 30),

                      SearchBarCustom(),
                      SizedBox(height: 20),

                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 2.5,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          children: [
                            for (int i = 0; i < state.categories.length; i++)
                              TypeProductVertical(
                                image: Image.asset(state.categories[i].imageUrl),
                                title: state.categories[i].title,
                                backgroundColor: state.categories[i].backgroundColor,
                                borderColor: state.categories[i].borderColor,
                                onTap: () => context.read<CategoryCubit>().onClickItem(),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                state.onClickItem ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0), // Điều chỉnh độ mờ
                  child: Container(
                    color: Colors.brown.withOpacity(0.5),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ) : Container(),
              ],
            ),
          );
        },
      ),
    );
  }
}
