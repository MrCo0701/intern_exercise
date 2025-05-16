import 'package:carousel_slider/carousel_slider.dart';
import 'package:exercise_1/features/shop/widgets/search_bar.dart';
import 'package:exercise_1/features/shop/widgets/title.dart';
import 'package:exercise_1/features/shop/widgets/vertical_product.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // * Logo
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                      child: Image.asset('assets/images/carrot.png'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.place, color: Colors.grey, size: 30),
                        Text('Dhaka, Banassre'),
                      ],
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
                            onPageChanged:
                                (index, _) => setState(() => _current = index),
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
                                    color:
                                        _current == i
                                            ? Colors.green
                                            : Colors.grey,
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
                          VerticalProduct(
                            assetImage: 'assets/images/apple.png',
                            title: 'Red Apple',
                            description: '1kg, Price',
                            price: '4.99',
                          ),
                          VerticalProduct(
                            assetImage: 'assets/images/apple.png',
                            title: 'Red Apple',
                            description: '1kg, Price',
                            price: '4.99',
                          ),
                          VerticalProduct(
                            assetImage: 'assets/images/apple.png',
                            title: 'Red Apple',
                            description: '1kg, Price',
                            price: '4.99',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
