import 'package:exercise_1/controller/check_controller.dart';
import 'package:exercise_1/data/model/product_model.dart';
import 'package:exercise_1/widgets/button_custom.dart';
import 'package:exercise_1/widgets/line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import 'cubit/detail_cubit.dart';
import 'cubit/detail_state.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFFe4e5e4)),
      body: BlocProvider(
        create: (context) => DetailCubit(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
                  color: Color(0xFFe4e5e4),
                ),
                alignment: Alignment.center,
                child: Image.asset(product.assetImage),
              ),
            ),

            // Title and Price
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          // ? Title
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title,
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                  Text(product.description, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
                                ],
                              ),
                              Spacer(),
                              BlocBuilder<DetailCubit, DetailState>(
                                builder: (context, state) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: IconButton(
                                      onPressed: () => context.read<DetailCubit>().changeFavorite(),
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all(
                                          Colors.transparent,
                                        ), // Tắt hiệu ứng khi bấm
                                      ),
                                      icon: Icon(Iconsax.heart, color: state.isFavorite ? Colors.red : Colors.grey),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),

                          // Price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BlocBuilder<DetailCubit, DetailState>(
                                builder: (context, state) {
                                  return Row(
                                    children: [
                                      TextButton(
                                        onPressed: () => context.read<DetailCubit>().decrement(),
                                        style: ButtonStyle(
                                          overlayColor: MaterialStateProperty.all(
                                            Colors.transparent,
                                          ), // Tắt hiệu ứng khi bấm
                                        ),
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                            fontSize: 40,
                                            color: state.number > 1 ? Colors.green : Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey, width: 1.5),
                                          borderRadius: BorderRadius.circular(19),
                                        ),
                                        width: 50,
                                        height: 50,
                                        child: Text(
                                          state.number.toString(),
                                          style: TextStyle(fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed:
                                            () => state.number != 5 ? context.read<DetailCubit>().increment() : {},
                                        style: ButtonStyle(
                                          overlayColor: MaterialStateProperty.all(
                                            Colors.transparent,
                                          ), // Tắt hiệu ứng khi bấm
                                        ),
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                            fontSize: 40,
                                            color: state.number == 5 ? Colors.grey : Colors.green,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              Spacer(),
                              Text('\$${product.price}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                            ],
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          LineCustom(),
                          // Product Detail
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text('Product Detail', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18)),
                                  Spacer(),
                                  Icon(Icons.keyboard_arrow_down, size: 35),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Apples are very nutritious. Apples may be good for weight loss. Apples may be good for your heart. As part of a healthy and varied diet.',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          LineCustom(),

                          // Nutrition
                          Row(
                            children: [
                              Text('Nutritions', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                              Spacer(),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(1.5),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text('100gr', style: TextStyle(color: Colors.grey, fontSize: 10)),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(Icons.chevron_right, size: 35),
                                ],
                              ),
                            ],
                          ),
                          LineCustom(),

                          Row(
                            children: [
                              Text('Review', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                              Spacer(),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.orange),
                                      Icon(Icons.star, color: Colors.orange),
                                      Icon(Icons.star, color: Colors.orange),
                                      Icon(Icons.star, color: Colors.orange),
                                      Icon(Icons.star, color: Colors.orange),
                                    ],
                                  ),
                                  Icon(Icons.chevron_right, size: 35),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),

                          ButtonCustom(title: 'Add to Basket', onPressed: () {}, canClick: true),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
