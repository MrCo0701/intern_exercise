import 'package:carousel_slider/carousel_slider.dart';
import 'package:exercise_1/features/shop/home/cubit/product_cubit.dart';
import 'package:exercise_1/features/shop/details/detail.dart';
import 'package:exercise_1/widgets/search_bar.dart';
import 'package:exercise_1/features/shop/home/widget/title.dart';
import 'package:exercise_1/features/shop/categories/widgets/type_product_horizontal.dart';
import 'package:exercise_1/features/shop/home/widget/vertical_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/product_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _current = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..addAllProducts(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    // * Logo
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 70, child: Image.asset('assets/images/carrot.png')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [Icon(Icons.place, color: Colors.grey, size: 30), Text('Dhaka, Banassre')],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // * Search and Banner
                    Column(
                      children: [
                        SearchBarCustom(),
                        SizedBox(height: 20),
                        Stack(
                          children: [
                            CarouselSlider(
                              items: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset('assets/banners/banner1.jpeg'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset('assets/banners/banner2.png'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset('assets/banners/banner3.png'),
                                  ),
                                ),
                              ],
                              options: CarouselOptions(
                                viewportFraction: 1,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 5),
                                onPageChanged: (index, _) => setState(() => _current = index),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 0,
                              left: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  for (var i = 0; i < 3; i++)
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      width: 20,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        color: _current == i ? Colors.green : Colors.grey,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // * Exclusive Offer
                    Column(
                      children: [
                        TitleShop(title: 'Exclusive Offer', onPress: () {}),
                        SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: 10,
                            children: [
                              for (int i = 0; i < state.exclusiveOffer.length; i++)
                                VerticalProduct(
                                  assetImage: state.exclusiveOffer[i].assetImage,
                                  title: state.exclusiveOffer[i].title,
                                  description: state.exclusiveOffer[i].description,
                                  price: state.exclusiveOffer[i].price.toString(),
                                  onPress:
                                      () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(product: state.exclusiveOffer[i]),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    // * Best Selling
                    Column(
                      children: [
                        TitleShop(title: 'Best Selling', onPress: () {}),
                        SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: 10,
                            children: [
                              for (int i = 0; i < state.bestSelling.length; i++)
                                VerticalProduct(
                                  assetImage: state.bestSelling[i].assetImage,
                                  title: state.bestSelling[i].title,
                                  description: state.bestSelling[i].description,
                                  price: state.bestSelling[i].price.toString(),
                                  onPress:
                                      () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailScreen(product: state.bestSelling[i]),
                                        ),
                                      ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        TitleShop(title: 'Groceries', onPress: () {}),
                        SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: 10,
                            children: [
                              TypeProductHorizontal(
                                title: 'Pulses',
                                assetImage: 'assets/images/pulses.png',
                                backgroundColor: Color.fromARGB(248, 164, 76, 1).withOpacity(0.2),
                              ),
                              TypeProductHorizontal(
                                title: 'Rice',
                                assetImage: 'assets/images/rice.png',
                                backgroundColor: Color.fromRGBO(83, 177, 117, 1).withOpacity(0.4),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: 10,
                            children: [
                              for (int i = 0; i < state.fishAndMeat.length; i++)
                                VerticalProduct(
                                  assetImage: state.fishAndMeat[i].assetImage,
                                  title: state.fishAndMeat[i].title,
                                  description: state.fishAndMeat[i].description,
                                  price: state.fishAndMeat[i].price.toString(),
                                  onPress:
                                      () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(product: state.fishAndMeat[i]),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
