import 'package:exercise_1/data/model/cart_model.dart';
import 'package:exercise_1/features/shop/cart/cubit/cart_cubit.dart';
import 'package:exercise_1/widgets/line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemInCart extends StatelessWidget {
  const ItemInCart({super.key, this.item});

  final CartModel? item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // * Image and Title
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  Expanded(flex: 2, child: Image.asset(item!.product.assetImage, width: 70, height: 70)),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          item!.product.title,
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text('\$${item!.product.price}', style: TextStyle(fontWeight: FontWeight.w200)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // * Button to change count
            Expanded(
              flex: 6,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () => context.read<CartCubit>().removeQuantityProduct(item!.product),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.transparent), // Tắt hiệu ứng khi bấm
                    ),
                    child: Text('-', style: TextStyle(fontSize: 40, color: Colors.green)),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.5),
                      borderRadius: BorderRadius.circular(19),
                    ),
                    width: 50,
                    height: 50,
                    child: Text(item!.quantity.toString(), style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  TextButton(
                    onPressed: () => context.read<CartCubit>().addProductToCart(item!.product),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.transparent), // Tắt hiệu ứng khi bấm
                    ),
                    child: Text('+', style: TextStyle(fontSize: 40, color: Colors.green)),
                  ),
                ],
              ),
            ),
          ],
        ),
        LineCustom(),
      ],
    );
  }
}
