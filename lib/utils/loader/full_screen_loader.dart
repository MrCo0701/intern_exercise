import 'package:exercise_1/features/shop/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
